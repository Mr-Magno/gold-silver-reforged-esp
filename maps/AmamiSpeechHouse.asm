	const_def 2 ; object constants
	const AMAMISPEECHHOUSE_GENTLEMAN

AmamiSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AmamiSpeechHouseGentlemanScript:
	jumptextfaceplayer AmamiSpeechHouseGentlemanText

AmamiSpeechHouseGentlemanText:
	text "Hace muchos años,"
	line "la gente del"
	para "continente llegó"
	line "aquí en barco y"
	para "se asentaron en"
	line "las islas. Siento"
	para "nuestra cultura"
	line "es más relajada"
	cont "aquí."
	done

AmamiSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, AMAMI_TOWN, 8
	warp_event  5,  7, AMAMI_TOWN, 8

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  1,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AmamiSpeechHouseGentlemanScript, -1
