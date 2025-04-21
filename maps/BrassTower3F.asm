	const_def 2 ; object constants
	const BRASSTOWER3F_SAGE1
	const BRASSTOWER3F_SAGE2
	const BRASSTOWER3F_SAGE3


BrassTower3F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

BrassTower3FSign:
	jumptext BrassTower3FSignText
	
BrassTower3FSignText:
	text "Es una estatua"
	line "de un TENTACRUEL."
	para "A pesar de su"
	line "intimidante"
	para "apariencia,"
	line "TENTACRUEL nos"
	para "enseña que todos"
	line "los #MON"
	cont "tienen un"
	cont "corazón puro."
	para "Esta estatua"
	line "está dedicada a"
	para "un TENTACRUEL que"
	line "usó sus tentáculos"
	para "para sacar a una"
	line "niña que se estaba"
	para "ahogando en el río"
	line "cerca de la torre."
	done


TrainerSageJeffrey:
	trainer SAGE, JEFFREY, EVENT_BEAT_SAGE_JEFFREY, SageJeffreySeenText, SageJeffreyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageJeffreyAfterBattleText
	waitbutton
	closetext
	end


SageJeffreySeenText:
	text "Para ti, ¿qué"
	line "significa subir"
	cont "esta torre?"
	done

SageJeffreyBeatenText:
	text "Bien, ya veo."
	done

SageJeffreyAfterBattleText:
	text "Debes buscarle"
	line "un significado"
	cont "a tu viaje."
	para "Tanto en la torre"
	line "como a lo que te"
	cont "venga después."
	done
	
TrainerSagePing:
	trainer SAGE, PING, EVENT_BEAT_SAGE_PING, SagePingSeenText, SagePingBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SagePingAfterBattleText
	waitbutton
	closetext
	end


SagePingSeenText:
	text "Pasado el 5o"
	line "piso se puede"
	cont "acceder a la"
	cont "azotea."
	para "Pero ni siquiera"
	line "nosotros podemos"
	para "poner un pie en"
	line "ese sacro lugar."
	done

SagePingBeatenText:
	text "Parece que tratas"
	line "a tus #MON"
	cont "muy bien."
	done

SagePingAfterBattleText:
	text "Esperamos que la"
	line "azotea vuelva a"
	para "ser hogar del ave"
	line "con alas arco-"
	cont "iris."
	done
	
TrainerSageNeal:
	trainer SAGE, NEAL, EVENT_BEAT_SAGE_NEAL, SageNealSeenText, SageNealBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageNealAfterBattleText
	waitbutton
	closetext
	end


SageNealSeenText:
	text "Has hecho bien"
	line "llegando tan"
	cont "lejos."
	done

SageNealBeatenText:
	text "Por favor, sigue."
	done

SageNealAfterBattleText:
	text "Si PEGASO te ha"
	line "pedido que hagas"
	para "este viaje es que"
	line "siente un impor-"
	para "tante destino"
	line "en tu futuro."
	done

BrassTower3F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 11,  4, BRASS_TOWER_2F, 2
	warp_event 10,  1, BRASS_TOWER_4F, 1

	db 0 ; coord events


	db 1 ; bg events
	bg_event  4,  1, BGEVENT_READ, BrassTower3FSign

	db 3 ; object events
	object_event  1, 10, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSageJeffrey, EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	object_event  7,  9, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSagePing, EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	object_event  7,  1, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSageNeal, EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE

