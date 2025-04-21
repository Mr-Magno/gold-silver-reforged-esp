	const_def 2 ; object constants
	const BATTLETOWER1F_RECEPTIONIST
	const BATTLETOWER1F_YOUNGSTER
	const BATTLETOWER1F_COOLTRAINER_F
	const BATTLETOWER1F_BUG_CATCHER
	const BATTLETOWER1F_GRANNY

BattleTower1F_MapScripts:
	db 2 ; scene scripts
	scene_script .Scene0 ; SCENE_DEFAULT
	scene_script .Scene1 ; SCENE_FINISHED

	db 0 ; callbacks

.Scene0:
	writebyte BATTLETOWERACTION_CHECKSAVEFILEISYOURS
	special BattleTowerAction
	iffalse .SkipEverything
	writebyte BATTLETOWERACTION_GET_CHALLENGE_STATE ; copybytetovar sBattleTowerChallengeState
	special BattleTowerAction
	ifequal $0, .SkipEverything
	ifequal $2, .priorityjump1
	ifequal $3, .SkipEverything
	ifequal $4, .SkipEverything
	opentext
	writetext Text_WeveBeenWaitingForYou
	waitbutton
	closetext
	priorityjump Script_ResumeBattleTowerChallenge
	end

.priorityjump1
	priorityjump BattleTower_LeftWithoutSaving
	writebyte BATTLETOWERACTION_CHALLENGECANCELED
	special BattleTowerAction
	writebyte BATTLETOWERACTION_06
	special BattleTowerAction
.SkipEverything:
	setscene SCENE_FINISHED
.Scene1:
	end

BattleTower1FRulesSign:
	opentext
	writetext Text_ReadBattleTowerRules
	yesorno
	iffalse .skip
	writetext Text_BattleTowerRules
	waitbutton
.skip:
	closetext
	end

BattleTower1FReceptionistScript:
	writebyte BATTLETOWERACTION_GET_CHALLENGE_STATE ; copybytetovar sBattleTowerChallengeState
	special BattleTowerAction
	ifequal $3, Script_BeatenAllTrainers2 ; maps/BattleTowerBattleRoom.asm
	opentext
	writetext Text_BattleTowerWelcomesYou
	buttonsound
	writebyte BATTLETOWERACTION_CHECK_EXPLANATION_READ ; if new save file: bit 1, [sBattleTowerSaveFileFlags]
	special BattleTowerAction
	ifnotequal $0, Script_Menu_ChallengeExplanationCancel
	jump Script_BattleTowerIntroductionYesNo

Script_Menu_ChallengeExplanationCancel:
	writetext Text_WantToGoIntoABattleRoom
	writebyte TRUE
	special Menu_ChallengeExplanationCancel
	ifequal 1, Script_ChooseChallenge
	ifequal 2, Script_BattleTowerExplanation
	jump Script_BattleTowerHopeToServeYouAgain

Script_ChooseChallenge:
	writebyte BATTLETOWERACTION_RESETDATA ; ResetBattleTowerTrainerSRAM
	special BattleTowerAction
	special CheckForBattleTowerRules
	ifnotequal FALSE, Script_WaitButton
	writetext Text_SaveBeforeEnteringBattleRoom
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_DEFAULT
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_FINISHED
	writebyte BATTLETOWERACTION_SET_EXPLANATION_READ ; set 1, [sBattleTowerSaveFileFlags]
	special BattleTowerAction
	special BattleTowerRoomMenu
	ifequal $a, Script_Menu_ChallengeExplanationCancel
	ifnotequal $0, Script_MobileError
	writebyte BATTLETOWERACTION_11
	special BattleTowerAction
	writetext Text_RightThisWayToYourBattleRoom
	waitbutton
	closetext
	writebyte BATTLETOWERACTION_CHOOSEREWARD
	special BattleTowerAction
	jump Script_WalkToBattleTowerElevator

Script_ResumeBattleTowerChallenge:
	closetext
	writebyte BATTLETOWERACTION_LOADLEVELGROUP ; load choice of level group
	special BattleTowerAction
