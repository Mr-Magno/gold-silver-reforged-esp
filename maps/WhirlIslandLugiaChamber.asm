	const_def 2 ; object constants
	const WhirlIslandLugiaCHAMBER_LUGIA

WhirlIslandLugiaChamber_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Lugia:
	faceplayer
	opentext
	writetext LugiaText
	cry LUGIA
	pause 15
	closetext
IF DEF(_GOLD)
	setevent EVENT_FOUGHT_LUGIA
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon LUGIA, 70
	startbattle
	disappear WhirlIslandLugiaCHAMBER_LUGIA
	reloadmapafterbattle
	end
	
ELIF DEF(_SILVER)
	setevent EVENT_FOUGHT_LUGIA
	clearevent EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	setmapscene PAGOTA_CITY, SCENE_DEFAULT
	setevent EVENT_WHIRL_ISLANDS_SAGE_GONE
	clearevent EVENT_FOUGHT_ENTEI
	clearevent EVENT_FOUGHT_SUICUNE
	clearevent EVENT_FOUGHT_RAIKOU
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon LUGIA, 45
	startbattle
	disappear WhirlIslandLugiaCHAMBER_LUGIA
	setevent EVENT_RELEASED_THE_BEASTS
	reloadmapafterbattle
	end
ENDC

LugiaText:
	text "¡Giaaa!"
	done

WhirlIslandLugiaChamber_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  8, 13, WHIRL_ISLAND_B3F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 10,  5, SPRITE_LUGIA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Lugia, EVENT_FOUGHT_LUGIA
