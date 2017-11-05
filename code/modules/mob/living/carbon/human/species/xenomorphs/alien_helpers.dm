/proc/is_xenomorph(mob/living/carbon/human/H)
	return is_xenomorph_adult(H) || islarva(H)

/proc/is_xenomorph_adult(mob/living/carbon/human/H)
	return ishuman(H) && H.species && H.species.get_bodytype(H) == SPECIES_XENO

/proc/get_caste(mob/living/carbon/human/H)
	return ishuman(H) && H.species && H.species.get_caste()
