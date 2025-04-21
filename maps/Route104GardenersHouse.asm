	const_def 2 ; object constants
	const ROUTE30BERRYHOUSE_POKEFAN_M

Route104GardenersHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route104GardenersHousePokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BERRY_FROM_ROUTE_30_HOUSE
	iftrue .GotBerry
	writetext Route30BerrySpeechHouseMonEatBerriesText
	buttonsound
	verbosegiveitem PSNCUREBERRY
	iffalse .NoRoom
	setevent EVENT_GOT_BERRY_FROM_ROUTE_30_HOUSE
.GotBerry:
	writetext Route30BerrySpeechHouseCheckTreesText
	waitbutton
.NoRoom:
	closetext
	end

Route104GardenersHouseBookshelf:
	jumpstd magazinebookshelf

Route30BerrySpeechHouseMonEatBerriesText:
	text "Me gusta mucho"
	line "cuidar mi jardín."

	para "Toda esta zona es"
	line "muy seca."

	para "Me he esforzado"
	line "mucho para que"
	cont "crezcan estas"
	cont "flores."

	para "Hace poco, incluso"
	line "conseguí que"
	para "creciese un árbol"
	line "frutal."

	para "¡Toma! ¡Deja que"
	line "comparta sus"
	cont "frutos contigo!"
	done

Route30BerrySpeechHouseCheckTreesText:
	text "Un día a lo mejor"
	line "consigo que"
	cont "crezcan dos"
	cont "árboles."
	done

Route104GardenersHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ROUTE_104, 1
	warp_event  5,  7, ROUTE_104, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  0, BGEVENT_READ, Route104GardenersHouseBookshelf
	bg_event  1,  0, BGEVENT_READ, Route104GardenersHouseBookshelf

	db 1 ; object events
	object_event  4,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route104GardenersHousePokefanMScript, EVENT_GEOFFREY_GONE_TO_DAITO
