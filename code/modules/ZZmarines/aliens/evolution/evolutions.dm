#define RESEARCH_T1	1200
#define RESEARCH_T2	3600
#define RESEARCH_T3	1800

#define COST_T1	5
#define COST_T2	10
#define COST_T3	15

var/datum/xeno_stats/x_stats = new /datum/xeno_stats

/datum/evolution/queen
	category = "Queen"

/datum/evolution/queen/queen_has_risen
	name = "The Queen Has Risen"
	desc = "<xeno>The Queen Has Risen</xeno><br>Required for everything."
	desc_level = list(
					1 = "Tier <statp>1</statp> evolutions available.",
					2 = "Increase your movement speed.<br>Tier <statp>2</statp> evolutions available.",
					3 = "Increase your movement speed.<br>Tier <statp>3</statp> evolutions available.",
					4 = "Increase your movement speed.<br>Tier <statc>3</statc> evolutions available.")
	id = "q_qhr"

	research_time = 600
	cost = COST_T1 + 5
	maxlevel = 3
	req_total_points = list(1 = 0, 2 = 12, 3 = 18)

//--------------------------------HIVE--------------------------------
/datum/evolution/hive
	category = "Hive"

/datum/evolution/hive/regeneration
	name = "Regeneration"
	desc = "<xeno>Regeneration</xeno><br>Boost regeneration rate."
	desc_level = list(
					1 = "Regenerate 4% health/armor every <statp>2</statp> seconds.",
					2 = "Regenerate 5% health/armor every <statp>2</statp> seconds.",
					3 = "Regenerate 6% health/armor every <statp>2</statp> seconds.",
					4 = "Regenerate 6% health/armor every <statp>2</statp> seconds.")
	id = "h_reg"

	tier = 1
	research_time = RESEARCH_T1
	cost = COST_T1 + 2
	maxlevel = 3

/datum/evolution/hive/regeneration/on_level()
	switch(level)
		if(1)
			x_stats.h_regen = 0.04
		if(2)
			x_stats.h_regen = 0.05
		if(3)
			x_stats.h_regen = 0.06
	..()

//--------------------------------DRONE--------------------------------
/datum/evolution/drone
	category = "Drone"

/datum/evolution/drone/drone
	name = "Nanny"
	desc = "<xeno>Drone</xeno>"
	id = "d_nan"

	caste = CASTE_DRONE

	level = 1
	research_time = RESEARCH_T1
	cost = COST_T1
	maxlevel = 3

//--------------------------------SENTINEL--------------------------------
/datum/evolution/sentinel
	category = "Sentinel"

/datum/evolution/sentinel/sentinel
	name = "Hive Watcher"
	desc = "<xeno>Sentinel</xeno>"
	id = "s_hwa"

	caste = CASTE_SENTINEL

	level = 1
	research_time = RESEARCH_T1
	cost = COST_T1
	maxlevel = 3

//--------------------------------WARRIOR--------------------------------
/datum/evolution/warrior
	category = "Warrior"

/datum/evolution/warrior/hunter
	name = "Warrior"
	desc = "<xeno>Hunter</xeno>"
	id = "w_hun"

	caste = CASTE_HUNTER

	level = 1
	research_time = RESEARCH_T1
	cost = COST_T1
	maxlevel = 3
