	const_def 2 ; object constants
	const OAKS_LAB_ENTRANCE_AIDE
	const OAKS_LAB_ENTRANCE_SILVER
	const OAKS_LAB_ENTRANCE_BLUE
	const OAKS_LAB_ENTRANCE_DAISY

OaksLabEntrance_MapScripts:
	db 6 ; scene scripts
	scene_script .SceneElmDoorLocked ; SCENE_DEFAULT
	scene_script .SceneHeadToTheBack ;
	scene_script .SceneOaksLabEntranceNothing ;does this work?
	scene_script .SceneOaksLabEntranceBattle ;seems to!
	scene_script .SceneOaksLabEntranceDaisy
	scene_script .SceneOakLabFrontRoomAfterTalkingToClerk

	db 0 ; callbacks
	
.SceneElmDoorLocked:
	end
	
.SceneHeadToTheBack:
	follow OAKS_LAB_ENTRANCE_BLUE, PLAYER
	applymovement OAKS_LAB_ENTRANCE_BLUE, Movement_BlueToBack
	stopfollow
	playsound SFX_ENTER_DOOR
	disappear OAKS_LAB_ENTRANCE_BLUE
	applymovement PLAYER, Movement_PlayerThroughDoor
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	warpfacing UP, OAKS_LAB, 3, 7
	end

.SceneOaksLabEntranceNothing:
	end

.SceneOaksLabEntranceBattle:
	end
	
.SceneOaksLabEntranceDaisy:
	end
	
.SceneOakLabFrontRoomAfterTalkingToClerk
	end

BattleScript:
	applymovement PLAYER, Movement_DownOne
	playsound SFX_EXIT_BUILDING
	moveobject OAKS_LAB_ENTRANCE_SILVER, 4, 0
	appear OAKS_LAB_ENTRANCE_SILVER
	applymovement OAKS_LAB_ENTRANCE_SILVER, Movement_SilverDownOne
	special FadeOutMusic
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext TimeToBattle
	waitbutton
	closetext
	checkevent EVENT_GOT_CRUIZE_FROM_OAK
	iftrue .Cruise
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .CHIKORITA
	winlosstext SilverEntranceWinText, SilverEntranceLossText
	loadtrainer RIVAL1, RIVAL1_1_CRUIZE
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	jump .AfterYourDefeat

.Cruise:
	winlosstext SilverEntranceWinText, SilverEntranceLossText
	loadtrainer RIVAL1, RIVAL1_1_CHIKORITA
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	jump .AfterYourDefeat

.CHIKORITA:
	winlosstext SilverEntranceWinText, SilverEntranceLossText
	loadtrainer RIVAL1, RIVAL1_1_FLAMBEAR
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	jump .AfterYourDefeat

.AfterVictorious:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext EntranceRivalText_YouWon
	waitbutton
	closetext
	jump .FinishRival

.AfterYourDefeat:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext EntranceRivalText_YouLost
	waitbutton
	closetext
.FinishRival:
	applymovement OAKS_LAB_ENTRANCE_SILVER, SilverLeavesLab
	disappear OAKS_LAB_ENTRANCE_SILVER
	setscene SCENE_OAK_ENTRANCE_DAISY
	special HealParty
	playmapmusic
	end


DoorLockedScript:
	opentext
	writetext DoorLockedText
	waitbutton
	closetext
	applymovement PLAYER, DoorLocked_Movement
	end
	
DaisyStopsScript1:
	applymovement OAKS_LAB_ENTRANCE_DAISY, DaisyWalksUp1
	opentext
	writetext DaisySpeechText
	buttonsound
	stringtotext .mapcardname, MEM_BUFFER_1
	scall .JumpstdReceiveItem
	setflag ENGINE_MAP_CARD
	writetext DaisySpeechText2
	buttonsound
	verbosegiveitem POTION
	verbosegiveitem POKE_BALL, 5
	writetext DaisySpeechText3
	waitbutton
	closetext
	applymovement OAKS_LAB_ENTRANCE_DAISY, DaisyLeftMovement
	setscene SCENE_OAK_ENTRANCE_NOTHING
	setmapscene ROUTE_101, SCENE_ROUTE29_CATCH_TUTORIAL
	end
	
