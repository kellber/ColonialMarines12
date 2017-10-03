/************
* SEV Torch *
************/
/var/const/access_hangar = 73
/datum/access/hangar
	id = access_hangar
	desc = "Hangar Deck"
	region = ACCESS_REGION_GENERAL

/var/const/access_petrov = 74
/datum/access/petrov
	id = access_petrov
	desc = "Petrov"
	region = ACCESS_REGION_GENERAL

/var/const/access_petrov_helm = 75
/datum/access/petrov_helm
	id = access_petrov_helm
	desc = "Petrov Helm"
	region = ACCESS_REGION_GENERAL

/var/const/access_guppy_helm = 76
/datum/access/guppy_helm
	id = access_guppy_helm
	desc = "General Utility Pod Helm"
	region = ACCESS_REGION_GENERAL

/var/const/access_expedition_shuttle_helm = 77
/datum/access/exploration_shuttle_helm
	id = access_expedition_shuttle_helm
	desc = "Charon Helm"
	region = ACCESS_REGION_GENERAL

/var/const/access_aquila = 78
/datum/access/aquila
	id = access_aquila
	desc = "Aquila"
	region = ACCESS_REGION_GENERAL

/var/const/access_aquila_helm = 79
/datum/access/aquila_helm
	id = access_aquila_helm
	desc = "Aquila Helm"
	region = ACCESS_REGION_GENERAL

/var/const/access_solgov_crew = 80
/datum/access/solgov_crew
	id = access_solgov_crew
	desc = "SolGov Crew"
	region = ACCESS_REGION_GENERAL

/var/const/access_nanotrasen = 81
/datum/access/nanotrasen
	id = access_nanotrasen
	desc = "NanoTrasen Personnel"
	region = ACCESS_REGION_RESEARCH

/var/const/access_robotics_engineering = 82 //two accesses so that you can give access to the lab without giving access to the borgs
/datum/access/robotics_engineering
	id = access_robotics_engineering
	desc = "Biomechanical Engineering"
	region = ACCESS_REGION_ENGINEERING

/var/const/access_emergency_armory = 83
/datum/access/emergency_armory
	id = access_emergency_armory
	desc = "Emergency Armory"
	region = ACCESS_REGION_COMMAND

/var/const/access_liaison = 84
/datum/access/liaison
	id = access_liaison
	desc = "NanoTrasen Liaison"
	region = ACCESS_REGION_COMMAND
	access_type = ACCESS_TYPE_NONE //Ruler of their own domain, CO and RD cannot enter and access can't be added with computer.

/var/const/access_representative = 85
/datum/access/representative
	id = access_representative
	desc = "SolGov Representative"
	region = ACCESS_REGION_COMMAND
	access_type = ACCESS_TYPE_NONE //Ruler of their own domain, CO cannot enter and access can't be added with computer.

/var/const/access_sec_guard = 86
/datum/access/sec_guard
	id = access_sec_guard
	desc = "Security Guard"
	region = ACCESS_REGION_RESEARCH

/var/const/access_gun = 87
/datum/access/gun
	id = access_gun
	desc = "Gunnery"
	region = ACCESS_REGION_COMMAND

/var/const/access_expedition_shuttle = 88
/datum/access/exploration_shuttle
	id = access_expedition_shuttle
	desc = "Charon"
	region = ACCESS_REGION_GENERAL

/var/const/access_guppy = 89
/datum/access/guppy
	id = access_guppy
	desc = "General Utility Pod"
	region = ACCESS_REGION_GENERAL

/var/const/access_seneng = 90
/datum/access/seneng
	id = access_seneng
	desc = "Senior Engineer"
	region = ACCESS_REGION_ENGINEERING

/var/const/access_senmed = 91
/datum/access/senmed
	id = access_senmed
	desc = "Physician"
	region = ACCESS_REGION_MEDBAY

/var/const/access_senadv = 92
/datum/access/senadv
	id = access_senadv
	desc = "Senior Enlisted Advisor"
	region = ACCESS_REGION_COMMAND

/var/const/access_explorer = 93
/datum/access/explorer
	id = access_explorer
	desc = "Explorer"
	region = ACCESS_REGION_RESEARCH

/var/const/access_pathfinder = 94
/datum/access/pathfinder
	id = access_pathfinder
	desc = "Pathfinder"
	region = ACCESS_REGION_RESEARCH

