	const_def 2 ; object constants
	const STANDSPEECHHOUSE_YOUNGSTER

StandSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

StandSpeechHouseYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .BillsBrotherRocketsGone
	writetext StandSpeechHouseYoungsterText
	waitbutton
	closetext
	end
	
.BillsBrotherRocketsGone
	writetext StandSpeechHouseYoungsterAllGoodText
	waitbutton
	closetext
	end
	

StandSpeechHouseYoungsterText:
	text "La casa de al"
	line "lado es muy"
	cont "sospechosa."
	para "Se ve entrar y"
	line "salir a miembros"
	cont "del TEAM ROCKET."
	done

StandSpeechHouseYoungsterAllGoodText:
	text "CIUDAD ENHIESTA"
	line "no es lugar para"
	cont "el crimen."
	para "¡Que se vaya el"
	line "TEAM ROCKET!"
	done

StandSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, STAND_CITY, 4
	warp_event  5,  7, STAND_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StandSpeechHouseYoungsterScript, -1
