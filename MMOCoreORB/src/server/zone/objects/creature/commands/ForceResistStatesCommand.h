/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef FORCERESISTSTATESCOMMAND_H_
#define FORCERESISTSTATESCOMMAND_H_

class ForceResistStatesCommand : public JediQueueCommand {
public:

	ForceResistStatesCommand(const String& name, ZoneProcessServer* server)
		: JediQueueCommand(name, server) {

		buffCRC = BuffCRC::JEDI_RESIST_STATES;

		skillMods.put("jedi_state_defense", 65);  //Infinity:  Switch to jedi_state_defense

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		return doJediSelfBuffCommand(creature);
	}

};

#endif //FORCERESISTSTATESCOMMAND_H_