.JumpstdReceiveItem:
	jumpstd receiveitem
	end

.mapcardname
	db "MAP CARD@"
	
DaisyStopsScript2:
	applymovement OAKS_LAB_ENTRANCE_DAISY, DaisyWalksUp2
	opentext
	writetext DaisySpeechText
	buttonsound
	stringtotext .mapcardname, MEM_BUFFER_1
	scall .JumpstdReceiveItem
	setflag ENGINE_MAP_CARD
	writetext DaisySpeechText2
	buttonsound
	verbosegiveitem POTION
	verbosegiveitem POKE_BALL, 5
	writetext DaisySpeechText3
	waitbutton
	closetext
	applymovement OAKS_LAB_ENTRANCE_DAISY, DaisyLeftMovement
	setscene SCENE_OAK_ENTRANCE_NOTHING
	setmapscene ROUTE_101, SCENE_ROUTE29_CATCH_TUTORIAL
	end
	
.JumpstdReceiveItem:
	jumpstd receiveitem
	end

.mapcardname
	db "MAP CARD@"
	
OaksLabEntranceDaisyScript:
	jumptextfaceplayer Text_RootingText

OaksLabEntranceSilverScript:
	jumptextfaceplayer OaksLabEntranceSilverText

OaksLabEntranceAideScript:
	jumptextfaceplayer OaksLabEntranceAideText
	
OaksLabEntranceComputerScript:
	jumptext OaksLabEntranceComputerText
	
OaksLabEntranceBookshelf:
	jumpstd difficultbookshelf
	
OaksLabEntranceSign:
	jumptext OaksLabEntranceSignText
	
OaksLabEntranceSignText:
	text "¡Registra tu"
	line "progreso con"
	cont "GUARDAR!"
	done
	
OaksLabEntranceComputerText:
	text "Es un informe"
	line "sobre los hábitats"
	cont "de los #MON."
	done
	
Text_RootingText:
	text "¡Estaré"
	line "apoyándote!"
	done
	
DaisySpeechText:
	text "Oh, ¿te vas"
	line "de vije??"
	
	para "AZUL es mi her-"
	line "mano pequeño."
	
	para "Si el abuelo te"
	line "encargó algo,"
	
	para "me gustaría"
	line "ayudarte."

	para "¡Se suponí que"
	line "debía darte esto!"
	done

DaisySpeechText2:
	text "¡La TARJ. MAPA"
	line "te permite ver"
	cont "el mapa desde"
	cont "tu #GEAR!"
	
	para "Y…"
	line "¿Qué más puedo"
	cont "hacer para ayudar?"
	
	para "…"
	
	para "¡Oh, ya sé!"	
	done

DaisySpeechText3:
	text "Una POCIÓN cura"
	line "a tu #MON"
	cont "si está herido,"
	
	para "y las  #BALLS"
	line "te permiten cap-"
	cont "turar #MON"
	cont "salvajes."
	
	para "Si te quedas sin"
	line "#BALLS, puedes"
	cont "compar más en"
	cont "una TIENDA."
	
	para "¡Buena suerte,"
	line "<PLAY_G>!"
	
	para "¡Te estaré"
	line "apoyando!"
	done

SilverEntranceWinText:
	text "¡Vaya! ¡Pensaba"
	line "que mi #MON"
	cont "sería el mejor!"
	done

EntranceRivalText_YouLost:
	text "¡<PLAY_G>!"
	line "¡Estoy preparado"
	cont "para enseñarle al"
	cont "mundo entero lo"
	cont "genial que es"
	cont "mi #MON!"
	para "¡Nos vemos por"
	line "ahí!"
	done

SilverEntranceLossText:
	text "¡Toma ya! ¡Mi"
	line "#MON mola!"
	done

