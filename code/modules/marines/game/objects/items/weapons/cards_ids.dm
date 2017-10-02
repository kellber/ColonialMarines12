/obj/item/weapon/card/id/equipped(mob/user, slot)
	..()
	if(slot == slot_wear_id)
		user.update_markings_mob()

/obj/item/weapon/card/id/dropped(mob/user)
	..()
	user.update_markings_mob()
