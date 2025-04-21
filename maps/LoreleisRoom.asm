	const_def 2 ; object constants
	const LORELEISROOM_LORELEI

LoreleisRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .LoreleisRoomDoors

.LockDoor:
	priorityjump .LoreleisDoorLocksBehindYou
	end

.DummyScene:
	end

.LoreleisRoomDoors:
	checkevent EVENT_LORELEIS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_LORELEIS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	return

.LoreleisDoorLocksBehindYou:
	applymovement PLAYER, LoreleisRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_LORELEIS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

LoreleiScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_LORELEI
	iftrue LoreleiScript_AfterBattle
	writetext LoreleiScript_LoreleiBeforeText
	waitbutton
	closetext
	winlosstext LoreleiScript_LoreleiBeatenText, 0
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue LoreleiRematchTeam
	loadtrainer LORELEI, LORELEI1
returntomainLorelei:
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_LORELEI
	opentext
	writetext LoreleiScript_LoreleiDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	reloadmappart
	closetext
	setevent EVENT_LORELEIS_ROOM_EXIT_OPEN
	waitsfx
	end

LoreleiRematchTeam:
	loadtrainer LORELEI, LORELEI2
	jump returntomainLorelei


LoreleiScript_AfterBattle:
	writetext LoreleiScript_LoreleiDefeatText
	waitbutton
	closetext
	end

LoreleisRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

LoreleiScript_LoreleiBeforeText:
	text "Te doy la bien-"
	line "venida a la"
	cont "LIGA de NIHON,"
	cont "<PLAYER>."

	para "Permíteme presen-"
	line "tarme. Me llamo"
	cont "LORELEI."

	para "Mis congelantes"
	line "#MON han"

	para "dejado tiritando"
	line "de miedo a muchos"
	cont "entrenadores."

	para "Los #MON del"
	line "tipo-hielo son"
	cont "tan feroces como"
	cont "preciosos."

	para "¡Tus #MON"
	line "estarán a mi"
	cont "merced cuando los"
	cont "deje congelados!"

	para "Je, je…"
	
	para "¡Comencemos!"
	done

LoreleiScript_LoreleiBeatenText:
	text "Yo… No puedo…"
	line "creérmelo…"
	done

LoreleiScript_LoreleiDefeatText:
	text "Bien hecho."

	para "Pero las cosas"
	line "se complicarán de"
	cont "ahora en adelante."

	para "Adelante."
	
	para "Solo has probado"
	line "un pedacito del"
	cont "ALTO MANDO."	
	done

LoreleisRoom_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5, 17, NIHON_LEAGUE, 4
	warp_event  4,  2, KOGAS_ROOM, 1
	warp_event  5,  2, KOGAS_ROOM, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  7, SPRITE_LORELEI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LoreleiScript_Battle, -1
