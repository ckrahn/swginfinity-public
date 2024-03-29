rebelRecruiterConvoTemplate = ConvoTemplate:new {
	initialScreen = "",
	templateType = "Lua",
	luaClassHandler = "RecruiterConvoHandler",
	screens = {}
}

greet_hated = ConvoScreen:new {
	id = "greet_hated",
	leftDialog = "@conversation/faction_recruiter_rebel:s_462", -- I'm sorry, but I do not know you and do not wish to.
	stopConversation = "true",
	options = {
	}
}

rebelRecruiterConvoTemplate:addScreen(greet_hated);

greet_changing_status = ConvoScreen:new {
	id = "greet_changing_status",
	leftDialog = "@conversation/faction_recruiter_rebel:s_596", -- Greetings. I see that your status is currently being processed. I won't be able to help you until that is complete. It should not take much longer.
	stopConversation = "true",
	options = {
	}
}

rebelRecruiterConvoTemplate:addScreen(greet_changing_status);

greet_enemy = ConvoScreen:new {
	id = "greet_enemy",
	leftDialog = "@conversation/faction_recruiter_rebel:s_464", -- What are you doing talking to me? People like you are destroying the galaxy.
	stopConversation = "true",
	options = {
	}
}

rebelRecruiterConvoTemplate:addScreen(greet_enemy);

member_covert_start = ConvoScreen:new {
	id = "greet_member_start_covert",
	leftDialog = "@conversation/faction_recruiter_rebel:s_466", -- Hello friend. Is there something that I may do to help you?
	stopConversation = "false",
	options = {
		{"@conversation/faction_recruiter_rebel:s_504", "confirm_go_overt"}, -- I need to address my role in the Civil War.
		{"@conversation/faction_recruiter_rebel:s_526", "leave_time_covert"}, -- I need to go on leave for a time.
		{"@conversation/faction_recruiter_rebel:s_538", "resign_covert"}, -- This is all too much for me. I would like to resign completely.
		{"@conversation/faction_recruiter_rebel:s_562", "show_gcw_score"}, -- How are we doing in the war against the Imperial tyrants?
	}
}

rebelRecruiterConvoTemplate:addScreen(member_covert_start);


member_overt_start = ConvoScreen:new {
	id = "greet_member_start_overt",
	leftDialog = "@conversation/faction_recruiter_rebel:s_466", -- Hello friend. Is there something that I may do to help you?
	stopConversation = "false",
	options = {
		{"@conversation/faction_recruiter_rebel:s_504", "confirm_go_covert"}, -- I need to address my role in the Civil War.
		{"@conversation/faction_recruiter_rebel:s_526", "leave_time_overt"}, -- I need to go on leave for a time.
		{"@conversation/faction_recruiter_rebel:s_538", "resign_overt"}, -- This is all too much for me. I would like to resign completely.
		{"@conversation/faction_recruiter_rebel:s_562", "show_gcw_score"}, -- How are we doing in the war against the Imperial tyrants?
	}
}

rebelRecruiterConvoTemplate:addScreen(member_overt_start);

neutral_start = ConvoScreen:new {
	id = "greet_neutral_start",
	leftDialog = "@conversation/faction_recruiter_rebel:s_566", -- Hello friend. Is there something that I can do for you? Are you interested in helping free the peoples of the galaxy?
	stopConversation = "false",
	options = {
	}
}

rebelRecruiterConvoTemplate:addScreen(neutral_start);

onleave_start = ConvoScreen:new {
	id = "greet_onleave_start",
	leftDialog = "@conversation/faction_recruiter_rebel:s_448", -- Hello friend. Ready to get back to some real work?
	stopConversation = "false",
	options = {
		{"@conversation/faction_recruiter_rebel:s_450", "resume_duties"}, -- I am ready to get back to my duties.
	}
}

rebelRecruiterConvoTemplate:addScreen(onleave_start);

