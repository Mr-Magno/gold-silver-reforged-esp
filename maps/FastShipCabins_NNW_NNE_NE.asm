	const_def 2 ; object constants
	const FASTSHIPCABINS_NNW_NNE_NE_COOLTRAINER_M
	const FASTSHIPCABINS_NNW_NNE_NE_COOLTRAINER_F
	const FASTSHIPCABINS_NNW_NNE_NE_SUPER_NERD
	const FASTSHIPCABINS_NNW_NNE_NE_POKEFAN_M
	const FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	const FASTSHIPCABINS_NNW_NNE_NE_GENTLEMAN
	const FASTSHIPCABINS_NNW_NNE_NE_PHARMACIST

FastShipCabins_NNW_NNE_NE_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerCooltrainermSean:
	trainer COOLTRAINERM, SEAN, EVENT_BEAT_COOLTRAINERM_SEAN, CooltrainermSeanSeenText, CooltrainermSeanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermSeanAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfCarol:
	trainer COOLTRAINERF, CAROL, EVENT_BEAT_COOLTRAINERF_CAROL, CooltrainerfCarolSeenText, CooltrainerfCarolBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfCarolAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacEthan:
	trainer POKEMANIAC, ETHAN, EVENT_BEAT_POKEMANIAC_ETHAN, PokemaniacEthanSeenText, PokemaniacEthanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacEthanAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerNoland:
	trainer HIKER, NOLAND, EVENT_BEAT_HIKER_NOLAND, HikerNolandSeenText, HikerNolandBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerNolandAfterBattleText
	waitbutton
	closetext
	end

TrainerGentlemanEdward:
	trainer GENTLEMAN, EDWARD, EVENT_BEAT_GENTLEMAN_EDWARD, GentlemanEdwardSeenText, GentlemanEdwardBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanEdwardAfterBattleText
	waitbutton
	closetext
	end

TrainerBurglarCorey:
	trainer BURGLAR, COREY, EVENT_BEAT_BURGLAR_COREY, BurglarCoreySeenText, BurglarCoreyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BurglarCoreyAfterBattleText
	waitbutton
	closetext
	end

FastShipLazySailorScript:
	playmusic MUSIC_HIKER_ENCOUNTER
	faceplayer
	opentext
	writetext SailorStanlySeenText
	waitbutton
	closetext
	winlosstext SailorStanlyBeatenText, 0
	loadtrainer SAILOR, STANLY
	startbattle
	reloadmap
	special HealParty
	setevent EVENT_BEAT_SAILOR_STANLY
	opentext
	writetext SailorStanlyAfterBattleText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_LAZY_SAILOR
	setmapscene FAST_SHIP_B1F, SCENE_FINISHED
	checkcode VAR_FACING
	ifequal RIGHT, .Movement2
	applymovement FASTSHIPCABINS_NNW_NNE_NE_SAILOR, FastShipLazySailorLeavesMovement1
	playsound SFX_EXIT_BUILDING
	disappear FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	waitsfx
	end

.Movement2:
	applymovement FASTSHIPCABINS_NNW_NNE_NE_SAILOR, FastShipLazySailorLeavesMovement2
	playsound SFX_EXIT_BUILDING
	disappear FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	waitsfx
	end

FastShipCabins_NNW_NNE_NETrashcan:
	jumpstd trashcan

FastShipLazySailorLeavesMovement1:
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

FastShipLazySailorLeavesMovement2:
	step DOWN
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step_end

CooltrainermSeanSeenText:
	text "Voy a las ISLAS"
	line "para poner a"
	cont "prueba mis"
	cont "habilidades."
	done

CooltrainermSeanBeatenText:
	text "¡Quería ganar!"
	done

CooltrainermSeanAfterBattleText:
	text "Debería haber"
	line "combatido contra"
	cont "más LÍDERES de"
	cont "GIMNASIO…"
	done

CooltrainerfCarolSeenText:
	text "¡Estoy entrenando"
	line "para ganar la"
	cont "LIGA!"
	done

CooltrainerfCarolBeatenText:
	text "¿En qué somos"
	line "tan diferentes?"
	done

CooltrainerfCarolAfterBattleText:
	text "¡Te ganaré un"
	line "día de éstos!"
	done

PokemaniacEthanSeenText:
	text "¿Conoces a ROSA?"
	line "Es la mejor"
	cont "locutora de radio."
	done

PokemaniacEthanBeatenText:
	text "¡Yaaaa!"
	done

PokemaniacEthanAfterBattleText:
	text "Los programas de"
	line "radio del conti-"
	cont "nente son igual de"
	cont "populares en las"
	cont "ISLAS."
	done

HikerNolandSeenText:
	text "¿Estás solo?"
	line "¡Pues luchemos!"
	done

HikerNolandBeatenText:
	text "¡Es demasiado!"
	done

HikerNolandAfterBattleText:
	text "Me pregunto si en"
	line "las ISLAS habrá"
	para "montañas que valga"
	line "la pena escalar."
	done

SailorStanlySeenText:
	text "Sí, es verdad,"
	line "soy un marinero."

	para "¡No hacía nada"
	line "malo!"

	para "Como el camarote"
	line "estaba vacío, me"
	cont "eché un sueñecito."

	para "¡Ah! ¡Olvídalo!"
	line "¡Luchemos!"
	done

SailorStanlyBeatenText:
	text "¡Lo siento! ¡Todo"
	line "es culpa mía!"
	done

SailorStanlyAfterBattleText:
	text "Los marineros"
	line "hacemos mucho"
	para "trabajo físico."
	line "¡Es agotador!"
	done

GentlemanEdwardSeenText:
	text "¡Oh, no! He"
	line "perdido algo"
	cont "muy importante."
	done

GentlemanEdwardBeatenText:
	text "No… No lo"
	line "encuentro…"
	done

GentlemanEdwardAfterBattleText:
	text "Me rindo."
	line "No tienes por qué"
	para "buscarlo."
	line "¡Olvídalo!"
	done

BurglarCoreySeenText:
	text "¡Yujuu!"
	line "¡Qué suerte!"
	done

BurglarCoreyBeatenText:
	text "¡Qué mala suerte!"
	line "¡He perdido!"
	done

BurglarCoreyAfterBattleText:
	text "He encontrado una"
	line "moneda muy bonita."

	para "Alguien debe de"
	line "haberla perdido…"
	done

FastShipCabins_NNW_NNE_NE_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  0, FAST_SHIP_1F, 2
	warp_event  2, 12, FAST_SHIP_1F, 3
	warp_event  2, 24, FAST_SHIP_1F, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event  6, 13, BGEVENT_READ, FastShipCabins_NNW_NNE_NETrashcan
	bg_event  7, 19, BGEVENT_READ, FastShipCabins_NNW_NNE_NETrashcan
	bg_event  7, 31, BGEVENT_READ, FastShipCabins_NNW_NNE_NETrashcan

	db 7 ; object events
	object_event  4,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermSean, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  1,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfCarol, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  1,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacEthan, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  4, 17, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerNoland, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  4, 26, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FastShipLazySailorScript, EVENT_FAST_SHIP_CABINS_NNW_NNE_NE_SAILOR
	object_event  7, 30, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerGentlemanEdward, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  2, 30, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerBurglarCorey, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
