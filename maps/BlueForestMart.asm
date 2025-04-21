	const_def 2 ; object constants
	const BLUEFORESTMART_CLERK
	const BLUEFORESTMART_COOLTRAINER_M
	const BLUEFORESTMART_BLACK_BELT

BlueForestMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlueForestMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_BLUEFOREST
	closetext
	end

BlueForestMartCooltrainerMScript:
	jumptextfaceplayer BlueForestMartCooltrainerMText

BlueForestMartBlackBeltScript:
	jumptextfaceplayer BlueForestMartBlackBeltText

BlueForestMartCooltrainerMText:
	text "No puedes comprar"
	line "REVIVIR MÁX., pero"
	para "éste reanima"
	line "a un #MON"
	cont "debilitado."

	para "Atención: No"
	line "restaura los PP o"
	para "PUNTOS de PODER de"
	line "los movimientos."
	done

BlueForestMartBlackBeltText:
	text "REPEL MÁX. evita"
	line "que se acerquen"
	cont "#MON débiles."

	para "Es el repelente"
	line "más duradero"
	cont "de todos."
	done

BlueForestMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, BLUE_FOREST, 4
	warp_event  5,  7, BLUE_FOREST, 4

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlueForestMartClerkScript, -1
	object_event  9,  6, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlueForestMartCooltrainerMScript, -1
	object_event  4,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlueForestMartBlackBeltScript, -1
