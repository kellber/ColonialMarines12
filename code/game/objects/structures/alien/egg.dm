/var/const/BURST = 0
/var/const/BURSTING = 1
/var/const/GROWING = 2
/var/const/GROWN = 3

/var/const/MIN_GROWTH_TIME = 1800 // time it takes to grow a hugger
/var/const/MAX_GROWTH_TIME = 3000

/obj/structure/alien/egg
	desc = "It looks like a weird egg."
	name = "egg"
	icon_state = "egg_growing"
	density = 0
	anchored = 1
	flags = PROXMOVE
	health = 100

	var/status = GROWING // can be GROWING, GROWN or BURST; all mutually exclusive

/obj/structure/alien/egg/Initialize()
	. = ..()
	spawn(rand(MIN_GROWTH_TIME, MAX_GROWTH_TIME))
		Grow()

/obj/structure/alien/egg/attack_hand(user)

	var/mob/living/carbon/human/H = user
	if(!istype(H) || !(locate(/obj/item/organ/internal/xenos/hivenode) in H.internal_organs))
		to_chat(user, "<span class='notice'>It feels slimy.</span>")
		return

	switch(status)
		if(BURST)
			to_chat(user, "<span class='warning'>You clear the hatched egg.</span>")
			qdel(src)
			return
		if(GROWING)
			to_chat(user, "<span class='warning'>The child is not developed yet.</span>")
			return
		if(GROWN)
			to_chat(user, "<span class='warning'>You retrieve the child.</span>")
			Burst(0)
			return

/obj/structure/alien/egg/proc/GetFacehugger()
	return locate(/obj/item/clothing/mask/facehugger) in contents

/obj/structure/alien/egg/proc/Grow()
	status = GROWN
	update_icon()
	new /obj/item/clothing/mask/facehugger(src)
	return

/obj/structure/alien/egg/proc/Burst(kill = 1) //drops and kills the hugger if any is remaining
	if(status == GROWN || status == GROWING)

		var/obj/item/clothing/mask/facehugger/child = GetFacehugger()
		if(!child)
			return

		status = BURSTING
		update_icon()
		flick("egg_opening", src)
		spawn(15)
			status = BURST
			child.forceMove(get_turf(src))

			if(kill && istype(child))
				child.Die()
			else
				for(var/mob/M in range(1,src))
					if(CanHug(M))
						child.Attach(M)
						break

/obj/structure/alien/egg/attackby(obj/item/weapon/W, mob/user)
	if(health <= 0)
		return
	if(W.attack_verb.len)
		visible_message("<span class='danger'>\The [src] has been [pick(W.attack_verb)] with \the [W][(user ? " by [user]." : ".")]</span>")
	else
		visible_message("<span class='danger'>\The [src] has been attacked with \the [W][(user ? " by [user]." : ".")]</span>")
	var/damage = W.force / 4.0

	if(istype(W, /obj/item/weapon/weldingtool))
		var/obj/item/weapon/weldingtool/WT = W

		if(WT.remove_fuel(0, user))
			damage = 15
			playsound(src, 'sound/items/Welder.ogg', 100, 1)

	health -= damage
	healthcheck()

/obj/structure/alien/egg/healthcheck()
	if(health <= 0)
		Burst()

/obj/structure/alien/egg/fire_act(datum/gas_mixture/air, exposed_temperature, exposed_volume)
	if(exposed_temperature > 500 + T0C)
		health -= 5
		healthcheck()

/obj/structure/alien/egg/HasProximity(atom/movable/AM)
	if(status == GROWN)
		if(!CanHug(AM))
			return

		var/mob/living/carbon/C = AM
		if(C.stat == CONSCIOUS && C.status_flags & XENO_HOST)
			return

		Burst(0)

/obj/structure/alien/egg/update_icon()
	switch(status)
		if(BURSTING, BURST)
			icon_state = "egg_hatched"
		if(GROWN)
			icon_state = "egg"
		if(GROWING)
			icon_state = "egg_growing"
