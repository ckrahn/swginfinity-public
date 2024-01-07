object_tangible_deed_guild_deed_generic_guild_deed_dark = object_tangible_deed_guild_deed_shared_generic_guild_deed_dark:new {
	templateType = STRUCTUREDEED,
	placeStructureComponent = "PlaceStructureComponent",
	generatedObjectTemplate = "object/building/player/player_guildhall_generic_style_01.iff",



	numberExperimentalProperties = {1, 1, 1},
	experimentalProperties = {"XX", "XX", "DR"},
	experimentalWeights = {1, 1, 1},
	experimentalGroupTitles = {"null", "null", "exp_durability"},
	experimentalSubGroupTitles = {"null", "null", "hitpoints"},
	experimentalMin = {0, 0, 50000},
	experimentalMax = {0, 0, 100000},
	experimentalPrecision = {0, 0, 0},
	experimentalCombineType = {0, 0, 4},
}

ObjectTemplates:addTemplate(object_tangible_deed_guild_deed_generic_guild_deed_dark, "object/tangible/deed/guild_deed/generic_guild_deed_dark.iff")