join_military = ConvoScreen:new {
	id = "join_military",
	leftDialog = "@conversation/faction_recruiter_rebel:s_584", -- This is not a decision to be taken lightly. Rebels are hunted across the galaxy. If you join us, while you are an active combatant, Imperials will attack you on sight but Imperial Special Forces will leave you alone. Are you ready for that?
	stopConversation = "false",
	options = {
		{"@conversation/faction_recruiter_rebel:s_586", "accept_join"}, -- That doesn't scare me. Down with the Emperor!
		{"@conversation/faction_recruiter_rebel:s_592", "think_more"}, -- Now that you put it that way, perhaps I was a bit hasty.
	}
}

rebelRecruiterConvoTemplate:addScreen(join_military);

neutral_need_more_points = ConvoScreen:new {
	id = "neutral_need_more_points",
	leftDialog = "@conversation/faction_recruiter_rebel:s_582", -- Your enthusiasm warms my heart. I'm afraid that right now, your loyalty is somewhat in question. Go out and prove to us that you want to help us overthrow the Empire and we can talk later.
	stopConversation = "true",
	options = {
	}
}

rebelRecruiterConvoTemplate:addScreen(neutral_need_more_points);

accept_join = ConvoScreen:new {
	id = "accept_join",
	leftDialog = "@conversation/faction_recruiter_rebel:s_588", -- Superb! Welcome to the Rebellion!
	stopConversation = "true",
	options = {
	}
}

rebelRecruiterConvoTemplate:addScreen(accept_join);

think_more = ConvoScreen:new {
	id = "think_more",
	leftDialog = "@conversation/faction_recruiter_rebel:s_594", -- We only want serious, committed candidates. If you change your mind, talk to me then.
	stopConversation = "true",
	options = {
	}
}

rebelRecruiterConvoTemplate:addScreen(think_more);

confirm_go_overt = ConvoScreen:new {
	id = "confirm_go_overt",
	leftDialog = "@conversation/faction_recruiter_rebel:s_516", -- We can use good people in Special Forces. As a member of the Special Forces, you will be able to attack and be attacked by Imperial Special Forces members. Does this interest you?
	stopConversation = "false",
	options = {
		{"@conversation/faction_recruiter_rebel:s_518", "accepted_go_overt"}, -- Yes. I want to hunt Imperial Special Forces. Sign me up!
		{"@conversation/faction_recruiter_rebel:s_522", "greet_member_start_overt"} -- Actually, maybe it isn't for me after all. Never mind.
	}
}

rebelRecruiterConvoTemplate:addScreen(confirm_go_overt);

confirm_go_covert = ConvoScreen:new {
	id = "confirm_go_covert",
	leftDialog = "@conversation/faction_recruiter_rebel:s_506", -- You are currently in Special Forces. Do you need to step back from it for now?
	stopConversation = "false",
	options = {
		{"@conversation/faction_recruiter_rebel:s_508", "accepted_go_covert"}, -- Yes please. I would like to return to combatant status and not fight the Imperial Special Forces.
		{"@conversation/faction_recruiter_rebel:s_512", "stay_special_forces"} -- Actually, I want to stay in Special Forces.
	}
}

rebelRecruiterConvoTemplate:addScreen(confirm_go_covert);

stay_special_forces = ConvoScreen:new {
	id = "stay_special_forces",
	leftDialog = "@conversation/faction_recruiter_rebel:s_514", -- Good show! Show those Imperials what for. May I help you with something else instead?
	stopConversation = "false",
	options = {
		{"@conversation/faction_recruiter_rebel:s_504", "confirm_go_covert"}, -- I need to address my role in the Civil War.
		{"@conversation/faction_recruiter_rebel:s_526", "leave_time_overt"}, -- I need to go on leave for a time.
		{"@conversation/faction_recruiter_rebel:s_538", "resign_overt"}, -- This is all too much for me. I would like to resign completely.
		{"@conversation/faction_recruiter_rebel:s_562", "show_gcw_score"}, -- How are we doing in the war against the Imperial tyrants?
	}
}

