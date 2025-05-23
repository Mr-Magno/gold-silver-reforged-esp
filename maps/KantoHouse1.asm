	const_def 2 ; object constants
	const KANTOHOUSE_1_TWIN
	const KANTOHOUSE_1_BUGCATCHER
	const KANTOHOUSE_1_TEACHER

KantoHouse1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoHouse1Twin:
	jumptextfaceplayer KantoHouse1TwinText
	
KantoHouse1BugCatcher:
	jumptextfaceplayer KantoHouse1BugCatcherText
	
KantoHouse1Teacher:
	jumptextfaceplayer KantoHouse1TeacherText
	
KantoHouse1TwinText:
	text "¡Un día, seré más"
	line "fuerte que ROJO!"
	done
	
KantoHouse1BugCatcherText:
	text "A lo mejor puedo"
	line "ganar la LIGA"
	para "usando solo"
	line "#MON bicho…"
	done
	
KantoHouse1TeacherText:
	text "A mis dos hijos"
	line "pequeños les"
	cont "encantan los"
	cont "#MON."

	para "Nunca fui"
	line "entrenadora, así"
	cont "que a veces no sé"
	cont "qué decirles sobre"
	cont "la crianza"
	cont "#MON."
	done

KantoHouse1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KANTO_REGION, 25
	warp_event  5,  7, KANTO_REGION, 25

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  5, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHouse1Twin, -1
	object_event  7,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHouse1BugCatcher, -1
	object_event  4,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHouse1Teacher, -1
