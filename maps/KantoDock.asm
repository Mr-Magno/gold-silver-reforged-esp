	const_def 2 ; object constants
	const KD_SAILOR1
	const KD_SAILOR2
	const KD_SAILOR3
	const KD_TRUCKMAN
	const KD_ITEMBALL

KantoDock_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoDockItemBall:
	itemball STAR_PIECE

TrainerKDOCK1:
	trainer SAILOR, KENT, EVENT_BEAT_KDOCKS_TRAINER1, SailorKentSeenText, SailorKentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorKentAfterBattleText
	waitbutton
	closetext
	end

TrainerKDOCK2:
	trainer SAILOR, ERNEST, EVENT_BEAT_KDOCKS_TRAINER2, SailorErnestSeenText, SailorErnestBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorErnestAfterBattleText
	waitbutton
	closetext
	end

TrainerKDOCK3:
	trainer SAILOR, SVEN, EVENT_BEAT_KDOCKS_TRAINER3, SailorSvenSeenText, SailorSvenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorSvenAfterBattleText
	waitbutton
	closetext
	end

SailorKentSeenText:
	text "Todavía falta"
	line "para que zarpe el"
	cont "siguiente barco,"
	cont "¡matemos el"
	cont "tiempo juntos!"
	done

SailorKentBeatenText:
	text "¡Dejé mi POCIÓN"
	line "en el barco!"
	done

SailorKentAfterBattleText:
	text "No es gran cosa,"
	line "tengo tiempo de"
	cont "sobra para ir"
	cont "al CENTRO"
	cont "#MON."
	done

SailorErnestSeenText:
	text "¡Soy el más duro"
	line "de es este"
	cont "muelle!"
	done

SailorErnestBeatenText:
	text "¡Arrr! ¡Tocado"
	line "y hundido!"
	done

SailorErnestAfterBattleText:
	text "¡Deberías"
	line "conseguir un"
	cont "trabajo aquí!"
	
	para "¡Se necesita"
	line "dureza para"
	cont "trabajar en el"
	cont "muelle!"
	done

SailorSvenSeenText:
	text "Acabo de llegar"
	line "de PUEBLO ES-"
	cont "CARCHA, ¡aquí"
	cont "hace demasiado"
	cont "calor!"
	done

SailorSvenBeatenText:
	text "¡Estoy empapado!"
	done

SailorSvenAfterBattleText:
	text "Necesito encon-"
	line "trar sombra y un"
	cont "poco de agua…"
	done

KantoDockTruckMan:
	jumptextfaceplayer KantoDockTruckManText
	
KantoDockTruckManText:
	text "Los niños"
	line "siempre están"
	cont "husmeando cerca"
	cont "de mi vehículo"
	cont "de trabajo."
	
	para "Les debe"
	line "impresionar lo"
	cont "impecable que"
	cont "está."
	
	para "Fíjate, ¡ni una"
	line "mancha de óxido!"
	done

TruckBGEvent:
	jumptext TruckText
	
TruckText:
	text "Un camión de"
	line "finales de los"
	cont "ochenta. Pulcro"
	cont "de cabo a rabo."
	
	para "Muy bonito…"
	done


KantoDock_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 14,  0, KANTO_REGION, 44

	db 0 ; coord events

	db 2 ; bg events
	bg_event 22,  0, BGEVENT_READ, TruckBGEvent
	bg_event 23,  0, BGEVENT_READ, TruckBGEvent

	db 5 ; object events
	object_event  7,  0, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerKDOCK1, -1
	object_event 27,  4, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerKDOCK2, -1
	object_event 26,  7, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerKDOCK3, -1
	object_event 21,  0, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoDockTruckMan, -1
	object_event  2,  0, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KantoDockItemBall, EVENT_KANTO_DOCK_STARPIECE
