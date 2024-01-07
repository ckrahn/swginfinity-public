/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef REVOKEBADGECOMMAND_H_
#define REVOKEBADGECOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"

class RevokeBadgeCommand : public QueueCommand {
public:

	RevokeBadgeCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		if (arguments.isEmpty() && target == 0) {
			creature->sendSystemMessage("Syntax: /revokeBadge [-area [range]] [badge id]");
			return GENERALERROR;
		}

		auto zoneServer = server->getZoneServer();
		if (zoneServer == nullptr)
			return GENERALERROR;

		ManagedReference<SceneObject*> targetObject = zoneServer->getObject(target);

		bool area = false;
		bool multiple = false;
		int range = 32;  //Infinity: Default range to 32 meters
		int badgeId = 0;
		int endBadge = 0;

		try {
			StringTokenizer args(arguments.toString());

			if (args.hasMoreTokens()) {

				String arg;
				args.getStringToken(arg);
				bool validOption = false;

				if (arg.charAt(0) == '-') {
					if (arg.toLowerCase() == "-help" || arg.toLowerCase() == "-h") {
						creature->sendSystemMessage("Syntax: /revokeBadge [badge id]");
						creature->sendSystemMessage("Syntax: /revokeBadge [-area [range]] [badge id]");
						creature->sendSystemMessage("Syntax: /revokeBadge [-multiple] [start badge] [end badge]");
						return GENERALERROR;
					}
					else if (arg.toLowerCase() == "-area" || arg.toLowerCase() == "-a") {
						validOption = true;
						area = true;

						if (!args.hasMoreTokens()) {
							creature->sendSystemMessage("Syntax: /revokeBadge [-area [range]] [badge id]");
							return GENERALERROR;
						}

						badgeId = args.getIntToken();

						if (args.hasMoreTokens()) {
							range = badgeId;
							badgeId = args.getIntToken();

							if (range <= 0 || range > 192) {
								creature->sendSystemMessage("Invalid range, must be between 1 and 192.");
								return INVALIDPARAMETERS;
							}
						}
					}
					else if (arg.toLowerCase() == "-multiple" || arg.toLowerCase() == "-m") {
						validOption = true;
						multiple = true;

						if (!args.hasMoreTokens()) {
							creature->sendSystemMessage("Syntax: /revokeBadge [-multiple] [start badge] [end badge]");
							return GENERALERROR;
						}

						badgeId = args.getIntToken();

						if (!args.hasMoreTokens()) {
							creature->sendSystemMessage("Syntax: /revokeBadge [-multiple] [start badge] [end badge]");
							return GENERALERROR;
						}

						endBadge = args.getIntToken();

						if (endBadge <= 0 || endBadge < badgeId) {
							creature->sendSystemMessage("End badge must be greater than 0 and greater than the start badge.");
							return INVALIDPARAMETERS;
						}
					}
					if (!validOption) {
						creature->sendSystemMessage("Invalid option " + arg);
						return INVALIDPARAMETERS;
					}
				}
				else {
					badgeId = Integer::valueOf(arg);
				}
			}
		}
		catch (Exception& e) {
				creature->sendSystemMessage("Syntax: /revokeBadge [badge id]");
				creature->sendSystemMessage("Syntax: /revokeBadge [-area [range]] [badge id]");
				creature->sendSystemMessage("Syntax: /revokeBadge [-multiple] [start badge] [end badge]");
				creature->sendSystemMessage(e.getMessage());
				return GENERALERROR;
		}
		if (area) {
			SortedVector<QuadTreeEntry*> closeObjects;
			Zone* zone = creature->getZone();
			if (zone == nullptr)
				return GENERALERROR;

			if (creature->getCloseObjects() == nullptr) {

#ifdef COV_DEBUG
				creature->info("Null closeobjects vector in GrantBadgeCommand::doQueueCommand", true);
#endif
				zone->getInRangeObjects(creature->getPositionX(), creature->getPositionY(), range, &closeObjects, true);
			}
			else {
				CloseObjectsVector* closeVector = (CloseObjectsVector*) creature->getCloseObjects();
				closeVector->safeCopyTo(closeObjects);
			}

			int numRevoked = 0;

			for (int i = 0; i < closeObjects.size(); i++) {

				ManagedReference<SceneObject*> sceno = cast<SceneObject*>(closeObjects.get(i));
				if (sceno == nullptr || !sceno->isPlayerCreature())
					continue;

				ManagedReference<CreatureObject*> player = sceno->asCreatureObject();
				if (player == nullptr || player == creature)
					continue;

				auto ghost = player->getPlayerObject();
				if (ghost == nullptr)
					continue;

				Locker crossLocker(ghost, creature);
				ghost->revokeBadge(badgeId);
				numRevoked++;								
			}
			creature->sendSystemMessage("Revoked badge #" + String::valueOf(badgeId) + " from " + String::valueOf(numRevoked) + " players found within " + String::valueOf(range) + "m.");
			return SUCCESS;

		}
		else {
			if (targetObject == nullptr || !targetObject->isPlayerCreature()) {
					creature->sendSystemMessage("Invalid target.");
					return INVALIDTARGET;
			}
			else {

				ManagedReference<CreatureObject*> player = targetObject->asCreatureObject();
				if (player == nullptr)
					return GENERALERROR;

				auto ghost = player->getPlayerObject();
				if (ghost == nullptr)
					return GENERALERROR;	
				
				Locker crossLocker(ghost, creature);

				if (multiple) {
					for (int i = (int)badgeId; i <= endBadge; i++) {
						ghost->revokeBadge(i);
					}
					creature->sendSystemMessage("Revoked badges from #" + String::valueOf(badgeId) + " to #" + String::valueOf(endBadge) + " from " + player->getDisplayedName() + ".");
				} else {
					ghost->revokeBadge(badgeId);
					creature->sendSystemMessage("Revoked badge #" + String::valueOf(badgeId) + " for " + player->getDisplayedName() + ".");
				}			
			}
		}
		return SUCCESS;
	}
};

#endif //REVOKEBADGECOMMAND_H_