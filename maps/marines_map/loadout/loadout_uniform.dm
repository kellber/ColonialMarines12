// Uniform slot
/datum/gear/uniform
	display_name = "black shorts" //kept separate because there aren't any other uniforms that every role could have
	path = /obj/item/clothing/under/shorts/black
	slot = slot_w_uniform
	sort_category = "Uniforms and Casual Dress"

/datum/gear/uniform/jumpsuit
	display_name = "jumpsuit"
	path = /obj/item/clothing/under/color
	flags = GEAR_HAS_COLOR_SELECTION
	allowed_roles = NON_MILITARY_ROLES

/datum/gear/uniform/jumpsuit_f
	display_name = "feminine jumpsuit"
	path = /obj/item/clothing/under/fcolor
	flags = GEAR_HAS_COLOR_SELECTION
	allowed_roles = NON_MILITARY_ROLES

/datum/gear/uniform/shortjumpskirt
	display_name = "short jumpskirt"
	path = /obj/item/clothing/under/shortjumpskirt
	flags = GEAR_HAS_COLOR_SELECTION
	allowed_roles = RESTRICTED_ROLES

/datum/gear/uniform/blackjumpshorts
	display_name = "black jumpsuit shorts"
	path = /obj/item/clothing/under/color/blackjumpshorts
	allowed_roles = RESTRICTED_ROLES

/datum/gear/uniform/roboticist_skirt
	display_name = "skirt, roboticist"
	path = /obj/item/clothing/under/rank/roboticist/skirt
	allowed_roles = list(/datum/job/roboticist)

/datum/gear/uniform/suit
	display_name = "clothes selection"
	path = /obj/item/clothing/under
	allowed_roles = FORMAL_ROLES

/datum/gear/uniform/suit/New()
	..()
	var/suits = list()
	suits["amish suit"] = /obj/item/clothing/under/sl_suit
	suits["black suit"] = /obj/item/clothing/under/suit_jacket
	suits["blue suit"] = /obj/item/clothing/under/lawyer/blue
	suits["burgundy suit"] = /obj/item/clothing/under/suit_jacket/burgundy
	suits["charcoal suit"] = /obj/item/clothing/under/suit_jacket/charcoal
	suits["checkered suit"] = /obj/item/clothing/under/suit_jacket/checkered
	suits["executive suit"] = /obj/item/clothing/under/suit_jacket/really_black
	suits["female executive suit"] = /obj/item/clothing/under/suit_jacket/female
	suits["gentleman suit"] = /obj/item/clothing/under/gentlesuit
	suits["navy suit"] = /obj/item/clothing/under/suit_jacket/navy
	suits["old man suit"] = /obj/item/clothing/under/lawyer/oldman
	suits["purple suit"] = /obj/item/clothing/under/lawyer/purpsuit
	suits["red suit"] = /obj/item/clothing/under/suit_jacket/red
	suits["red lawyer suit"] = /obj/item/clothing/under/lawyer/red
	suits["shiny black suit"] = /obj/item/clothing/under/lawyer/black
	suits["tan suit"] = /obj/item/clothing/under/suit_jacket/tan
	suits["white suit"] = /obj/item/clothing/under/scratch
	suits["white-blue suit"] = /obj/item/clothing/under/lawyer/bluesuit
	suits["formal outfit"] = /obj/item/clothing/under/rank/internalaffairs/plain
	suits["blue blazer"] = /obj/item/clothing/under/blazer
	suits["black jumpskirt"] = /obj/item/clothing/under/blackjumpskirt
	suits["kilt"] = /obj/item/clothing/under/kilt
	suits["human resources dress"] = /obj/item/clothing/under/dress/dress_hr
	suits["detective's suit"] = /obj/item/clothing/under/det
	suits["black detective's suit"] = /obj/item/clothing/under/det/black
	suits["grey detective's suit"] = /obj/item/clothing/under/det/grey
	gear_tweaks += new/datum/gear_tweak/path(suits)

/datum/gear/uniform/scrubs
	display_name = "medical scrubs"
	path = /obj/item/clothing/under/rank/medical
	allowed_roles = STERILE_ROLES

/datum/gear/uniform/scrubs/New()
	..()
	var/scrubcolor = list()
	scrubcolor["black scrubs"] = /obj/item/clothing/under/rank/medical/black
	scrubcolor["blue scrubs"] = /obj/item/clothing/under/rank/medical/blue
	scrubcolor["green scrubs"] = /obj/item/clothing/under/rank/medical/green
	scrubcolor["navy blue scrubs"] = /obj/item/clothing/under/rank/medical/navyblue
	scrubcolor["purple scrubs"] = /obj/item/clothing/under/rank/medical/purple
	gear_tweaks += new/datum/gear_tweak/path(scrubcolor)

