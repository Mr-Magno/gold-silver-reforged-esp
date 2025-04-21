	const_def 2 ; object constants
	const BRASSTOWER4F_POKE_BALL1
	const BRASSTOWER4F_SAGE1
	const BRASSTOWER4F_SAGE2

BrassTower4F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
SproutTower4FSign:
	jumptext SproutTower4FSignText
	
SproutTower4FSignText:
	text "Es una estatua"
	line "de HO-OH."
	para "El #MON ave"
	line "legendario que"
	para "una vez se posó"
	line "en la cima de"
	cont "esta torre."
	para "Honramos su"
	line "nida esperando"
	para "a que un día"
	line "vuelva."
	done



BrassTower4FEscapeRope:
	itemball ESCAPE_ROPE
	
TrainerSageLi:
	trainer SAGE, LI, EVENT_BEAT_SAGE_LI, SageLiSeenText, SageLiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageLiAfterBattleText
	waitbutton
	closetext
	end


SageLiSeenText:
	text "Siento que es"
	line "una buena"
	para "decisión que"
	line "hagas este"
	cont "viaje."
	done

SageLiBeatenText:
	text "¡Lo sé!"
	done

SageLiAfterBattleText:
	text "Por favor, sigue"
	line "hasta el último"
	cont "piso."
	done
	
TrainerSageGaku:
	trainer SAGE, GAKU, EVENT_BEAT_SAGE_GAKU, SageGakuSeenText, SageGakuBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageGakuAfterBattleText
	waitbutton
	closetext
	end


SageGakuSeenText:
	text "Pasamos nuestros"
	line "día en seria"
	cont "reflexión."
	done

SageGakuBeatenText:
	text "Me siento"
	line "completo."
	done

SageGakuAfterBattleText:
	text "La mente es capaz"
	line "de pensar y"
	para "transmitir muchos"
	line "pensamientos"
	cont "al día."
	done


BrassTower4F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10,  1, BRASS_TOWER_3F, 2
	warp_event 11, 11, BRASS_TOWER_5F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  8,  1, BGEVENT_READ, SproutTower4FSign

	db 3 ; object events
	object_event  0,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BrassTower4FEscapeRope, EVENT_BRASS_TOWER_4F_ESCAPE_ROPE
	object_event  3,  1, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSageLi, EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	object_event  9,  9, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSageGaku, EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
