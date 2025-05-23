	const_def 2 ; object constants
	const JOULE_CAVE_ZAPDOS_ROOM_ZAPDOS

JouleCaveZapdosRoom_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Zapdos

.Zapdos:
	checkevent EVENT_FOUGHT_ZAPDOS
	iftrue .NoAppearZ
	checkitem TRI_WING
	iftrue .AppearZ
	jump .NoAppearZ

.AppearZ:
	appear JOULE_CAVE_ZAPDOS_ROOM_ZAPDOS
	return

.NoAppearZ:
	disappear JOULE_CAVE_ZAPDOS_ROOM_ZAPDOS
	return
	
	
ZapdosScript:
	faceplayer
	opentext
	writetext ZapdosText
	cry ZAPDOS
	pause 15
	closetext
	setevent EVENT_FOUGHT_ZAPDOS
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDKANTO
	loadwildmon ZAPDOS, 40
	startbattle
	disappear JOULE_CAVE_ZAPDOS_ROOM_ZAPDOS
	reloadmapafterbattle
	end
	
ZapdosText:
	text "¡Dooos!"
	done
	

ZapdosHiddenBrightPowder:
	hiddenitem BRIGHTPOWDER, EVENT_JOULE_CAVE_ZAPDOS_ROOM_HIDDEN_BRIGHTPOWDER

JouleCaveZapdosRoom_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9, 11, JOULE_CAVE, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  3,  4, BGEVENT_ITEM, ZapdosHiddenBrightPowder

	db 1 ; object events
	object_event  7,  5, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ZapdosScript, EVENT_HIDE_JOULE_CAVE_ZAPDOS_ROOM_ZAPDOS
