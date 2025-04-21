	const_def 2 ; object constants
	const BLUEFORESTNIGHTMAREHOUSE_GRANNY
	const BLUEFORESTNIGHTMAREHOUSE_METTO

BlueForestNightmareHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlueForestNightmareHouseGrannyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM50_NIGHTMARE
	iftrue .AlreadyGotNightmare
	writetext Text_NightmareIntro
	buttonsound
	verbosegiveitem TM_NIGHTMARE
	iffalse .BagFull
	setevent EVENT_GOT_TM50_NIGHTMARE
.AlreadyGotNightmare:
	writetext Text_NightmareOutro
	waitbutton
.BagFull:
	closetext
	end	

BlueForestNightmareHouseAnimonScript:
	faceplayer
	opentext
	writetext BlueForestNightmareHouseMonText
	cry METTO
	waitbutton
	closetext
	end
	
BlueForestNightmareHouseMonText:
	text "METTO:"
	line "¡Meeet!"
	done

Text_NightmareIntro:
	text "Anoche tuve una"
	line "terrible pesadilla"
	para "en la que mi"
	line "METTO había"
	cont "desaparecido."

	para "Me sentí"
	line "devastada."

	para "Por suerte, no fue"
	line "real."

	para "Pero hoy encontré"
	line "esto en mi casa."

	para "No lo quiero."
	line "Quédatelo, por"
	cont "favor."
	done
	
Text_NightmareOutro:
	text "La MT50 enseña"
	line "PESADILLA."

	para "Provoca un gran"
	line "daño a los"
	cont "#MON que están"
	cont "dormidos."
	done

BlueForestNightmareHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, BLUE_FOREST, 7
	warp_event  5,  7, BLUE_FOREST, 7

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  8, 3, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlueForestNightmareHouseGrannyScript, -1
	object_event  9, 6, SPRITE_GRIMER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlueForestNightmareHouseAnimonScript, -1
