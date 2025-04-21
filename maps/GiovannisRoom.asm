	const_def 2 ; object constants
	const GIOVANNISROOM_GIOVANNI

GiovannisRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .GiovannisRoomDoors

.LockDoor:
	priorityjump .GiovannisDoorLocksBehindYou
	end

.DummyScene:
	end

.GiovannisRoomDoors:
	checkevent EVENT_GIOVANNIS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_GIOVANNIS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	return

.GiovannisDoorLocksBehindYou:
	applymovement PLAYER, GiovannisRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_GIOVANNIS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

GiovanniScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_GIOVANNI
	iftrue GiovanniScript_AfterBattle
	writetext GiovanniScript_GiovanniBeforeText
	waitbutton
	closetext
	winlosstext GiovanniScript_GiovanniBeatenText, 0
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue GiovanniRematchTeam
	loadtrainer GIOVANNI_E4, GIOVANNI_E41
returntomainGiovanni:
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_GIOVANNI
	opentext
	writetext GiovanniScript_GiovanniDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	reloadmappart
	closetext
	setevent EVENT_GIOVANNIS_ROOM_EXIT_OPEN
	waitsfx
	end

GiovanniScript_AfterBattle:
	writetext GiovanniScript_GiovanniDefeatText
	waitbutton
	closetext
	end

GiovanniRematchTeam:
	loadtrainer GIOVANNI_E4, GIOVANNI_E42
	jump returntomainGiovanni

GiovannisRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

GiovanniScript_GiovanniBeforeText:
	text "¡Jajajaja!"

	para "¡Tus ojos no"
	line "te engañan!"

	para "¡Soy yo, GIOVANNI!"

	para "Aunque conozcas mi"
	line "verdadera identi-"
	cont "dad, ¡también"
	cont "formo parte"
	cont "del ALTO MANDO!"
	
	para "¡Mi ambición de"
	line "restaurar mi"
	cont "organización no"
	cont "ha cambiado, pero"
	cont "hasta entonces"
	cont "haré lo que tenga"
	cont "que hacer para"
	cont "lograrlo!"
	
	para "Bien,"
	line "<PLAY_G>,"
	cont "espero que estés"
	cont "preparado,"
	cont "¡porque tu viaje"
	cont "termina aquí!"
	done

GiovanniScript_GiovanniBeatenText:
	text "¡Argh!"

	para "¡Parece que"
	line "te has vuelto"
	cont "mucho más fuerte!"
	done

GiovanniScript_GiovanniDefeatText:
	text "Te detesto."

	para "Pero tienes mi"
	line "respeto."
	
	para "Tal vez en otro"
	line "momento, podríamos"
	cont "haber llegado a"
	cont "ser aliados…"
	
	para "A pesar de todo…"
	
	para "Me has derrotado."

	para "Continúa."
	
	para "El CAMPEÓN te"
	line "está esperando…"
	done

GiovannisRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 17, AGATHAS_ROOM, 3
	warp_event  5, 17, AGATHAS_ROOM, 4
	warp_event  4,  2, LANCES_ROOM, 1
	warp_event  5,  2, LANCES_ROOM, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  7, SPRITE_GIOVANNI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GiovanniScript_Battle, -1
