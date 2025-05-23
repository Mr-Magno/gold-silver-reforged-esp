	const_def 2 ; object constants
	const JADE_FOREST_SNORLAX_ROOM_SNORLAX

JadeForestSnorlaxRoom_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


JadeForestSnorlax:
	opentext
	writetext SnorlaxText
	yesorno
	iffalse DontDisturbSnorlaxScript
	writetext SnorlaxText2
	waitbutton
	closetext
	pause 10
	opentext
	writetext SnorlaxText3
	cry SNORLAX
	pause 15
	closetext
	setevent EVENT_JADE_FOREST_SNORLAX
	loadwildmon SNORLAX, 30
	startbattle
	disappear JADE_FOREST_SNORLAX_ROOM_SNORLAX
	reloadmapafterbattle
	end
	
DontDisturbSnorlaxScript:
	writetext SnorlaxAloneText
	waitbutton
	closetext
	end
	
SnorlaxAloneText:
	text "Mejor dejarlo"
	line "solo…"
	done
	
SnorlaxText:
	text "Este SNORLAX"
	line "parece inquieto…"
	para "¿Quieres"
	line "molestarlo?"
	done
	
SnorlaxText2:
	text "Has empujado al"
	line "SNORLAX…"
	para "¡Se ha despertado!"
	done
	
SnorlaxText3:
	text "SNORLAX:"
	line "¿Snor?"
	done
	

JadeForestSnorlaxRoom_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 15, JADE_FOREST, 5
	warp_event  5, 15, JADE_FOREST, 6

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  3,  3, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JadeForestSnorlax, EVENT_JADE_FOREST_SNORLAX
