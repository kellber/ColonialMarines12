/obj/item/clothing/suit/storage/marine_m3
	name = "M3 Pattern Marine Armor"
	desc = "A standard Colonial Marines M3 Pattern Chestplate. Protects the chest from ballistic rounds, bladed objects and accidents. It has a small leather pouch strapped to it for limited storage."
	icon = 'icons/marines/marine_armor.dmi'
	icon_override = 'icons/marines/marine_armor.dmi'
	icon_state = "m3"
	valid_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA)
	blood_overlay_type = "armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	allowed = list(/obj/item/device/flashlight,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/weapon/handcuffs,/obj/item/weapon/storage/fancy/cigarettes,/obj/item/weapon/flame/lighter)
	armor = list(melee = 30, bullet = 15, laser = 40, energy = 10, bomb = 25, bio = 0, rad = 0)

/obj/item/clothing/suit/storage/marine_m3/get_mob_overlay(mob/user_mob, slot)
	var/image/ret = ..()

	if(slot == 	slot_l_hand_str) // dunno why bay12 override hands icon_state under /suit path, so i override again :/.
		ret.icon_state = "[icon_state]_l"
	else if(slot == slot_r_hand_str)
		ret.icon_state = "[icon_state]_r"

	if(current_markings)
		ret.overlays += current_markings

	return ret

/obj/item/clothing/suit/storage/marine_m3/equipped(mob/user, slot)
	..()
	update_markings(FALSE, user)

/obj/item/clothing/suit/storage/marine_m3/dropped(mob/user)
	..()
	update_markings(FALSE, user)

/obj/item/clothing/suit/storage/marine_m3/update_markings(update_human_overlays, mob/user)
	..(update_human_overlays, user, slot_wear_suit)
