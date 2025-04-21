	const_def 2 ; object constants
	const MUSEUM_NPC_1
	const MUSEUM_NPC_2
	const MUSEUM_NPC_3
	const MUSEUM_NPC_4
	const MUSEUM_NPC_5

KantoMuseum1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MuseumCounterScientist:
	turnobject MUSEUM_NPC_1, LEFT
	jumptext MuseumCounterScientistText
	
MuseumCounterScientistBottom:
	turnobject MUSEUM_NPC_1, DOWN
	jumptext MuseumCounterScientistText
	
MuseumCounterScientistText:
	text "¡Bienvenido al"
	line "MUSEO de la"
	cont "CIENCIA de CIUDAD"
	cont "PLATEADA!"
	done
	
MuseumCounterScientistBehind:
	jumptextfaceplayer MuseumCounterScientistBehindText
	
MuseumCounterScientistBehindText:
	text "Emm… Preferiría"
	line "que entraras por"
	cont "la entrada"
	cont "principal."
	done
	
MuseumGramps:
	jumptextfaceplayer MuseumGrampsText
	
MuseumGrampsText:
	text "Soy el conserje,"
	line "¡pero paso tanto"
	cont "tiempo rodeado de"
	cont "huesos que podría"
	cont "ser también un"
	cont "paleontólogo!"
	done

MuseumScientistAmber:
	checkevent EVENT_PICKED_UP_OLD_AMBER
	iftrue .aftertext
	jumptextfaceplayer MuseumScientistAmberText
.aftertext
	jumptextfaceplayer ScientistAfterAmberTakenText
	
MuseumScientistAmberText:
	text "¡Eh! ¡Un entre-"
	line "nador #MON!"
	
	para "¡Estás de"
	line "suerte hoy!"
	
	para "Acabo de terminar"
	line "de investigar"
	cont "este ÁMBAR VIEJO"
	cont "y estoy conven-"
	cont "cido que tiene"
	cont "ADN de un"
	cont "#MON antiguo."
	
	para "Si se lo llevas"
	line "a los chicos del"
	cont "LABORATORIOA de"
	cont "CANELA, tendrás"
	cont "un AERODACTYL."
	
	para "¿Que cómo lo sé?"
	line "¡Yo lo descubrí!"
	done

ScientistAfterAmberTakenText:
	text "¿Te lo quedas?"
	
	para "Buena suerte, he"
	line "oído que criar"
	cont "un AERODACTYL"
	cont "es todo un reto."
	
	para "¡Son bastantes"
	line "feroces!"
	done

MuseumOtherScientist:
	jumptextfaceplayer MuseumOtherScientistText
	
MuseumOtherScientistText:
	text "¿Por qué los"
	line "jóvenes se"
	cont "cuelan aquí?"
	
	para "¡Está bien! No"
	line "rompas ni robes"
	cont "nada, ¿entendido?"
	done

OldAmberItemSprite:
	itemball OLD_AMBER

KabutopsFossil:
	jumptext KabutopsFossilText
	
KabutopsFossilText:
	text "¡Uau! ¡Es un"
	line "esqueleto de"
	cont "KABUTOPS!"
	done
	
AerodactylFossil:
	jumptext AerodactylFossilText
	
AerodactylFossilText:
	text "¡Uau! ¡Es un"
	line "esqueleto de"
	cont "AERODACTYL!"
	done


KantoMuseum1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 10,  7, KANTO_REGION, 39
	warp_event 11,  7, KANTO_REGION, 39
	warp_event 16,  7, KANTO_REGION, 40
	warp_event 17,  7, KANTO_REGION, 40
	warp_event  7,  7, KANTO_MUSEUM_2F,1

	db 0 ; coord events

	db 4 ; bg events
	bg_event 2,  3, BGEVENT_READ, KabutopsFossil
	bg_event 2,  6, BGEVENT_READ, AerodactylFossil
	bg_event 11,  4, BGEVENT_READ, MuseumCounterScientist
	bg_event 12,  5, BGEVENT_READ, MuseumCounterScientistBottom

	db 5 ; object events
	object_event  $c, $4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MuseumCounterScientistBehind, -1
	object_event  $1, $4, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MuseumGramps, -1
	object_event  $f, $2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MuseumScientistAmber, -1
	object_event  $11, $4, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MuseumOtherScientist, -1
	object_event  $10, $2, SPRITE_OLD_AMBER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OldAmberItemSprite, EVENT_PICKED_UP_OLD_AMBER

