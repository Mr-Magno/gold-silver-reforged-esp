	const_def 2 ; object constants
	const VICTORYROAD_POKE_BALL1
	const VICTORYROAD_POKE_BALL2
	const VICTORYROAD_POKE_BALL3
	const VICTORYROAD_POKE_BALL4
	const VICTORYROAD_POKE_BALL5
	const VICTORYROAD_COOLTRAINER_M
	const VICTORYROAD_COOLTRAINER_M2
	const VICTORYROAD_COOLTRAINER_F
	const VICTORYROAD_INSTRUCTOR
	const VICTORYROAD_SWIMMERM
	const VICTORYROAD_SWIMMERF
	const VICTORYROAD_ENGINEER
	const VICTORYROAD_COOLTRAINER_M3
	const VICTORYROAD_COOLTRAINER_F2

VictoryRoad_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


VictoryRoadTMEarthquake:
	itemball TM_EARTHQUAKE

VictoryRoadMaxRevive:
	itemball MAX_REVIVE

VictoryRoadFullRestore:
	itemball FULL_RESTORE

VictoryRoadFullHeal:
	itemball FULL_HEAL

VictoryRoadHPUp:
	itemball HP_UP

VictoryRoadHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_VICTORY_ROAD_HIDDEN_MAX_POTION

VictoryRoadHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_VICTORY_ROAD_HIDDEN_FULL_HEAL

TrainerCooltrainermCody:
	trainer COOLTRAINERM, CODY, EVENT_BEAT_COOLTRAINERM_CODY, CooltrainermCodySeenText, CooltrainermCodyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermCodyAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermJake:
	trainer COOLTRAINERM, JAKE, EVENT_BEAT_COOLTRAINERM_JAKE, CooltrainermJakeSeenText, CooltrainermJakeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermJakeAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfJoyce:
	trainer COOLTRAINERF, JOYCE, EVENT_BEAT_COOLTRAINERF_JOYCE, CooltrainerfJoyceSeenText, CooltrainerfJoyceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfJoyceAfterBattleText
	waitbutton
	closetext
	end


TrainerInstructorGeoff:
	trainer INSTRUCTOR, GEOFF, EVENT_BEAT_INSTRUCTOR_GEOFF, InstructorGeoffSeenText, InstructorGeoffBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext InstructorGeoffAfterBattleText
	waitbutton
	closetext
	end
	

TrainerSwimmermHarold:
	trainer SWIMMERM, HAROLD, EVENT_BEAT_SWIMMERM_HAROLD, SwimmermHaroldSeenText, SwimmermHaroldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermHaroldAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfLisa:
	trainer SWIMMERF, LISA, EVENT_BEAT_SWIMMERF_LISA, SwimmerfLisaSeenText, SwimmerfLisaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfLisaAfterBattleText
	waitbutton
	closetext
	end

TrainerEngineerDavidson:
	trainer ENGINEER, DAVIDSON, EVENT_BEAT_ENGINEER_DAVIDSON, EngineerDavidsonSeenText, EngineerDavidsonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext EngineerDavidsonAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermErick:
	trainer COOLTRAINERM, ERICK, EVENT_BEAT_COOLTRAINERM_ERICK, CooltrainermErickSeenText, CooltrainermErickBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermErickAfterBattleText
	waitbutton
	closetext
	end


TrainerCooltrainerfQuinn:
	trainer COOLTRAINERF, QUINN, EVENT_BEAT_COOLTRAINERF_QUINN, CooltrainerfQuinnSeenText, CooltrainerfQuinnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfQuinnAfterBattleText
	waitbutton
	closetext
	end

CooltrainermErickSeenText:
	text "¿Cansado?"
	done

CooltrainermErickBeatenText:
	text "Me parece que"
	line "yo sí."
	done

CooltrainermErickAfterBattleText:
	text "Todavía hay un"
	line "largo camino"
	cont "hasta la cima."
	para "He oído que la"
	line "última parte es"
	cont "como un laberinto."
	done


CooltrainermJakeSeenText:
	text "Estoy haciendo los"
	line "últimos retoques"

	para "para la LIGA"
	line "#MON."
	done

CooltrainermJakeBeatenText:
	text "¡La fastidié!"
	done

CooltrainermJakeAfterBattleText:
	text "Va a ser duro"
	line "ganar en la"
	cont "LIGA #MON."

	para "Necesito prac-"
	line "ticar más."

	para "He oído qu el"
	line "ALTO MANDO de"

	para "la liga son más"
	line "fuertes que los"
	cont "LÍDERES de"
	cont "GIMNASIO."
	done

CooltrainerfJoyceSeenText:
	text "Si has llegado tan"
	line "lejos, debes ser"
	cont "bastante bueno."

	para "¡Daré todo de"
	line "mí en este"
	cont "combate!"
	done

