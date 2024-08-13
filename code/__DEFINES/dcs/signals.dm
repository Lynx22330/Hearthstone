
///Called when the movable tries to change its dynamic light color setting, from base atom/movable/lighting_overlay_set_color(): (color)
#define COMSIG_MOVABLE_LIGHT_OVERLAY_SET_RANGE "movable_light_overlay_set_color"
///Called when the movable tries to change its dynamic light power setting, from base atom/movable/lighting_overlay_set_power(): (power)
#define COMSIG_MOVABLE_LIGHT_OVERLAY_SET_POWER "movable_light_overlay_set_power"
///Called when the movable tries to change its dynamic light range setting, from base atom/movable/lighting_overlay_set_range(): (range)
#define COMSIG_MOVABLE_LIGHT_OVERLAY_SET_COLOR "movable_light_overlay_set_range"
///Called when the movable tries to toggle its dynamic light LIGHTING_ON status, from base atom/movable/lighting_overlay_toggle_on(): (new_state)
#define COMSIG_MOVABLE_LIGHT_OVERLAY_TOGGLE_ON "movable_light_overlay_toggle_on"

// 
// Since adding the actual signal .dm files and including them in the .dme did not work, I'm adding all the signals that the mob_chain.dm uses here. 
//


/// before a datum's Destroy() is called: (force), returning a nonzero value will cancel the qdel operation
/// you should only be using this if you want to block deletion
/// that's the only functional difference between it and COMSIG_QDELETING, outside setting QDELETING to detect
#define COMSIG_PREQDELETED "parent_preqdeleted"
/// just before a datum's Destroy() is called: (force), at this point none of the other components chose to interrupt qdel and Destroy will be called
#define COMSIG_QDELETING "parent_qdeleting"

/// Sent on a mob from /datum/component/mob_chain when component is attached with it as the "front" : (mob/living/basic/tail)
#define COMSIG_MOB_GAINED_CHAIN_TAIL "living_gained_chain_tail"
/// Sent on a mob from /datum/component/mob_chain when component is detached from it as the "front" : (mob/living/basic/tail)
#define COMSIG_MOB_LOST_CHAIN_TAIL "living_detached_chain_tail"
/// Sent from a 'contract chain' button on a mob chain
#define COMSIG_MOB_CHAIN_CONTRACT "living_chain_contracted"

///from base of mob/living/death(): (gibbed)
#define COMSIG_LIVING_DEATH "living_death"

///signal sent out by an atom when it checks if it can be pulled, for additional checks
#define COMSIG_ATOM_CAN_BE_PULLED "movable_can_be_pulled"
	#define COMSIG_ATOM_CANT_PULL (1 << 0)

/// from mob/living/*/UnarmedAttack(): (mob/living/source, atom/target, proximity, modifiers)
#define COMSIG_LIVING_UNARMED_ATTACK "living_unarmed_attack"

///from base of [atom/update_icon_state]: ()
#define COMSIG_ATOM_UPDATE_ICON_STATE "atom_update_icon_state"

/// List of signals sent when you receive any damage except stamina
#define COMSIG_LIVING_ADJUST_STANDARD_DAMAGE_TYPES list(\
	COMSIG_LIVING_ADJUST_BRUTE_DAMAGE,\
	COMSIG_LIVING_ADJUST_BURN_DAMAGE,\
	COMSIG_LIVING_ADJUST_OXY_DAMAGE,\
	COMSIG_LIVING_ADJUST_TOX_DAMAGE,\
)
// adjust_x_loss messages sent from /mob/living/proc/adjust[x]Loss
/// Returned from all the following messages if you actually aren't going to apply any change
#define COMPONENT_IGNORE_CHANGE (1<<0)
// Each of these messages sends the damagetype even though it is inferred by the signal so you can pass all of them to the same proc if required
/// Send when bruteloss is modified (type, amount, forced)
#define COMSIG_LIVING_ADJUST_BRUTE_DAMAGE "living_adjust_brute_damage"
/// Send when fireloss is modified (type, amount, forced)
#define COMSIG_LIVING_ADJUST_BURN_DAMAGE "living_adjust_burn_damage"
/// Send when oxyloss is modified (type, amount, forced)
#define COMSIG_LIVING_ADJUST_OXY_DAMAGE "living_adjust_oxy_damage"
/// Send when toxloss is modified (type, amount, forced)
#define COMSIG_LIVING_ADJUST_TOX_DAMAGE "living_adjust_tox_damage"
/// Send when staminaloss is modified (type, amount, forced)
#define COMSIG_LIVING_ADJUST_STAMINA_DAMAGE "living_adjust_stamina_damage"
///from /obj/item/bodypart/proc/receive_damage, sent from the limb owner (limb, brute, burn)
#define COMSIG_CARBON_LIMB_DAMAGED "carbon_limb_damaged"
	#define COMPONENT_PREVENT_LIMB_DAMAGE (1 << 0)

