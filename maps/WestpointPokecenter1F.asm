	const_def 2 ; object constants
	const GOLDENRODPOKECENTER1F_NURSE 
	const GOLDENRODPOKECENTER1F_GAMEBOY_KID
	const GOLDENRODPOKECENTER1F_LASS

WestpointPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WestpointPokecenter1FNurseScript:
	jumpstd pokecenternurse



WestpointPokecenter1FGameboyKidScript:
	jumptextfaceplayer WestpointPokecenter1FGameboyKidText

WestpointPokecenter1FLassScript:
	jumptextfaceplayer WestpointPokecenter1FLassText

WestpointPokecenter1FGameboyKidText:
	text "¿Has intentado"
	line "capturar #MON"
	cont "con una SÚPER"
	cont "BALL?"
	
	para "Tiene más probabi-"
	line "lidad de éxito que"
	cont "una # BALL."
	done

WestpointPokecenter1FLassText:
	text "Un #MON de"
	line "nivel superior no"
	cont "siempre gana."

	para "Aun así, su tipo"
	line "puede tener alguna"
	cont "desventaja."

	para "No creo que haya"
	line "un único #MON"
	cont "que sea el más"
	cont "fuerte."
	done



WestpointPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, WESTPORT_CITY, 8
	warp_event  6,  7, WESTPORT_CITY, 8
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestpointPokecenter1FNurseScript, -1
	object_event  8,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestpointPokecenter1FGameboyKidScript, -1
	object_event  1,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestpointPokecenter1FLassScript, -1
