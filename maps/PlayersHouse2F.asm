	const_def 2 ; object constants
	const PLAYERSHOUSE2F_CONSOLE
	const PLAYERSHOUSE2F_DOLL_1
	const PLAYERSHOUSE2F_DOLL_2
	const PLAYERSHOUSE2F_BIG_DOLL
	const PLAYERSHOUSE_CLEFDOLL
	const PLAYERSHOUSE2F_KEN

PlayersHouse2F_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .InitializeRoom
	callback MAPCALLBACK_TILES, .SetSpawn

; unused
.Null:
	end

.InitializeRoom:
	special ToggleDecorationsVisibility
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	checkevent EVENT_INITIALIZED_EVENTS
	iftrue .SkipInitialization
	jumpstd initializeevents
	return

.SkipInitialization:
	return

.SetSpawn:
	special ToggleMaptileDecorations
	return

	db 0, 0, 0 ; filler

MeetKenScript:
	turnobject PLAYER, LEFT
	turnobject PLAYERSHOUSE2F_KEN, RIGHT
PlayersHouse2F_Ken:
	faceplayer
	opentext
	writetext KenGreeting1
	waitbutton
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .KenPart2
	setevent EVENT_TALKED_TO_KEN_AT_BEGINNING
	checkevent EVENT_READ_OAKS_EMAIL
	iffalse .KenEmailScript
	waitbutton
	closetext
	setscene SCENE_PLAYERS_HOUSE_2F_NOTHING
	end
	
.KenEmailScript
	
	closetext
	checkcode VAR_FACING
	ifequal UP, .DontNeedToWalk
	applymovement PLAYER, PlayerToReadEmailMovement
	turnobject PLAYERSHOUSE2F_KEN, DOWN
	end

.DontNeedToWalk
	end
	
.KenPart2
	checkevent EVENT_GOT_TM31_MUD_SLAP
	iftrue .KenPart3
	writetext KenGreeting2
	waitbutton
	closetext
	end
	
.KenPart3
	writetext KenGreeting3
	waitbutton
	closetext
	end

KenGreeting1:
	text "KEN: ¡<PLAYER>!"
	para "Creo que tienes"
	line "un correo nuevo"
	cont "en tu PC."
	para "¡Deberías leerlo"
	line "antes de irte!"
	done
	
KenGreeting2:
	text "KEN: ¡<PLAYER>!"
	para "¿El PROF. OAK te"
	line "pidió que lo"
	cont "ayudases a"
	cont "completar una"
	cont "nueva #DEX?"
	para "¡Uau! ¡Buena"
	line "suerte con ello!"
	done
	
KenGreeting3:
	text "¡Me han llamado"
	line "para una"
	para "entrevista de"
	line "trabajo como DJ de"
	para "radio en CIUDAD"
	line "PONIENTE!"

	para "¡Podrías escuchar"
	line "a tu hermano en"
	cont "la radio!"

	para "¡Deséame suerte!"

	para "¡La misma que yo"
	line "te deseo a ti!"
	done


Doll1Script:
	describedecoration DECODESC_LEFT_DOLL

Doll2Script:
	describedecoration DECODESC_RIGHT_DOLL

BigDollScript:
	describedecoration DECODESC_BIG_DOLL

GameConsoleScript:
	describedecoration DECODESC_CONSOLE

PlayersHousePosterScript:
	conditional_event EVENT_PLAYERS_ROOM_POSTER, .Script

.Script:
	describedecoration DECODESC_POSTER

PlayersHouseRadioScript:
	jumpstd radio1

PlayersHouseBookshelfScript:
	jumpstd picturebookshelf

PlayersHousePCScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .PlayersHousePC2
	opentext
	writetext PlayersRadioText2
	waitbutton
	closetext
	setevent EVENT_READ_OAKS_EMAIL
	checkevent EVENT_TALKED_TO_KEN_AT_BEGINNING
	iffalse .DontSetKenScene
	setscene SCENE_PLAYERS_HOUSE_2F_NOTHING
	end
	
.DontSetKenScene
	end
	
.Warp:
	warp NONE, 0, 0
	end

.PlayersHousePC2
	opentext
	special PlayersHousePC
	iftrue .Warp
	closetext
	end
	
PlayersDollScript:
	opentext
	writetext PlayersDollText
	waitbutton
	closetext
	end
	
PlayerToReadEmailMovement:
	step DOWN
	step_end

PlayersDollText:
	text "Es un muñeco que"
	line "un familiar de"
	cont "KANTO te regaló"
	cont "en Navidad."
	done

PlayersRadioText2:
	text "<PLAYER> encendió"
	line "el PC."
	
	para "¡Parece que hay"
	line "un nuevo correo!"
	
	para "…"
	
	para "Espero que me"
	line "disculpes por"
	para "enviarte un correo"
	line "tan de repente,"
	para "pero hay algo que"
	line "me gustaría"
	cont "entregarte."
	
	para "¿Te importaría"
	line "venir a recogerlo?"
	
	para "OAK, investigador"
	line "#MON"	
	done

PlayersHouse2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9,  0, PLAYERS_HOUSE_1F, 3

	db 1 ; coord events
	coord_event  9,  1, SCENE_DEFAULT, MeetKenScript

	db 5 ; bg events
	bg_event  3,  1, BGEVENT_UP, PlayersHousePCScript
	bg_event  2,  1, BGEVENT_READ, PlayersHouseRadioScript
	bg_event  5,  1, BGEVENT_READ, PlayersHouseBookshelfScript
	bg_event  1,  1, BGEVENT_READ, PlayersHouseBookshelfScript
	bg_event  8,  0, BGEVENT_IFSET, PlayersHousePosterScript

	db 6 ; object events
	object_event  7,  2, SPRITE_CONSOLE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GameConsoleScript, EVENT_PLAYERS_HOUSE_2F_CONSOLE
	object_event  4,  6, SPRITE_DOLL_1, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Doll1Script, EVENT_PLAYERS_HOUSE_2F_DOLL_1
	object_event  5,  6, SPRITE_DOLL_2, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Doll2Script, EVENT_PLAYERS_HOUSE_2F_DOLL_2
	object_event  0,  6, SPRITE_BIG_DOLL, SPRITEMOVEDATA_BIGDOLL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BigDollScript, EVENT_PLAYERS_HOUSE_2F_BIG_DOLL
	object_event  6,  1, SPRITE_CLEFAIRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersDollScript, -1
	object_event  8,  1, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PlayersHouse2F_Ken, EVENT_ROUTE_102_SILVER
