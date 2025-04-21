	const_def 2 ; object constants
	const KUMEPOINT_FISHER1
	const KUMEPOINT_FISHER2

KumePoint_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerFisherKyle:
	trainer FISHER, KYLE, EVENT_BEAT_FISHER_KYLE, FisherKyleSeenText, FisherKyleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherKyleAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherMartin:
	trainer FISHER, MARTIN, EVENT_BEAT_FISHER_MARTIN, FisherMartinSeenText, FisherMartinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMartinAfterBattleText
	waitbutton
	closetext
	end
	
	
FisherMartinSeenText:
	text "La paciencia es"
	line "la clave tanto"
	cont "para pescar como"
	cont "para los #MON."
	done

FisherMartinBeatenText:
	text "¡Aaaah!"
	done

FisherMartinAfterBattleText:
	text "Soy demasiado"
	line "impaciente para"
	cont "pescar…"
	done
	

FisherKyleSeenText:
	text "¡Este es el"
	line "mejor punto para"
	cont "pescar, de veras!"
	done

FisherKyleBeatenText:
	text "¿Alguna vez has"
	line "pescado aquí?"
	done

FisherKyleAfterBattleText:
	text "Hay más PESCADO-"
	line "RES que dicen que"
	cont "se pesca mejor"
	cont "al otro lado del"
	cont "ESTRECHO."
	para "¡Se equivocan!"
	para "Sé que este"
	line "lugar es mejor."
	done

KumePoint_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 10, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerFisherMartin, -1
	object_event  6, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerFisherKyle, -1
