	const_def 2 ; object constants
	const KIKAIPC_NURSE
	const KIKAIPC_BLACKBELT1
	const KIKAIPC_BLACKBELT2

KikaiPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KikaiPokecenter1FNurseScript:
	jumpstd pokecenternurse
	
KikaiPokecenter1FBlackBelt1Script:
	jumptextfaceplayer KikaiPokecenter1FBlackBeltText1

KikaiPokecenter1FBlackBelt2Script:
	jumptextfaceplayer KikaiPokecenter1FBlackBeltText2


KikaiPokecenter1FBlackBeltText1:
	text "¡Llegué a venir"
	line "doce veces a este"
	cont "CENTRO #MON"
	cont "durante la semana"
	cont "pasada!"
	done

KikaiPokecenter1FBlackBeltText2:
	text "Ojalá la gente se"
	line "curase igual de"
	cont "rápido que los"
	cont "#MON."

	para "Si fuese así,"
	line "¡podría entrenar"
	cont "mucho más duro!"
	done

KikaiPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, KIKAI_VILLAGE, 1
	warp_event  6,  7, KIKAI_VILLAGE, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KikaiPokecenter1FNurseScript, -1
	object_event  7,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KikaiPokecenter1FBlackBelt1Script, -1
	object_event  11,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KikaiPokecenter1FBlackBelt2Script, -1
