	const_def 2 ; object constants
	const ISEN_STRAIT_SEASIDE_PATH_GATE_OFFICER
	const ISEN_STRAIT_SEASIDE_PATH_GATE_BUG_CATCHER

IsenStraitSeasidePathGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


IsenStraitSeasidePathGateOfficerScript:
	jumptextfaceplayer IsenStraitSeasidePathGateOfficerText

IsenStraitSeasidePathGateBugCatcherScript:
	jumptextfaceplayer IsenStraitSeasidePathGateBugCatcherText
	
IsenStraitSeasidePathGateBugCatcherText:
	text "Los #MON"
	line "salvajes de las"
	cont "ISLAS son muy"
	cont "poderosos."
	para "Mucho más que los"
	line "del continente,"
	cont "o eso creo."
	done

IsenStraitSeasidePathGateOfficerText:
	text "He oído que el"
	line "ESTRECHO ISEN"
	cont "esconde restos de"
	cont "experimentos se-"
	cont "cretos para crear"
	cont "un #MON"
	cont "artificial."
	para "¿Que podría"
	line "significar eso?"
	done


IsenStraitSeasidePathGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  7, ISEN_STRAIT, 1
	warp_event  1,  7, ISEN_STRAIT, 1
	warp_event  8,  7, SEASIDE_PATH, 1
	warp_event  9,  7, SEASIDE_PATH, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, IsenStraitSeasidePathGateOfficerScript, -1
	object_event  1,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, IsenStraitSeasidePathGateBugCatcherScript, -1
