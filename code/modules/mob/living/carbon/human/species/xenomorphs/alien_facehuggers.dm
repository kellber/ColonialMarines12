//TODO: Make these simple_animals

var/const/MIN_IMPREGNATION_TIME = 100 //time it takes to impregnate someone
var/const/MAX_IMPREGNATION_TIME = 150

var/const/MIN_ACTIVE_TIME = 200 //time between being dropped and going idle
var/const/MAX_ACTIVE_TIME = 400

/obj/item/clothing/mask/facehugger
	name = "alien"
	desc = "It has some sort of a tube at the end of its tail."
	icon = 'icons/mob/alien.dmi'
	icon_state = "facehugger"
	item_state = "facehugger"
	w_class = 3 //note: can be picked up by aliens unlike most other items of w_class below 4
	flags = PROXMOVE
	body_parts_covered = FACE|EYES
	throw_range = 5

	var/stat = CONSCIOUS //UNCONSCIOUS is the idle state in this case
	var/sterile = 0
	var/strength = 5
	var/attached = 0

/obj/item/clothing/mask/facehugger/attack_hand(user)

	if(stat == CONSCIOUS && !sterile)
		if(Attach(user))
			return

	..()

/obj/item/clothing/mask/facehugger/attack(mob/living/M, mob/user)
	..()
	user.drop_from_inventory(src)
	Attach(M)

/obj/item/clothing/mask/facehugger/examine(mob/user)
	..(user)
	switch(stat)
		if(DEAD,UNCONSCIOUS)
			to_chat(user, "<span class='danger'>[src] is not moving.</span>")
		if(CONSCIOUS)
			to_chat(user, "<span class='danger'>[src] seems to be active.</span>")
	if (sterile)
		to_chat(user, "<span class='danger'>It looks like the proboscis has been removed.</span>")
	return

/obj/item/clothing/mask/facehugger/attackby(obj/item/I, mob/user)
	if(I.force)
		user.do_attack_animation(src)
		Die()
	return

/obj/item/clothing/mask/facehugger/bullet_act()
	Die()
	return

/obj/item/clothing/mask/facehugger/fire_act(datum/gas_mixture/air, exposed_temperature, exposed_volume)
	if(exposed_temperature > T0C+80)
		Die()
	return

/obj/item/clothing/mask/facehugger/equipped(mob/M)
	. = ..()
	Attach(M)

/obj/item/clothing/mask/facehugger/Crossed(atom/target)
	HasProximity(target)
	return

/obj/item/clothing/mask/facehugger/on_found(mob/finder)
	if(stat == CONSCIOUS)
		HasProximity(finder)
		return 1
	return

/obj/item/clothing/mask/facehugger/HasProximity(atom/movable/AM)
	if(CanHug(AM))
		Attach(AM)

/obj/item/clothing/mask/facehugger/throw_at(atom/target, range, speed)
	..()
	if(stat == CONSCIOUS)
		icon_state = "[initial(icon_state)]_thrown"
		spawn(15)
			if(icon_state == "[initial(icon_state)]_thrown")
				icon_state = "[initial(icon_state)]"

/obj/item/clothing/mask/facehugger/throw_impact(atom/hit_atom)
	..()
	if(stat == CONSCIOUS)
		icon_state = "[initial(icon_state)]"
		throwing = 0
	GoIdle(30,100) //stunned for a few seconds - allows throwing them to be useful for positioning but not as an offensive action (unless you're setting up a trap)

/obj/item/clothing/mask/facehugger/proc/Attach(M)

	if(!iscorgi(M) && !ishuman(M))
		return

	if(attached)
		return

	var/mob/living/carbon/human/H = M
	if(istype(H) && (locate(/obj/item/organ/internal/xenos/hivenode) in H.internal_organs))
		return

	attached++
	spawn(MAX_IMPREGNATION_TIME)
		attached = 0

	var/mob/living/L = M // just so I don't need to use :

	if(loc == L)
		return
	if(stat != CONSCIOUS)
		return
	if(!sterile)
		L.take_organ_damage(strength, 0) //done here so that even borgs and humans in helmets take damage

	L.visible_message("<span class='danger'>[src] leaps at [L]'s face!</span>")

	if(ishuman(M))
		var/mob/living/carbon/human/target = L

		if(target.wear_mask)
			if(prob(20))
				return

			var/obj/item/clothing/W = target.wear_mask
			if(!W.canremove)
				return

			target.drop_from_inventory(W)
			target.visible_message("<span class='danger'>[src] tears [W] off of [target]'s face!</span>")

		target.equip_to_slot(src, slot_wear_mask)

		if(!sterile)
			L.Paralyse(MAX_IMPREGNATION_TIME / 6) //something like 25 ticks = 20 seconds with the default settings

	else if (iscorgi(M))
		var/mob/living/simple_animal/corgi/corgi = M

		loc = corgi
		corgi.facehugger = src
		corgi.wear_mask = src
		//C.regenerate_icons()

	GoIdle() //so it doesn't jump the people that tear it off

	spawn(rand(MIN_IMPREGNATION_TIME, MAX_IMPREGNATION_TIME))
		Impregnate(L)

	return TRUE

/obj/item/clothing/mask/facehugger/proc/Impregnate(mob/living/target)
	if(!target || target.wear_mask != src || target.stat == DEAD) //was taken off or something
		return

	if(!sterile)
		//target.contract_disease(new /datum/disease/alien_embryo(0)) //so infection chance is same as virus infection chance
		new /obj/item/alien_embryo(target)
		target.status_flags |= XENO_HOST

		target.visible_message("<span class='danger'>[src] falls limp after violating [target]'s face!</span>")

		Die()
		icon_state = "[initial(icon_state)]_impregnated"

		if(iscorgi(target))
			var/mob/living/simple_animal/corgi/C = target
			src.loc = get_turf(C)
			C.facehugger = null
	else
		target.visible_message("<span class='danger'>[src] violates [target]'s face!</span>")
	return

/obj/item/clothing/mask/facehugger/proc/GoActive()
	if(stat == DEAD || stat == CONSCIOUS)
		return

	stat = CONSCIOUS
	icon_state = "[initial(icon_state)]"

	return

/obj/item/clothing/mask/facehugger/proc/GoIdle(min_time = MIN_ACTIVE_TIME, max_time = MAX_ACTIVE_TIME)
	if(stat == DEAD || stat == UNCONSCIOUS)
		return

/*		RemoveActiveIndicators()	*/

	stat = UNCONSCIOUS
	icon_state = "[initial(icon_state)]_inactive"

	spawn(rand(min_time,max_time))
		GoActive()
	return

/obj/item/clothing/mask/facehugger/proc/Die()
	if(stat == DEAD)
		return

/*		RemoveActiveIndicators()	*/

	icon_state = "[initial(icon_state)]_dead"
	stat = DEAD

	src.visible_message("<span class='danger'>[src] curls up into a ball!</span>")

	return

/proc/CanHug(mob/M)

	if(iscorgi(M))
		return TRUE

	if(!ishuman(M))
		return FALSE

	var/mob/living/carbon/human/H = M
	if(istype(H) && (locate(/obj/item/organ/internal/xenos/hivenode) in H.internal_organs))
		return FALSE

	if(H.head && (H.head.body_parts_covered & FACE) && !(H.head.item_flags & FLEXIBLEMATERIAL))
		return FALSE

	return TRUE