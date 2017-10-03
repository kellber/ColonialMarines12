/obj/item/weapon/gun/projectile/automatic/m41a
	name = "M41A MK2"
	desc = "M41A Pulse Rifle MK2. The standard issue rifle of the Colonial Marines. Commonly carried by most combat personnel. Uses 10mm special ammunition."
	icon = 'icons/marines/marine_weapons.dmi'
	icon_override = 'icons/marines/marine_weapons.dmi'
	icon_state = "m41a"
	item_state = "m41a"
	w_class = ITEM_SIZE_HUGE
	force = 10
	caliber = "10mm"
	handle_casings = CLEAR_CASINGS
	origin_tech = list(TECH_COMBAT = 1, TECH_MATERIAL = 1)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/m41
	allowed_magazines = /obj/item/ammo_magazine/m41
	one_hand_penalty = 3
	wielded_item_state = "m41a-wielded"

	//Assault rifle, burst fire degrades quicker than SMG, worse one-handing penalty, slightly increased move delay
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=6,    one_hand_penalty=5, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="short bursts",   burst=5, fire_delay=null, move_delay=6,    one_hand_penalty=6, burst_accuracy=list(0,-1,-2,-3,-3), dispersion=list(0.6, 1.0, 1.2, 1.2, 1.5)),
		)

/obj/item/weapon/gun/projectile/automatic/m41a/update_icon()
	icon_state = (ammo_magazine)? "m41a" : "m41a-empty"
	..()

/obj/item/ammo_magazine/m41
	name = "magazine (10mm)"
	icon = 'icons/marines/marine_ammo.dmi'
	icon_state = "10caseless"
	mag_type = MAGAZINE
	caliber = "10mm"
	matter = list(DEFAULT_WALL_MATERIAL = 1800)
	ammo_type = /obj/item/ammo_casing/m41
	max_ammo = 40
	multiple_sprites = 1

/obj/item/ammo_casing/m41
	desc = "A 10mm special bullet casing."
	caliber = "10mm"
	projectile_type = /obj/item/projectile/bullet/rifle/m41
	icon_state = "rifle-casing"
	spent_icon = "rifle-casing-spent"

/obj/item/projectile/bullet/rifle/m41
	fire_sound = 'sound/marines/weapons/gunshot/gunshot_m41.ogg'
	damage = 30
