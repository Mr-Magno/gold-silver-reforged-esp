	const_def 2 ; object constants
	const ROUTE5SAFFRONGATE_OFFICER

SunPointDocksSunPointGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


SunPointDocksSunPointGateOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	iftrue .NoMoreBadBoat
	writetext SunPointDocksSunPointGateOfficerRocketsText
	waitbutton
	closetext
	end

.NoMoreBadBoat:
	writetext SunPointDocksSunPointGateOfficerGoodText
	waitbutton
	closetext
	end

SunPointDocksSunPointGateOfficerRocketsText:
	text "Está pasando algo"
	line "raro en el MUELLE."

	para "Unos tipos miste-"
	line "riosos han estado"
	para "trayendo bastante"
	line "carga cubierta por"
	cont "este acceso."

	para "No parece nada en"
	line "contra de la ley,"
	para "así que no deberia"
	line "meterme en esto…"
	para "Pero me ponen de"
	line "los nervios…"
	done

SunPointDocksSunPointGateOfficerGoodText:
	text "El MUELLE CALORINA"
	line "siempre está hasta"
	cont "arriba de gente."

	para "Es muy buen lugar"
	line "para verla pasar."
	done

SunPointDocksSunPointGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, SUNPOINT_DOCKS, 1
	warp_event  5,  0, SUNPOINT_DOCKS, 2
	warp_event  4,  7, SUNPOINT_CITY, 7
	warp_event  5,  7, SUNPOINT_CITY, 8

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SunPointDocksSunPointGateOfficerScript, -1
