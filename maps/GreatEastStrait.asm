	const_def 2
	const GREAT_EAST_STRAIT_MADDAN
	const GREAT_EAST_STRAIT_ITEMBALL

GreatEastStrait_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GreatEastSign:
	jumptext GreatEastSignText
	
GreatEastSignText:
	text "GREAT EAST STRAIT"
	line "ahead, watch out"
	cont "for whirlpools!"
	done


TrainerSoldierDan:
	trainer SOLDIER, DAN, EVENT_BEAT_SOLDIER_DAN, DanSeenText, DanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext DanAfterBattleText
	waitbutton
	closetext
	end

DanSeenText:
	text "Esta isla es mi"
	line "campo de batalla,"
	cont "y las olas mi"
	cont "sirena de guerra."

	para "¡Mientras esté en"
	line "el agua, jamás me"
	cont "atraparás con"
	cont "vida!"
	done

DanBeatenText:
	text "¡TELSOOOOOOON!"
	done

DanAfterBattleText:
	text "¡La guerra nunca"
	line "acaba! ¡Cada día"
	cont "libro mi propia"
	cont "guerra en este"
	cont "lugar!"
	done

GreatEastStraitItemball:
	itemball NUGGET

GreatEastStrait_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  9, NANJO_FOREST, 3
	warp_event  4,  8, NANJO_FOREST, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event 10,  8, BGEVENT_READ, GreatEastSign

	db 2 ; object events
	object_event 41,  7, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerSoldierDan, -1
	object_event 69,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GreatEastStraitItemball, EVENT_GREAT_EAST_STRAIT_NUGGET
