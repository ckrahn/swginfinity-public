/*
 * ArmorObjectMenuComponent.cpp
 *
 *  Created on: 2/4/2013
 *      Author: bluree
 *		Credits: TA & Valk
 */

#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/objects/building/BuildingObject.h"
#include "server/zone/objects/player/sui/colorbox/SuiColorBox.h"
#include "ArmorObjectMenuComponent.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"
#include "server/zone/objects/player/sui/callbacks/ColorArmorSuiCallback.h"
#include "server/zone/ZoneServer.h"
#include "templates/customization/AssetCustomizationManagerTemplate.h"

void ArmorObjectMenuComponent::fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player) const {
	if (!sceneObject->isWearableObject())
		return;

	ManagedReference<SceneObject*> parent = sceneObject->getParent().get();

	if (parent != nullptr && parent->isCellObject()) {
		ManagedReference<SceneObject*> obj = parent->getParent().get();

		if (obj != nullptr && obj->isBuildingObject()) {
			ManagedReference<BuildingObject*> buio = cast<BuildingObject*>(obj.get());

			if (!buio->isOnAdminList(player))
				return;
		}
	} else {
		if (!sceneObject->isASubChildOf(player))
			return;
	}

	String text = "Change Color";
	menuResponse->addRadialMenuItem(81, 3, text);

	WearableObjectMenuComponent::fillObjectMenuResponse(sceneObject, menuResponse, player);
}

int ArmorObjectMenuComponent::handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* player, byte selectedID) const {

	if (selectedID == 81) {
		ManagedReference<SceneObject*> parent = sceneObject->getParent().get();

		if (parent == nullptr)
			return 0;

		if (parent->isPlayerCreature()) {
			player->sendSystemMessage("@armor_rehue:equipped");
			return 0;
		}

		if (parent->isCellObject()) {
			ManagedReference<SceneObject*> obj = parent->getParent().get();

			if (obj != nullptr && obj->isBuildingObject()) {
				ManagedReference<BuildingObject*> buio = cast<BuildingObject*>(obj.get());

				if (!buio->isOnAdminList(player))
					return 0;
			}
		} else {
			if (!sceneObject->isASubChildOf(player))
				return 0;
		}

		auto zoneServer = player->getZoneServer();
		auto ghost = player->getPlayerObject();

		if (zoneServer != nullptr && ghost != nullptr) {
			// The color index.
			String appearanceFilename = sceneObject->getObjectTemplate()->getAppearanceFilename();
			VectorMap<String, Reference<CustomizationVariable*> > variables;
			AssetCustomizationManagerTemplate::instance()->getCustomizationVariables(appearanceFilename.hashCode(), variables, false);

			//Infinity:  Let's loop through all the color slot options
			for (int i = 0; i < variables.size(); i++) {

				String varkey = variables.elementAt(i).getKey();
				
				if (varkey.contains("color")) {

					// The Sui Box.
					ManagedReference<SuiColorBox*> cbox = new SuiColorBox(player, SuiWindowType::COLOR_ARMOR);
					cbox->setCallback(new ColorArmorSuiCallback(zoneServer));
					cbox->setColorPalette(variables.elementAt(i).getKey()); //Infinity:  Loop through
					cbox->setUsingObject(sceneObject);

					int skillMod = 500; //Infinity;   Max customization player->getSkillMod("armor_customization");
					cbox->setSkillMod(skillMod);

					// Add to player.
					ghost->addSuiBox(cbox);
					player->sendMessage(cbox->generateMessage());

				}
			}
		}
	}

	return WearableObjectMenuComponent::handleObjectMenuSelect(sceneObject, player, selectedID);
}
