//Shouldn't be a lot in here, only torch versions of existing machines that need a different access req or something along those lines.

/obj/machinery/vending/medical/torch
	req_access = list(access_medical)

/obj/machinery/drone_fabricator/torch
	fabricator_tag = "SEV Torch Maintenance"

/obj/machinery/drone_fabricator/torch/adv
	name = "advanced drone fabricator"
	fabricator_tag = "SFV Arrow Maintenance"
	drone_type = /mob/living/silicon/robot/drone/construction

//telecommunications gubbins for torch-specific networks

/obj/machinery/telecomms/hub/preset
	id = "Hub"
	network = "tcommsat"
	autolinkers = list("hub", "relay", "c_relay", "s_relay", "m_relay", "r_relay", "b_relay", "1_relay", "2_relay", "3_relay", "4_relay", "5_relay", "s_relay", "science", "medical",
	"supply", "service", "common", "command", "engineering", "security", "exploration", "unused",
 	"receiverA", "broadcasterA")

/obj/machinery/telecomms/receiver/preset_right
	freq_listening = list(AI_FREQ, SCI_FREQ, MED_FREQ, SUP_FREQ, SRV_FREQ, COMM_FREQ, ENG_FREQ, SEC_FREQ, ENT_FREQ, EXP_FREQ, MAR_ALPHA, MAR_BRAVO, MAR_CHARLIE, MAR_DELTA)

/obj/machinery/telecomms/bus/preset_two
	freq_listening = list(SUP_FREQ, SRV_FREQ, EXP_FREQ, MAR_ALPHA, MAR_BRAVO, MAR_CHARLIE, MAR_DELTA)
	autolinkers = list("processor2", "supply", "service", "exploration", "unused")

/obj/machinery/telecomms/server/presets/service
	id = "Service and Exploration Server"
	freq_listening = list(SRV_FREQ, EXP_FREQ, MAR_ALPHA, MAR_BRAVO, MAR_CHARLIE, MAR_DELTA)
	autolinkers = list("service", "exploration")

/obj/machinery/telecomms/server/presets/exploration
	id = "Utility Server"
	freq_listening = list(EXP_FREQ, MAR_ALPHA, MAR_BRAVO, MAR_CHARLIE, MAR_DELTA)
	autolinkers = list("Exploration")

// Suit cyclers and storage
/obj/machinery/suit_cycler/exploration
	name = "Exploration suit cycler"
	model_text = "Exploration"
	req_access = list(access_explorer)
	departments = list("Exploration")
	species = list(SPECIES_HUMAN,SPECIES_TAJARA,SPECIES_SKRELL)

/obj/machinery/suit_storage_unit/explorer
	name = "Exploration Voidsuit Storage Unit"
	SUIT_TYPE = /obj/item/clothing/suit/space/void/exploration
	HELMET_TYPE = /obj/item/clothing/head/helmet/space/void/exploration
	BOOTS_TYPE = /obj/item/clothing/shoes/magboots
	TANK_TYPE = /obj/item/weapon/tank/oxygen
	MASK_TYPE = /obj/item/clothing/mask/breath
	req_access = list(access_explorer)
	islocked = 1

/obj/machinery/vending/marine
	name = "EqMarTech"
	desc = "A marine equipment vendor."
	product_ads = "If it moves, it's hostile!;How many enemies have you killed today?;Shoot first, perform autopsy later!;Your ammo is right here.;Guns!;Die, scumbag!;Don't shoot me bro!;Shoot them, bro.;Why not have a donut?"
	icon_state = "robotics"
	icon_deny = "robotics-deny"
	vend_delay = 14
	req_one_access = list(access_alpha_prep, access_bravo_prep, access_charlie_prep, access_delta_prep)
	products = list(
		/obj/item/weapon/gun/projectile/automatic/m41a = 5,
		/obj/item/weapon/gun/projectile/m4a3 = 5,

		/obj/item/ammo_magazine/m41 = 25,
		/obj/item/ammo_magazine/m4a3 = 25,

		/obj/item/weapon/material/kitchen/utensil/knife/boot = 5,

		/obj/item/device/flashlight/flare = 10,
		/obj/item/device/flashlight = 2
		)

/obj/machinery/vending/marine_med
	name = "MedMarTech"
	desc = "A marine medical drug dispenser."
	icon_state = "med"
	icon_deny = "med-deny"
	icon_vend = "med-vend"
	vend_delay = 18
	product_ads = "Go save some lives!;The best stuff for your medbay.;Only the finest tools.;Natural chemicals!;This stuff saves lives.;Don't you want some?;Ping!"
	req_one_access = list(access_alpha_prep, access_bravo_prep, access_charlie_prep, access_delta_prep)
	products = list(
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/detox = 10,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/pain = 10
		)
	idle_power_usage = 211 //refrigerator - believe it or not, this is actually the average power consumption of a refrigerated vending machine according to NRCan.
