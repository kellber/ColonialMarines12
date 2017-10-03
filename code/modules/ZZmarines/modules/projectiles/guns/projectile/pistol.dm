/obj/item/weapon/gun/projectile/m4a3
	name = "M4A3 service pistol"
	desc = "M4A3 Service Pistol, the standard issue sidearm of the Colonial Marines. Uses .45 rounds."
	icon = 'icons/marines/marine_weapons.dmi'
	icon_state = "m4a3"
	magazine_type = /obj/item/ammo_magazine/m4a3
	allowed_magazines = /obj/item/ammo_magazine/m4a3
	caliber = ".45"
	origin_tech = list(TECH_COMBAT = 1, TECH_MATERIAL = 1)
	load_method = MAGAZINE

/obj/item/weapon/gun/projectile/m4a3/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "m4a3"
	else
		icon_state = "m4a3-e"

/obj/item/ammo_magazine/m4a3
	name = "M4A3 magazine (.45)"
	icon = 'icons/marines/marine_ammo.dmi'
	icon_state = "a45"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/c45/m4a3
	matter = list(DEFAULT_WALL_MATERIAL = 525) //metal costs are very roughly based around 1 .45 casing = 75 metal
	caliber = ".45"
	max_ammo = 12
	multiple_sprites = 1

/obj/item/ammo_magazine/m4a3/empty
	initial_ammo = 0

/obj/item/ammo_casing/c45/m4a3
	projectile_type = /obj/item/projectile/bullet/pistol/m4a3

/obj/item/projectile/bullet/pistol/m4a3
	fire_sound = 'sound/marines/weapons/gunshot/gunshot_m4a3.ogg'
	damage = 25