/// Called when a /datum/component/leash must forcibly teleport the parent to the owner.
/// Fired on the object with the leash component.
#define COMSIG_LEASH_FORCE_TELEPORT "leash_force_teleport"

/// Called when a /datum/component/leash plans on pathfinding to the target, if out of range.
/// Fired on the object with the leash component.
#define COMSIG_LEASH_PATH_STARTED "leash_path_started"

/// Called when a /datum/component/leash finishes its pathfinding to the target.
/// Fired on the object with the leash component.
#define COMSIG_LEASH_PATH_COMPLETE "leash_path_complete"
///from base of [/atom/proc/take_damage]: (damage_amount, damage_type, damage_flag, sound_effect, attack_dir, aurmor_penetration)
#define COMSIG_ATOM_TAKE_DAMAGE "atom_take_damage"
	/// Return bitflags for the above signal which prevents the atom taking any damage.
	#define COMPONENT_NO_TAKE_DAMAGE (1<<0)
/* Attack signals. They should share the returned flags, to standardize the attack chain. */
/// tool_act -> pre_attack -> target.attackby (item.attack) -> afterattack
	///Ends the attack chain. If sent early might cause posterior attacks not to happen.
	#define COMPONENT_CANCEL_ATTACK_CHAIN (1<<0)
	///Skips the specific attack step, continuing for the next one to happen.
	#define COMPONENT_SKIP_ATTACK (1<<1)
///from base of [/atom/proc/update_appearance]: (updates)
#define COMSIG_ATOM_UPDATE_APPEARANCE "atom_update_appearance"
	/// If returned from [COMSIG_ATOM_UPDATE_APPEARANCE] it prevents the atom from updating its name.
	#define COMSIG_ATOM_NO_UPDATE_NAME UPDATE_NAME
	/// If returned from [COMSIG_ATOM_UPDATE_APPEARANCE] it prevents the atom from updating its desc.
	#define COMSIG_ATOM_NO_UPDATE_DESC UPDATE_DESC
	/// If returned from [COMSIG_ATOM_UPDATE_APPEARANCE] it prevents the atom from updating its icon.
	#define COMSIG_ATOM_NO_UPDATE_ICON UPDATE_ICON
///from base of [/atom/proc/update_name]: (updates)
#define COMSIG_ATOM_UPDATE_NAME "atom_update_name"
///from base of [/atom/proc/update_desc]: (updates)
#define COMSIG_ATOM_UPDATE_DESC "atom_update_desc"

// simple_animal signals
/// called when a simplemob is given sentience from a sentience potion (target = person who sentienced)
#define COMSIG_SIMPLEMOB_SENTIENCEPOTION "simplemob_sentiencepotion"
/// called when a simplemob is given sentience from a consciousness transference potion (target = person who sentienced)
#define COMSIG_SIMPLEMOB_TRANSFERPOTION "simplemob_transferpotion"

// /mob/living/simple_animal/hostile signals
///before attackingtarget has happened, source is the attacker and target is the attacked
#define COMSIG_HOSTILE_PRE_ATTACKINGTARGET "hostile_pre_attackingtarget"
///after attackingtarget has happened, source is the attacker and target is the attacked, extra argument for if the attackingtarget was successful
#define COMSIG_HOSTILE_POST_ATTACKINGTARGET "hostile_post_attackingtarget"

