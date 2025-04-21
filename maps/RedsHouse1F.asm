	const_def 2 ; object constants
	const REDSHOUSE1F_REDS_MOM

RedsHouse1F_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

RedsMom:
	jumptextfaceplayer RedsMomText1

RedsHouse1FTV:
	jumptext RedsHouse1FTVText

RedsHouse1FBookshelf:
	jumpstd picturebookshelf

RedsMomText1:
	text "¡Hola!"

	para "Mi hijo ROJO es el"
	line "LÍDER de GIMNASIO"
	cont "de aquí."

	para "También consiguió"
	line "ser el CAMPEÓN de"
	cont "la LIGA el año"
	cont "pasado."

	para "Estoy muy"
	line "orgullosa de todo"
	cont "lo que ha logrado"
	cont "mi hijo."
	done


RedsHouse1FTVText:
	text "Nunca he visto"
	line "esta película…"
	done

RedsHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  7, KANTO_REGION, 21
	warp_event  3,  7, KANTO_REGION, 21
	warp_event  7,  0, REDS_HOUSE_2F, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, RedsHouse1FBookshelf
	bg_event  1,  1, BGEVENT_READ, RedsHouse1FBookshelf
	bg_event  3,  1, BGEVENT_READ, RedsHouse1FTV

	db 1 ; object events
	object_event  5,  3, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedsMom, -1