Script_WalkToBattleTowerElevator:
	musicfadeout MUSIC_NONE, 8
	setmapscene BATTLE_TOWER_BATTLE_ROOM, SCENE_DEFAULT
	setmapscene BATTLE_TOWER_ELEVATOR, SCENE_DEFAULT
	setmapscene BATTLE_TOWER_HALLWAY, SCENE_DEFAULT
	follow BATTLETOWER1F_RECEPTIONIST, PLAYER
	applymovement BATTLETOWER1F_RECEPTIONIST, MovementData_BattleTower1FWalkToElevator
	writebyte BATTLETOWERACTION_0A
	special BattleTowerAction
	warpsound
	disappear BATTLETOWER1F_RECEPTIONIST
	stopfollow
	applymovement PLAYER, MovementData_BattleTowerHallwayPlayerEntersBattleRoom
	warpcheck
	end

Script_GivePlayerHisPrize:
	writebyte BATTLETOWERACTION_1C
	special BattleTowerAction
	writebyte BATTLETOWERACTION_GIVEREWARD
	special BattleTowerAction
	ifequal POTION, Script_YourPackIsStuffedFull
	itemtotext USE_SCRIPT_VAR, MEM_BUFFER_1
	giveitem ITEM_FROM_MEM, 5
	writetext Text_PlayerGotFive
	writebyte BATTLETOWERACTION_1D
	special BattleTowerAction
	closetext
	end

Script_YourPackIsStuffedFull:
	writetext Text_YourPackIsStuffedFull
	waitbutton
	closetext
	end

Script_BattleTowerIntroductionYesNo:
	writetext Text_WouldYouLikeToHearAboutTheBattleTower
	yesorno
	iffalse Script_BattleTowerSkipExplanation
Script_BattleTowerExplanation:
	writetext Text_BattleTowerIntroduction_2
Script_BattleTowerSkipExplanation:
	writebyte BATTLETOWERACTION_SET_EXPLANATION_READ
	special BattleTowerAction
	jump Script_Menu_ChallengeExplanationCancel

Script_BattleTowerHopeToServeYouAgain:
	writetext Text_WeHopeToServeYouAgain
	waitbutton
	closetext
	end

UnreferencedScript_0x9e4b6:
	special BattleTowerMobileError
	closetext
	end

Script_WaitButton:
	waitbutton
	closetext
	end

UnreferencedScript_0x9e4be:
	writetext Text_SaveBeforeEnteringBattleRoom
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	writebyte BATTLETOWERACTION_SET_EXPLANATION_READ
	special BattleTowerAction
	special Function1700ba
	ifequal $a, Script_Menu_ChallengeExplanationCancel
	ifnotequal $0, Script_MobileError
	writetext Text_ReceivedAListOfLeadersOnTheHonorRoll
	turnobject BATTLETOWER1F_RECEPTIONIST, LEFT
	writetext Text_PleaseConfirmOnThisMonitor
	waitbutton
	turnobject BATTLETOWER1F_RECEPTIONIST, DOWN
	closetext
	end

UnreferencedScript_0x9e4ea:
	writebyte BATTLETOWERACTION_LEVEL_CHECK
	special BattleTowerAction
	ifnotequal $0, Script_AMonLevelExceeds
	writebyte BATTLETOWERACTION_UBERS_CHECK
	special BattleTowerAction
	ifnotequal $0, Script_MayNotEnterABattleRoomUnderL70
	special CheckForBattleTowerRules
	ifnotequal FALSE, Script_WaitButton
	writebyte BATTLETOWERACTION_05
	special BattleTowerAction
	ifequal $0, .zero
	writetext Text_CantBeRegistered_PreviousRecordDeleted
	jump continue

.zero
	writetext Text_CantBeRegistered
continue:
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	writetext Text_SaveBeforeReentry
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_DEFAULT
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_FINISHED
	writebyte BATTLETOWERACTION_06
	special BattleTowerAction
	writebyte BATTLETOWERACTION_12
	special BattleTowerAction
	writetext Text_RightThisWayToYourBattleRoom
	waitbutton
	jump Script_ResumeBattleTowerChallenge

UnreferencedScript_0x9e53b:
	writetext Text_FiveDayBattleLimit_Mobile
	waitbutton
	jump Script_BattleTowerHopeToServeYouAgain

Script_AMonLevelExceeds:
	writetext Text_AMonLevelExceeds
	waitbutton
	jump Script_Menu_ChallengeExplanationCancel

Script_MayNotEnterABattleRoomUnderL70:
	writetext Text_MayNotEnterABattleRoomUnderL70
	waitbutton
	jump Script_Menu_ChallengeExplanationCancel

Script_MobileError:
	special BattleTowerMobileError
	closetext
	end

