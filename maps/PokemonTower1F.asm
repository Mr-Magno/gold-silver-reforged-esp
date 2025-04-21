	const_def 2
	const TOWER1RECEPTIONIST
	const TOWER1WOMAN
	const TOWER1BALDMAN
	const TOWER1GIRL
	const TOWER1MEDIUM

PokemonTower1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Tower1Receptionist:
	checkevent EVENT_BEAT_TOWER_GENGAR
	iftrue Tower1ReceptionistAfter
	jumptextfaceplayer Tower1ReceptionistScaredText
	
Tower1ReceptionistAfter:
	jumptextfaceplayer Tower1ReceptionistAfterText
	
Tower1ReceptionistScaredText:
	text "Actualmente hay"
	line "disturbios en la"
	cont "TORRE. Por favor,"
	cont "evita los pisos"
	cont "superiores."
	done
	
Tower1ReceptionistAfterText:
	text "La TORRE #MON"
	line "fue construida en"
	cont "memoria del"
	cont "#MON que"
	cont "murió."
	done

Tower1Teacher:
	checkevent EVENT_BEAT_TOWER_GENGAR
	iftrue Tower1TeacherAfter
	jumptextfaceplayer Tower1TeacherScaredText
	
Tower1TeacherAfter:
	jumptextfaceplayer Tower1TeacherAfterText
	
Tower1TeacherScaredText:
	text "Vine a rendir"
	line "tributo a mis"
	cont "#MON, pero en"
	cont "los pisos supe"
	cont "superiores están"
	cont "bajo ataque."
	
	para "¡Haz algo,"
	line "por favor!"
	done
	
Tower1TeacherAfterText:
	text "Ahora puedo rezar"
	line "tranqulamente."
	cont "Gracias."
	done


Tower1Pokefan:
	checkevent EVENT_BEAT_TOWER_GENGAR
	iftrue Tower1PokefanAfter
	jumptextfaceplayer Tower1PokefanScaredText
	
Tower1PokefanAfter:
	jumptextfaceplayer Tower1PokefanAfterText
	
Tower1PokefanScaredText:
	text "¿Qu-Qué ocurre?"
	line "¿Es seguro"
	cont "entrar?"
	done
	
Tower1PokefanAfterText:
	text "¡Fiiu! Menos"
	line "mal, ahora puedo"
	cont "rendir tributo"
	cont "debidamente."
	done


Tower1Lass:
	checkevent EVENT_BEAT_TOWER_GENGAR
	iftrue Tower1LassAfter
	jumptextfaceplayer Tower1LassScaredText
	
Tower1LassAfter:
	jumptextfaceplayer Tower1LassAfterText
	
Tower1LassScaredText:
	text "¡Ahh! ¡Quiero"
	line "irme, pero estoy"
	cont "tan asustada"
	cont "que no puedo!"
	done
	
Tower1LassAfterText:
	text "¡Gracias por"
	line "deshacerte de"
	cont "ese poltergeist!"
	done


Tower1Medium:
	checkevent EVENT_BEAT_TOWER_GENGAR
	iftrue Tower1MediumAfter
	jumptextfaceplayer Tower1MediumScaredText
	
Tower1MediumAfter:
	jumptextfaceplayer Tower1MediumAfterText
	
Tower1MediumScaredText:
	text "¡Soy un MÉDIUM!"
	line "¡Hay espíritus"
	cont "haciendo trave-"
	cont "suras de nuevo!"
	done
	
Tower1MediumAfterText:
	text "¡Los espíritus"
	line "se han calmado!"
	done

PokemonTower1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 10, 17, KANTO_REGION, 41
	warp_event 11, 17, KANTO_REGION, 41
	warp_event 18,  9, POKEMON_TOWER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event 14, 14, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Tower1Receptionist, -1
	object_event 12,  4, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Tower1Teacher, -1
	object_event  5,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Tower1Pokefan, -1
	object_event  8, 13, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Tower1Lass, -1
	object_event 18,  8, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Tower1Medium, -1