rebelRecruiterConvoTemplate:addScreen(stay_special_forces);

accepted_go_overt = ConvoScreen:new {
	id = "accepted_go_overt",
	leftDialog = "@conversation/faction_recruiter_rebel:s_520", -- Good for you! I'll update your status and you will be a member of the Special Forces in 30 seconds.
	stopConversation = "true",
	options = {
	}
}

rebelRecruiterConvoTemplate:addScreen(accepted_go_overt);

accepted_go_covert = ConvoScreen:new {
	id = "accepted_go_covert",
	leftDialog = "@conversation/faction_recruiter_rebel:s_510", -- That's a shame. It will take some time to push the paperwork through for approval. Your status will change in about 5 minutes.
	stopConversation = "true",
	options = {
	}
}

rebelRecruiterConvoTemplate:addScreen(accepted_go_covert);

leave_time_covert = ConvoScreen:new {
	id = "leave_time_covert",
	leftDialog = "@conversation/faction_recruiter_rebel:s_528", -- We really need your skills. Are you sure that you want to go on leave now? You will be overlooked by most Imperials, unless you get stopped by a tenacious agent that finds something linking you to us.
	stopConversation = "false",
	options = {
		{"@conversation/faction_recruiter_rebel:s_530", "accepted_go_on_leave"}, -- Yes. I really need to take some leave time.
		{"@conversation/faction_recruiter_rebel:s_534", "stay_covert"} -- Maybe not. I will stay active.
	}
}

rebelRecruiterConvoTemplate:addScreen(leave_time_covert);

stay_covert = ConvoScreen:new {
	id = "stay_covert",
	leftDialog = "@conversation/faction_recruiter_rebel:s_536", -- I wish all of our soldiers had your dedication. I salute you!
	stopConversation = "false",
	options = {
		{"@conversation/faction_recruiter_rebel:s_504", "confirm_go_overt"}, -- I need to address my role in the Civil War.
		{"@conversation/faction_recruiter_rebel:s_526", "leave_time_covert"}, -- I need to go on leave for a time.
		{"@conversation/faction_recruiter_rebel:s_538", "resign_covert"}, -- This is all too much for me. I would like to resign completely.
		{"@conversation/faction_recruiter_rebel:s_562", "show_gcw_score"}, -- How are we doing in the war against the Imperial tyrants?
	}
}

rebelRecruiterConvoTemplate:addScreen(stay_covert);

leave_time_overt = ConvoScreen:new {
	id = "leave_time_overt",
	leftDialog = "@conversation/faction_recruiter_rebel:s_528", -- We really need your skills. Are you sure that you want to go on leave now? You will be overlooked by most Imperials, unless you get stopped by a tenacious agent that finds something linking you to us.
	stopConversation = "false",
	options = {
		{"@conversation/faction_recruiter_rebel:s_530", "accepted_go_on_leave"}, -- Yes. I really need to take some leave time.
		{"@conversation/faction_recruiter_rebel:s_534", "stay_overt"} -- Maybe not. I will stay active.
	}
}

rebelRecruiterConvoTemplate:addScreen(leave_time_overt);

stay_overt = ConvoScreen:new {
	id = "stay_overt",
	leftDialog = "@conversation/faction_recruiter_rebel:s_536", -- I wish all of our soldiers had your dedication. I salute you!
	stopConversation = "false",
	options = {
		{"@conversation/faction_recruiter_rebel:s_504", "confirm_go_covert"}, -- I need to address my role in the Civil War.
		{"@conversation/faction_recruiter_rebel:s_526", "leave_time_covert"}, -- I need to go on leave for a time.
		{"@conversation/faction_recruiter_rebel:s_538", "resign_covert"}, -- This is all too much for me. I would like to resign completely.
		{"@conversation/faction_recruiter_rebel:s_562", "show_gcw_score"}, -- How are we doing in the war against the Imperial tyrants?
	}
}

rebelRecruiterConvoTemplate:addScreen(stay_overt);

