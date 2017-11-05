/datum/xeno_points_controller
	var/keys[0]
	var/points_max = 100
	var/points = 0
	var/points_per_tick = 1
	var/tick = 0

/datum/xeno_points_controller/New()
	process_controller()

/datum/xeno_points_controller/proc/process_controller()
	spawn while(1)
		add_users()
		add_points()
		sleep(120)

/datum/xeno_points_controller/proc/add_points()
	for(var/client/C in GLOB.clients)
		if("[C.ckey]" in keys)
			if(is_xenomorph(C.mob))
				var/mob/living/carbon/human/H = C.mob
				if(!H.stat)
					keys["[C.ckey]"] = min(points_max, keys["[C.ckey]"] + points_per_tick)

/datum/xeno_points_controller/proc/use_points(client/C, how_many)
	if(!C) return
	if(!how_many) return
	if(how_many < 0) return

	if("[C.ckey]" in keys)
		if(keys["[C.ckey]"] >= how_many)
			keys["[C.ckey]"] -= how_many
			return 1
		else
			C << "<span class='noticealien'>Not enough evolution points. [how_many] points required.</span>"
			return 0

/datum/xeno_points_controller/proc/add_users()
	spawn()
		for(var/client/C in GLOB.clients)
			if("[C.ckey]" in keys) continue
			if(is_xenomorph(C.mob))
				keys["[C.ckey]"] = 0

/var/global/datum/xeno_points_controller/x_points_controller = new()

/datum/xeno_stats
	var/max_health
	var/heal_rate
	var/armor
	var/max_plasma
	var/plasma_rate
	var/damage_min
	var/damage_max
	var/tackle_min
	var/tackle_max
	var/tackle_chance

	var/datum/xeno_stats/drone/drone
	var/datum/xeno_stats/sentinel/sentinel
	var/datum/xeno_stats/hunter/hunter

	var/h_regen = 0.03
	var/h_regen_damage_penalty = 20 SECONDS

/datum/xeno_stats/New()
	if(type == /datum/xeno_stats)
		drone = new
		sentinel = new
		hunter = new

/datum/xeno_stats/proc/GetCasteStats(caste)
	switch(caste)
		if(CASTE_DRONE)
			return drone
		if(CASTE_SENTINEL)
			return sentinel
		if(CASTE_HUNTER)
			return hunter
		else
			return null

/datum/xeno_stats/drone
	max_health		= list("base" = 170,	"bonus" = list("2" = 30,	"3" = 100))	//300
	heal_rate		= list("base" = 0.03,	"bonus" = list("2" = 0,		"3" = 0))
	armor			= list("base" = 80,		"bonus" = list("2" = 10,	"3" = 10))	//100
	max_plasma		= list("base" = 500,	"bonus" = list("2" = 50,	"3" = 175))	//725
	plasma_rate		= list("base" = 20,		"bonus" = list("2" = 10,	"3" = 10))	//40
	damage_min		= list("base" = 9,		"bonus" = list("2" = 0,		"3" = 0))
	damage_max		= list("base" = 14,		"bonus" = list("2" = 0,		"3" = 0))
	tackle_min		= list("base" = 1,		"bonus" = list("2" = 0,		"3" = 2))	//3
	tackle_max		= list("base" = 2,		"bonus" = list("2" = 0,		"3" = 1))	//3
	tackle_chance	= list("base" = 20,		"bonus" = list("2" = 0,		"3" = 20))	//40

/datum/xeno_stats/sentinel
	max_health		= list("base" = 200,	"bonus" = list("2" = 50,	"3" = 75))	//325
	heal_rate		= list("base" = 0.06,	"bonus" = list("2" = 2,		"3" = 2))	//10
	armor			= list("base" = 50,		"bonus" = list("2" = 25,	"3" = 25))	//100
	max_plasma		= list("base" = 200,	"bonus" = list("2" = 0,		"3" = 0))
	plasma_rate		= list("base" = 7,		"bonus" = list("2" = 0,		"3" = 0))
	damage_min		= list("base" = 18,		"bonus" = list("2" = 2,		"3" = 15))	//35
	damage_max		= list("base" = 24,		"bonus" = list("2" = 10,	"3" = 1))	//35
	tackle_min		= list("base" = 2,		"bonus" = list("2" = 0,		"3" = 2))	//4
	tackle_max		= list("base" = 4,		"bonus" = list("2" = 0,		"3" = 0))	//4
	tackle_chance	= list("base" = 60,		"bonus" = list("2" = 5,		"3" = 10))	//75

/datum/xeno_stats/hunter
	max_health		= list("base" = 200,	"bonus" = list("2" = 50,	"3" = 30))	//280
	heal_rate		= list("base" = 3,		"bonus" = list("2" = 3,		"3" = 4))	//10
	armor			= list("base" = 115,	"bonus" = list("2" = 25,	"3" = 25))	//165
	max_plasma		= list("base" = 0,		"bonus" = list("2" = 0,		"3" = 0))
	plasma_rate		= list("base" = 0,		"bonus" = list("2" = 0,		"3" = 0))
	damage_min		= list("base" = 23,		"bonus" = list("2" = 8,		"3" = 13))	//44
	damage_max		= list("base" = 28,		"bonus" = list("2" = 7,		"3" = 16))	//51
	tackle_min		= list("base" = 3,		"bonus" = list("2" = 1,		"3" = 0))	//4
	tackle_max		= list("base" = 5,		"bonus" = list("2" = 1,		"3" = 1))	//7
	tackle_chance	= list("base" = 60,		"bonus" = list("2" = 5,		"3" = 15))	//80