CooltrainerfJoyceBeatenText:
	text "¡No me lo"
	line "puedo creer!"
	done

CooltrainerfJoyceAfterBattleText:
	text "He derrotado a"
	line "ocho LÍDERES de"
	cont "GIMNASIO, así"

	para "que me sentía"
	line "segura."

	para "Lo intentaré de"
	line "nuevo la próxima."
	done

InstructorGeoffSeenText:
	text "Los entrenadores"
	line "aquí son duros."
	para "Cada combate es"
	line "una nueva lec-"
	cont "ción."
	done
	
InstructorGeoffBeatenText:
	text "Desde luego que"
	line "he aprendido"
	cont "algo nuevo."
	done
	
InstructorGeoffAfterBattleText:
	text "Los #MON"
	line "salvajes de aquí"
	cont "también son duros."
	done


SwimmermHaroldSeenText:
	text "¿Usas un #MON"
	line "para que te lle-"
	cont "ve por la cueva?"
	para "Si estuvieras"
	line "preparado,"
	cont "¡nadarías!"
	done

SwimmermHaroldBeatenText:
	text "Glu…"
	done

SwimmermHaroldAfterBattleText:
	text "La técnica de"
	line "natación no"
	para "afecta a los"
	line "combates #MON."
	done

SwimmerfLisaSeenText:
	text "El agua está"
	line "más caliente de"
	cont "lo esperado."
	done

SwimmerfLisaBeatenText:
	text "¡Me hundo!"
	done

SwimmerfLisaAfterBattleText:
	text "Prefiero nadar en"
	line "cuevas que en"
	cont "el exterior."
	done
	
EngineerDavidsonSeenText:
	text "¡Encontraré una"
	line "manera más rápi-"
	para "da de llegar a"
	line "la cumbre que"
	cont "caminar por aquí!"
	done
	
EngineerDavidsonBeatenText:
	text "Quizás me toca"
	line "caminar."
	done
	
EngineerDavidsonAfterBattleText:
	text "Eres fuerte."
	line "No pierdas en la"
	cont "LIGA o me sen-"
	cont "tiré peor de"
	cont "haber perdido."
	done


CooltrainermCodySeenText:
	text "El MT.FUJI es"
	line "enorme."
	para "Prepárate bien,"
	line "¡porque estarás"
	para "un buen rato"
	line "por aquí!"
	done

CooltrainermCodyBeatenText:
	text "¡Ojalá tuviera"
	line "mejores #-"
	cont "MON!"
	done

CooltrainermCodyAfterBattleText:
	text "Esta montaña"
	line "está dividida en"
	cont "cinco partes."
	para "¡Ésta es tan"
	line "sólo una!"
	done
	
CooltrainerfQuinnSeenText:
	text "¡Eh, tú!"
	line "¿Combatimos?"
	done

CooltrainerfQuinnBeatenText:
	text "He perdido…"
	done

CooltrainerfQuinnAfterBattleText:
	text "Eres fuerte."

	para "Debe haber entre-"
	line "nado mucho."
	done


VictoryRoad_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event  8, 51, CROWN_CITY, 5
	warp_event  4, 41, VICTORY_ROAD_OUTSIDE, 1
	warp_event  4, 33, VICTORY_ROAD_OUTSIDE, 2
	warp_event 26, 23, VICTORY_ROAD_OUTSIDE, 3
	warp_event 24, 15, VICTORY_ROAD_OUTSIDE, 4
	warp_event  8,  3, VICTORY_ROAD_OUTSIDE, 5
	warp_event 34, 25, VICTORY_ROAD, 8
	warp_event 34, 42, VICTORY_ROAD, 7
	warp_event 31,  2, VICTORY_ROAD_2F, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event 37, 33, BGEVENT_ITEM, VictoryRoadHiddenMaxPotion
	bg_event 19, 44, BGEVENT_ITEM, VictoryRoadHiddenFullHeal

	db 14 ; object events
	object_event 34,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadTMEarthquake, EVENT_VICTORY_ROAD_TM_EARTHQUAKE
	object_event 33, 40, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadMaxRevive, EVENT_VICTORY_ROAD_MAX_REVIVE
	object_event 11, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadFullRestore, EVENT_VICTORY_ROAD_FULL_RESTORE
	object_event 23, 44, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadFullHeal, EVENT_VICTORY_ROAD_FULL_HEAL
	object_event  8, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadHPUp, EVENT_VICTORY_ROAD_HP_UP
	object_event 13, 46, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermCody, -1
	object_event 31, 44, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermJake, -1
	object_event 24, 46, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerfJoyce, -1
	object_event 18, 49, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerInstructorGeoff, -1
	object_event 10, 24, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermHarold, -1
	object_event 18, 25, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfLisa, -1
	object_event 30, 25, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerEngineerDavidson, -1
	object_event  2,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermErick, -1
	object_event 27, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfQuinn, -1
