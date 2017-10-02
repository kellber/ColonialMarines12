/obj/item/clothing/head/helmet/marine_m10
	name = "M10 Pattern Marine Helmet"
	desc = "A standard M10 Pattern Helmet. It reads on the label, 'The difference between an open-casket and closed-casket funeral. Wear on head for best results.'."
	icon = 'icons/marines/marine_armor.dmi'
	icon_override = 'icons/marines/marine_armor.dmi'
	icon_state = "helmet"

/obj/item/clothing/head/helmet/marine_m10/get_mob_overlay(mob/user_mob, slot)
	var/image/ret = ..()

	if(current_markings)
		ret.overlays += current_markings

	return ret

/obj/item/clothing/head/helmet/marine_m10/equipped(mob/user, slot)
	..()
	update_markings(FALSE, user)

/obj/item/clothing/head/helmet/marine_m10/dropped(mob/user)
	..()
	update_markings(FALSE, user)

/obj/item/clothing/head/helmet/marine_m10/update_markings(update_human_overlays, mob/user)
	..(update_human_overlays, user, slot_head)
