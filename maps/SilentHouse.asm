	const_def 2 ; object constants
	const ELMSHOUSE_ELMS_WIFE
	const ELMSHOUSE_ELMS_SON

SilentHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ElmsWife:
	jumptextfaceplayer ElmsWifeText

ElmsSon:
	jumptextfaceplayer ElmsSonText

SilentHousePC:
	jumptext SilentHousePCText

SilentHouseBookshelf:
	jumpstd difficultbookshelf

ElmsWifeText:
	text "¡Hola, <PLAY_G>!"
	line "Mi hijo tiene"
	cont "mucha energía."
	para "Cuando se le mete"
	line "algo en la cabe-"
	para "za, no parará"
	line "hasta lograrlo."
	done

ElmsSonText:
	text "Cuando crezca,"
	line "¡seré un criador"
	cont "#MON!"

	para "¡Cuidaré a todos"
	line "los #MON!"
	done

SilentHouseLabFoodText:
; unused
	text "Aquí hay comida."
	line "Debe ser para el"
	cont "LABORATORIO."
	done

SilentHousePokemonFoodText:
; unused
	text "Aquí hay comida."
	line "Debe ser para el"
	cont "LABORATORIO."
	done

SilentHousePCText:
	text "¿De dónde vienen"
	line "los #MON?"

	para "¿Adónde van?"

	para "¿Por qué nadie"
	line "nunca ha visto a"
	cont "un #MON"
	cont "nacer?"

	para "¡Quiero saberlo!"
	line "¡Dedicaré mi vida"

	para "a estudiar a los"
	line "#MON!"

	para "…"

	para "Es parte de un"
	line "trabajo de inves-"
	cont "tigación del"
	cont "PROF. OAK."
	done

SilentHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SILENT_TOWN, 4
	warp_event  3,  7, SILENT_TOWN, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  1, BGEVENT_READ, SilentHouseBookshelf
	bg_event  5,  0, BGEVENT_READ, SilentHouseBookshelf

	db 2 ; object events
	object_event  5,  3, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ElmsWife, -1
	object_event  2,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ElmsSon, -1
