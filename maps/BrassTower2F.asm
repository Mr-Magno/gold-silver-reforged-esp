	const_def 2 ; object constants
	const BRASSTOWER2F_MEDIUM1
	const BRASSTOWER2F_MEDIUM2
	const BRASSTOWER2F_MEDIUM3
	const BRASSTOWER2F_POKE_BALL

BrassTower2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BrassTower2FSign:
	jumptext BrassTower2FSignText

BrassTower2FXAccuracy:
	itemball X_ACCURACY
	
TrainerMediumMartha:
	trainer MEDIUM, MARTHA, EVENT_BEAT_MEDIUM_MARTHA, MediumMarthaSeenText, MediumMarthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumMarthaAfterBattleText
	waitbutton
	closetext
	end
	
BrassTower2FSignText:
	text "Es una estatua"
	line "de un PIKACHU."
	para "PIKACHU nos"
	line "recuerda que"
	para "incluso el más"
	line "popular de los"
	para "#MON se"
	line "merece ser tra-"
	para "tado con respeto"
	line "y no ser visto"
	para "como un símbolo"
	line "de aceptación."
	done


MediumMarthaSeenText:
	text "¿Qué te trae"
	line "aquí?"
	done

MediumMarthaBeatenText:
	text "Tu propósito"
	line "es claro."
	done

MediumMarthaAfterBattleText:
	text "Sólo los entrena-"
	line "dores más sabios"
	para "comprenden la"
	line "importancia de la"
	para "relación entre"
	line "las personas y"
	cont "los #MON."
	done
	
TrainerMediumGrace:
	trainer MEDIUM, GRACE, EVENT_BEAT_MEDIUM_GRACE, MediumGraceSeenText, MediumGraceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumGraceAfterBattleText
	waitbutton
	closetext
	end


MediumGraceSeenText:
	text "Cuando se hace de"
	line "manera adecuada,"
	para "un combate #-"
	line "MON puede ser una"
	cont "experiencia"
	cont "espiritual."
	done

MediumGraceBeatenText:
	text "Espero que lo"
	line "hayas sentido."
	done

MediumGraceAfterBattleText:
	text "Los humanos"
	line "dependen más de"
	para "los #MON que"
	line "ellos de nosotros."
	done
	
TrainerMediumBethany:
	trainer MEDIUM, BETHANY, EVENT_BEAT_MEDIUM_BETHANY, MediumBethanySeenText, MediumBethanyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumBethanyAfterBattleText
	waitbutton
	closetext
	end


MediumBethanySeenText:
	text "¿Sientes una"
	line "presencia de"
	para "otro mundo en"
	line "este lugar?"
	done

MediumBethanyBeatenText:
	text "Mmmm."
	done

MediumBethanyAfterBattleText:
	text "De una forma u"
	line "otra, todos"
	cont "podemos sentirla."
	done
	


BrassTower2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  1, BRASS_TOWER_1F, 3
	warp_event 11,  4, BRASS_TOWER_3F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  8,  1, BGEVENT_READ, BrassTower2FSign

	db 4 ; object events
	object_event 10,  2, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerMediumMartha, EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	object_event  1,  7, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerMediumGrace, EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	object_event  9,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerMediumBethany, EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	object_event 11,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BrassTower2FXAccuracy, EVENT_BRASS_TOWER_2F_X_ACCURACY
