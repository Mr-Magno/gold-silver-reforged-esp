	const_def 2 ; object constants
	const ROUTE15FUCHSIAGATE_OFFICER
	const ROUTE15FUCHSIAGATE_FISHINGURU

Route119SunpointGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route119SunpointGateOfficerScript:
	jumptextfaceplayer Route119SunpointGateOfficerText
	
Route119SunpointGateFishScript:
	jumptextfaceplayer Route119SunpointGateFishText

Route119SunpointGateFishText:
	text "Creo que iré a la"
	line "costa a pescar un"
	cont "poco."
	done

Route119SunpointGateOfficerText:
	text "¿Estás trabajando"
	line "en una #DEX?"

	para "Es muy importante."
	line "¡No te rindas!"
	done

Route119SunpointGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, SUNPOINT_CITY, 9
	warp_event  5,  0, SUNPOINT_CITY, 10
	warp_event  4,  7, ROUTE_119, 1
	warp_event  5,  7, ROUTE_119, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route119SunpointGateOfficerScript, -1
	object_event  6,  5, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route119SunpointGateFishScript, -1
