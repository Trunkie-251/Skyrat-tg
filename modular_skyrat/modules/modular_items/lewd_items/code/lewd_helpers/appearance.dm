/// Helper proc for adding overrides to bodyparts to hide them if a catsuit or sleeping bag is worn. Allows for overrides for each, in case a part shouldn't be hidden.
/datum/sprite_accessory/proc/lewd_is_hidden(mob/living/carbon/human/target_human, hide_if_catsuit = TRUE, hide_if_sleeping_bag = TRUE)
	if(target_human.wear_suit && istype(target_human.wear_suit, /obj/item/clothing/suit/straight_jacket/kinky_sleepbag))
		var/obj/item/clothing/suit/straight_jacket/kinky_sleepbag/sleeping_bag = target_human.wear_suit
		if(sleeping_bag.state_thing == "inflated")
			return hide_if_sleeping_bag
		return FALSE
	else if(target_human.w_uniform && istype(target_human.w_uniform, /obj/item/clothing/under/misc/latex_catsuit))
		return hide_if_catsuit
	return FALSE

// Extends default proc check for hidden skrell hair for supporting our sleepbag and catsuit too
/datum/sprite_accessory/tails/is_hidden(mob/living/carbon/human/target_human)
	. = ..()
	if(!.) // If true, tail already hidden
		return lewd_is_hidden(target_human, hide_if_catsuit = FALSE)

/datum/sprite_accessory/xenodorsal/is_hidden(mob/living/carbon/human/target_human)
	. = ..()
	if(!.)
		return lewd_is_hidden(target_human)

/datum/sprite_accessory/xenohead/is_hidden(mob/living/carbon/human/target_human)
	. = ..()
	if(!.)
		return lewd_is_hidden(target_human, hide_if_catsuit = FALSE, hide_if_sleeping_bag = FALSE)

// Extends default proc check for hidden wings for supporting our sleepbag and catsuit too
/datum/sprite_accessory/wings/is_hidden(mob/living/carbon/human/target_human)
	. = ..()
	if(!.)
		return lewd_is_hidden(target_human)

