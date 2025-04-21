	const_def 2 
	const SAFARIFATMAN
	const SAFARIPOKEFAN1
	const SAFARIPOKEFAN2
	const SAFARITRAINER
	const SAFARIITEM

SafariZoneBeta_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


SafariFatman:
	jumptextfaceplayer SafariFatmanText
	
SafariFatmanText:
	text "Ahora que ha"
	line "finalizado el pro-"
	cont "grama de crianza,"
	cont "el partque está"
	cont "abierto de"
	cont "forma gratuita."
	
	para "Dicho programa"
	line "ayudó a traer"
	cont "de vuelta a"
	cont "#MON como"
	cont "RHYHORN y"
	cont "EXEGGCUTE."
	done

SafariPokefan1:
	jumptextfaceplayer SafariPokefan1Text
	
SafariPokefan1Text:
	text "Escuché que el"
	line "GUARDA SLOWPOKE"
	cont "fue a invertir en"
	cont "otras empresas"
	cont "por NIHON."
	
	para "Una de sus últi-"
	line "mas inversiones"
	cont "es el ZOO de"
	cont "CIUDAD ENHIESTA."
	done

SafariPokefan2:
	jumptextfaceplayer SafariPokefan2Text
	
SafariPokefan2Text:
	text "¡EXEGGUTOR es mi"
	line "#MON favorito!"
	
	para "¡Ojalá criar uno"
	line "que crezca lo"
	cont "suficiente para"
	cont "hacer sombra en"
	cont "mi jardín!"
	done


SafariCooltrainer:
	jumptextfaceplayer SafariCooltrainerText
	
SafariCooltrainerText:
	text "La ZONA SAFARI"
	line "es un sitio genial"
	cont "para hacerse con"
	cont "#MON fuertes"
	cont "y variados."
	done
	
SafariItem:
	itemball ULTRA_BALL
	
SafarizoneSign:
	jumptext SafarizoneSignText
	
SafarizoneSignText:
	text "¡BIENVENIDO A"
	line "LA ZONA SAFARI!"
	
	para "POR FAVOR,"
	line "RESPETA LAS"
	cont "NORMAS"
	cont "¡NO TIRES"
	cont "BASURA!"
	done

SafariTrash:
	jumptext SafariTrashtext
	
SafariTrashtext:
	text "Afortunadamente"
	line "la basura no"
	cont "está vacía."
	done

SafariZoneBeta_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10, 31, SAFARI_ZONE_FUCHSIA_GATE_BETA, 1
	warp_event 11, 31, SAFARI_ZONE_FUCHSIA_GATE_BETA, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event 11, 19, BGEVENT_READ, SafarizoneSign
	bg_event  8, 26, BGEVENT_READ, SafariTrash

	db 5 ; object events
	object_event  4, 20, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SafariFatman, -1
	object_event 11, 11, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariPokefan1, -1
	object_event  3, 16, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariPokefan2, -1
	object_event  6,  9, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SafariCooltrainer, -1
	object_event 17, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SafariItem, EVENT_SAFARI_ITEMBALL