EntranceRivalText_YouWon:
	text "¡<PLAY_G>!"
	line "¡Estoy preparado"
	cont "para enseñarle al"
	cont "mundo entero lo"
	cont "genial que es"
	cont "mi #MON!"
	para "¡Nos vemos por"
	line "ahí!"
	done
	
TimeToBattle:
	text "¡<PLAY_G>!"
	para "¡No te vas a ir"
	line "tan rápido!"
	cont "OAK nos has dado"
	cont "un #MON,"
	cont "¡así que comba-"
	cont "tamos con ellos!"
	para "¡No te lo voy a"
	line "poner fácil!"
	done

OaksLabEntranceAideText:
	text "Si buscas al"
	line "PROF.OAK, suele"
	cont "estar en su"
	cont "oficina ahí"
	cont "atrás."
	done
	
OaksLabEntranceSilverText:
	text "¡Ey, <PLAY_G>!"
	
	para "¡Parece que el"
	line "PROF.OAK no está!"
	
	para "¡A saber cuándo"
	line "esperaba que"
	cont "viniésemos!"
	done
	
DaisyLeftMovement:
	step LEFT
	step LEFT
	turn_head DOWN
	step_end
	
DaisyWalksUp1:
	step RIGHT
	step RIGHT
	step UP
	step_end
	
DaisyWalksUp2:
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end
	
SilverLeavesLab:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
Movement_SilverDownOne:
	step DOWN
	step_end
	
Movement_DownOne:
	step DOWN
	turn_head UP
	step_end

DoorLocked_Movement:
	turn_head DOWN
	step DOWN
	step_end

Movement_BlueToBack:
	step UP
	step UP
	step UP
	step UP
	step UP
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

Movement_PlayerThroughDoor:
	step UP
	step_end

DoorLockedScriptWeekends:
	checkcode VAR_WEEKDAY
	ifequal SATURDAY, .DoorIsLockedWeekend
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, .DoorIsLockedWeekend
	end

.DoorIsLockedWeekend
	opentext
	writetext DoorLockedText
	waitbutton
	closetext
	applymovement PLAYER, DoorLocked_Movement
	end

DoorLockedText:
	text "Parece que la"
	line "puerta está"
	cont "cerrada…"
	done

OaksLabEntrance_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3, 15, SILENT_TOWN, 1
	warp_event  4, 15, SILENT_TOWN, 5
	warp_event  4,  0, OAKS_LAB, 1


	db 5 ; coord events
	coord_event  4,  1, SCENE_DEFAULT, DoorLockedScript
	coord_event  4,  1, SCENE_OAK_ENTRANCE_BATTLE, BattleScript
	coord_event  3, 11, SCENE_OAK_ENTRANCE_DAISY, DaisyStopsScript1
	coord_event  4, 11, SCENE_OAK_ENTRANCE_DAISY, DaisyStopsScript2
	coord_event  4,  1, SCENE_OAK_LAB_FRONT_ROOM_AFTER_TALKING_TO_CLERK, DoorLockedScriptWeekends

	db 14 ; bg events
	bg_event  6,  1, BGEVENT_READ, OaksLabEntranceComputerScript
	bg_event  0,  7, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  1,  7, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  2,  7, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  5,  7, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  6,  7, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  7,  7, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  0, 11, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  1, 11, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  2, 11, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  5, 11, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  6, 11, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  7, 11, BGEVENT_READ, OaksLabEntranceBookshelf
	bg_event  2,  0, BGEVENT_READ, OaksLabEntranceSign


	db 4 ; object events
	object_event  6, 13, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksLabEntranceAideScript, -1
	object_event  3,  4, SPRITE_SILVER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OaksLabEntranceSilverScript, EVENT_RIVAL_OAKS_LAB_ENTRANCE
	object_event  4, 14, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BLUE_OAKS_LAB_ENTRANCE
	object_event  1, 13, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksLabEntranceDaisyScript, EVENT_DAISY_OAKS_LAB_ENTRANCE

	
