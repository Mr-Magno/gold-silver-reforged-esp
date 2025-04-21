	const_def 2
	const TP_TEACHER
	const TP_INSTR
	const TP_SNERD
	const TP_SAILOR
	const TP_ITEMBALL

TatsugoPath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSailorEugene:
	trainer SAILOR, EUGENE, EVENT_BEAT_SAILOR_EUGENE, SailorEugeneSeenText, SailorEugeneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorEugeneAfterBattleText
	waitbutton
	closetext
	end
	

SailorEugeneSeenText:
	text "Acabo de volver"
	line "del mar."

	para "¿Te apetece luchar"
	line "con mis #MON?"
	done

SailorEugeneBeatenText:
	text "¡Aaaargh!"
	done

SailorEugeneAfterBattleText:
	text "Mis #MON han"
	line "sido atrapados y"
	para "entrenados en el"
	line "extranjero."

	para "Me han acompañado"
	line "en esos largos"
	cont "viajes."
	done


TrainerTeacherHolly:
	trainer TEACHER, HOLLY, EVENT_BEAT_TEACHER_HOLLY, TeacherHollySeenText, TeacherHollyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherHollyAfterBattleText
	waitbutton
	closetext
	end
	

TeacherHollySeenText:
	text "¡Perdona, pero"
	line "esto es una cita"
	cont "privada!"
	done

TeacherHollyBeatenText:
	text "¡Largo de aquí,"
	line "pelmazo!"
	done

TeacherHollyAfterBattleText:
	text "¡Como si no"
	line "tuviera que lidiar"
	para "ya con suficientes"
	line "niños en el"
	cont "colegio!"
	done


TrainerInstrMoshe:
	trainer INSTRUCTOR, MOSHE, EVENT_BEAT_INSTRUCTOR_MOSHE, InstrMosheSeenText, InstrMosheBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext InstrMosheAfterBattleText
	waitbutton
	closetext
	end
	

InstrMosheSeenText:
	text "Si estás buscando"
	line "clases particula-"
	cont "res, ¡has llegado"
	cont "en el momento"
	cont "equivocado!"
	done

InstrMosheBeatenText:
	text "¡Venga ya!"
	done

InstrMosheAfterBattleText:
	text "Es habitual que no"
	line "pueda siquiera"
	cont "tener una cita sin"
	cont "que venga un niño"
	cont "a incordiar."
	done

TrainerSNNorton:
	trainer SUPER_NERD, NORTON, EVENT_BEAT_SUPERNERD_NORTON, SNNortonSeenText, SNNortonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SNNortonAfterBattleText
	waitbutton
	closetext
	end
	

SNNortonSeenText:
	text "¡Vengo todos los"
	line "días a la LAGUNA"
	cont "CORAZÓN!"

	para "¿Entonces por qué"
	line "todavía no tengo"
	cont "novia?"
	done

SNNortonBeatenText:
	text "Qué dura es la"
	line "vida de un NECIO."
	done

SNNortonAfterBattleText:
	text "¿Bañarme en la"
	line "LAGUNA CORAZÓN"
	cont "aumentaría mis"
	cont "posibilidades?"
	done

TPItemball:
	itemball ULTRA_BALL

HeartPondSign:
	jumptext HeartPondSignText
	
HeartPondSignText:
	text "LAGUNA CORAZÓN"

	para "Un lugar de"
	line "encuentro para"
	cont "los amantes"
	done

KikaiStraitSign:
	jumptext KikaiStraitSignText
	
KikaiStraitSignText:
	text "SENDA TATSUGO"

	para "PUEBLO AMAMI -"
	line "VILLA KIKAI"
	done

TatsugoPath_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 2 ; bg events
	bg_event 20,  6, BGEVENT_READ, HeartPondSign
	bg_event 54,  6, BGEVENT_READ, KikaiStraitSign

	db 5 ; object events
	object_event 19,  9, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerTeacherHolly, -1
	object_event 19, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerInstrMoshe, -1
	object_event 27,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSNNorton, -1
	object_event 52,  9, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSailorEugene, -1
	object_event 51, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TPItemball, EVENT_TATSUGO_PATH_ITEMBALL
