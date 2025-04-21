	const_def 2
	const IENPCHOUSE2

IeHouse2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Ie2NPCScript:
	jumptextfaceplayer Ie2NPCText
	
Ie2NPCText:
	text "Existe una vieja"
	line "leyenda en este"
	cont "pueblo sobre una"
	cont "triste mujer que"
	cont "escaló la cima"
	cont "de la MONTAÑA"
	cont "del CASTILLO y"
	cont "murió al caer."
	
	para "Algunos dicen"
	line "que su espíritu"
	cont "todavía ronda"
	cont "por el CASTILLO."
	done

IeHouse2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, IE_TOWN, 5
	warp_event  5,  7, IE_TOWN, 5

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Ie2NPCScript, -1