BattleTower_LeftWithoutSaving:
	opentext
	writetext Text_BattleTower_LeftWithoutSaving
	waitbutton
	jump Script_BattleTowerHopeToServeYouAgain

BattleTower1FYoungsterScript:
	faceplayer
	opentext
	writetext Text_BattleTowerYoungster
	waitbutton
	closetext
	turnobject BATTLETOWER1F_YOUNGSTER, RIGHT
	end

BattleTower1FCooltrainerFScript:
	jumptextfaceplayer Text_BattleTowerCooltrainerF

BattleTower1FBugCatcherScript:
	jumptextfaceplayer Text_BattleTowerBugCatcher

BattleTower1FGrannyScript:
	jumptextfaceplayer Text_BattleTowerGranny

MovementData_BattleTower1FWalkToElevator:
	step UP
	step UP
	step UP
	step UP
	step UP
MovementData_BattleTowerHallwayPlayerEntersBattleRoom:
	step UP
	step_end

MovementData_BattleTowerElevatorExitElevator:
	step DOWN
	step_end

MovementData_BattleTowerHallwayWalkTo1020Room:
	step RIGHT
	step RIGHT
MovementData_BattleTowerHallwayWalkTo3040Room:
	step RIGHT
	step RIGHT
	step UP
	step RIGHT
	turn_head LEFT
	step_end

MovementData_BattleTowerHallwayWalkTo90100Room:
	step LEFT
	step LEFT
MovementData_BattleTowerHallwayWalkTo7080Room:
	step LEFT
	step LEFT
MovementData_BattleTowerHallwayWalkTo5060Room:
	step LEFT
	step LEFT
	step UP
	step LEFT
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomPlayerWalksIn:
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomOpponentWalksIn:
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	turn_head LEFT
	step_end

MovementData_BattleTowerBattleRoomOpponentWalksOut:
	turn_head UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

MovementData_BattleTowerBattleRoomReceptionistWalksToPlayer:
	slow_step RIGHT
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_end

MovementData_BattleTowerBattleRoomReceptionistWalksAway:
	slow_step DOWN
	slow_step DOWN
	slow_step LEFT
	slow_step LEFT
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomPlayerTurnsToFaceReceptionist:
	turn_head DOWN
	step_end

MovementData_BattleTowerBattleRoomPlayerTurnsToFaceNextOpponent:
	turn_head RIGHT
	step_end

Text_BattleTowerWelcomesYou:
	text "¡La TORRE BATALLA"
	line "te da la"
	cont "bienvenida!"

	para "Puedo mostrarte"
	line "una SALA BATALLA."
	done

Text_WantToGoIntoABattleRoom:
	text "¿Quieres ntrar a"
	line "una SALA BATALLA?"
	done

Text_RightThisWayToYourBattleRoom:
	text "Por aquí está"
	line "tu SALA BATALLA."
	done

Text_BattleTowerIntroduction_1:
	text "La TORRE BATALLA"
	line "es una instalación"
	cont "para llevar a cabo"
	cont "combates #MON."

	para "Innumerables en-"
	line "trenadores se"

	para "reúnes de todas"
	line "partes para librar"

	para "combates en salas"
	line "especialmente"
	cont "diseñadas."

	para "Hay muchas SALAs"
	line "BATALLA en la"
	cont "TORRE BATALLA."

	para "Cada SALA tiene"
	line "capacidad para"
	cont "7 entrenadores."

	para "Si derrotas a los"
	line "7 de una SALA y"

	para "tienes un buen"
	line "historial, podrías"

	para "convertirte en el"
	line "LÍDER de la SALA."

	para "Se registrarán a"
	line "todos los LÍDERES"

	para "en la LISTA de"
	line "HONOR para la"
	cont "posteridad."

	para "Puedes participar"
	line "en hasta 5 SALAs"

	para "BATALLA cada"
	line "día."

	para "No obstante, solo"
	line "puedes combatir"

	para "una vez al día"
	line "en cada SALA."

	para "Para interrumpir"
	line "una sesión, debes"

	para "GUARDAR. Sino,"
	line "no podrás reanudar"

	para "tu desafía de"
	line "la SALA."

	para ""
	done

