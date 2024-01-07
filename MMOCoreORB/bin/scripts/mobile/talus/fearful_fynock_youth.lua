fearful_fynock_youth = Creature:new {
	objectName = "@mob/creature_names:fearful_fynock_youth",
	socialGroup = "fynock",
	faction = "",
	mobType = MOB_CARNIVORE,
	level = 24,
	chanceHit = 0.33,
	damageMin = 290,
	damageMax = 450,
	baseXp = 2143,
	baseHAM = 6300,
	baseHAMmax = 7100,
	armor = 0,
	resists = {135,10,120,-1,-1,-1,-1,-1,-1},
	meatType = "meat_avian",
	meatAmount = 123,
	hideType = "",
	hideAmount = 0,
	boneType = "bone_avian",
	boneAmount = 123,
	milk = 2 * 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = HERD,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/fearful_fynock_youth.iff"},
	scale = 0.7,
	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "unarmed",
	secondaryWeapon = "none",
	conversationTemplate = "",
	
	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = { {"",""} },
	secondaryAttacks = { }
}

CreatureTemplates:addCreatureTemplate(fearful_fynock_youth, "fearful_fynock_youth")
