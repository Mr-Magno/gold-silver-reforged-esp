	const_def 2 ; object constants
	const ROUTE27_COOLTRAINER_M1
	const ROUTE27_COOLTRAINER_M2
	const ROUTE27_COOLTRAINER_F1
	const ROUTE27_COOLTRAINER_F2
	const ROUTE27_YOUNGSTER1
	const ROUTE27_YOUNGSTER2
	const ROUTE27_POKE_BALL1
	const ROUTE27_POKE_BALL2
	const ROUTE27_FISHER
	const ROUTE27_POKE_BALL3

Route115_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .ClearRocks27

.ClearRocks27:
	checkevent EVENT_ROUTE_115_ROCKS_DEMOLISHED
	iftrue .R27RocksDone
	changeblock   5,  7, $25 ; rock
	changeblock   7,  5, $25 ; rock
	changeblock   5,  9, $25 ; rock
	return

.R27RocksDone
	return

TrainerPsychicGilbert:
	trainer PSYCHIC_T, GILBERT, EVENT_BEAT_PSYCHIC_GILBERT, PsychicGilbertSeenText, PsychicGilbertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicGilbertAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperJose2:
	trainer BIRD_KEEPER, JOSE, EVENT_BEAT_BIRD_KEEPER_JOSE2, BirdKeeperJose2SeenText, BirdKeeperJose2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperJose2AfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermBlake:
	trainer COOLTRAINERM, BLAKE, EVENT_BEAT_COOLTRAINERM_BLAKE, CooltrainermBlakeSeenText, CooltrainermBlakeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermBlakeAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermBrian:
	trainer COOLTRAINERM, BRIAN, EVENT_BEAT_COOLTRAINERM_BRIAN, CooltrainermBrianSeenText, CooltrainermBrianBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermBrianAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfReena:
	trainer COOLTRAINERF, REENA, EVENT_BEAT_COOLTRAINERF_REENA, CooltrainerfReenaSeenText, CooltrainerfReenaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfReenaAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfMegan:
	trainer COOLTRAINERF, MEGAN, EVENT_BEAT_COOLTRAINERF_MEGAN, CooltrainerfMeganSeenText, CooltrainerfMeganBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfMeganAfterBattleText
	waitbutton
	closetext
	end


Route115TMSolarbeam:
	itemball TM_SOLARBEAM

Route115RareCandy:
	itemball RARE_CANDY
	
Route115FisherScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_RED
	iffalse .RocksStillThere
	writetext Route115FisherReadyToBlowText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .WalkUpBehindTrees
	follow ROUTE27_FISHER, PLAYER
	applymovement ROUTE27_FISHER, TakeCoverMovement
	stopfollow
	turnobject ROUTE27_FISHER, DOWN
	applymovement PLAYER, PlayerTakeCoverMovement
	turnobject PLAYER, DOWN
	special FadeOutMusic
	pause 30
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_EGG_BOMB
	earthquake 10
	pause 8
	playsound SFX_EGG_BOMB
	earthquake 10
	pause 8
	playsound SFX_EGG_BOMB
	earthquake 10
	pause 8
	playsound SFX_EMBER
	earthquake 160
	pause 16	
	changeblock   5,  7, $01 ; clear
	changeblock   7,  5, $01 ; clear
	changeblock   5,  9, $01 ; clear
	moveobject ROUTE27_POKE_BALL3, 5, 7
	special RestartMapMusic
	follow ROUTE27_FISHER, PLAYER
	applymovement ROUTE27_FISHER, ReturnMovement
	stopfollow
	applymovement PLAYER, PlayerReturnMovement
	opentext
	writetext Route115FisherLoveThisJobText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ROUTE27_FISHER, 15
	opentext
	writetext Route115LookieText
	waitbutton
	closetext
	applymovement PLAYER, PickUpMovement
	disappear ROUTE27_POKE_BALL3
	opentext
	verbosegiveitem HM_WATERFALL
	setevent EVENT_GOT_HM07_WATERFALL
	turnobject PLAYER, RIGHT
	opentext
	writetext Route115ThatWasGreatText
	waitbutton
	closetext
	applymovement ROUTE27_FISHER, LeaveMovement
	disappear ROUTE27_FISHER
	setevent EVENT_ROUTE_115_ROCKS_DEMOLISHED
	end
	
	