/************
* SEV Torch *
************/

/datum/access/robotics
	region = ACCESS_REGION_ENGINEERING

/datum/access/network
	region = ACCESS_REGION_COMMAND

/***************
* MARINES PREP *
***************/
/var/const/access_alpha_prep = 301
/datum/access/alpha_prep
	id = access_alpha_prep
	desc = "Alpha Preparation"
	region = ACCESS_REGION_ALPHA

/var/const/access_alpha_mprep = 302
/datum/access/alpha_mprep
	id = access_alpha_mprep
	desc = "Alpha Medical Preparation"
	region = ACCESS_REGION_ALPHA

/var/const/access_alpha_eprep = 303
/datum/access/alpha_eprep
	id = access_alpha_eprep
	desc = "Alpha Engineering Preparation"
	region = ACCESS_REGION_ALPHA

/var/const/access_alpha_sprep = 304
/datum/access/alpha_sprep
	id = access_alpha_sprep
	desc = "Alpha Standard Preparation"
	region = ACCESS_REGION_ALPHA

/var/const/access_alpha_leader = 305
/datum/access/alpha_leader
	id = access_alpha_leader
	desc = "Alpha Leader Preparation"
	region = ACCESS_REGION_ALPHA


/var/const/access_bravo_prep = 306
/datum/access/bravo_prep
	id = access_bravo_prep
	desc = "Bravo Preparation"
	region = ACCESS_REGION_BRAVO

/var/const/access_bravo_mprep = 307
/datum/access/bravo_mprep
	id = access_bravo_mprep
	desc = "Bravo Medical Preparation"
	region = ACCESS_REGION_BRAVO

/var/const/access_bravo_eprep = 308
/datum/access/bravo_eprep
	id = access_bravo_eprep
	desc = "Bravo Engineering Preparation"
	region = ACCESS_REGION_BRAVO

/var/const/access_bravo_sprep = 309
/datum/access/bravo_sprep
	id = access_bravo_sprep
	desc = "Bravo Standard Preparation"
	region = ACCESS_REGION_BRAVO

/var/const/access_bravo_leader = 310
/datum/access/bravo_leader
	id = access_bravo_leader
	desc = "Bravo Leader Preparation"
	region = ACCESS_REGION_BRAVO


/var/const/access_charlie_prep = 311
/datum/access/charlie_prep
	id = access_charlie_prep
	desc = "Charlie Preparation"
	region = ACCESS_REGION_CHARLIE

/var/const/access_charlie_mprep = 312
/datum/access/charlie_mprep
	id = access_charlie_mprep
	desc = "Charlie Medical Preparation"
	region = ACCESS_REGION_CHARLIE

/var/const/access_charlie_eprep = 313
/datum/access/charlie_eprep
	id = access_charlie_eprep
	desc = "Charlie Engineering Preparation"
	region = ACCESS_REGION_CHARLIE

/var/const/access_charlie_sprep = 314
/datum/access/charlie_sprep
	id = access_charlie_sprep
	desc = "Charlie Standard Preparation"
	region = ACCESS_REGION_CHARLIE

/var/const/access_charlie_leader = 315
/datum/access/charlie_leader
	id = access_charlie_leader
	desc = "Charlie Leader Preparation"
	region = ACCESS_REGION_CHARLIE


/var/const/access_delta_prep = 316
/datum/access/delta_prep
	id = access_delta_prep
	desc = "Delta Preparation"
	region = ACCESS_REGION_DELTA

/var/const/access_delta_mprep = 317
/datum/access/delta_mprep
	id = access_delta_mprep
	desc = "Delta Medical Preparation"
	region = ACCESS_REGION_DELTA

/var/const/access_delta_eprep = 318
/datum/access/delta_eprep
	id = access_delta_eprep
	desc = "Delta Engineering Preparation"
	region = ACCESS_REGION_DELTA

/var/const/access_delta_sprep = 319
/datum/access/delta_sprep
	id = access_delta_sprep
	desc = "Delta Standard Preparation"
	region = ACCESS_REGION_DELTA

/var/const/access_delta_leader = 320
/datum/access/delta_leader
	id = access_delta_leader
	desc = "Delta Leader Preparation"
	region = ACCESS_REGION_DELTA