accepted_go_on_leave = ConvoScreen:new {
	id = "accepted_go_on_leave",
	leftDialog = "@conversation/faction_recruiter_rebel:s_532", -- It will take me some time to process, but you will be on leave beginning in 5 minutes.
	stopConversation = "true",
	options = {
	}
}

rebelRecruiterConvoTemplate:addScreen(accepted_go_on_leave);

leave_resign_covert = ConvoScreen:new {
	id = "resign_covert",
	leftDialog = "@conversation/faction_recruiter_rebel:s_540", -- How could you turn your back on people trying to win freedom from tyranny? We need everyone we can get! Won't you reconsider?
	stopConversation = "false",
	options = {
		{"@conversation/faction_recruiter_rebel:s_542", "accepted_resign"}, -- I'm sure. I have had enough war. I want out.
		{"@conversation/faction_recruiter_rebel:s_546", "dont_resign_covert"} -- You are right. It was a momentary lapse. I will stay with the Rebellion.
	}
}

rebelRecruiterConvoTemplate:addScreen(leave_resign_covert);

dont_resign_covert = ConvoScreen:new {
	id = "dont_resign_covert",
	leftDialog = "@conversation/faction_recruiter_rebel:s_548", -- Doubt is understandable, but have faith. We are on the right side. No one wants to cater to a tyrant. Down with the Empire!
	stopConversation = "false",
	options = {
		{"@conversation/faction_recruiter_rebel:s_504", "confirm_go_overt"}, -- I need to address my role in the Civil War.
		{"@conversation/faction_recruiter_rebel:s_526", "leave_time_covert"}, -- I need to go on leave for a time.
		{"@conversation/faction_recruiter_rebel:s_538", "resign_covert"}, -- This is all too much for me. I would like to resign completely.
		{"@conversation/faction_recruiter_rebel:s_562", "show_gcw_score"}, -- How are we doing in the war against the Imperial tyrants?
	}
}

rebelRecruiterConvoTemplate:addScreen(dont_resign_covert);

leave_resign_overt = ConvoScreen:new {
	id = "resign_overt",
	leftDialog = "@conversation/faction_recruiter_rebel:s_540", -- How could you turn your back on people trying to win freedom from tyranny? We need everyone we can get! Won't you reconsider?
	stopConversation = "false",
	options = {
		{"@conversation/faction_recruiter_rebel:s_542", "accepted_resign"}, -- I'm sure. I have had enough war. I want out.
		{"@conversation/faction_recruiter_rebel:s_546", "dont_resign_overt"} -- You are right. It was a momentary lapse. I will stay with the Rebellion.
	}
}

rebelRecruiterConvoTemplate:addScreen(leave_resign_overt);

dont_resign_overt = ConvoScreen:new {
	id = "dont_resign_overt",
	leftDialog = "@conversation/faction_recruiter_rebel:s_548", -- Doubt is understandable, but have faith. We are on the right side. No one wants to cater to a tyrant. Down with the Empire!
	stopConversation = "false",
	options = {
		{"@conversation/faction_recruiter_rebel:s_504", "confirm_go_covert"}, -- I need to address my role in the Civil War.
		{"@conversation/faction_recruiter_rebel:s_526", "leave_time_covert"}, -- I need to go on leave for a time.
		{"@conversation/faction_recruiter_rebel:s_538", "resign_covert"}, -- This is all too much for me. I would like to resign completely.
		{"@conversation/faction_recruiter_rebel:s_562", "show_gcw_score"}, -- How are we doing in the war against the Imperial tyrants?
	}
}

rebelRecruiterConvoTemplate:addScreen(dont_resign_overt);

accepted_resign = ConvoScreen:new {
	id = "accepted_resign",
	leftDialog = "@conversation/faction_recruiter_rebel:s_544", -- So be it. If you decide that you want to come back, let me know. But for now, you are no longer a member of the Rebellion.
	stopConversation = "true",
	options = {
	}
}

