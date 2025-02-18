/datum/preferences
	var/show_in_directory = 1	//Show in Character Directory
	var/directory_tag = "Unset" //Sorting tag to use in character directory
	var/directory_erptag = "Unset"	//ditto, but for non-vore scenes
	var/directory_ad = ""		//Advertisement stuff to show in character directory.
	var/sensorpref = 5			//Set character's suit sensor level
	var/capture_crystal = 1	//Whether or not someone is able to be caught with capture crystals
	var/auto_backup_implant = FALSE //Whether someone starts with a backup implant or not.
	var/borg_petting = TRUE //Whether someone can be petted as a borg or not.

	var/job_talon_high = 0
	var/job_talon_med = 0
	var/job_talon_low = 0

//Why weren't these in game toggles already?
/client/verb/toggle_eating_noises()
	set name = "Toggle Eating Noises"
	set category = "Preferences"
	set desc = "Toggles hearing Vore Eating noises."

	var/pref_path = /datum/client_preference/eating_noises

	toggle_preference(pref_path)

	to_chat(src, "You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear eating related vore noises.")

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TEatNoise") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!


/client/verb/toggle_digestion_noises()
	set name = "Toggle Digestion Noises"
	set category = "Preferences"
	set desc = "Toggles hearing Vore Digestion noises."

	var/pref_path = /datum/client_preference/digestion_noises

	toggle_preference(pref_path)

	to_chat(src, "You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear digestion related vore noises.")

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TDigestNoise") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_belch_noises()
	set name = "Toggle Audible Belching"
	set category = "Preferences"
	set desc = "Toggles hearing audible belches."

	var/pref_path = /datum/client_preference/belch_noises

	toggle_preference(pref_path)

	to_chat(src, "You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear belching.")

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TBelchNoise")

/client/verb/toggle_emote_noises()
	set name = "Toggle Emote Noises"
	set category = "Preferences"
	set desc = "Toggles hearing emote noises."

	var/pref_path = /datum/client_preference/emote_noises

	toggle_preference(pref_path)

	to_chat(src, "You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear emote-related noises.")

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TEmoteNoise") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_ghost_quiets()
	set name = "Toggle Ghost Privacy"
	set category = "Preferences"
	set desc = "Toggles ghosts being able to see your subtles/whispers."

	var/pref_path = /datum/client_preference/whisubtle_vis

	toggle_preference(pref_path)

	to_chat(src, "Ghosts will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear subtles/whispers made by you.")

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TWhisubtleVis") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_ghost_privacyvision()
	set name = "Toggle Ghost Private Eyes/ears"
	set category = "Preferences"
	set desc = "Toggles your ability to see subtles/whispers. Overrides admin status. Respects Ghost Privacy"

	var/pref_path = /datum/client_preference/ghost_see_whisubtle

	toggle_preference(pref_path)

	to_chat(src, "As a ghost, you will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear subtles/whispers made by players.")

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TGhostSeeWhisSubtle") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_capture_crystal()
	set name = "Toggle Catchable"
	set category = "Preferences"
	set desc = "Toggles being catchable with capture crystals."

	var/mob/living/L = mob

	if(prefs.capture_crystal)
		to_chat(src, "You are no longer catchable.")
		prefs.capture_crystal = 0
	else
		to_chat(src, "You are now catchable.")
		prefs.capture_crystal = 1
	if(L && istype(L))
		L.capture_crystal = prefs.capture_crystal
	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TCaptureCrystal") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_mentorhelp_ping()
	set name = "Toggle Mentorhelp Ping"
	set category = "Preferences"
	set desc = "Toggles the mentorhelp ping"

	var/pref_path = /datum/client_preference/play_mentorhelp_ping

	toggle_preference(pref_path)

	to_chat(src, "Mentorhelp pings are now [ is_preference_enabled(pref_path) ? "enabled" : "disabled"]")

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb", "TSoundMentorhelps")

/client/verb/toggle_player_tips()
	set name = "Toggle Receiving Player Tips"
	set category = "Preferences"
	set desc = "When toggled on, you receive tips periodically on roleplay and gameplay."

	var/pref_path = /datum/client_preference/player_tips

	toggle_preference(pref_path)

	to_chat(src, "You are [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] periodically receiving advice on gameplay and roleplay.")

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb", "TReceivePlayerTips")

/client/verb/toggle_pain_frequency()
	set name = "Toggle Pain Frequency"
	set category = "Preferences"
	set desc = "When toggled on, increases the cooldown of pain messages sent to chat for minor injuries"

	var/pref_path = /datum/client_preference/pain_frequency

	toggle_preference(pref_path)

	to_chat(src, "The cooldown between pain messages for minor (under 20/5 injury. Multi-limb injuries are still faster) is now [ (is_preference_enabled(pref_path)) ? "extended" : "default"].")

/client/verb/toggle_automatic_afk()
	set name = "Toggle Automatic AFK"
	set category = "Preferences"
	set desc = "When enabled, causes you to be automatically marked as AFK if you are idle for too long."

	var/pref_path = /datum/client_preference/auto_afk

	toggle_preference(pref_path)

	to_chat(src, "You will [ (is_preference_enabled(pref_path)) ? "now" : "not"] be automatically marked as AFK if you are idle for ten minutes or more.")
