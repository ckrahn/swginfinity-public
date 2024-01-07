chunker_pest = Creature:new {
	objectName = "@mob/creature_names:chunker_pest",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	faction = "thug",
	socialGroup = "chunker",
	mobType = MOB_NPC,
	level = 56,
	chanceHit = 0.68,
	damageMin = 260,
	damageMax = 510,
	baseXp = 4835,
	baseHAM = 11750,
	baseHAMmax = 13450,
	armor = 0,
	resists = {25,25,25,15,-1,45,5,15,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 2 * 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	
	templates = {"object/mobile/dressed_mugger.iff",
		"object/mobile/dressed_robber_human_male_01.iff",
		"object/mobile/dressed_criminal_thug_zabrak_female_01.iff",
		"object/mobile/dressed_criminal_thug_aqualish_female_02.iff",
		"object/mobile/dressed_criminal_thug_aqualish_male_02.iff",
		"object/mobile/dressed_desperado_bith_female_01.iff",
		"object/mobile/dressed_criminal_thug_human_female_01.iff",
		"object/mobile/dressed_goon_twk_female_01.iff",
		"object/mobile/dressed_criminal_thug_human_male_01.iff",
		"object/mobile/dressed_robber_twk_female_01.iff",
		"object/mobile/dressed_villain_trandoshan_male_01.iff",
		"object/mobile/dressed_desperado_bith_male_01.iff",
		"object/mobile/dressed_mugger.iff"},
	
		lootGroups = {
			{
				groups = {
					{group = "armor_attachments",    chance = 20 * (100000)},
					{group = "clothing_attachments", chance = 20 * (100000)},
					{group = "rifles",          chance = 20 * (100000)},
					{group = "pistols",              chance = 20 * (100000)},
					{group = "carbines",             chance = 20 * (100000)},
				},
				lootChance = 75 * (100000)
			},
			{
				groups = {
					{group = "chunker_common",       chance = 20 * (100000)},
					{group = "junk",                 chance = 20 * (100000)},
					{group = "wearables_common",     chance = 20 * (100000)},
					{group = "tailor_components",    chance = 20 * (100000)},
					{group = "melee_knife",          chance = 20 * (100000)},
				},
				lootChance = 50 * (100000)
			}
		},
	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "st_assault_weapons",
	secondaryWeapon = "none",
	conversationTemplate = "",
	
	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(carbineermid,marksmanmaster),
	secondaryAttacks = { }

	}
	
	CreatureTemplates:addCreatureTemplate(chunker_pest, "chunker_pest")
	