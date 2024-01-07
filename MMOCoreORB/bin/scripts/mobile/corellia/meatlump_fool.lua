meatlump_fool = Creature:new {
	objectName = "@mob/creature_names:meatlump_fool",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	mobType = MOB_NPC,
	socialGroup = "meatlump",
	faction = "meatlump",
	level = 18,
	chanceHit = 0.250000,
	damageMin = 50,
	damageMax = 55,
	baseXp = 113,
	baseHAM = 180,
	baseHAMmax = 220,
	armor = 0,
	resists = {0,0,0,0,0,0,0,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0.000000,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = HERD,
	diet = HERBIVORE,

	templates = {"thug"},
	lootGroups = {
	{
	groups = {
		{group = "junk", chance = 3000000},
		{group = "loot_kit_parts", chance = 1000000},
		--{group = "color_crystals", chance = 100000},
		{group = "tailor_components", chance = 500000},
		{group = "meatlump_common", chance = 3500000},
		--{group = "armor_attachments", chance = 5000000},
		{group = "clothing_attachments", chance = 500000},
				{group = "art_illum21", chance = 1500000}
	}
}
},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "pirate_weapons_light",
	secondaryWeapon = "unarmed",
	reactionStf = "@npc_reaction/slang",
	
	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(brawlernovice,marksmannovice),
	secondaryAttacks = { }
}

CreatureTemplates:addCreatureTemplate(meatlump_fool, "meatlump_fool")
