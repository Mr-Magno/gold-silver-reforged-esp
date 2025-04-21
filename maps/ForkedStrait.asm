	const_def 2
	const FORKEDSTRAIT_FISHER1
	const FORKEDSTRAIT_FISHER2
	const FORKEDSTRAIT_ITEMBALL

ForkedStrait_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ForkedStraitItemball:
	itemball LURE_BALL

TrainerForkedStrait1:
	trainer FISHER, STIRNER, EVENT_BEAT_FORKED_STRAIT_STIRNER, FisherStirnerSeenText, FisherStirnerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherStirnerAfterBattleText
	waitbutton
	closetext
	end

FisherStirnerSeenText:
	text "Quiero ir a pescar"
	line "a las ISLAS DEL"
	cont "SUR, ¡pero solo"
	cont "dejan ir a los"
	cont "científicos!"
	done
	
FisherStirnerBeatenText:
	text "¡La filosofía es"
	line "una ciencia!"
	cont "¡Dejadme pasar!"
	done
	
FisherStirnerAfterBattleText:
	text "¡La ley es un"
	line "espejismo!"

	para "¡Pescaré donde me"
	line "plazca!"
	done


TrainerForkedStrait2:
	trainer FISHER, EDGAR, EVENT_BEAT_FORKED_STRAIT_EDGAR, FisherEdgarSeenText, FisherEdgarBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherEdgarAfterBattleText
	waitbutton
	closetext
	end

FisherEdgarSeenText:
	text "¡Soy el pescador"
	line "más fuerte del"
	cont "mundo!"

	para "Desafíame… ¡Si te"
	line "atreves!"
	done

FisherEdgarBeatenText:
	text "Eres digno de"
	line "tener una"
	cont "SUPERCAÑA…"
	done
	
FisherEdgarAfterBattleText:
	text "No tengo nada más"
	line "que enseñarte,"
	cont "joven."

	para "Ahora tú eres el"
	line "maestro pescador."
	done

CheckpointSignpost:
	jumptext CheckpointSignpostText
	
CheckpointSignpostText:
	text "ISLAS DEL SUR"
	line "PUESTO DE CONTROL"

	para "AUTORIZACIÓN"
	line "OFICIAL REQUERIDA"
	cont "PARA ENTRAR"
	done


ForkedStrait_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  9, 41,  FORKED_STRAIT_GATE, 1
	warp_event 10, 41,  FORKED_STRAIT_GATE, 2
	warp_event  8, 41,  FORKED_STRAIT_GATE, 1
	warp_event 11, 41,  FORKED_STRAIT_GATE, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event 12, 41, BGEVENT_READ, CheckpointSignpost

	db 3 ; object events
	object_event  6,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerForkedStrait1, -1
	object_event  4, 26, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerForkedStrait2, -1
	object_event 15, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ForkedStraitItemball, EVENT_FORKED_STRAIT_LURE_BALL
	