	const_def 2 ; object constants
	const GOLDENRODGYM_WHITNEY
	const GOLDENRODGYM_LASS1
	const GOLDENRODGYM_LASS2
	const GOLDENRODGYM_BUENA1
	const GOLDENRODGYM_GYM_GUY

TeknosGym_MapScripts:
	db 0 ; scene scripts
	
	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .whitneynothere
	
.whitneynothere
	checkevent EVENT_WHITNEY_BACK_IN_GYM
	iffalse .gone
	return
	
.gone
	disappear GOLDENRODGYM_WHITNEY
	disappear GOLDENRODGYM_LASS1
	disappear GOLDENRODGYM_LASS2
	disappear GOLDENRODGYM_BUENA1
	return


TeknosGymWhitneyScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_WHITNEY
	iftrue rematchscriptWhitney
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue postrematchscriptWhitney
	
	opentext
	checkevent EVENT_BEAT_WHITNEY
	iftrue .FightDone
	writetext WhitneyBeforeText
	waitbutton
	closetext
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	loadtrainer WHITNEY, WHITNEY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WHITNEY
	setevent EVENT_BEAT_LASS_CARRIE
	setevent EVENT_BEAT_LASS_BRIDGET
	setevent EVENT_BEAT_BEAUTY_SAMANTHA
	specialphonecall SPECIALCALL_ROBBED
	setmapscene OAKS_LAB_ENTRANCE, SCENE_DEFAULT
	opentext
	writetext PlayerReceivedPlainBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_PLAINBADGE
	checkcode VAR_BADGES
	scall TeknosGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM45_ATTRACT
	iftrue .GotAttract
	writetext Whitney_BadgeSpeech
	buttonsound
	verbosegiveitem TM_ATTRACT
	iffalse .NoRoomForAttract
	setevent EVENT_GOT_TM45_ATTRACT
	writetext WhitneyAttractText
	waitbutton
	closetext
	end

.GotAttract:
	writetext Whitney_GoodLuck
	waitbutton
.NoRoomForAttract
	closetext
	end

rematchscriptWhitney:
	opentext
	writetext WhitneyRematchText
	waitbutton
	closetext
	winlosstext WhitneyRematchWinText, 0
	loadtrainer WHITNEY, WHITNEY2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_WHITNEY
	opentext
	writetext WhitneyAfterRematchText
	waitbutton
	closetext
	end

postrematchscriptWhitney:
	opentext
	writetext WhitneyAfterRematchText
	waitbutton
	closetext
	end

WhitneyRematchText:
	text "¿Has venido hasta"
	line "aquí solo para"
	cont "verme?"
	
	para "¿O has venido para"
	line "combatir de nuevo?"
	
	para "¡Sea lo que sea,"
	line "aquí me tienes!"
	done

WhitneyRematchWinText:
	text "¡Hala! ¡No me"
	line "extraña que me"
	cont "ganases antes!"
	done

WhitneyAfterRematchText:
	text "¡Oí que te"
	line "encargaste del"
	cont "TEAM ROCKET!"
	
	para "¡Me alegro! No he"
	line "vuelto a ver a un"
	para "solo ROCKET desde"
	line "que pasó lo del"
	cont "ACUARIO."
	done



TeknosGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerLassCarrie:
	trainer LASS, CARRIE, EVENT_BEAT_LASS_CARRIE, LassCarrieSeenText, LassCarrieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassCarrieAfterBattleText
	waitbutton
	closetext
	end



TrainerLassBridget:
	trainer LASS, BRIDGET, EVENT_BEAT_LASS_BRIDGET, LassBridgetSeenText, LassBridgetBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassBridgetAfterBattleText
	waitbutton
	closetext
	end



TrainerBeautySamantha:
	trainer BEAUTY, SAMANTHA, EVENT_BEAT_BEAUTY_SAMANTHA, BeautySamanthaSeenText, BeautySamanthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautySamanthaAfterBattleText
	waitbutton
	closetext
	end



TeknosGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_WHITNEY_BACK_IN_GYM
	iffalse .whitneynothere
	checkevent EVENT_BEAT_WHITNEY
	iftrue .TeknosGymGuyWinScript
	writetext TeknosGymGuyText
	waitbutton
	closetext
	end
	
.whitneynothere
	writetext TeknosGymGuyTextNotHere
	waitbutton
	closetext
	end
	
.TeknosGymGuyWinScript:
	writetext TeknosGymGuyWinText
	waitbutton
	closetext
	end

TeknosGymStatue:
;	setmapscene OAKS_LAB_ENTRANCE, SCENE_DEFAULT
;	specialphonecall SPECIALCALL_ROBBED
	checkflag ENGINE_PLAINBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext WHITNEY, WHITNEY1, MEM_BUFFER_1
	jumpstd gymstatue2

