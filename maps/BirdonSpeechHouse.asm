	const_def 2 ; object constants
	const BIRDONSPEECHHOUSE_GRANNY

BirdonSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BirdonSpeechHouseGrannyScript:
	jumptextfaceplayer BirdonSpeechHouseGrannyText

BirdonSpeechHouseGrannyText:
	text "Hace muchos años,"
	line "me dijo que un"
	para "#MON singular"
	line "apareció como el"
	para "fuego en el cielo"
	line "diuerno, dejando"
	para "tras de sí un"
	line "rastro de cenizas"
	cont "que quemaba el"
	para "aire. Ese #MON"
	line "creó de sus"
	para "cenizas tres"
	line "bestias que"
	para "fueron enviadas"
	line "por la tierra."
	para "A día de hoy,"
	line "nadie ha visto a"
	cont "esas bestias en"
	cont "persona."
	done

BirdonSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, BIRDON_TOWN, 10
	warp_event  5,  7, BIRDON_TOWN, 10

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BirdonSpeechHouseGrannyScript, -1
