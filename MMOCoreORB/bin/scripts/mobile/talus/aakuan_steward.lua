aakuan_steward = Creature:new {
	objectName = "@mob/creature_names:aakuan_steward",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "aakuans",
	faction = "aakuans",
	mobType = MOB_NPC,
	level = 40,
	chanceHit = 1.32,
	damageMin = 403,
	damageMax = 580,
	baseXp = 3876,
	baseHAM = 7800,
	baseHAMmax = 8800,
	armor = 0,
	resists = {25,15,45,-1,-1,22.5,7.5,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 2 * 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	templates = {
		"object/mobile/dressed_aakuan_steward_human_female_01.iff",
		"object/mobile/dressed_aakuan_steward_human_male_01.iff"},
	lootGroups = {
		{
			groups = {
				{group = "junk", chance = 4000000},
				{group = "wearables_all", chance = 1000000},
				{group = "data_storage_unit_parts", chance = 1600000},
				{group = "aakuan_common", chance = 2300000},
				{group = "armor_attachments", chance = 500000},
				{group = "clothing_attachments", chance = 600000}
			},
			lootChance = 5000000,
		}
	},
	primaryWeapon = "melee_weapons",
	secondaryWeapon = "none",
	primaryAttacks = merge(brawlermid),
	secondaryAttacks = { },

	reactionStf = "@npc_reaction/fancy",
}

CreatureTemplates:addCreatureTemplate(aakuan_steward, "aakuan_steward")