.WalkUpBehindTrees
	follow ROUTE27_FISHER, PLAYER
	applymovement ROUTE27_FISHER, TakeCoverMovement2
	stopfollow
	turnobject ROUTE27_FISHER, DOWN
	applymovement PLAYER, PlayerTakeCoverMovement
	turnobject PLAYER, DOWN
	special FadeOutMusic
	pause 30
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_POUND
	pause 2
	playsound SFX_EGG_BOMB
	earthquake 10
	pause 8
	playsound SFX_EGG_BOMB
	earthquake 10
	pause 8
	playsound SFX_EGG_BOMB
	earthquake 10
	pause 8
	playsound SFX_EMBER
	earthquake 160
	pause 16	
	changeblock   5,  7, $01 ; clear
	changeblock   7,  5, $01 ; clear
	changeblock   5,  9, $01 ; clear
	moveobject ROUTE27_POKE_BALL3, 5, 7
	special RestartMapMusic
	follow ROUTE27_FISHER, PLAYER
	applymovement ROUTE27_FISHER, ReturnMovement
	stopfollow
	applymovement PLAYER, PlayerReturnMovement
	opentext
	writetext Route115FisherLoveThisJobText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ROUTE27_FISHER, 15
	opentext
	writetext Route115LookieText
	waitbutton
	closetext
	applymovement PLAYER, PickUpMovement
	disappear ROUTE27_POKE_BALL3
	opentext
	verbosegiveitem HM_WATERFALL
	setevent EVENT_GOT_HM07_WATERFALL
	turnobject PLAYER, RIGHT
	opentext
	writetext Route115ThatWasGreatText
	waitbutton
	closetext
	applymovement ROUTE27_FISHER, LeaveMovement
	disappear ROUTE27_FISHER
	setevent EVENT_ROUTE_115_ROCKS_DEMOLISHED
	end

.RocksStillThere
	writetext Route115FisherSettingUpText
	waitbutton
	closetext
	turnobject ROUTE27_FISHER, LEFT
	end
	
TakeCoverMovement:
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

TakeCoverMovement2:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end
	
PlayerTakeCoverMovement:
	step RIGHT	
	step UP
	step_end
	
ReturnMovement:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
PlayerReturnMovement:
	step DOWN
	step LEFT
	step_end
	
PickUpMovement:
	step LEFT
	step_end
	
LeaveMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end
	
Route115FisherLoveThisJobText:
	text "¡Jajaja!"
	
	para "¡Me encanta este"
	line "trabajo!"
	done
	
Route115LookieText:
	text "¡Anda, mira!"
	
	para "Parece que había"
	line "algo dentro de esa"
	cont "roca."

	para "¿Por qué no te lo"
	line "quedas?"
	done
	
Route115ThatWasGreatText:
	text "¡Genial!"
	
	para "Por fin está"
	line "despejado el"
	para "camino a PUEBLO"
	line "SILENTE."

	para "¡Cuídate mucho,"
	line "chico!"
	done

	
Route115FisherSettingUpText:
	text "¡Esas rocas han"
	line "estado bloqueando"
	para "el camino a PUEBLO"
	line "SILENTE durante"
	cont "meses!"
	
	para "¡No te preocupes,"
	line "pienso quitarlas"
	cont "de en medio!"
	
	para "Sólo necesito un"
	line "poco de tiempo"
	para "para preparar los"
	line "explosivos."
	
	para "¿Por qué no"
	line "desafías el"
	para "GIMNASIO de KANTO"
	line "mientras tanto?"
	done
	
