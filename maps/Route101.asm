	const_def 2 ; object constants
	const ROUTE29_COOLTRAINER_M1
	const ROUTE29_YOUNGSTER
	const ROUTE29_TEACHER1
	const ROUTE29_FRUIT_TREE
	const ROUTE29_FISHER
	const ROUTE29_COOLTRAINER_M2
	const ROUTE29_POKE_BALL
	const ROUTE29_POKE_BALL_2
	const ROUTE29_TEACHER2
	const ROUTE29_FLEDELING

Route101_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE29_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE29_CATCH_TUTORIAL

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end
	
TrainerFledglingHugo:
	trainer FLEDGLING, HUGO, EVENT_BEAT_FLEDGLING_HUGO, FledglingHugoSeenText, FledglingHugoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FledglingHugoAfterBattleText
	waitbutton
	closetext
	end
	
TrainerTeacherColette:
	trainer POKEFANF, COLETTE, EVENT_BEAT_TEACHER_COLETTE, TeacherColetteSeenText, TeacherColetteBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherColetteAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfHikari:
	trainer SWIMMERF, HIKARI, EVENT_BEAT_SWIMMERF_HIKARI, SwimmerfHikariSeenText, SwimmerfHikariBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfHikariAfterBattleText
	waitbutton
	closetext
	end

Route101Tutorial1:
	turnobject ROUTE29_COOLTRAINER_M1, UP
	showemote EMOTE_SHOCK, ROUTE29_COOLTRAINER_M1, 15
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData1a
	turnobject PLAYER, DOWN
	setevent EVENT_DUDE_TALKED_TO_YOU
	opentext
	writetext CatchingTutorialIntroText
	yesorno
	iffalse Script_RefusedTutorial1
	closetext
	follow ROUTE29_COOLTRAINER_M1, PLAYER
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData1b
	stopfollow
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	turnobject ROUTE29_COOLTRAINER_M1, UP
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setscene SCENE_ROUTE29_NOTHING
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

Route101Tutorial2:
	turnobject ROUTE29_COOLTRAINER_M1, UP
	showemote EMOTE_SHOCK, ROUTE29_COOLTRAINER_M1, 15
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData2a
	turnobject PLAYER, DOWN
	setevent EVENT_DUDE_TALKED_TO_YOU
	opentext
	writetext CatchingTutorialIntroText
	yesorno
	iffalse Script_RefusedTutorial2
	closetext
	follow ROUTE29_COOLTRAINER_M1, PLAYER
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData2b
	stopfollow
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	turnobject ROUTE29_COOLTRAINER_M1, UP
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setscene SCENE_ROUTE29_NOTHING
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

Script_RefusedTutorial1:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	setscene SCENE_ROUTE29_NOTHING
	end

Script_RefusedTutorial2:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	setscene SCENE_ROUTE29_NOTHING
	end

CatchingTutorialDudeScript:
	faceplayer
	opentext
	checkcode VAR_BOXSPACE
	ifequal 0, .BoxFull
	checkevent EVENT_LEARNED_TO_CATCH_POKEMON
	iftrue .BoxFull
	writetext CatchingTutorialRepeatText
	yesorno
	iffalse .Declined
	closetext
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

.BoxFull:
	writetext CatchingTutorialBoxFullText
	waitbutton
	closetext
	end

.Declined:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	end

Route101YoungsterScript:
	jumptextfaceplayer Route101YoungsterText

Route101TeacherScript:
	jumptextfaceplayer Route101TeacherText

Route101FisherScript:
	jumptextfaceplayer Route101FisherText

Route101CooltrainerMScript:
	faceplayer
	opentext
	checktime DAY
	iftrue .day_morn
	checktime NITE
	iftrue .nite
.day_morn
	writetext Route101CooltrainerMText_WaitingForNight
	waitbutton
	closetext
	end

.nite
	writetext Route101CooltrainerMText_WaitingForMorning
	waitbutton
	closetext
	end


Route101Sign1:
	jumptext Route101Sign1Text

Route101Sign2:
	jumptext Route101Sign2Text
	
SilentHillsEntranceSign:
	jumptext SilentHillsEntranceSignText

Route101FruitTree:
	fruittree FRUITTREE_ROUTE_101

Route101Potion:
	itemball POTION
	
Route101Potion2:
	itemball POTION
	
Route101Pokeball:
	itemball POKE_BALL
	
Route101Ether:
	itemball ETHER
	
Route101RareCandy:
	itemball RARE_CANDY

DudeMovementData1a:
	step UP
	step UP
	step_end

DudeMovementData2a:
	step UP
	step_end

DudeMovementData1b:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step DOWN
	step_end

DudeMovementData2b:
	step DOWN
	step LEFT
	step LEFT
	step DOWN
	step_end
	
DebugSignText:
	text "Cartel Debug"
	done

CatchingTutorialBoxFullText:
	text "Los #MON se"
	line "esconden en la"
	para "hierba. Nadie sabe"
	line "cuándo salen…"
	done

CatchingTutorialIntroText:
	text "¡Oye, chico!"

	para "¡Pareces un"
	line "entrenador novato!"
	
	para "¡Seguro que"
	line "quieres atrapar"
	cont "algunos #MON!"

	para "¿Quieres que te"
	line "enseñe cómo"
	cont "atrapar #MON?"
	done

