	const_def 2 ; object constants
	const CROWNPOKECENTER1F_NURSE
	const CROWNPOKECENTER1F_FISHER
	const CROWNPOKECENTER1F_GENTLEMAN
	const CROWNPOKECENTER1F_TEACHER

CrownPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CrownPokecenter1FNurseScript:
	jumpstd pokecenternurse

CrownPokecenter1FFisherScript:
	jumptextfaceplayer CrownPokecenter1FFisherText

CrownPokecenter1FGentlemanScript:
	jumptextfaceplayer CrownPokecenter1FGentlemanText

CrownPokecenter1FTeacherScript:
	jumptextfaceplayer CrownPokecenter1FTeacherText

CrownPokecenter1FFisherText:
	text "Será mejor que me"
	line "asegure de que mis"
	cont "#MON están"
	cont "listos."

	para "Escalar el MT."
	line "FUJI no será"
	cont "fácil."
	done

CrownPokecenter1FGentlemanText:
	text "Los entrenadores"
	line "que te cruzarás en"
	para "esta gran montaña"
	line "son duros."

	para "Todos quieren"
	line "desafiar a la"
	cont "LIGA."
	done

CrownPokecenter1FTeacherText:
	text "CIUDAD CORONA es"
	line "un buen punto de"
	para "encuentro para"
	line "entrenadores que"
	cont "quieren escalar el"
	cont "MT. FUJI."
	done


CrownPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, CROWN_CITY, 3
	warp_event  6,  7, CROWN_CITY, 3
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CrownPokecenter1FNurseScript, -1
	object_event  2,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CrownPokecenter1FFisherScript, -1
	object_event  12, 6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CrownPokecenter1FGentlemanScript, -1
	object_event  1,  6, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CrownPokecenter1FTeacherScript, -1