///FROM mob/living/simple_animal/hostile/ooze/eat_atom(): (atom/target, edible_flags)
#define COMSIG_OOZE_EAT_ATOM "ooze_eat_atom"
	#define COMPONENT_ATOM_EATEN  (1<<0)

///Called when a /mob/living/simple_animal/hostile fines a new target: (atom/source, new_target)
#define COMSIG_HOSTILE_FOUND_TARGET "comsig_hostile_found_target"

// Atom attack signals. Format:
// When the signal is called: (signal arguments)
// All signals send the source datum of the signal as the first argument

///from base of atom/attackby(): (/obj/item, /mob/living, params)
#define COMSIG_ATOM_ATTACKBY "atom_attackby"
/// From base of [atom/proc/attacby_secondary()]: (/obj/item/weapon, /mob/user, params)
#define COMSIG_ATOM_ATTACKBY_SECONDARY "atom_attackby_secondary"
/// From [/item/attack()], sent by an atom which was just attacked by an item: (/obj/item/weapon, /mob/user, proximity_flag, click_parameters)
#define COMSIG_ATOM_AFTER_ATTACKEDBY "atom_after_attackby"
/// From base of [/atom/proc/attack_hand_secondary]: (mob/user, list/modifiers) - Called when the atom receives a secondary unarmed attack.
#define COMSIG_ATOM_ATTACK_HAND_SECONDARY "atom_attack_hand_secondary"
///from base of atom/animal_attack(): (/mob/user)
#define COMSIG_ATOM_ATTACK_ANIMAL "attack_animal"
//from base of atom/attack_basic_mob(): (/mob/user)
#define COMSIG_ATOM_ATTACK_BASIC_MOB "attack_basic_mob"
	#define COMSIG_BASIC_ATTACK_CANCEL_CHAIN (1<<0)
/// from /atom/proc/atom_break: (damage_flag)
#define COMSIG_ATOM_BREAK "atom_break"
/// from base of [/atom/proc/atom_fix]: ()
#define COMSIG_ATOM_FIX "atom_fix"
/// from base of [/atom/proc/atom_destruction]: (damage_flag)
#define COMSIG_ATOM_DESTRUCTION "atom_destruction"
/// from base of [/atom/proc/extinguish]
#define COMSIG_ATOM_EXTINGUISH "atom_extinguish"
///from base of [/atom/proc/update_integrity]: (old_value, new_value)
#define COMSIG_ATOM_INTEGRITY_CHANGED "atom_integrity_changed"
///from base of atom/mech_melee_attack(): (obj/vehicle/sealed/mecha/mecha_attacker, mob/living/user)
#define COMSIG_ATOM_ATTACK_MECH "atom_attack_mech"
/// from base of atom/attack_robot(): (mob/user)
#define COMSIG_ATOM_ATTACK_ROBOT "atom_attack_robot"
/// from base of atom/attack_robot_secondary(): (mob/user)
#define COMSIG_ATOM_ATTACK_ROBOT_SECONDARY "atom_attack_robot_secondary"
///from relay_attackers element: (atom/attacker, attack_flags)
#define COMSIG_ATOM_WAS_ATTACKED "atom_was_attacked"
///Called before a atom gets something tilted on them. If [COMPONENT_IMMUNE_TO_TILT_AND_CRUSH] is returned in a signal, the atom will be unaffected: (atom/target, atom/source)
#define COMSIG_PRE_TILT_AND_CRUSH "atom_pre_tilt_and_crush"
	#define COMPONENT_IMMUNE_TO_TILT_AND_CRUSH (1<<0)
///Called when a atom gets something tilted on them: (atom/target, atom/source)
#define COMSIG_POST_TILT_AND_CRUSH "atom_post_tilt_and_crush"
/// Called when an atom is splashed with something: (atom/source)
#define COMSIG_ATOM_SPLASHED "atom_splashed"

	///The damage type of the weapon projectile is non-lethal stamina
	#define ATTACKER_STAMINA_ATTACK (1<<0)
	///the attacker is shoving the source
	#define ATTACKER_SHOVING (1<<1)
	/// The attack is a damaging-type attack
	#define ATTACKER_DAMAGING_ATTACK (1<<2)

