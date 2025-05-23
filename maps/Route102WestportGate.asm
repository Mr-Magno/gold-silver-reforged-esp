	const_def 1 ; object constants
	const NEWVIOLETGATENORTH_OFFICER
	const NEWVIOLETGATENORTH_YOUNGSTER

Route102WestportGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route102WestportGateOfficerScript:
	jumptextfaceplayer Route102WestportGateOfficerText

Route102WestportGateOfficerText:
	text "CIUDAD PONIENTE es"
	line "una metrópolis con"
	para "toda clase de"
	line "recursos para los"
	para "entrenadores que"
	line "no deja de crecer."
	done
	
Route102WestportGateYoungsterScript:
	jumptextfaceplayer Route102WestportGateYoungsterText

Route102WestportGateYoungsterText:
	text "¡Uf!"
	
	para "¡El CENTRO"
	line "COMERCIAL de"
	para "CIUDAD PONIENTE"
	line "tiene un sótano"
	para "que está lleno de"
	line "entrenadores"
	cont "fuertes!"
	done


Route102WestportGate_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  0,  7, WESTPORT_CITY, 3
	warp_event  1,  7, WESTPORT_CITY, 3
	warp_event  8,  7, ROUTE_102, 1
	warp_event  9,  7, ROUTE_102, 1
	warp_event  1,  0, ROUTE_102_WESTPORT_GATE_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route102WestportGateOfficerScript, -1
	object_event  0,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route102WestportGateYoungsterScript, -1

	
