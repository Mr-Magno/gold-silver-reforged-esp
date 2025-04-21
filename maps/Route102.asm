	const_def 2 ; object constants
	const ROUTE102_YOUNGSTER1
	const ROUTE102_YOUNGSTER2
	const ROUTE102_LASS1
	const ROUTE102_FRUIT_TREE
	const ROUTE102_ARTHUR
	const ROUTE102_SILVER
	const ROUTE102_YOUNGSTER3
	const ROUTE102_YOUNGSTER4
	const ROUTE102_BUG_CATCHER
	const ROUTE102_FISHER1
	const ROUTE102_FISHER2


Route102_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE102_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE102_SILVER

	db 3 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ArthurCallback
	callback MAPCALLBACK_NEWMAP, .CheckMomCall
	callback MAPCALLBACK_TILES, .Route35ClearTree
	
.Route35ClearTree
	checkevent EVENT_ROUTE36_GARDENER
	iftrue .Done
	changeblock  33, 07, $07 ; tree
.Done:
	return

.CheckMomCall:
	checkevent EVENT_TALKED_TO_MOM_AFTER_GETTING_POKEDEX
	iffalse .DoMomCall
	return

.DoMomCall:
	specialphonecall SPECIALCALL_WORRIED
	return

.DummyScene0:
	end

.DummyScene1:
	end

.ArthurCallback:
	checkcode VAR_WEEKDAY
	ifequal THURSDAY, .ArthurAppears
	disappear ROUTE102_ARTHUR
	return

.ArthurAppears:
	appear ROUTE102_ARTHUR
	return
	
GardenerScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM01_CUT
	iftrue .chopped
	writetext GardenerTreeText
	waitbutton
	closetext
	turnobject ROUTE102_FISHER1, UP
	end
	
.chopped
	writetext GardenerTreeChoppedText
	waitbutton
	closetext
	applymovement ROUTE102_FISHER2, GardenerWalkAway
	setevent EVENT_ROUTE36_TREE_CHOPPED
	disappear ROUTE102_FISHER2
	end
	

TrainerCamperSamuel:
	trainer CAMPER, SAMUEL, EVENT_BEAT_YOUNGSTER_SAMUEL, CamperSamuelSeenText, CamperSamuelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperSamuelAfterText
	waitbutton
	closetext
	end

TrainerYoungsterIan:
	trainer YOUNGSTER, IAN, EVENT_BEAT_YOUNGSTER_IAN, YoungsterIanSeenText, YoungsterIanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterIanAfterText
	waitbutton
	closetext
	end


Route102LassScript:
	faceplayer
	opentext
	writetext Route102LassText
	waitbutton
	closetext
	end


TrainerSchoolboyAlan:
	trainer SCHOOLBOY, ALAN, EVENT_BEAT_SCHOOLBOY_ALAN, SchoolboyAlanSeenText, SchoolboyAlanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyAlanAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicMark:
	trainer PSYCHIC_T, MARK, EVENT_BEAT_PSYCHIC_MARK, PsychicMarkSeenText, PsychicMarkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicMarkAfterBattleText
	waitbutton
	closetext
	end
	
TrainerFledglingJohnny:
	trainer FLEDGLING, JOHNNY, EVENT_BEAT_FLEDGLING_JOHNNY, FledglingJohnnySeenText, FledglingJohnnyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FledglingJohnnyAfterBattleText
	waitbutton
	closetext
	end

ArthurScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	iftrue .AlreadyGotStone
	checkcode VAR_WEEKDAY
	ifnotequal THURSDAY, ArthurNotThursdayScript
	checkevent EVENT_MET_ARTHUR_OF_THURSDAY
	iftrue .MetArthur
	writetext MeetArthurText
	buttonsound
	setevent EVENT_MET_ARTHUR_OF_THURSDAY
.MetArthur:
	writetext ArthurGivesGiftText
	buttonsound
	verbosegiveitem HARD_STONE
	iffalse .BagFull
	setevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	writetext ArthurGaveGiftText
	waitbutton
	closetext
	end

.AlreadyGotStone:
	writetext ArthurThursdayText
	waitbutton
.BagFull:
	closetext
	end

ArthurNotThursdayScript:
	writetext ArthurNotThursdayText
	waitbutton
	closetext
	end

Route102SilverScript:
	applymovement PLAYER, Movement_102DownOne
	playsound SFX_EXIT_BUILDING
	moveobject ROUTE102_SILVER, 6, 5
	appear ROUTE102_SILVER
	applymovement ROUTE102_SILVER, Movement_102SilverDownOne
	special FadeOutMusic
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext Route102RivalBeforeText
	waitbutton
	closetext
	checkevent EVENT_GOT_CRUIZE_FROM_OAK
	iftrue .Cruise
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .CHIKORITA
	winlosstext Route102SilverWinText, Route102SilverLossText
	loadtrainer RIVAL1, RIVAL1_2_CRUIZE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.Cruise:
	winlosstext Route102SilverWinText, Route102SilverLossText
	loadtrainer RIVAL1, RIVAL1_2_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.CHIKORITA:
	winlosstext Route102SilverWinText, Route102SilverLossText
	loadtrainer RIVAL1, RIVAL1_2_FLAMBEAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .AfterBattle

.AfterBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext Route102RivalAfterText
	waitbutton
	closetext
	turnobject ROUTE102_SILVER, UP
	pause 20
	showemote EMOTE_SHOCK, ROUTE102_SILVER, 15
	turnobject ROUTE102_SILVER, DOWN
	opentext
	writetext Route102RivalRadioCardText
	waitbutton
	closetext
	applymovement ROUTE102_SILVER, Route102RivalBattleExitMovement
	playsound SFX_ENTER_DOOR
	disappear ROUTE102_SILVER
	setscene SCENE_ROUTE36_NOTHING
	waitsfx
	playmapmusic
	setevent EVENT_ROUTE_102_SILVER
	end

Route102SilverTalkScript:
	end

Route102Sign:
	jumptext Route102SignText

RuinsOfAlphNorthSign:
	jumptext RuinsOfAlphNorthSignText

Route102TrainerTips1:
	jumptext Route102TrainerTips1Text

Route102TrainerTips2:
	jumptext Route102TrainerTips2Text
	
Route102GameHouse:
	jumptext Route102GameHouseText

Route102FruitTree:
	fruittree FRUITTREE_ROUTE_102

BipetalShakeMovement:
	tree_shake ; shake
	step_end

WeirdTreeMovement_Flee:
	fast_jump_step UP
	fast_jump_step UP
	step_end
	
Movement_102DownOne:
	step DOWN
	turn_head UP
	step_end
	
Movement_102SilverDownOne:
	step DOWN
	step_end

FloriaMovement1:
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

FloriaMovement2:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

Route102SuicuneMovement:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	remove_sliding
	step_end
	
Route102Greatball:
	itemball GREAT_BALL
	
Route102RivalBattleExitMovement:
	step UP
	step_end
	
GardenerWalkAway:
	step UP
	fast_jump_step LEFT
	fast_jump_step LEFT
	fast_jump_step LEFT
	step DOWN
	fast_jump_step LEFT
	step_end
	
Route102SilverWinText:
	text "¡Hala! ¡Se ve que"
	line "has trabajado duro"
	cont "entrenando a tus"
	cont "#MON!"
	done
	
Route102SilverLossText:
	text "¡Mi equipo es el"
	line "mejor!"
	done
	
Route102RivalBeforeText:
	text "¡<PLAY_G>!"

	para "¡He empezado el"
	line "desafío de la"
	cont "LIGA!"
	
	para "¡He oído que tú"
	line "también!"
	
	para "¡Será la mejor"
	line "manera de enseñar-"
	cont "le al mundo que mi"
	cont "equipo es el más"
	cont "fuerte que hay!"

	para "¡Vamos a"
	line "combatir para ver"
	para "quién los ha"
	line "entrenado mejor!"
	done
	
Route102RivalAfterText:
	text "¡Uf! ¡Ha estado"
	line "bien encontrarme"
	cont "contigo, <PLAY_G>!"
	done

Route102RivalRadioCardText:
	text "¡Oh!"
	line "¡Casi lo olvido!"
	
	para "Échale un"
	line "vistazo a la"
	cont "TORRE RADIO JOPM."
	
	para "¡He oído que dan"
	line "gratis TARJETAS"
	cont "RADIO!"
	
	para "¡Voy a regresar a"
	line "la ciudad!"
	
	para "¡Nos vemos!"
	done

Route102LassText:
	text "Un arbusto bloquea"
	line "el paso a CIUDAD"
	cont "PONIENTE."

	para "Si necesitas"
	line "pasar, un #MON"
	cont "podría CORTAR el"
	cont "árbol."
	done

PsychicMarkSeenText:
	text "¡Te voy a leer"
	line "el pensamiento!"
	done

PsychicMarkBeatenText:
	text "¡Te he leído"
	line "mal!"
	done

PsychicMarkAfterBattleText:
	text "Sería fuerte si"
	line "pudiera saber lo"
	para "que está pensando"
	line "mi rival."
	done

SchoolboyAlanSeenText:
	text "¡Gracias a mis"
	line "estudios, estoy"
	para "preparado para"
	line "cualquier #MON!"
	done

SchoolboyAlanBeatenText:
	text "¡Ups! ¿Error de"
	line "cálculo?"
	done

SchoolboyAlanAfterBattleText:
	text "Yo también estudio"
	line "5 horas al día."

	para "Leyendo libros"
	line "puedes aprender"
	cont "muchas cosas."
	done

MeetArthurText:
	text "JOSUÉ: ¿Quién"
	line "eres tú?"

	para "Soy JOSUÉ, por"
	line "jueves."
	done