/// Called on the atom being hit, from /datum/component/anti_magic/on_attack() : (obj/item/weapon, mob/user, antimagic_flags)
#define COMSIG_ATOM_HOLYATTACK "atom_holyattacked"

//
// This stuff is so weird. I apologize to anyone in the future if this does get PR merged because a lot of this shit is a total mess just to get mob_chains working.
//

#define BASIC_MOB_MAX_STAMINALOSS 200

///Basic mob flags

/// Delete mob upon death
#define DEL_ON_DEATH (1<<0)
/// Rotate mob 180 degrees while it is dead
#define FLIP_ON_DEATH (1<<1)
/// Mob remains dense while dead
#define REMAIN_DENSE_WHILE_DEAD (1<<2)
/// Mob can be set on fire
#define FLAMMABLE_MOB (1<<3)
/// Mob never takes damage from unarmed attacks
#define IMMUNE_TO_FISTS (1<<4)
/// Mob is immune to getting wet
#define IMMUNE_TO_GETTING_WET (1<<5)
/// Disables the function of attacking random body zones
#define PRECISE_ATTACK_ZONES (1<<6)

/// Temporary trait applied when an attack forecast animation has completed
#define TRAIT_BASIC_ATTACK_FORECAST "trait_basic_attack_forecast"
#define INTERACTION_BASIC_ATTACK_FORCEAST "interaction_basic_attack_forecast"

/// Above this speed we stop gliding because it looks silly
#define END_GLIDE_SPEED 10

///mook attack status flags
#define MOOK_ATTACK_NEUTRAL 0
#define MOOK_ATTACK_WARMUP 1
#define MOOK_ATTACK_ACTIVE 2
#define MOOK_ATTACK_STRIKE 3

///keeps track of how many gutlunches are born
GLOBAL_VAR_INIT(gutlunch_count, 0)

//raptor defines

#define RAPTOR_RED "Red"
#define RAPTOR_GREEN "Green"
#define RAPTOR_PURPLE "Purple"
#define RAPTOR_WHITE "White"
#define RAPTOR_YELLOW "Yellow"
#define RAPTOR_BLACK "Black"
#define RAPTOR_BLUE "Blue"

#define RAPTOR_INHERIT_MAX_ATTACK 5
#define RAPTOR_INHERIT_MAX_HEALTH 30

///this mob suffers depression
#define BB_BASIC_DEPRESSED "basic_depressed"
///this mob will care for its young
#define BB_RAPTOR_MOTHERLY "raptor_motherly"
///this mob will be playful around their owners
#define BB_RAPTOR_PLAYFUL "raptor_playful"
///this mob will flee combat when it feels threatened
#define BB_RAPTOR_COWARD "raptor_coward"
///this mob will go out seeking trouble against its kind
#define BB_RAPTOR_TROUBLE_MAKER "raptor_trouble_maker"
///cooldown till we go out cause trouble again
#define BB_RAPTOR_TROUBLE_COOLDOWN "raptor_trouble_maker_cooldown"
///our raptor baby target we will take care of
#define BB_RAPTOR_BABY "raptor_baby"
///the raptor we will heal up
#define BB_INJURED_RAPTOR "injured_raptor"
///the raptor we will bully
#define BB_RAPTOR_VICTIM "raptor_victim"
///the cooldown for next time we eat
#define BB_RAPTOR_EAT_COOLDOWN "raptor_eat_cooldown"
///our trough target
#define BB_RAPTOR_TROUGH_TARGET "raptor_trough_target"

#define MAX_RAPTOR_POP 64

#define DOING_INTERACTION(user, interaction_key) (LAZYACCESS(user.do_afters, interaction_key))
#define DOING_INTERACTION_LIMIT(user, interaction_key, max_interaction_count) ((LAZYACCESS(user.do_afters, interaction_key) || 0) >= max_interaction_count)
#define DOING_INTERACTION_WITH_TARGET(user, target) (LAZYACCESS(user.do_afters, target))
#define DOING_INTERACTION_WITH_TARGET_LIMIT(user, target, max_interaction_count) ((LAZYACCESS(user.do_afters, target) || 0) >= max_interaction_count)
