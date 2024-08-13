/datum/component/wormborn

/datum/component/wormborn/Initialize(...)
	. = ..()
	if(!isliving(parent))
		return COMPONENT_INCOMPATIBLE

/datum/component/wormborn/RegisterWithParent()
	. = ..()
	RegisterSignal(parent, COMSIG_LIVING_DEATH, PROC_REF(second_breath))

/datum/component/wormborn/UnregisterFromParent()
	. = ..()
	UnregisterSignal(parent, COMSIG_LIVING_DEATH)

/datum/component/wormborn/proc/second_breath(mob/living/source)
	SIGNAL_HANDLER

	// if(get_area(source) == GLOB.areas_by_type[/area/centcom/wizard_station]) Don't have this area. Not necessary anyways.
	//	return
	source.buckled?.unbuckle_mob(source, force = TRUE)

	if(source.movement_type & VENTCRAWLING)
		source.forceMove(get_turf(source))

	var/mob/living/worm = new /mob/living/simple_animal/noita_worm(get_turf(source))
	source.mind?.transfer_to(worm)
	source.forceMove(worm)

/mob/living/simple_animal/noita_worm
	name = "Magic Worm"
	desc = "Large blue worm. What happens if you put your hand in his mouth?."
	icon = 'modular_hearthstone/icons/mob/worm/test.dmi'
	icon_state = "worm_start"
	icon_living = "worm_start"
	base_icon_state = "worm"
	maxHealth = 800
	health = 800
	melee_damage_lower = 20
	melee_damage_upper = 30
	obj_damage = 200
	speed = 0
	move_force = MOVE_FORCE_OVERPOWERING
	move_resist = MOVE_FORCE_OVERPOWERING
	pull_force = MOVE_FORCE_OVERPOWERING
	mob_size = MOB_SIZE_HUGE
	sentience_type = SENTIENCE_BOSS
	mob_biotypes = MOB_ORGANIC|MOB_EPIC
	melee_attack_cooldown = 2 SECONDS

/mob/living/simple_animal/noita_worm/has_gravity(turf/gravity_turf)
	return TRUE

/mob/living/simple_animal/noita_worm/can_be_pulled()
	return FALSE

/mob/living/simple_animal/noita_worm/Initialize(mapload, spawn_bodyparts = TRUE)
	. = ..()
	// AddElement(/datum/element/wall_tearer) Don't need to break walls with this.

	if(spawn_bodyparts)
		build_tail()

/mob/living/simple_animal/noita_worm/proc/build_tail(mob/living/tail)
	AddComponent(/datum/component/mob_chain, vary_icon_state = TRUE)
	var/mob/living/simple_animal/noita_worm/prev = src
	for(var/i in 1 to 2)
		prev = new_segment(behind = prev)
	update_appearance(UPDATE_ICON_STATE)

/mob/living/simple_animal/noita_worm/proc/new_segment(mob/living/simple_animal/noita_worm/behind)
	var/mob/living/segment = new type(drop_location(), FALSE)
	// ADD_TRAIT(segment, TRAIT_PERMANENTLY_MORTAL, INNATE_TRAIT) We don't have a wizard antag here. 
	segment.AddComponent(/datum/component/mob_chain, front = behind, vary_icon_state = TRUE)
	return segment
