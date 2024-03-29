death_watch_bloodguard = Creature:new {
	objectName = "@mob/creature_names:mand_bunker_dthwatch_red",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	mobType = MOB_NPC,
	socialGroup = "death_watch",
	faction = "",
	level = 261,
	chanceHit = 1,
	damageMin = 745,
	damageMax = 1200,
	baseXp = 11390,
	baseHAM = 75000,
	baseHAMmax = 95000,
	armor = 2,
	resists = {55,55,70,60,30,30,75,40,15},
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
	creatureBitmask = KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1.15,

	templates = {"object/mobile/dressed_death_watch_red.iff"},
	lootGroups = {
		{
			groups = {
				{group = "death_watch_bunker_commoners", chance = 6000000},
				{group = "death_watch_bunker_lieutenants", chance = 4000000}
			},
			lootChance = 3500000
		},
		{
			groups = {
				{group = "death_watch_bunker_commoners", chance = 6000000},
				{group = "death_watch_bunker_lieutenants", chance = 4000000}
			},
			lootChance = 3500000
		},
		{
			groups = {
				{group = "clothing_attachments", chance = 10000000},
			},
			lootChance = 500000
		},
		{
			groups = {
				{group = "armor_attachments", chance = 10000000},
			},
			lootChance = 1000000
		},
	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "pirate_weapons_heavy",
	secondaryWeapon = "none",
	conversationTemplate = "",
	thrownWeapon = "thrown_weapons",

	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(bountyhuntermaster,marksmanmaster,brawlermaster,tkamaster),
	secondaryAttacks = { }
}

CreatureTemplates:addCreatureTemplate(death_watch_bloodguard, "death_watch_bloodguard")
