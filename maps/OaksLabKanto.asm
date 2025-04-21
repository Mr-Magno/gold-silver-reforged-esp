	const_def 2 ; object constants
	const OAKS_KANTO_LAB_AIDE1
	const OAKS_KANTO_LAB_AIDE2

OaksLabKanto_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OaksLabKantoBookshelf:
	jumpstd difficultbookshelf

OaksLabKantoPoster1:
	jumptext OaksLabKantoPoster1Text

OaksLabKantoPoster2:
	jumptext OaksLabKantoPoster2Text
	
OaksLabKantoPC:
	jumptext OaksLabKantoPCText

OaksLabKantoPoster1Text:
	text "Pulsa START para"
	line "acceder al MENÚ."
	done

OaksLabKantoPoster2Text:
	text "La opción GUARDAR"
	line "está en el MENÚ."

	para "Utilízala con"
	line "frecuencia."
	done

OaksLabKantoPCText:
	text "No está encendido…"
	done

KantoAide1:
	jumptextfaceplayer KantoAide1Text
	
KantoAide1Text:
	text "¡Hola!"

	para "¡El PROF. OAK está"
	line "estudiando en"
	cont "PUEBLO SILENTE!"

	para "Me he quedado para"
	line "cuidar de su viejo"
	cont "LABORATORIO."
	done

KantoAide2:
	checkevent EVENT_GIVEN_BALL_FROM_AIDE
	iftrue AideGivenLevelBall
	faceplayer
	opentext
	writetext AideGivingLevelBallText
	buttonsound
	verbosegiveitem LEVEL_BALL
	iffalse .noroom
	setevent EVENT_GIVEN_BALL_FROM_AIDE
	writetext AideGivenLevelBallText
.noroom
	waitbutton
	closetext
	end
	
AideGivenLevelBall:
	jumptextfaceplayer AideGivenLevelBallText

AideGivingLevelBallText:
	text "PROF.OAK pidió un"
	line "puñado de"
	cont "# BALLS"
	cont "personalizadas"
	cont "para su inves-"
	cont "tigación."
	
	para "Sigo encontrándo-"
	line "melas cuando"
	cont "barro el suelo."
	
	para "Toma, puede que"
	line "hagas mejor uso"
	cont "tú de una de"
	cont "éstas."
	done

AideGivenLevelBallText:
	text "Me dijo que un"
	line "montón de estas"
	cont "BALLS fueron"
	cont "hechas por el"
	cont "famoso CÉSAR de"
	cont "CIUDAD PAGOTA."
	
	para "¡Úsala sabiamente!"
	done


OaksLabKanto_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, KANTO_REGION, 18
	warp_event  4,  7, KANTO_REGION, 19

	db 0 ; coord events

	db 7 ; bg events
	bg_event  0,  5, BGEVENT_READ, OaksLabKantoBookshelf
	bg_event  1,  5, BGEVENT_READ, OaksLabKantoBookshelf
	bg_event  7,  5, BGEVENT_READ, OaksLabKantoBookshelf
	bg_event  6,  5, BGEVENT_READ, OaksLabKantoBookshelf
	bg_event  2,  0, BGEVENT_READ, OaksLabKantoPoster1
	bg_event  4,  0, BGEVENT_READ, OaksLabKantoPoster2
	bg_event  0,  1, BGEVENT_READ, OaksLabKantoPC

	db 2 ; object events
	object_event  2,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoAide1, -1
	object_event  5,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KantoAide2, -1
