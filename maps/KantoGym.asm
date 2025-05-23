	const_def 2 ; object constants
	const KANTOGYM_RED
	const KANTOGYM_COOLTRAINERM1
	const KANTOGYM_COOLTRAINERM2
	const KANTOGYM_COOLTRAINERF1
	const KANTOGYM_COOLTRAINERF2
	const KANTOGYM_RED_DUMMY
	const KANTOGYM_GYM_GUY

KantoGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoGymErikaScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_RED
	iftrue rematchscriptRed
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue postrematchscriptRed
	opentext
	checkflag ENGINE_RISINGBADGE
	iftrue .FightDone
	writetext ErikaBeforeBattleText
	waitbutton
	closetext
	winlosstext ErikaBeatenText, 0
	loadtrainer RED, RED1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_RED
	opentext
	writetext PlayerReceivedRainbowBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_RISINGBADGE
.FightDone:
	checkevent EVENT_GOT_TM15_HYPER_BEAM
	iftrue .AlreadyGotTM
	writetext ErikaAfterBattleText
	buttonsound
	verbosegiveitem TM_HYPER_BEAM
	iffalse .BagFull
	setevent EVENT_GOT_TM15_HYPER_BEAM
	writetext ErikaAfterBattleText
	waitbutton
	closetext
	end

.AlreadyGotTM:
	writetext ErikaAfterBattleText
	waitbutton
.BagFull:
	closetext
	end


rematchscriptRed:
	opentext
	writetext RedRematchText
	waitbutton
	closetext
	winlosstext RedRematchWinText, 0
	loadtrainer RED, RED2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_RED
	opentext
	writetext RedAfterRematchText
	waitbutton
	closetext
	end

postrematchscriptRed:
	opentext
	writetext RedAfterRematchText
	waitbutton
	closetext
	end

RedRematchText:
	text "..?"
	done

RedRematchWinText:
	text "..!"
	done

RedAfterRematchText:
	text "…"
	done



KantoGymStatue:
	checkflag ENGINE_RISINGBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext RED, RED1, MEM_BUFFER_1
	jumpstd gymstatue2


TrainerCooltrainermPaul:
	trainer COOLTRAINERM, PAUL, EVENT_BEAT_COOLTRAINERM_PAUL, CooltrainermPaulSeenText, CooltrainermPaulBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermPaulAfterBattleText
	waitbutton
	closetext
	end
	

TrainerCooltrainermMike:
	trainer COOLTRAINERM, MIKE, EVENT_BEAT_COOLTRAINERM_MIKE, CooltrainermMikeSeenText, CooltrainermMikeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermMikeAfterBattleText
	waitbutton
	closetext
	end
	
TrainerCooltrainerfLola:
	trainer COOLTRAINERF, LOLA, EVENT_BEAT_COOLTRAINERF_LOLA, CooltrainerfLolaSeenText, CooltrainerfLolaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfLolaAfterBattleText
	waitbutton
	closetext
	end
	

TrainerCooltrainerfFran:
	trainer COOLTRAINERF, FRAN, EVENT_BEAT_COOLTRAINERF_FRAN, CooltrainerfFranSeenText, CooltrainerfFranBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfFranAfterBattleText
	waitbutton
	closetext
	end
	
RedEntersGymScene:
	checkevent EVENT_BEAT_COOLTRAINERF_FRAN
	iftrue .CheckGymTrainer2
	end
	
.CheckGymTrainer2
	checkevent EVENT_BEAT_COOLTRAINERF_LOLA
	iftrue .CheckGymTrainer3
	end
	
.CheckGymTrainer3
	checkevent EVENT_BEAT_COOLTRAINERM_MIKE
	iftrue .CheckGymTrainer4
	end
	
.CheckGymTrainer4
	checkevent EVENT_BEAT_COOLTRAINERM_PAUL
	iftrue .ItsRedTime
	end
	
.ItsRedTime
	playsound SFX_EXIT_BUILDING
	moveobject KANTOGYM_RED_DUMMY, 4, 17
	appear KANTOGYM_RED_DUMMY
	applymovement KANTOGYM_RED_DUMMY, RedDummyDummyMovement
	pause 20
	applymovement KANTOGYM_RED_DUMMY, RedDummyWalksToSpotRight
	disappear KANTOGYM_RED_DUMMY
	appear KANTOGYM_RED
	setscene SCENE_RED_IS_HERE
	clearevent EVENT_KANTO_GYM_RED_GONE
	end
	
	
RedEntersGymScene2:
	checkevent EVENT_BEAT_COOLTRAINERF_FRAN
	iftrue .CheckGymTrainer22
	end
	
.CheckGymTrainer22
	checkevent EVENT_BEAT_COOLTRAINERF_LOLA
	iftrue .CheckGymTrainer32
	end
	
.CheckGymTrainer32
	checkevent EVENT_BEAT_COOLTRAINERM_MIKE
	iftrue .CheckGymTrainer42
	end
	
.CheckGymTrainer42
	checkevent EVENT_BEAT_COOLTRAINERM_PAUL
	iftrue .ItsRedTime2
	end
	
