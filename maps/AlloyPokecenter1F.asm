	const_def 2 ; object constants
	const ALLOYPOKECENTER1F_NURSE
	const ALLOYPOKECENTER1F_FISHING_GURU
	const ALLOYPOKECENTER1F_FISHER
	const ALLOYPOKECENTER1F_TEACHER

AlloyPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AlloyPokecenter1FNurseScript:
	jumpstd pokecenternurse

AlloyPokecenter1FFishingGuruScript:
	jumpstd happinesschecknpc

AlloyPokecenter1FFisherScript:
	jumptextfaceplayer AlloyPokecenter1FFisherText

AlloyPokecenter1FTeacherScript:
	jumptextfaceplayer AlloyPokecenter1FTeacherText

AlloyPokecenter1FFisherText:
	text "El MARINERO del"
	line "CAFÉ ALEACIÓN"
	cont "es muy generoso."

	para "Le enseñó VUELO a"
	line "mi #MON."

	para "Ahora me lleva a"
	line "cualquier lugar"
	cont "donde ya haya"
	cont "estado."
	done

AlloyPokecenter1FTeacherText:
	text "He oído que hay"
	line "una chica en ISLA"
	cont "KOBAN, más allá"
	cont "del mar, que es"
	cont "una maestra de los"
	cont "#MON dragón."
	done

AlloyPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, ALLOY_CITY, 1
	warp_event  6,  7, ALLOY_CITY, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyPokecenter1FNurseScript, -1
	object_event  8,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyPokecenter1FFishingGuruScript, -1
	object_event  2,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AlloyPokecenter1FFisherScript, -1
	object_event  9,  1, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyPokecenter1FTeacherScript, -1