ArthurGivesGiftText:
	text "Toma. Coge esto."
	done

ArthurGaveGiftText:
	text "JOSUÉ: Debería"
	line "usarlo un #MON"
	para "con habilidades de"
	line "tipo roca."

	para "Mejora los ataques"
	line "de tipo roca."
	done

ArthurThursdayText:
	text "JOSUÉ: Soy JOSUÉ,"
	line "por jueves. Soy el"
	cont "cuarto de siete"
	cont "hermanos."
	done

ArthurNotThursdayText:
	text "JOSUÉ: Hoy no es"
	line "jueves."
	cont "¡Qué desilusión!"
	done

Route102SignText:
	text "RUTA 102"
	
	para "CIUDAD PAGOTA -"
	line "CIUDAD PONIENTE"
	done

RuinsOfAlphNorthSignText:
	text "ENTRADA NORTE DE"
	line "LAS RUINAS ALFA"
	done

Route102TrainerTips1Text:
	text "PISTAS ENTRENADOR"

	para "Las habilidades de"
	line "los #MON varían"
	para "incluso dentro de"
	line "una misma especie."

	para "Al principio, sus"
	line "habilidades pueden"
	cont "parecerse."

	para "Sin embargo, las"
	line "diferencias surgen"
	para "a medida que el"
	line "#MON crece."
	done

Route102TrainerTips2Text:
	text "PISTAS ENTRENADOR"

	para "Usa EXCAVAR para"
	line "volver a la"
	cont "entrada."

	para "Es útil para"
	line "explorar cuevas y"
	cont "otros lugares."
	done
	
Route102GameHouseText:
	text "SALÓN RECREATIVO"
	para "¡Pasa a echar el"
	line "rato!"
	done
	
CamperSamuelSeenText:
	text "¡Aquí es donde"
	line "me entreno!"
	done

CamperSamuelBeatenText:
	text "¡Me han"
	line "derrotado!"
	done

CamperSamuelAfterText:
	text "Voy a entrenarme"
	line "mucho más."

	para "Después de todo,"
	line "intento ser un"
	cont "LÍDER de GIMNASIO."
	done

YoungsterIanSeenText:
	text "Soy el mejor de mi"
	line "clase en #MON."
	
	para "Te falta mucho"
	line "para ser como yo."
	done

YoungsterIanBeatenText:
	text "¡No! Hay mejores"
	line "entrenadores…"
	done

YoungsterIanAfterText:
	text "Supongo que debo"
	line "esforzarme aún"
	cont "más."
	done
	
FledglingJohnnySeenText:
	text "¿Te gusta mi"
	line "#MON pájaro?"
	done

FledglingJohnnyBeatenText:
	text "¡Eres demasiado"
	line "duro!"
	done

FledglingJohnnyAfterBattleText:
	text "Estoy cansado de"
	line "entrenar. Nece-"
	cont "sito un respiro."
	done
	
GardenerTreeText:
	text "¡Bah!"
	para "¡El arbusto blo-"
	line "quea el camino!"
	
	para "Creo que puedo"
	line "cortarlo, pero"
	cont "me llevará un"
	cont "tiempo…"
	done
	
GardenerTreeChoppedText:
	text "¡Já!"
	para "Al fin he corta-"
	line "do ese arbusto."
	
	para "¡Ya puedo ir a"
	line "CIUDAD PONIENTE!"
	
	para "Nos vemos,"
	line "¡buena suerte!"
	done


Route102_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6,  5, ROUTE_102_WESTPORT_GATE, 4
	warp_event 16,  4, ROUTE_102_N64_HOUSE, 1

	db 1 ; coord events
	coord_event  6,  6, SCENE_ROUTE102_SILVER, Route102SilverScript

	db 4 ; bg events
	bg_event 22, 10, BGEVENT_READ, Route102TrainerTips2
	bg_event 50, 10, BGEVENT_READ, Route102Sign
	bg_event 32, 10, BGEVENT_READ, Route102TrainerTips1
	bg_event 18,  4, BGEVENT_READ, Route102GameHouse

	db 12 ; object events
	object_event  8, 9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPsychicMark, -1
	object_event 29,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSchoolboyAlan, -1
	object_event 50,  7, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route102LassScript, -1
	object_event 39,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route102FruitTree, -1
	object_event 40,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ArthurScript, EVENT_ROUTE_36_ARTHUR_OF_THURSDAY
	object_event  1,  1, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route102SilverTalkScript, EVENT_ROUTE_102_SILVER
	object_event 12, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperSamuel, -1
	object_event 20,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterIan, -1
	object_event 34,  9, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINCLOCKWISE, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerFledglingJohnny, -1
	object_event 33,  7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GardenerScript, EVENT_ROUTE36_GARDENER
	object_event 33,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GardenerScript, EVENT_ROUTE36_GARDENER_CHOPPED
	object_event 33,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route102Greatball, EVENT_ROUTE_36_GREATBALL	
