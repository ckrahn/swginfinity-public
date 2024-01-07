kunga_herbalist = Creature:new {
	objectName = "@mob/creature_names:kunga_herbalist",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	mobType = MOB_NPC,
	socialGroup = "kunga_tribe",
	faction = "kunga_tribe",
	level = 75,
	chanceHit = 0.31,
	damageMin = 520,
	damageMax = 750,
	baseXp = 960,
	baseHAM = 12000,
	baseHAMmax = 15000,
	armor = 1,
	resists = {15,15,10,5,10,5,10,15,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK + HERD,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dantari_male.iff",
		"object/mobile/dantari_female.iff"},
	lootGroups = {
		{
			groups = {
				{group = "junk", chance = 3500000},
				{group = "loot_kit_parts", chance = 3000000},
				{group = "armor_attachments", chance = 500000},
				{group = "clothing_attachments", chance = 500000},
				{group = "wearables_common", chance = 1000000},
				{group = "wearables_uncommon", chance = 1000000},
				{group = "power_crystals", chance = 500000}
			}
		},
		{
			groups = {
				{group = "kunga_common", chance = 100 * (100000)}
			},
			lootChance = 50 * (100000)
		},
	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "primitive_weapons",
	secondaryWeapon = "unarmed",
	conversationTemplate = "",

	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = brawlermaster,
	secondaryAttacks = { }
}

CreatureTemplates:addCreatureTemplate(kunga_herbalist, "kunga_herbalist")