BridgetWalksUpMovement:
	step LEFT
	turn_head UP
	step_end

BridgetWalksAwayMovement:
	step RIGHT
	turn_head LEFT
	step_end

Whitney_GoodLuck:
	text "¡Buena suerte"
	line "con el desafío de"
	cont "la LIGA!"
	done

WhitneyBeforeText:
	text "¡Bien!"

	para "¡Al final has"
	line "venido!"

	para "Gracias de nuevo"
	line "por tu ayuda en"
	cont "el ACUARIO."
	
	para "¡Pero esto es"
	line "diferente!"
	
	para "Así que…"
	
	para "Ejem…"
	
	para "Soy BLANCA."
	
	para "¡Mis bonitos"
	line "#MON te"
	cont "aplastarán!"
	
	para "…risilla…"

	para "¿Crees que"
	line "puedes ganarme?"
	done

WhitneyShouldntBeSoSeriousText:
	text "¡Vaya!"
	para "¡Eres más fuerte"
	line "de lo que me"
	cont "pensaba!"
	done

PlayerReceivedPlainBadgeText:
	text "<PLAYER> recibió la"
	line "MEDALLA PLANICIE."
	done

Whitney_BadgeSpeech:
	text "La MEDALLA"
	line "PLANICIE aumenta"
	cont "la VELOCIDAD de"
	cont "tus #MON."

	para "¡Ah, toma esto"
	line "también!"
	done

WhitneyAttractText:
	text "¡Es ATRACCIÓN!"
	line "Utiliza todo el"
	para "encanto de un"
	line "#MON."

	para "¿No es perfecto"
	line "para una monada"
	cont "como yo?"
	done

LassCarrieSeenText:
	text "No dejes que te"
	line "impresione la"
	para "belleza de mis"
	line "#MON."
	cont "¡Son muy fuertes!"
	done

LassCarrieBeatenText:
	text "¡Vaya…! Pensaba"
	line "que eras débil…"
	done

LassCarrieAfterBattleText:
	text "¿Creen mis #MON"
	line "que soy guapa?"
	done

LassBridgetSeenText:
	text "Prefiero un"
	line "#MON mono a un"
	cont "#MON fuerte."

	para "¡Mis #MON son"
	line "monos y fuertes!"
	done

LassBridgetBeatenText:
	text "¡Oh, no, no, no!"
	done

LassBridgetAfterBattleText:
	text "Intento vencer a"
	line "BLANCA, pero…"
	cont "Es deprimente."

	para "¡De acuerdo! ¡Si"
	line "pierdo, volveré"
	para "a intentarlo"
	line "otra vez!"
	done

BridgetWhitneyCriesText:
	text "¡Oh, no! Has hecho"
	line "llorar a BLANCA."

	para "¡No te preocupes!"
	line "Pronto dejará de"
	para "llorar. Siempre"
	line "llora si pierde."
	done



BeautySamanthaSeenText:
	text "¡Hazlo lo mejor"
	line "que puedas o"
	cont "acabaré contigo!"
	done

BeautySamanthaBeatenText:
	text "¡No! ¡Oh, MEOWTH,"
	line "lo siento mucho!"
	done

BeautySamanthaAfterBattleText:
	text "Le había enseñado"
	line "a MEOWTH todo tipo"
	cont "de ataques…"
	done
	
TeknosGymGuyTextNotHere:
	text "¡Hola, joven"
	line "promesa!"
	
	para "BLANCA no está"
	line "aquí ahora."
	
	para "Siempre está"
	line "ocupada lidiando"
	cont "con los problemas"
	cont "de la ciudad."

	para "Algo debe estar"
	line "sucediendo en la"
	cont "ciudad."
	done

TeknosGymGuyText:
	text "¡Hola, joven"
	line "promesa!"

	para "Este GIMNASIO"
	line "es el hogar de"
	cont "los entrenadores"
	cont "de #MON de"
	cont "tipo normal."

	para "Te recomiendo usar"
	line "los #MON de"
	cont "tipo lucha."
	done

TeknosGymGuyWinText:
	text "¿Has ganado?"
	line "¡Genial! Yo estaba"
	para "ocupado mirando a"
	line "las chicas."
	done

TeknosGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2, 17, TEKNOS_CITY, 11
	warp_event  3, 17, TEKNOS_CITY, 12

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4, 15, BGEVENT_READ, TeknosGymStatue

	db 5 ; object events
	object_event 16, 13, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TeknosGymWhitneyScript, 0
	object_event  4,  8, SPRITE_LASS, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassCarrie, 0
	object_event 11,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassBridget, 0
	object_event 17,  8, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautySamantha, 0
	object_event  5, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TeknosGymGuyScript, -1