/datum/gear/uniform/dress
	display_name = "dress selection"
	path = /obj/item/clothing/under
	allowed_roles = FORMAL_ROLES

/datum/gear/uniform/dress/New()
	..()
	var/dresses = list()
	dresses["white sundress"] = /obj/item/clothing/under/sundress_white
	dresses["flame dress"] = /obj/item/clothing/under/dress/dress_fire
	dresses["green dress"] = /obj/item/clothing/under/dress/dress_green
	dresses["orange dress"] = /obj/item/clothing/under/dress/dress_orange
	dresses["pink dress"] = /obj/item/clothing/under/dress/dress_pink
	dresses["purple dress"] = /obj/item/clothing/under/dress/dress_purple
	dresses["sundress"] = /obj/item/clothing/under/sundress
	gear_tweaks += new/datum/gear_tweak/path(dresses)

/datum/gear/uniform/cheongsam
	display_name = "cheongsam"
	path = /obj/item/clothing/under/cheongsam
	flags = GEAR_HAS_COLOR_SELECTION
	allowed_roles = FORMAL_ROLES

/datum/gear/uniform/abaya
	display_name = "abaya"
	path = /obj/item/clothing/under/abaya
	flags = GEAR_HAS_COLOR_SELECTION
	allowed_roles = FORMAL_ROLES

/datum/gear/uniform/skirt
	display_name = "skirt selection"
	path = /obj/item/clothing/under/skirt
	allowed_roles = FORMAL_ROLES
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/skirt/color
	display_name = "short skirt"
	path = /obj/item/clothing/under/skirt_c
	allowed_roles = FORMAL_ROLES
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/uniform/casual_pants
	display_name = "casual pants selection"
	path = /obj/item/clothing/under/casual_pants
	allowed_roles = SEMIFORMAL_ROLES
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/formal_pants
	display_name = "formal pants selection"
	path = /obj/item/clothing/under/formal_pants
	allowed_roles = FORMAL_ROLES
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/shorts
	display_name = "shorts selection"
	path = /obj/item/clothing/under/shorts/jeans
	allowed_roles = RESTRICTED_ROLES
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/turtleneck
	display_name = "sweater"
	path = /obj/item/clothing/under/rank/psych/turtleneck/sweater
	flags = GEAR_HAS_COLOR_SELECTION
	allowed_roles = FORMAL_ROLES

/datum/gear/uniform/tacticool
	display_name = "tacticool turtleneck"
	path = /obj/item/clothing/under/syndicate/tacticool
	allowed_roles = RESTRICTED_ROLES

/datum/gear/uniform/corporate
	display_name = "corporate uniform selection"
	path = /obj/item/clothing/under
	allowed_roles = list(/datum/job/scientist, /datum/job/mining, /datum/job/guard, /datum/job/scientist_assistant,
						/datum/job/scientist_assistant, /datum/job/engineer_contractor, /datum/job/roboticist, /datum/job/doctor_contractor,
						/datum/job/chemist, /datum/job/psychiatrist, /datum/job/cargo_contractor, /datum/job/bartender, /datum/job/merchant)

/datum/gear/uniform/corporate/New()
	..()
	var/corps = list()
	corps["major bill's shipping uniform"] = /obj/item/clothing/under/mbill
	corps["SAARE uniform"] = /obj/item/clothing/under/saare
	corps["aether atmospherics uniform"] = /obj/item/clothing/under/aether
	corps["hephaestus uniform"] = /obj/item/clothing/under/hephaestus
	corps["PCRC uniform"] = /obj/item/clothing/under/pcrc
	corps["ward-takahashi uniform"] = /obj/item/clothing/under/wardt
	corps["grayson uniform"] = /obj/item/clothing/under/grayson
	corps["focal point uniform"] = /obj/item/clothing/under/focal
	gear_tweaks += new/datum/gear_tweak/path(corps)

/datum/gear/uniform/sterile
	display_name = "sterile jumpsuit"
	path = /obj/item/clothing/under/sterile
	allowed_roles = MEDICAL_ROLES

/datum/gear/uniform/hazard
	display_name = "hazard jumpsuit"
	path = /obj/item/clothing/under/hazard
	allowed_roles = ENGINEERING_ROLES

/datum/gear/uniform/utility
	display_name = "Contractor Utility Uniform"
	path = /obj/item/clothing/under/utility
	allowed_roles = CONTRACTOR_ROLES

/datum/gear/uniform/frontier
	display_name = "frontier clothes"
	path = /obj/item/clothing/under/frontier
	allowed_roles = NON_MILITARY_ROLES
