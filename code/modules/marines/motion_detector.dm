GLOBAL_VAR_INIT(detector_window, "parent=detectorwindow;type=MAIN;pos=281,0;size=128x128;anchor1=none;\
	anchor2=none;font-family=\"\";font-size=0;font-style=\"\";text-color=#000000;background-color=none;\
	is-visible=false;is-disabled=false;is-transparent=false;is-default=false;border=none;drop-zone=false;\
	right-click=false;saved-params=\"pos;size;is-minimized;is-maximized;\";on-size=\"\";title=\"\";\
	titlebar=true;statusbar=false;can-close=false;can-minimize=true;can-resize=true;is-pane=false;\
	is-minimized=false;is-maximized=false;can-scroll=none;icon=\"\";image=\"\";image-mode=stretch;\
	keep-aspect=false;transparent-color=none;alpha=255;macro=\"\";menu=\"\";on-close=\"\"")
GLOBAL_VAR_INIT(detector, "parent=detectorwindow;type=MAP;pos=0,0;size=128x128;anchor1=0,0;anchor2=100,100;\
	font-family=\"\";font-size=0;font-style=\"\";text-color=none;background-color=none;is-visible=true;\
	is-disabled=false;is-transparent=false;is-default=false;border=none;drop-zone=true;right-click=false;\
	saved-params=icon-size;on-size=\"\";icon-size=0;text-mode=false;letterbox=true;zoom=0;on-show=\"\";on-hide=\"\";style=\"\"")

/mob/var/current_detector = null

/obj/item/device/motiondetector
	name = "motion detector"
	icon = 'icons/marines/motiondetector.dmi'
	icon_state = "off"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	w_class = ITEM_SIZE_SMALL
	item_state = "electronic"
	throw_speed = 4
	throw_range = 20
	matter = list(DEFAULT_WALL_MATERIAL = 50, "glass" = 20)

	var/active = FALSE
	var/static/obj/detector_image

/obj/item/device/motiondetector/Initialize()
	. = ..()
	QDEL_NULL(detector_image)
	if(!detector_image)
		detector_image = new
		detector_image.icon = 'icons/marines/detectorscreen.dmi'
		detector_image.screen_loc = "detector:-3,-3"

/obj/item/device/motiondetector/Destroy()
	active = FALSE
	. = ..()

/obj/item/device/motiondetector/attack_self(mob/user)
	winclone(user, "window", "detectorwindow")
	winset(user, "detectorwindow", GLOB.detector_window)
	winset(user, "detector", GLOB.detector)

	if(!(detector_image in user.client.screen)) // animated detector background
		user.client.screen += detector_image

	ToggleDetector(user)

/obj/item/device/motiondetector/proc/Redraw(mob/user)
	var/client/C = user.client
	while(active && user.client)

		if(user.get_equipped_item(slot_r_hand) != src && user.get_equipped_item(slot_l_hand) != src) // If the radar isn't in hand, disable it and stop the loop.
			break

		var/list/detected = list()

		for(var/atom/movable/target in orange(14, user))
			if(!isliving(target) && !isobj(target))
				continue

			if(istype(target, /obj/machinery/door))
				var/obj/machinery/door/D = target
				if(D.operating)
					detected[D] = TRUE
			//else if(isliving(target) && istype(get_equipped_item(slot_wear_suit), /obj/item/clothing/suit/storage/marine2)) until clothes port or smth.
			//	continue
			else
				detected[target] = target.loc

		sleep(3) //Amount of time to "check" for movement

		if(detected.len)
			var/dist = 100 // this used below, to get sound tone for pinging.
			for(var/atom/movable/target in detected)
				var/T = detected[target]
				detected -= target

				if(QDELETED(target))
					continue

				if(isnum(T) || isturf(T) && T != target.loc) // num check for doors.
					dist = min(dist, get_dist(target, user))
					new /obj/Blip(null, target, user)

			playsound(src, 'sound/marines/effects/detector.ogg', 150, 1, 0, null, FALSE, 55000 - dist * 1500) //If player isn't the only blip, play ping

		playsound(src, 'sound/marines/effects/tick.ogg', 125)
		flick("", detector_image)
		sleep(4)

	active = FALSE
	icon_state = "off"
	user.current_detector = null
	if(C)
		winshow(C, "detectorwindow", 0)

/obj/item/device/motiondetector/proc/ToggleDetector(mob/user)
	if(winget(user, "detectorwindow", "is-visible") == "true" && user.current_detector == src) // Checks if radar window is already open and if radar is assigned
		active = FALSE // Sets the active state of the radar to off
		icon_state = "off"
		user << "<span class='notice'>You deactivate the radar.</span>"
		winshow(user, "detectorwindow", 0) //Closes the radar window
		playsound(null) // Stops the radar pings
		user.current_detector = null
	else if(!user.current_detector)
		active = 1
		icon_state = "on"
		user << "<span class='notice'> You activate the radar.</span>"
		winshow(user, "detectorwindow", 1)
		user.current_detector = src
		Redraw(user)
	else
		user << "<span class='warning'>You're already using another tracker.</span>"

/obj/item/device/motiondetector/dropped(mob/user)
	if(active)
		ToggleDetector(user) //Disables the radar if dropped
		icon_state = "off"

/obj/item/device/motiondetector/pickup(mob/user)
	if(active && user.current_detector == src) //If the radar on the floor is active and tied to the user
		winshow(user, "detectorwindow", 1)

/obj/Blip
	icon = 'icons/marines/detector-blips.dmi'
	icon_state = "blip"
	layer = 5

	var/mob/owner

/obj/Blip/New(loc, atom/target, mob/user)
	owner = user
	pixel_x = (target.x - user.x) * 4 - 4 // Make the blip in the right position on the radar (multiplied by the icon dimensions)
	pixel_y = (target.y - user.y) * 4 - 4 //-4 is a slight offset south and west
	screen_loc = "detector:-1:[pixel_x],-1:[pixel_y]"
	user.client.screen += src
	flick("blip", src)
	spawn(6)
		qdel(src)

/obj/Blip/Destroy()
	if(owner.client)
		owner.client.screen -= src
	owner = null
	. = ..()
