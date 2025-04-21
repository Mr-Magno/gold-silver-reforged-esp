	const_def 2 ; object constants
	const BLUEFORESTSPEECHHOUSE_GRANNY
	const BLUEFORESTSPEECHHOUSE_SLOWPOKE

BlueForestSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlueForestSpeechHouseGrannyScript:
	jumptextfaceplayer BlueForestSpeechHouseGrannyText

BlueForestSpeechHouseDratiniScript:
	opentext
	writetext BlueForestSpeechHouseDratiniText
	cry SLOWPOKE
	waitbutton
	closetext
	end

BlueForestSpeechHouseGrannyText:
	text "Al norte, en el"
	line "océano, se encuen-"
	cont "tra ISLA REMOLINO."
	para "Se llama así por"
	line "todos los remo-"
	para "linos que la"
	line "rodean. Es un"
	para "peligroso labe-"
	line "rinto que lleva"
	cont "a la nada."
	para "Asegúrate de lo"
	line "que haces si"
	para "tienes la inten-"
	line "ción de ir."
	done

BlueForestSpeechHouseDratiniText:
	text "SLOWPOKE: ¿poke?"
	done

BlueForestSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, BLUE_FOREST, 2
	warp_event  4,  7, BLUE_FOREST, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlueForestSpeechHouseGrannyScript, -1
	object_event  5,  5, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlueForestSpeechHouseDratiniScript, -1
