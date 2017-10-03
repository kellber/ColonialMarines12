/obj/structure/closet/secure_closet/marine
	name = "marine's locker"
	req_access = list()
	icon_state = "standard1"
	icon_closed = "standard"
	icon_locked = "standard1"
	icon_opened = "squad_open"
	icon_broken = "standardbroken"
	icon_off = "standardoff"

/obj/structure/closet/secure_closet/marine/WillContain()
	return list(
		/obj/item/clothing/suit/storage/marine_m3,
		/obj/item/weapon/storage/belt/security,
		/obj/item/clothing/head/helmet/marine_m10,
		/obj/item/device/flashlight/maglight,
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/clothing/shoes/jackboots,
		/obj/item/clothing/gloves/thick,
		/obj/item/clothing/under/mildress/marine,
		/obj/item/device/radio/headset,

		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack/security, /obj/item/weapon/storage/backpack/satchel_sec)),
		new /datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack/dufflebag/sec, /obj/item/weapon/storage/backpack/messenger/sec))
	)

/obj/structure/closet/secure_closet/marine/marine_alpha_equipment
	name = "alpha squad's locker"
	req_access = list(access_alpha_prep)
	icon_state = "alpha1"
	icon_closed = "alpha"
	icon_locked = "alpha1"
	icon_broken = "alphabroken"
	icon_off = "alphaoff"

/obj/structure/closet/secure_closet/marine/marine_alpha_equipment/WillContain()
	return ..() + list(/obj/item/device/radio/headset/marine_alpha)

/obj/structure/closet/secure_closet/marine/marine_bravo_equipment
	name = "bravo squad's locker"
	req_access = list(access_bravo_prep)
	icon_state = "bravo1"
	icon_closed = "bravo"
	icon_locked = "bravo1"
	icon_broken = "bravobroken"
	icon_off = "bravooff"

/obj/structure/closet/secure_closet/marine/marine_bravo_equipment/WillContain()
	return ..() + list(/obj/item/device/radio/headset/marine_bravo)

/obj/structure/closet/secure_closet/marine/marine_charlie_equipment
	name = "charlie squad's locker"
	req_access = list(access_charlie_prep)
	icon_state = "charlie1"
	icon_closed = "charlie"
	icon_locked = "charlie1"
	icon_broken = "charliebroken"
	icon_off = "charlieoff"

/obj/structure/closet/secure_closet/marine/marine_charlie_equipment/WillContain()
	return ..() + list(/obj/item/device/radio/headset/marine_charlie)

/obj/structure/closet/secure_closet/marine/marine_delta_equipment
	name = "delta squad's locker"
	req_access = list(access_delta_prep)
	icon_state = "delta1"
	icon_closed = "delta"
	icon_locked = "delta1"
	icon_broken = "deltabroken"
	icon_off = "deltaoff"

/obj/structure/closet/secure_closet/marine/marine_delta_equipment/WillContain()
	return ..() + list(/obj/item/device/radio/headset/marine_delta)