.ItsRedTime2
	playsound SFX_EXIT_BUILDING
	moveobject KANTOGYM_RED_DUMMY, 5, 17
	appear KANTOGYM_RED_DUMMY
	applymovement KANTOGYM_RED_DUMMY, RedDummyDummyMovement
	pause 20
	applymovement KANTOGYM_RED_DUMMY, RedDummyWalksToSpotLeft
	disappear KANTOGYM_RED_DUMMY
	appear KANTOGYM_RED
	setscene SCENE_RED_IS_HERE
	clearevent EVENT_KANTO_GYM_RED_GONE
	end
	

KantoGymGuyScript2:
	faceplayer
	checkevent EVENT_KANTO_GYM_RED_GONE
	iftrue .KantoGymGuyRedNotHereScript2
	checkevent EVENT_BEAT_RED
	iftrue .KantoGymGuyWinScript2
	opentext
	writetext KantoGymGuyText2
	waitbutton
	closetext
	end
	
.KantoGymGuyRedNotHereScript2
	opentext
	writetext KantoGymGuyRedNotHereText2
	waitbutton
	closetext
	end

.KantoGymGuyWinScript2:
	opentext
	writetext KantoGymGuyWinText2
	waitbutton
	closetext
	end
	
RedDummyDummyMovement:
	step_end
	
RedDummyWalksToSpotRight:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end
	
RedDummyWalksToSpotLeft:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step LEFT
	step UP
	step UP
	step UP
	step_end
	
KantoGymGuyWinText2:
	text "¡Menudo combate!"
	
	para "¿Cuántas MEDALLAS"
	line "has conseguido?"
	
	para "Quizá estés listo"
	line "para la LIGA."
	done
	
KantoGymGuyText2:
	text "¡A por él, joven"
	line "promesa!"
	done
	
KantoGymGuyRedNotHereText2:
	text "¡Hola, joven"
	line "promesa!"

	para "¿Ya sabes quién"
	line "es el LÍDER de"
	cont "GIMNASIO?"

	para "No solo es el"
	line "LÍDER, sino que"
	cont "además fue"
	cont "CAMPEÓN de la"
	cont "LIGA."

	para "Es bastante"
	line "fuerte, pero es"
	cont "poco hablador."

	para "Y ahora mismo no"
	line "está aquí."

	para "Seguro que regresa"
	line "pronto. ¿Por qué"
	cont "no combates contra"
	cont "el resto de"
	cont "entrenadores"
	cont "mientras esperamos"
	cont "a que vuelva?"
	done
	
CooltrainerfFranSeenText:
	text "¡No dejaré que un"
	line "entrenador anónimo"
	cont "me derrote!"
	done

CooltrainerfFranBeatenText:
	text "Auuuu… Perdí…"
	done

CooltrainerfFranAfterBattleText:
	text "Quizá tengas lo"
	line "que hace falta"
	cont "para ganar aquí."
	done

CooltrainerfLolaSeenText:
	text "¿Que qué tipo de"
	line "#MON usamos?"

	para "Pues todos, como"
	line "todo buen entrena-"
	cont "dor debería."
	done

CooltrainerfLolaBeatenText:
	text "¡Adelante!"
	done

CooltrainerfLolaAfterBattleText:
	text "Un equipo"
	line "equilibrado es la"
	cont "clave para ganar."
	done


CooltrainermMikeSeenText:
	text "¿Mis posibilidades"
	line "de perder? ¡Ni el"
	cont "uno por ciento!"
	done

CooltrainermMikeBeatenText:
	text "Qué extraño."
	done

CooltrainermMikeAfterBattleText:
	text "Ahora sé cuál es"
	line "mi punto débil."

	para "¡Gracias por"
	line "enseñármelo!"
	done

CooltrainermPaulSeenText:
	text "Enfrentarte al"
	line "LÍDER será tu"
	cont "combate más duro."

	para "¡Pero yo no me"
	line "quedo atrás!"
	done

CooltrainermPaulBeatenText:
	text "¿Mis #MON han"
	line "perdido?"
	done

CooltrainermPaulAfterBattleText:
	text "¿Ya casi estás"
	line "listo para desafi-"
	cont "ar a la LIGA?"
	done

ErikaBeforeBattleText:
	text "…"
	done

ErikaBeatenText:
	text "…"
	done

PlayerReceivedRainbowBadgeText:
	text "<PLAYER> recibió la"
	line "MEDALLA AÑIL."
	done

ErikaExplainTMText:
	text "…"
	done

ErikaAfterBattleText:
	text "…"
	done


KantoGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, KANTO_REGION, 8
	warp_event  5, 17, KANTO_REGION, 16

	db 2 ; coord events
	coord_event  5, 13, SCENE_DEFAULT, RedEntersGymScene
	coord_event  4, 13, SCENE_DEFAULT, RedEntersGymScene2

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, KantoGymStatue
	bg_event  6, 15, BGEVENT_READ, KantoGymStatue

	db 7 ; object events
	object_event  4,  7, SPRITE_RED, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KantoGymErikaScript, EVENT_KANTO_GYM_RED_GONE
	object_event  4,  1, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermPaul, -1
	object_event  9,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermMike, -1
	object_event  5,  1, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfLola, -1
	object_event  0,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfFran, -1
	object_event -5, -5, SPRITE_RED, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KantoGymErikaScript, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KantoGymGuyScript2, -1
