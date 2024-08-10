/datum/status_effect/debuff/fortitudebuff
	id = "fortitudebuff"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/hungryt1
	effectedstats = list("strength" = 1, "constitution" = 3)
	duration = 100

/datum/status_effect/debuff/swiftnessbuff
	id = "swiftnessbuff"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/hungryt1
	effectedstats = list("speed" = 5, "dexterity" = 2)
	duration = 100

/datum/status_effect/debuff/intellectbuff
	id = "intellectbuff"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/hungryt1
	effectedstats = list("intelligence" = 5, "perception" = 5)
	duration = 100

/datum/status_effect/debuff/virilitybuff
	id = "virilitybuff"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/hungryt1
	duration = 100

/datum/status_effect/debuff/virilitybuff/on_apply()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.sexcon.set_charge(INFINITY)
	return ..()

/datum/status_effect/debuff/virilitybuff/on_remove()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.sexcon.set_charge(0)
	return ..()
