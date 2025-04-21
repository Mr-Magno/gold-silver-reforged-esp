	const_def 2
	const IEHOUSENPC1
	const IEHOUSENPC2

IeHouse1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Ie1NPC1Script:
	jumptextfaceplayer Ie1NPC1Text
	
Ie1NPC2Script:
	jumptextfaceplayer Ie1NPC2Text
	
Ie1NPC1Text:
	text "Cuando era joven,"
	line "la MONTAÑA del"
	cont "CASTILLO era el"
	cont "orgullo de todo"
	cont "el pueblo."
	
	para "Ahora está en"
	line "ruinas. Es"
	cont "un verdadera"
	cont "lástima…"
	done
	
Ie1NPC2Text:
	text "El CASTILLO"
	line "era un monu-"
	cont "mento histórico"
	cont "y era tratado"
	cont "como tal."
	
	para "Eso cambió"
	line "cuando algo"
	cont "feroz se esta-"
	cont "bleció debajo"
	cont "del CASTILLO."
	
	para "Supuestamente un"
	line "DRAGÓN VERDE"
	cont "apareció como"
	cont "resultado de la"
	cont "maldición de una"
	cont "triste mujer que"
	cont "pereció allí."
	done



IeHouse1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, IE_TOWN, 4
	warp_event  5,  7, IE_TOWN, 4

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  4,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Ie1NPC1Script, -1
	object_event  7,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Ie1NPC2Script, -1
