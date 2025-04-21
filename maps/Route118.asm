	const_def 2 ; object constants
	const ROUTE4_YOUNGSTER
	const ROUTE4_LASS1
	const ROUTE4_LASS2
	const ROUTE4_POKE_BALL
	const HONTO_ROUTE_TRAINER
	const HONTO_ROUTE_MON
	const ROUTE4_FRUIT_TREE
	const ROUTE4_SWIMMERM2
	const ROUTE4_SWIMMERF
	const ROUTE4_SWIMMERF2

Route118_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
HontoTownRouteCooltrainermScript:
	end
HontoTownRouteMonsterScript:
	end
	
Route118FruitTree:
	fruittree FRUITTREE_ROUTE_118
	
TrainerSwimmerfElaine:
	trainer SWIMMERF, ELAINE, EVENT_BEAT_SWIMMERF_ELAINE, SwimmerfElaineSeenText, SwimmerfElaineBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfElaineAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfPaula:
	trainer SWIMMERF, PAULA, EVENT_BEAT_SWIMMERF_PAULA, SwimmerfPaulaSeenText, SwimmerfPaulaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfPaulaAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperHank:
	trainer BIRD_KEEPER, HANK, EVENT_BEAT_BIRD_KEEPER_HANK, BirdKeeperHankSeenText, BirdKeeperHankBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperHankAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerHope:
	trainer PICNICKER, HOPE, EVENT_BEAT_PICNICKER_HOPE, PicnickerHopeSeenText, PicnickerHopeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHopeAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerSharon:
	trainer PICNICKER, SHARON, EVENT_BEAT_PICNICKER_SHARON, PicnickerSharonSeenText, PicnickerSharonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerSharonAfterBattleText
	waitbutton
	closetext
	end
	

TrainerSwimmermRandall:
	trainer SWIMMERM, RANDALL, EVENT_BEAT_SWIMMERM_RANDALL, SwimmermRandallSeenText, SwimmermRandallBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermRandallAfterBattleText
	waitbutton
	closetext
	end
	
TrainerSwimmermCharlie:
	trainer SWIMMERM, CHARLIE, EVENT_BEAT_SWIMMERM_CHARLIE, SwimmermCharlieSeenText, SwimmermCharlieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermCharlieAfterBattleText
	waitbutton
	closetext
	end
	

MtMoonSquareSign:
	jumptext MtMoonSquareSignText

Route118HPUp:
	itemball HP_UP

Route118HiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ROUTE_4_HIDDEN_ULTRA_BALL

BirdKeeperHankSeenText:
	text "Estoy mejorando"
	line "mis #MON."

	para "¿Quieres combatir"
	line "contra mí?"
	done

BirdKeeperHankBeatenText:
	text "¡Argh! He perdido"
	line "esta vez…"
	done

BirdKeeperHankAfterBattleText:
	text "Si tienes un"
	line "#MON que desees"
	para "mejorar, ponlo en"
	line "primer lugar y"
	para "cámbialo nada más"
	line "empezar."

	para "Así es como hay"
	line "que hacerlo."
	done

PicnickerHopeSeenText:
	text "Presiento que"
	line "puedo ganar."

	para "¡Veamos si tengo"
	line "razón!"
	done

PicnickerHopeBeatenText:
	text "¡Uau! Eres"
	line "demasiado fuerte."
	done

PicnickerHopeAfterBattleText:
	text "He oído que algu-"
	line "nos #MON tienen"
	para "formas bebé que"
	line "nacen de HUEVOS."

	para "¿Pero de dónde"
	line "saca uno un HUEVO"
	cont "#MON?"
	done

PicnickerSharonSeenText:
	text "Eh…"
	line "Yo…"
	para "¿Combates conmigo?"
	done

PicnickerSharonBeatenText:
	text "…"
	done

PicnickerSharonAfterBattleText:
	text "Vine aquí por los"
	line "CLEFAIRY, pero no"
	cont "he encontrado ni"
	cont "uno…"
	done
	
SwimmermCharlieSeenText:
	text "El agua está bien"
	line "aquí. Me siento"
	cont "muy cómodo."

	para "¡Te ganaré!"
	done
	
SwimmermCharlieBeatenText:
	text "¡Vaya! ¡Se me"
	line "arrugó la piel!"
	done

SwimmermCharlieAfterBattleText:
	text "¿Verdad que es"
	line "relajante flotar"
	cont "así?"
	done
	
SwimmermRandallSeenText:
	text "¡Eres joven y"
	line "estás en forma!"

	para "¡No vayas sobre tu"
	line "#MON! ¡Nada!"
	done

SwimmermRandallBeatenText:
	text "¡Oh, he perdido…!"
	done

SwimmermRandallAfterBattleText:
	text "La natación"
	line "fortalece tu"
	cont "cuerpo. Es sana."
	done
	
SwimmerfElaineSeenText:
	text "¿Vas a CALORINA?"

	para "¿Y si combatimos"
	line "primero?"
	done

SwimmerfElaineBeatenText:
	text "¡He perdido!"
	done

SwimmerfElaineAfterBattleText:
	text "Creo que soy me-"
	line "jor nadadora que"
	cont "tú. ¡Sí!"
	done

SwimmerfPaulaSeenText:
	text "Me he quedado"
	line "sin aire."

	para "¡Me apoyaré en un"
	line "#MON acuático!"
	done

SwimmerfPaulaBeatenText:
	text "¡Me estoy"
	line "mareando!"
	done

SwimmerfPaulaAfterBattleText:
	text "Mientras floto,"
	line "el oleaje me"
	cont "lleva por el mar."
	done

MtMoonSquareSignText:
	text "RUTA 118"
	
	para "CIUDAD CALORINA -"
	line "PUEBLO SÁNSCRITO"
	done

Route118_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4, 11, ROUTE_118_SUNPOINT_GATE, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  6, 10, BGEVENT_READ, MtMoonSquareSign
	bg_event 16,  4, BGEVENT_ITEM, Route118HiddenUltraBall

	db 11 ; object events
	object_event 64,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperHank, -1
	object_event  8, 12, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerHope, -1
	object_event 11,  9, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerSharon, -1
	object_event  6,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route118HPUp, EVENT_ROUTE_4_HP_UP
	object_event 72,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HontoTownRouteCooltrainermScript, -1
	object_event 72,  5, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HontoTownRouteMonsterScript, -1
	object_event 17,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route118FruitTree, -1
	object_event 37,  5, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermRandall, -1
	object_event 50, 10, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermCharlie, -1
	object_event 42, 12, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerSwimmerfElaine, -1
	object_event 57,  8, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfPaula, -1
