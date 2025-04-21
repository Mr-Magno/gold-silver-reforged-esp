	const_def 2
	const KIKAIHOUSE1_BLACKBELT
	const KIKAIHOUSE1_GRANNY

KikaiHouse1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KikaiHouse1BBScript:
	jumptextfaceplayer KikaiHouse1BBText
	
KikaiHouse1GrannyScript:
	jumptextfaceplayer KikaiHouse1GrannyText
	
KikaiHouse1BBText:
	text "¡He hecho todo el"
	line "camino desde el"
	cont "DOJO KARATE en"
	cont "CIUDAD ALEAR para"
	cont "entrenar en la"
	cont "CALDERA!"
	done

KikaiHouse1GrannyText:
	text "Los artistas"
	line "marciales que"
	cont "viajan buscan"
	cont "hospedarse aquí,"
	cont "en mi humilde"
	cont "hogar."

	para "Puede que no lo"
	line "parezca, pero hace"
	cont "muchos años yo"
	cont "también venía a"
	cont "entrenar a la"
	cont "CALDERA."
	done
	

KikaiHouse1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KIKAI_VILLAGE, 3
	warp_event  5,  7, KIKAI_VILLAGE, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  4,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KikaiHouse1BBScript, -1
	object_event  7,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KikaiHouse1GrannyScript, -1
