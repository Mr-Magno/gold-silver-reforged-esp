	const_def 2 ; object constants
	const NAGOIMPOSTERHOUSE_FISHING_GURU
	const NAGOIMPOSTERHOUSE_DIGLETT

NagoImposterHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

NagoImposterHouseFishingGuruScript:
	jumptextfaceplayer NagoImposterHouseFishingGuruText

CeruleanDiglett:
	opentext
	writetext CeruleanDiglettText
	cry DIGLETT
	waitbutton
	closetext
	end

NagoImposterHouseFishingGuruText:
	text "OAK IMPOSTOR: Oh."

	para "Eres tú."

	para "…"

	para "No estoy aquí para"
	line "combatir o hacer"
	cont "alguna maldad."

	para "Me equivoqué al"
	line "trabajar con el"
	cont "TEAM ROCKET."

	para "Creo que me"
	line "cegaron las ansias"
	cont "de poder."

	para "Pero el TEAM"
	line "ROCKET, de equipo,"
	cont "tenía poco."

	para "Yo no significaba"
	line "nada para ellos."

	para "En el momento que"
	line "dejé de servirles"
	para "para engañar a la"
	line "gente, se"
	cont "deshicieron de mí"
	cont "enseguida."

	para "Sé lo que son, y"
	line "estoy intentando"
	cont "dejar esa vida"
	cont "atrás."

	para "No tienes que"
	line "perdonarme, pero"
	cont "esto es lo que soy"
	cont "ahora."
	done


CeruleanDiglettText:
	text "DIGLETT: Dig, dig."
	done

NagoImposterHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, NAGO_VILLAGE, 2
	warp_event  5,  7, NAGO_VILLAGE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  7,  4, SPRITE_IMPOSTER_OAK, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, NagoImposterHouseFishingGuruScript, EVENT_TELEPORT_GUY
	object_event  3,  5, SPRITE_DIGLETT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeruleanDiglett, EVENT_TELEPORT_GUY