Route115FisherReadyToBlowText:
	text "¡Justo a tiempo!"
	
	para "¡Esas rocas están"
	line "a punto de"
	cont "explotar!"
	
	para "¡Pongámonos a"
	line "cubierto!"
	done

CooltrainermBlakeSeenText:
	text "Pareces muy"
	line "fuerte. ¡Déjame"
	cont "combatir contigo!"
	done

CooltrainermBlakeBeatenText:
	text "¡Auch!"
	done

CooltrainermBlakeAfterBattleText:
	text "¿Te diriges al"
	line "MT. FUJI?"
	done

CooltrainermBrianSeenText:
	text "¿Cómo se te da"
	line "esto?"
	done

CooltrainermBrianBeatenText:
	text "¡Justo como"
	line "pensaba!"
	done

CooltrainermBrianAfterBattleText:
	text "Un buen entrenador"
	line "puede reconocer a"
	cont "otros buenos"
	cont "entrenadores."
	done

CooltrainerfReenaSeenText:
	text "No deberías"
	line "subestimar a los"
	cont "#MON salvajes"
	cont "que hay por aquí."
	done

CooltrainerfReenaBeatenText:
	text "¡Oh! ¡Qué fuerte"
	line "eres!"
	done

CooltrainerfReenaAfterBattleText:
	text "Eres solo un niño,"
	line "pero nadie debería"
	cont "subestimarte."
	done

CooltrainerfMeganSeenText:
	text "¿Qué te trae por"
	line "aquí?"
	para "¿Estás entrenando"
	line "por tu cuenta?"
	done

CooltrainerfMeganBeatenText:
	text "¡Sí que eres"
	line "fuerte!"
	done

CooltrainerfMeganAfterBattleText:
	text "Me estoy"
	line "informando sobre"
	para "los #MON antes"
	line "y después de"
	cont "evolucionar."

	para "Los #MON"
	line "evolucionados son"
	cont "más fuertes."

	para "Pero tardan más"
	line "en aprender"
	cont "movimientos."
	done

PsychicGilbertSeenText:
	text "¡No digas nada!"

	para "Déjame adivinar en"
	line "qué estás"
	cont "pensando."

	para "Mmm…"

	para "¡Lo tengo! ¡Estás"
	line "afrontando el"
	cont "desafío de la LIGA"
	cont "#MON!"
	done

PsychicGilbertBeatenText:
	text "¡Eres demasiado!"
	done

PsychicGilbertAfterBattleText:
	text "Con tus"
	line "habilidades, lo"
	para "harás bien en la"
	line "LIGA."

	para "Eso es lo que"
	line "presiento."
	done

BirdKeeperJose2SeenText:
	text "¡Pío! ¡Pío!"
	line "¡Pío, pío!"
	done

BirdKeeperJose2BeatenText:
	text "¡Pío!"
	done

BirdKeeperJose2AfterBattleText:
	text "Los ORNITÓLOGOS"
	line "como yo imitamos"
	para "el canto de los"
	line "pájaros para"
	para "entrenar a"
	line "nuestros #MON."
	done


Route115_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 53,  9, ROUTE_115_KANTO_GATE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 10 ; object events
	object_event 39,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermBlake, -1
	object_event 48,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainermBrian, -1
	object_event 26,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfReena, -1
	object_event 18,  9, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfMegan, -1
	object_event 33, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicGilbert, -1
	object_event  9, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperJose2, -1
	object_event 31, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route115TMSolarbeam, EVENT_ROUTE_27_TM_SOLARBEAM
	object_event 15,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route115RareCandy, EVENT_ROUTE_27_RARE_CANDY
	object_event  6,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 1,  0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route115FisherScript, EVENT_ROUTE_115_ROCKS_DEMOLISHED
	object_event  9,  -8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ObjectEvent, -1
