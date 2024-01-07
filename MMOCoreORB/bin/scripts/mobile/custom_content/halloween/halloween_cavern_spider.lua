halloween_cavern_spider = Creature:new {
	customName = "an infected Cavern Spider",
	socialGroup = "geonosian_creature",
	pvpFaction = "",
	faction = "",
	mobType = MOB_CARNIVORE,
	level = 130,
	chanceHit = 33.36,
	damageMin = 850,
	damageMax = 1160,
	baseXp = 3822,
	baseHAM = 55200,
	baseHAMmax = 62400,
	armor = 0,
	resists = {20,20,20,20,20,10,10,10,5},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = 128,
	diet = CARNIVORE,

	templates = {"object/mobile/gaping_spider.iff"},
	scale = 1.1,
	lootGroups = {
		{
	        groups =
			{
				{group = "armor_attachments", chance = 10000000},
			},
			lootChance = 2250000,
		},
		{
					groups =
			{
				{group = "power_crystals", chance = 10000000},
			},
			lootChance = 2250000,
		},
		{
					groups =
			{
				{group = "enhanced_spider", chance = 3000000},
				{group = "fire_breathing_spider", chance = 7000000},
			},
			lootChance = 1500000,
		},
		{
	        groups =
			{
				{group = "clothing_attachments", chance = 10000000},
			},
			lootChance = 1050000,
		},
		{
					groups =
			{
				{group = "geonosian_common", chance = 10000000},
			},
			lootChance = 10000000,
		},
	 	{
	        groups =
			{

				{group = "geonosian_relic", chance = 2500000},
				{group = "geonosian_common", chance = 7500000},
			},
			lootChance = 10000000,
		},
		{
			groups =
			{
				{group = "pistols", chance = 2500000},
				{group = "rifles", chance = 2500000},
				{group = "carbines", chance = 2500000},
				{group = "melee_weapons", chance = 2500000},
			},
			lootChance = 10000000,
		},
	},
	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "unarmed",
	secondaryWeapon = "none",
	conversationTemplate = "",
	
	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = { {"intimidationattack","intimidationChance=60"}, },
	secondaryAttacks = { {"knockdownfire",""},	{"strongpoison",""}	}
}

CreatureTemplates:addCreatureTemplate(halloween_cavern_spider, "halloween_cavern_spider")
