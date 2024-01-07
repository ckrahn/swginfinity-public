feeble_kima = Creature:new {
	objectName = "@mob/creature_names:feeble_kima",
	socialGroup = "kima",
	faction = "",
	mobType = MOB_CARNIVORE,
	level = 36,
	chanceHit = 1.15,
	damageMin = 390,
	damageMax = 540,
	baseXp = 2771,
	baseHAM = 7680,
	baseHAMmax = 10690,
	armor = 0,
	resists = {45,130,0,0,160,0,0,-1,-1},
	meatType = "meat_herbivore",
	meatAmount = 123,
	hideType = "hide_bristley",
	hideAmount = 123,
	boneType = "bone_mammal",
	boneAmount = 123,
	milk = 2 * 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = HERD,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/kima_hue.iff"},
	scale = 0.9,
	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "unarmed",
	secondaryWeapon = "none",
	conversationTemplate = "",
	
	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = { {"stunattack",""}, {"",""} },
	secondaryAttacks = { }

}

CreatureTemplates:addCreatureTemplate(feeble_kima, "feeble_kima")