Text_BattleTowerIntroduction_2:
	text "La TORRE BATALLA"
	line "es una instalación"
	cont "para llevar a cabo"
	cont "combates #MON."

	para "Innumerables en-"
	line "trenadores se"

	para "reúnes de todas"
	line "partes para librar"

	para "combates en salas"
	line "especialmente"
	cont "diseñadas."

	para "Hay muchas SALAs"
	line "BATALLA en la"
	cont "TORRE BATALLA."

	para "Cada SALA tiene"
	line "capacidad para"
	cont "7 entrenadores."

	para "Derrótalos a todos"
	line "y gana un premio."

	para "Para interrumpir"
	line "una sesión, debes"

	para "GUARDAR. Sino,"
	line "no podrás reanudar"

	para "tu desafía de"
	line "la SALA."

	para ""
	done

Text_ReceivedAListOfLeadersOnTheHonorRoll:
	text "Has recibido una"
	line "lista de los"
	cont "LÍDERES de la"
	cont "LISTA del HONOR."

	para ""
	done

Text_PleaseConfirmOnThisMonitor:
	text "Por favor, acepta"
	line "en este monitor."
	done

Text_ThankYou:
	text "¡Gracias!"

	para ""
	done

Text_ThanksForVisiting:
	text "¡Gracias por"
	line "visitarnos!"
	done

Text_BeatenAllTheTrainers_Mobile:
	text "¡Felicidades!"

	para "¡Has derrotado a"
	line "todos los"
	cont "entrenadores!"

	para "Merece la pena"
	line "registrar tu"
	cont "hazaña,"

	para "<PLAYER>. Con tus"
	line "resultados, puede"

	para "que seas elegido"
	line "como el LÍDER"
	cont "de la SALA."

	para ""
	done

Text_CongratulationsYouveBeatenAllTheTrainers:
	text "¡Felicidades!"

	para "¡Has derrotado a"
	line "todos los"
	cont "entrenadores!"

	para "Por ello, ¡has"
	line "conseguido este"
	cont "increíble premio!"

	para ""
	done

Text_AskRegisterRecord_Mobile:
	text "¿Quieres dejar"
	line "registrado tu"

	para "historial en el"
	line "CENTRO?"
	done

Text_PlayerGotFive:
	text "¡<PLAYER> obtuvo"
	line "@"
	text_ram wStringBuffer4
	text "!@"
	sound_item
	text_waitbutton
	text_end

Text_YourPackIsStuffedFull:
	text "Ups, tu MOCHILA"
	line "está llena."

	para "Por favor, haz"
	line "sitio y vuelve."
	done

Text_YourRegistrationIsComplete:
	text "Tu registro"
	line "está completo."

	para "¡Vuelve pronto!"
	done

Text_WeHopeToServeYouAgain:
	text "Esperamos poder"
	line "servirte de"
	cont "nuevo."
	done

Text_PleaseStepThisWay:
	text "Por favor, pasa"
	line "por aquí."
	done

Text_WouldYouLikeToHearAboutTheBattleTower:
	text "¿Te gustaría"
	line "ssaber obre la"
	cont "TORRE BATALLA?"
	done

Text_CantBeRegistered:
	text "No se puede"
	line "registrar tu"

	para "historial de la"
	line "SALA BATALLA."
	cont "¿De acuerdo?"
	done

Text_CantBeRegistered_PreviousRecordDeleted:
	text "No se puede"
	line "registrar tu"

	para "historial de la"
	line "SALA BATALLA."

	para "También se"
	line "eliminará el"
	cont "historial"
	cont "existente, ¿de"
	cont "acuerdo?"
	done

Text_CheckTheLeaderHonorRoll:
	text "¿Comprobar la"
	line "LISTA de HONOR?"
	done

Text_ReadBattleTowerRules:
	text "Las normas de la"
	line "TORRE BATALLA"
	cont "están escritas"
	cont "aquí."

	para "¿Quieres leerlas?"
	done

Text_BattleTowerRules:
	text "Tres #MON"
	line "por combate."

	para "Los tres deben"
	line "ser diferentes."

	para "Los OBJ. que"
	line "lleven equipados"
	cont "también deben"
	cont "ser diferentes."

	para "A ciertos"
	line "#MON se les"
	cont "pueden aplicar"
	cont "restricciones de"
	cont "nivel."
	done

Text_BattleTower_LeftWithoutSaving:
	text "¡Disculpa! No"
	line "has GUARDADO"

	para "antes de salir de"
	line "la SALA BATALLA."

	para "Lo siento mucho,"
	line "pero tu desafía"

	para "será declarado"
	line "inválido."
	done

