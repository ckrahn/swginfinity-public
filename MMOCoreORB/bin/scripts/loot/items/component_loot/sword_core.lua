--Automatically generated by SWGEmu Spawn Tool v0.12 loot editor.

sword_core = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/component/weapon/sword_core.iff",
	craftingValues = {
		{"mindamage", 4,20,0},
		{"maxdamage", 4,20,0},
		{"attackspeed",-0.1,-0.5,2},
		{"woundchance",2,10,1},
		{"hitpoints",20,100,0, true},
		{"midrangemod",2,10,0},
		{"attackhealthcost",8,0,0},
		{"attackactioncost",8,0,0},
		{"attackmindcost",8,0,0},
		{"useCount",3,7,0}
	},
	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("sword_core", sword_core)