rebelRecruiterConvoTemplate:addScreen(accepted_resign);

resume_duties = ConvoScreen:new {
	id = "resume_duties",
	leftDialog = "@conversation/faction_recruiter_rebel:s_452", -- Good to hear! I just want to make sure that you are serious about returning. You really want to come off leave? Remember that most of the Imperials will attack you on sight.
	stopConversation = "false",
	options = {
		{"@conversation/faction_recruiter_rebel:s_454", "accepted_resume_duties"}, -- Absolutely.
		{"@conversation/faction_recruiter_rebel:s_458", "stay_on_leave"} -- Actually, I think I like being on leave.
	}
}

rebelRecruiterConvoTemplate:addScreen(resume_duties);

stay_on_leave = ConvoScreen:new {
	id = "stay_on_leave",
	leftDialog = "@conversation/faction_recruiter_rebel:s_460", -- All right. We need you, but I think I can give you a few more days of leave.
	stopConversation = "true",
	options = {
	}
}

rebelRecruiterConvoTemplate:addScreen(stay_on_leave);

accepted_resume_duties = ConvoScreen:new {
	id = "accepted_resume_duties",
	leftDialog = "@conversation/faction_recruiter_rebel:s_456", -- Let me send your paperwork through. It should only take me about 30 seconds to get it done.
	stopConversation = "true",
	options = {
	}
}

rebelRecruiterConvoTemplate:addScreen(accepted_resume_duties);

confirm_promotion = ConvoScreen:new {
	id = "confirm_promotion",
	leftDialog = "@conversation/faction_recruiter_rebel:s_470", -- I see that you qualify for a promotion to %TO.
	stopConversation = "false",
	options = {
		{"@conversation/faction_recruiter_rebel:s_472", "accepted_promotion"}, -- Excellent. I would like that promotion.
		{"@conversation/faction_recruiter_rebel:s_476", "declined_promotion"} -- I believe that I will stay my current rank. I am not looking for glory.
	}
}

rebelRecruiterConvoTemplate:addScreen(confirm_promotion);

accepted_promotion = ConvoScreen:new {
	id = "accepted_promotion",
	leftDialog = "@conversation/faction_recruiter_rebel:s_474", -- Outstanding! You certainly deserve this promotion. Congratulations.
	stopConversation = "true",
	options = {
	}
}

rebelRecruiterConvoTemplate:addScreen(accepted_promotion);

declined_promotion = ConvoScreen:new {
	id = "declined_promotion",
	leftDialog = "@conversation/faction_recruiter_rebel:s_478", -- While I applaud you for not seeking glory, we need good leaders. I hope you change your mind.
	stopConversation = "true",
	options = {
	}
}

rebelRecruiterConvoTemplate:addScreen(declined_promotion);

not_enough_points = ConvoScreen:new {
	id = "not_enough_points",
	leftDialog = "@faction_recruiter:not_enough_for_promotion", -- You do not have enough faction standing to spend. You must maintain at least %DI to remain part of the %TO faction.
	stopConversation = "true",
	options = {
	}
}

rebelRecruiterConvoTemplate:addScreen(not_enough_points);

confirm_bribe = ConvoScreen:new {
	id = "confirm_bribe",
	leftDialog = "@conversation/faction_recruiter_rebel:s_570", -- I would be happy to accept a donation.
	stopConversation = "false",
	options = {
		{"@conversation/faction_recruiter_rebel:s_572", "accepted_bribe_20k"} -- I just happen to have a spare 20000 credits for you.
	}
}

rebelRecruiterConvoTemplate:addScreen(confirm_bribe);

accepted_bribe_20k = ConvoScreen:new {
	id = "accepted_bribe_20k",
	leftDialog = "@conversation/faction_recruiter_rebel:s_574", -- Your donation is certainly appreciated. Let me just quickly verify the bank funds.
	stopConversation = "true",
	options = {
	}
}

rebelRecruiterConvoTemplate:addScreen(accepted_bribe_20k);