Text_YourMonWillBeHealedToFullHealth:
	text "Tus #MON será"
	line "curados por"
	cont "completo."
	done

Text_NextUpOpponentNo:
	text "A continuación,"
	line "oponente"
	cont "núm.@"
	text_ram wStringBuffer3
	text ". ¿Preparado?"
	done

Text_SaveBeforeConnecting_Mobile:
	text "Se GUARDARÁ tu"
	line "sesión antes de"

	para "conectarte con"
	line "el CENTRO."
	done

Text_SaveBeforeEnteringBattleRoom:
	text "Antes de entrar"
	line "a la SALA BATALLA,"

	para "se GUARDARÁ tu"
	line "progreso."
	done

Text_SaveAndEndTheSession:
	text "¿GUARDAR y acabar"
	line "la sesión?"
	done

Text_SaveBeforeReentry:
	text "Se GUARDARÁ tu"
	line "antes de volver a"
	cont "la SALA anterior."
	done

Text_CancelYourBattleRoomChallenge:
	text "¿Salir del"
	line "desafía de la"
	cont "SALA BATALLA?"
	done

Text_RegisterRecordOnFile_Mobile:
	text "Tenemos tu"
	line "historial anterior"

	para "archivado."
	line "¿Quieres"
	cont "registrarlo en"
	cont "el CENTRO?"
	done

Text_WeveBeenWaitingForYou:
	text "Te estábamos"
	line "esperando. Por"

	para "aquí a la SALA"
	line "BATALLA."
	done

Text_FiveDayBattleLimit_Mobile:
	text "Solo puedes"
	line "entrar a 5 SALAs"
	cont "BATALLA por día."

	para "Por favor,"
	line "vuelve mañana."
	done

Text_TooMuchTimeElapsedNoRegister:
	text "Lo siento, pero"
	line "no es posible"

	para "registrar tu"
	line "historial actual"

	para "en el CENTRO"
	line "debido a que ha"

	para "transcurrido mucho"
	line "tiempo del inicio"
	cont "de tu desafío."
	done

; a dupe?
Text_RegisterRecordTimedOut_Mobile:
	text "Lo siento, pero"
	line "no es posible"

	para "registrar tu"
	line "historial actual"

	para "en el CENTRO"
	line "debido a que ha"

	para "transcurrido mucho"
	line "tiempo del inicio"
	cont "de tu desafío."
	done

Text_AMonLevelExceeds:
	text "El nivel de uno"
	line "o más #MON"
	cont "sobrepasa @"
	text_decimal wScriptVar, 1, 3
	text "."
	done

Text_MayNotEnterABattleRoomUnderL70:
	text_ram wcd49
	text " no puede"
	line "entrar a la SALA"
	cont "BATALLA inferior"
	cont "al nivel 70."

	para "Esta SALA BATALLA"
	line "es para Nv@"
	text_decimal wScriptVar, 1, 3
	text "."
	done

Text_BattleTowerYoungster:
	text "Destruido por el"
	line "primer oponente"

	para "en un abrir y"
	line "cerrar de ojos…"
	cont "No sirvo para"
	cont "nada…"
	done

Text_BattleTowerCooltrainerF:
	text "Hay muchas SALAs"
	line "BATALLA, ¡pero"

	para "voy a ganar"
	line "en todas!"
	done

Text_BattleTowerGranny:
	text "Es una tarea"
	line "agotadora no"

	para "poder usar OBJ."
	line "en combate."

	para "Hacer que tus"
	line "#MON lleven"

	para "OBJ. es la clave"
	line "para ganar."
	done

Text_BattleTowerBugCatcher:
	text "Intento ver cómo"
	line "de lejos puedo"

	para "llegar usando"
	line "#MON bicho."

	para "Que no haya"
	line "#MON de fuego…"
	done

BattleTower1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  7,  9, BATTLE_TOWER_OUTSIDE, 1
	warp_event  8,  9, BATTLE_TOWER_OUTSIDE, 2
	warp_event  7,  0, BATTLE_TOWER_ELEVATOR, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  7, BGEVENT_READ, BattleTower1FRulesSign

	db 5 ; object events
	object_event  7,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower1FReceptionistScript, -1
	object_event 10,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BattleTower1FYoungsterScript, -1
	object_event  3,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTower1FCooltrainerFScript, -1
	object_event  1,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BattleTower1FBugCatcherScript, -1
	object_event 14,  3, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower1FGrannyScript, -1
