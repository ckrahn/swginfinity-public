blurrg_raptor = Creature:new {
	objectName = "@mob/creature_names:blurrg_raptor",
	socialGroup = "blurrg",
	faction = "",
	mobType = MOB_CARNIVORE,
	level = 140,
	chanceHit = 1.25,
	damageMin = 1000,
	damageMax = 1900,
	baseXp = 13367,
	baseHAM = 145000,
	baseHAMmax = 185000,
	armor = 2,
	resists = {65,65,65,65,65,65,65,65,25},
	meatType = "meat_carnivore",
	meatAmount = 50,
	hideType = "hide_leathery",
	hideAmount = 40,
	boneType = "bone_avian",
	boneAmount = 35,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/blurrg_hue.iff"},
	hues = { 16, 17, 18, 19, 20, 21, 22, 23 },
	scale = 2.0,
	lootGroups = {},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "object/weapon/ranged/creature/creature_spit_large_yellow.iff",
	secondaryWeapon = "unarmed",
	conversationTemplate = "",
	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = { {"stunattack",""}, {"blindattack",""} },
	secondaryAttacks = { {"stunattack",""}, {"blindattack",""} },
}

CreatureTemplates:addCreatureTemplate(blurrg_raptor, "blurrg_raptor")
