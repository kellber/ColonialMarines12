// Unsorted marines module procs and maybe their vars.

/obj/item/clothing/var/image/current_markings
/obj/item/clothing/proc/get_marine_squad_markings(for_armor)
	if(!ismob(loc))
		return

	var/mob/M = loc

	var/obj/item/weapon/card/id/O = M.get_equipped_item(slot_wear_id)
	if(!istype(O))
		return

	var/squad_color

	if(findtext(O.assignment, "Alpha"))
		squad_color = rgb(255, 0, 0)
	else if(findtext(O.assignment, "Bravo"))
		squad_color = rgb(255, 255, 0)
	else if(findtext(O.assignment, "Charlie"))
		squad_color = rgb(160, 32, 240)
	else if(findtext(O.assignment, "Delta"))
		squad_color = rgb(0, 0, 255)

	if(!squad_color)
		return

	var/image/I = image('icons/marines/marine_armor.dmi')
	if(findtext(O.assignment, "Leader"))
		I.icon_state = "sql"
	else
		I.icon_state = "std"

	I.icon_state += for_armor ? "-armor" : "-helmet"
	I.color = squad_color

	return I

// update_human_overlays only needed, when update_markings not called by src as in update_markings_mob proc.
// if called by src as in dropped or equipped procs, then update_inv_* will be called anyway, so no point in that.
/obj/item/clothing/proc/update_markings(update_human_overlays, mob/user, slot) // child proc pass slot for us.
	if(current_markings)
		overlays -= current_markings
		current_markings = null
	if(user.get_equipped_item(slot) == src)
		current_markings = get_marine_squad_markings(slot == slot_wear_suit)
		if(current_markings)
			overlays += current_markings
	if(update_human_overlays)
		update_clothing_icon()

/mob/proc/update_markings_mob()
	return

/mob/living/carbon/human/update_markings_mob()
	if(istype(wear_suit, /obj/item/clothing/suit/storage/marine_m3))
		var/obj/item/clothing/suit/storage/marine_m3/C = wear_suit
		C.update_markings(TRUE, src)
	if(istype(head, /obj/item/clothing/head/helmet/marine_m10))
		var/obj/item/clothing/head/helmet/marine_m10/C = head
		C.update_markings(TRUE, src)