accepted_bribe_100k = ConvoScreen:new {
	id = "accepted_bribe_100k",
	leftDialog = "@conversation/faction_recruiter_rebel:s_578", -- Wow! That's quite a donation. Thank you very much. Your donation will be processed after I verify the funds.
	stopConversation = "true",
	options = {
	}
}

rebelRecruiterConvoTemplate:addScreen(accepted_bribe_100k);

faction_purchase = ConvoScreen:new {
	id = "faction_purchase",
	leftDialog = "@conversation/faction_recruiter_rebel:s_482",  -- we have some things.  what do you need?
	stopConversation = "false",
	options = {
		{ "@conversation/faction_recruiter_rebel:s_484", "fp_installations" }, -- We have some things. What do you need?
		{ "@conversation/faction_recruiter_rebel:s_488", "fp_weapons_armor" }, -- I need better weaponry and armor.
		{ "@conversation/faction_recruiter_rebel:s_492", "fp_schematics" }, -- I like to build. What schematics are available?
		{ "@conversation/faction_recruiter_rebel:s_496", "fp_furniture"}, -- I would like to do some decorating. I need furniture.
		{ "@conversation/faction_recruiter_rebel:s_500", "fp_hirelings" }, -- I need some back-up troops.
	},
}

rebelRecruiterConvoTemplate:addScreen(faction_purchase);

fp_furniture = ConvoScreen:new {
	id = "fp_furniture",
	leftDialog = "@conversation/faction_recruiter_rebel:s_498", -- What suits your style? This is what I have available.
	stopConversation = "true",
	options = {	},
}
rebelRecruiterConvoTemplate:addScreen(fp_furniture);

fp_weapons_armor = ConvoScreen:new {
	id = "fp_weapons_armor",
	leftDialog = "@conversation/faction_recruiter_rebel:s_490", -- Don't we all? With all the Imperial thugs crawling around, I don't blame you. Let me show you my selection.
	stopConversation = "true",
	options = {},
}
rebelRecruiterConvoTemplate:addScreen(fp_weapons_armor);

fp_installations = ConvoScreen:new {
	id = "fp_installations",
	leftDialog = "@conversation/faction_recruiter_rebel:s_486", -- All right. Let me show you the plans that are available.
	stopConversation = "true",
	options = {},
}
rebelRecruiterConvoTemplate:addScreen(fp_installations);

fp_schematics = ConvoScreen:new {
	id = "fp_schematics",
	leftDialog = "@conversation/faction_recruiter_rebel:s_494", -- Good. We always need people making useful goods. I'll show you what I have.
	stopConversation = "true",
	options = {},
}
rebelRecruiterConvoTemplate:addScreen(fp_schematics);

fp_hirelings = ConvoScreen:new {
	id = "fp_hirelings",
	leftDialog = "@conversation/faction_recruiter_rebel:s_502", -- I'll see what I can do, but as you know, every soldier is valuable.
	stopConversation = "true",
	options = {},

}
rebelRecruiterConvoTemplate:addScreen(fp_hirelings);

show_gcw_score = ConvoScreen:new {
	id = "show_gcw_score",
	leftDialog = "@conversation/faction_recruiter_rebel:s_564", -- Our spies have reported that the possession of the planet stands at Rebel: %TO and Imperial: %DI.
	stopConversation = "true",
	options = {}
}

rebelRecruiterConvoTemplate:addScreen(show_gcw_score);

--[[

	Covert/Overt System Responses

]]

-- Greeting neutral

neutral_start2 = ConvoScreen:new {
	id = "greet_neutral_start2",
	leftDialog = "@faction_recruiter:greeting", -- Greetings. What can I do for you today?
	stopConversation = "false",
	options = {
		{"@faction_recruiter:response_join_faction", "join_military2"}, -- I would like to become a Covert member of your faction.
	}
}
rebelRecruiterConvoTemplate:addScreen(neutral_start2);

-- Neutral joining

