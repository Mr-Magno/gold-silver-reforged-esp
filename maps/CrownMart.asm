	const_def 2 ; object constants
	const CROWN_MART_CLERK
	const CROWN_MART_COOLTRAINER_M
	const CROWN_MART_YOUNGSTER

CrownMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CrownMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_CROWN
	closetext
	end

CrownMartCooltrainerMScript:
	jumptextfaceplayer CrownMartCooltrainerMText

CrownMartYoungsterScript:
	jumptextfaceplayer CrownMartYoungsterText

CrownMartCooltrainerMText:
	text "Hay una TIENDA en"
	line "la entrada a la"
	cont "LIGA."

	para "Creo que allí"
	line "tienen una mejor"
	cont "selección de"
	cont "artículos."
	done

CrownMartYoungsterText:
	text "Compra algunas"
	line "ULTRA BALLS si"
	para "quieres capturar"
	line "#MON en el MT."
	cont "FUJI."
	done

CrownMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, CROWN_CITY, 4
	warp_event  5,  7, CROWN_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CrownMartClerkScript, -1
	object_event  8,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CrownMartCooltrainerMScript, -1
	object_event  2,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CrownMartYoungsterScript, -1