CatchingTutorialDebriefText:
	text "Así es como se"
	line "hace."

	para "Las # BALLS"
	line "sólo deben usarse"
	para "después de"
	line "debilitar al"
	cont "#MON salvaje."
	done

CatchingTutorialDeclinedText:
	text "¡Ah! ¡Muy bien!"

	para "Pero si quieres"
	line "atrapar #MON,"
	para "tendrás que"
	line "caminar mucho."
	done

CatchingTutorialRepeatText:
	text "¿Eh? ¿Quieres que"
	line "te enseñe a"
	cont "atrapar #MON?"
	done

Route101YoungsterText:
	text "Una noche, cuando"
	line "volvía de clase,"
	cont "¡vi un #MON"
	cont "desconocido!"
	done

Route101TeacherText:
	text "¿Ves esa cornisa?"
	line "Da miedo saltarla."

	para "Pero puedes saltar"
	line "por encima de"
	para "ellas para usarlas"
	line "de atajo en muchos"
	cont "sitios."
	done

Route101FisherText:
	text "Quería descansar,"
	line "así que guardé"

	para "mi progreso."
	done

; unused
Text_WaitingForDay:
	text "Estoy esperando"
	line "a #MON que"

	para "sólo aparecen"
	line "por el día."
	done

Route101CooltrainerMText_WaitingForNight:
	text "Estoy esperando"
	line "a #MON que"

	para "sólo aparecen"
	line "por la noche."
	done

Route101CooltrainerMText_WaitingForMorning:
	text "Estoy esperando"
	line "a #MON que"

	para "sólo aparecen"
	line "por el mañana."
	done


Route101Sign1Text:
	text "RUTA 101"

	para "PUEBLO SILENTE -"
	line "CIUDAD PAGOTA"
	done

Route101Sign2Text:
	text "PISTAS ENTRENADOR"

	para "¡No robes #MON"
	line "de la gente!"

	para "¡Utiliza # BALLS"
	line "para capturar"
	cont "#MON salvajes!"
	done

SilentHillsEntranceSignText:
	text "COLINAS SILENTES"
	
	para "Entrada a la"
	line "izquierda"
	
	para "Cuidado con los"
	line "#MON salvajes"
	done
	
TeacherColetteSeenText:
	text "Mi CHIX es el"
	line "más bonito del"
	cont "mundo."
	done

TeacherColetteBeatenText:
	text "¡Mi CHIX!"
	done

TeacherColetteAfterBattleText:
	text "¡Mira qué bonito"
	line "es mi CHIX!"
	done
	
FledglingHugoSeenText:
	text "Mmm…"
	para "¿Eres un nuevo"
	line "entrenador?"
	done

FledglingHugoBeatenText:
	text "Vaya, no lo"
	line "parece…"
	done

FledglingHugoAfterBattleText:
	text "¿Cómo eres"
	line "tan bueno?"
	done
	
SwimmerfHikariSeenText:
	text "¡Ups!"
	para "¡Has encontrado"
	line "mi lugar secreto"
	cont "de nado!"
	done

SwimmerfHikariBeatenText:
	text "Ah…"
	line "…burbuja…"
	done

SwimmerfHikariAfterBattleText:
	text "No se lo digas"
	line "a nadie, ¿vale?"
	done

Route101_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  8, 27, SILENT_HILLS, 1
	warp_event  9, 27, SILENT_HILLS, 2
	warp_event 30, 28, SILENT_HILLS, 3
	warp_event 30, 29, SILENT_HILLS, 4
	warp_event  8,  5, ROUTE_101_PAGOTA_GATE, 3
	warp_event  9,  5, ROUTE_101_PAGOTA_GATE, 4

	db 2 ; coord events
	coord_event 45, 28, SCENE_ROUTE29_CATCH_TUTORIAL, Route101Tutorial1
	coord_event 45, 29, SCENE_ROUTE29_CATCH_TUTORIAL, Route101Tutorial2

	db 3 ; bg events
	bg_event 42, 28, BGEVENT_READ, Route101Sign1
	bg_event 10, 22, BGEVENT_READ, Route101Sign2
	bg_event 34, 27, BGEVENT_READ, SilentHillsEntranceSign

	db 14 ; object events
	object_event 45, 31, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CatchingTutorialDudeScript, -1
	object_event 34, 25, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route101YoungsterScript, -1
	object_event 39, 27, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route101TeacherScript, -1
	object_event 44, 25, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route101FruitTree, -1
	object_event  8, 25, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route101FisherScript, -1
	object_event  4, 28, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route101CooltrainerMScript, -1
	object_event 45, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route101Potion, EVENT_ROUTE_29_POTION
	object_event 13, 23, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route101Potion2, EVENT_ROUTE_29_POTION_2
	object_event  6,  9, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerTeacherColette, -1
	object_event  9, 16, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerFledglingHugo, -1
	object_event 24, 32, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route101Pokeball, EVENT_ROUTE_29_POKEBALL
	object_event 16,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route101Ether, EVENT_ROUTE_29_ETHER
	object_event 32, 15, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfHikari, -1
	object_event 41, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route101RareCandy, EVENT_ROUTE_101_RARE_CANDY