join_military2 = ConvoScreen:new {
	id = "join_military2",
	leftDialog = "@faction_recruiter:join_faction_confirm", -- A wise decision! Are you certain you wish to join us?
	stopConversation = "false",
	options = {
		{"@faction_recruiter:response_yes_to_join", "accept_join2"}, -- Yes. I am certain that I wish to join.
		{"@faction_recruiter:response_no_to_join", "think_more2"}, -- No. I'd rather not join at this time.
	}
}
rebelRecruiterConvoTemplate:addScreen(join_military2);

neutral_need_more_points2 = ConvoScreen:new {
	id = "neutral_need_more_points2",
	leftDialog = "@faction_recruiter:join_faction_denied", -- I am glad you've expressed such interest in joining us. You must, however, prove your devotion to our cause by increasing your %TO faction standing to at least %DI.
	stopConversation = "true",
	options = {
	}
}
rebelRecruiterConvoTemplate:addScreen(neutral_need_more_points2);

accept_join2 = ConvoScreen:new {
	id = "accept_join2",
	leftDialog = "@faction_recruiter:welcome_to_faction", -- A fine decision!  Welcome to the %TO faction.  Perhaps you would like to hear about our faction services?
	stopConversation = "false",
	options = {
		{"@faction_recruiter:response_yes_to_see_options", "faction_purchase"}, -- Yes. I would like to see what's available.
		{"@faction_recruiter:response_no_to_see_options", "greet_member_start_covert2"}, -- No thanks.  Not right now.
	}
}
rebelRecruiterConvoTemplate:addScreen(accept_join2);

think_more2 = ConvoScreen:new {
	id = "think_more2",
	leftDialog = "@faction_recruiter:join_faction_player_no", -- Sorry to hear it.  Speak with me again if you ever reconsider.
	stopConversation = "true",
	options = {
	}
}
rebelRecruiterConvoTemplate:addScreen(think_more2);


-- Greeting Covert

member_covert_start2 = ConvoScreen:new {
	id = "greet_member_start_covert2",
	leftDialog = "@faction_recruiter:greeting_member", -- Hello, %TO. What would you like to do?
	stopConversation = "false",
	options = {
		--{"@faction_recruiter:option_go_declared", "confirm_declare"}, -- I would like to declare my faction affiliation.
	}
}
rebelRecruiterConvoTemplate:addScreen(member_covert_start2);

-- Declaring overt faction status

confirm_declare = ConvoScreen:new {
	id = "confirm_declare",
	leftDialog = "@faction_recruiter:go_declared_confirm", -- If you declare your affiliation, you will become open to attack from our enemies.  Furthermore, should you change your mind, returning to your covert status is not immediate.  Are you sure you want to do this?
	stopConversation = "false",
	options = {
		{"@faction_recruiter:response_yes_to_go_declared", "declare_complete"}, -- Yes.  I'm certain I want to declare my affiliation.
		{"@faction_recruiter:response_no_to_go_declared", ""}, -- On second thought, I'll stay covert for now.
	}
}
rebelRecruiterConvoTemplate:addScreen(confirm_declare);

declare_complete = ConvoScreen:new {
	id = "declare_complete",
	leftDialog = "@faction_recruiter:go_declared_yes", -- Very well. Your affiliation is now apparent to all.  Do you need anything else?
	stopConversation = "true",
	options = {
	}
}
rebelRecruiterConvoTemplate:addScreen(declare_complete);


-- Greeting overt

member_overt_start2 = ConvoScreen:new {
	id = "greet_member_start_overt2",
	leftDialog = "@faction_recruiter:greeting_member", -- 	Hello, %TO. What would you like to do?
	stopConversation = "false",
	options = {
		--{"@faction_recruiter:option_go_covert", "confirm_covert"}, -- I would like to become a covert faction member.
	}
}
rebelRecruiterConvoTemplate:addScreen(member_overt_start2);

