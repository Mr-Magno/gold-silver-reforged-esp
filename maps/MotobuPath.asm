	const_def 2 ; object constants
	const MOTOBU_PATH_SWIMMER1
	const MOTOBU_PATH_SWIMMER2
	const MOTOBU_PATH_SWIMMER3

MotobuPath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerSwimmerfJill:
	trainer SWIMMERF, JILL, EVENT_BEAT_SWIMMERF_JILL, SwimmerfJillSeenText, SwimmerfJillBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfJillAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfMary:
	trainer SWIMMERF, MARY, EVENT_BEAT_SWIMMERF_MARY, SwimmerfMarySeenText, SwimmerfMaryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfMaryAfterBattleText
	waitbutton
	closetext
	end


TrainerSwimmerfKatie:
	trainer SWIMMERF, KATIE, EVENT_BEAT_SWIMMERF_KATIE, SwimmerfKatieSeenText, SwimmerfKatieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKatieAfterBattleText
	waitbutton
	closetext
	end


SwimmerfJillSeenText:
	text "¡El agua de por"
	line "aquí es muy agra-"
	cont "dable y cálida!"
	done

SwimmerfJillBeatenText:
	text "¡Ay!"
	done

SwimmerfJillAfterBattleText:
	text "Ir al CENTRO"
	line "#MON significa"
	cont "tener que salir"
	cont "del agua. En fin…"
	done

SwimmerfMarySeenText:
	text "¡Nadaré en"
	line "círculos alrededor"
	cont "de ti!"
	done

SwimmerfMaryBeatenText:
	text "¡Qué mareo!"
	done

SwimmerfMaryAfterBattleText:
	text "Creo que me va a"
	line "dar un golpe de"
	cont "calor."
	done

SwimmerfKatieSeenText:
	text "¡Ven que te"
	line "salpique!"
	done

SwimmerfKatieBeatenText:
	text "¡He acabado"
	line "salpicada yo!"
	done

SwimmerfKatieAfterBattleText:
	text "Want to see how"
	line "long I can hold"
	cont "my breath?"
	done

MotobuPathSign:
	jumptext MotobuPathSignText
	
MotobuPathSignText:
	text "SENDA MOTOBU"

	para "VILLA NAGO -"
	line "PUEBLO IE"
	done


MotobuPath_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event 57,  7, BGEVENT_READ, MotobuPathSign

	db 3 ; object events
	object_event 14,  7, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfJill, -1
	object_event 21,  9, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfMary, -1
	object_event 28,  7, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfKatie, -1
