talus_wrix = Creature:new {
	objectName = "@mob/creature_names:wrix",
	socialGroup = "wrix",
	faction = "",
	mobType = MOB_CARNIVORE,
	level = 54,
	chanceHit = 1.35,
	damageMin = 310,
	damageMax = 520,
	baseXp = 4737,
	baseHAM = 9900,
	baseHAMmax = 11200,
	armor = 0,
	resists = {145,155,25,150,-1,135,15,30,-1},
	meatType = "meat_carnivore",
	meatAmount = 123,
	hideType = "hide_bristley",
	hideAmount = 123,
	boneType = "bone_mammal",
	boneAmount = 123,
	milk = 2 * 0,
	tamingChance = 0.25,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK + HERD,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/wrix.iff"},
	controlDeviceTemplate = "object/intangible/pet/gurreck_hue.iff",
	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "unarmed",
	secondaryWeapon = "none",
	conversationTemplate = "",
	
	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = { {"intimidationattack",""} },
	secondaryAttacks = { }

}

CreatureTemplates:addCreatureTemplate(talus_wrix, "talus_wrix")