confirm_covert = ConvoScreen:new {
	id = "confirm_covert",
	leftDialog = "@faction_recruiter:go_covert_confirm", -- Becoming covert will shield you from attacks by our enemies, but will also prevent you from initiating conflicts with them.  Are you sure you this is what you want?
	stopConversation = "false",
	options = {
		{"@faction_recruiter:response_yes_to_go_covert", "covert_complete"}, -- Yes, I wish to become a covert member.
		{"@faction_recruiter:response_no_to_go_covert", ""}, -- No. I'd rather keep my allegiance declared.
	}
}
rebelRecruiterConvoTemplate:addScreen(confirm_covert);

covert_complete = ConvoScreen:new {
	id = "covert_complete",
	--leftDialog = "@faction_recruiter:go_covert_yes", -- Very well.  We will be able to conceal your affiliation in about %DI hours.  Is there anything else with which I can help you?
	customDialogText = "Very well. We will be able to conceal your affiliation in about 15 minutes. Is there anything else with which I can help you?",
	stopConversation = "true",
	options = {
	}
}
rebelRecruiterConvoTemplate:addScreen(covert_complete);


-- Resign Faction

resign_faction = ConvoScreen:new {
	id = "resign_faction",
	--leftDialog = "@faction_recruiter:resign_faction_confirm", -- We'd hate to lose you, %TU.  Your request will require %DI hours to process.  Be warned, if you resign all of your faction perks will be lost to you.  This includes your factional backpacks and anything contained within!  Are you sure you want to resign?
	customDialogText = "We'd hate to lose you. Your request will require 15 minutes to process. Be warned, if you resign all of your faction perks will be lost to you. Are you sure you want to resign?",
	stopConversation = "false",
	options = {
		{"@faction_recruiter:response_yes_to_resign", "confirm_resign"}, -- Yes, I would like to leave the faction.
		{"@faction_recruiter:response_no_to_resign", "dont_resign"} -- No.  I will stay for now.
	}
}
rebelRecruiterConvoTemplate:addScreen(resign_faction);

confirm_resign = ConvoScreen:new {
	id = "confirm_resign",
	--leftDialog = "@faction_recruiter:resign_faction_yes", -- Very well. You will be removed from the %TO faction in %DI hours.
	customDialogText = "Very well. You will be removed from the Rebel faction in 15 minutes.",
	stopConversation = "true",
	options = {}
}
rebelRecruiterConvoTemplate:addScreen(confirm_resign);

dont_resign = ConvoScreen:new {
	id = "dont_resign",
	leftDialog = "@faction_recruiter:resign_faction_no", -- I'm glad you changed your mind.  What would you like to do?
	stopConversation = "false",
	options = {}
}
rebelRecruiterConvoTemplate:addScreen(dont_resign);

cancel_resignation = ConvoScreen:new {
	id = "cancel_resignation",
	leftDialog = "@faction_recruiter:resignation_recinded", -- Glad to have you back!
	stopConversation = "true",
	options = {}
}
rebelRecruiterConvoTemplate:addScreen(cancel_resignation);

-- Infinity Upgrade Trade in dialogue
faction_pet_tradein = ConvoScreen:new {
	id = "faction_pet_tradein",
	customDialogText = "If you agree, I will go through your datapad and destroy all faction pets and then replace them with tokens in your inventory. If your inventory is full, I WILL Overload it! You use a radial option on the token to ready it in your datapad. You CANNOT trade or sell these tokens!",
		stopConversation = "false",
	options = {
		{"Yes, I agree", "faction_pet_tradein_agree"}
	}
}

rebelRecruiterConvoTemplate:addScreen(faction_pet_tradein);

faction_pet_tradein_agree = ConvoScreen:new {
	id = "faction_pet_tradein_agree",
	customDialogText = "All pets removed, replacements take a few seconds to appear.",
	stopConversation = "true",
	options = {
	}
}

rebelRecruiterConvoTemplate:addScreen(faction_pet_tradein_agree);

-- End of file

addConversationTemplate("rebelRecruiterConvoTemplate", rebelRecruiterConvoTemplate);
