	const_def 2 ; object constants
	const NAGO_CHARMANDER_HOUSE_NPC1
	const NAGO_CHARMANDER_HOUSE_NPC2
	const NAGO_CHARMANDER_HOUSE_NPC3
	const NAGO_CHARMANDER_HOUSE_NPC4
	const NAGO_CHARMANDER_HOUSE_NPC5
	const NAGO_CHARMANDER_HOUSE_NPC6

NagoCharmanderHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
NagoCharmanderHouseCharmander:
	opentext
	writetext NagoCharmanderHouseCharmanderText
	cry CHARMANDER
	waitbutton
	closetext
	end
	
NagoCharmanderHouseTeacher:
	faceplayer
	opentext
	checkevent EVENT_NAGO_VILLAGE_RECEIVED_CHARMANDER
	iftrue .AlreadyGotCharmander
	writetext ILoveCharmanderText
	yesorno
	iffalse .DontTakeCharmander
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullCharmander
	writetext UnknownText_0x7e355a
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke CHARMANDER, 5
	writetext GiveCharmanderText
	waitbutton
	disappear NAGO_CHARMANDER_HOUSE_NPC1
	closetext
	setevent EVENT_NAGO_VILLAGE_RECEIVED_CHARMANDER
	end
	
.AlreadyGotCharmander
	writetext AlreadyGotCharmanderText
	waitbutton
	closetext
	end
	
.DontTakeCharmander
	writetext NoCharmanderText
	waitbutton
	closetext
	end
	
.PartyFullCharmander
	writetext PartyFullCharmanderText
	waitbutton
	closetext
	end
	
UnknownText_0x7e355a:
	text "<PLAYER> recibió"
	line "a CHARMANDER."
	done
	
AlreadyGotCharmanderText:
	text "¡Mis queridos"
	line "CHARMANDER son lo"
	cont "que más me gusta!"
	done
	
PartyFullCharmanderText:
	text "¡Ya llevas muchos"
	line "#MON en tu"
	cont "equipo!"
	done
	
NoCharmanderText:
	text "¿No te gustan"
	line "tanto como a mí?"
	done
	

NagoCharmanderHouseCharmanderText:
	text "CHARMANDER: ¡Char!"
	done
	
ILoveCharmanderText:
	text "¡Adoro a los"
	line "CHARMANDER!"

	para "¡Son lo más mono"
	line "de este mundo!"

	para "Mi objetivo en la"
	line "vida es compartir"
	cont "mi amor por los"
	cont "CHARMANDER con el"
	cont "resto del mundo."

	para "¿Quieres uno?"
	done
	
GiveCharmanderText:
	text "¡Cuídalo mucho,"
	line "cielo!"
	done

NagoCharmanderHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, NAGO_VILLAGE, 3
	warp_event  5,  7, NAGO_VILLAGE, 3

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	object_event  9,  7, SPRITE_CHARMANDER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NagoCharmanderHouseCharmander, EVENT_NAGO_VILLAGE_RECEIVED_CHARMANDER
	object_event  6,  2, SPRITE_CHARMANDER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NagoCharmanderHouseCharmander, -1
	object_event  8,  1, SPRITE_CHARMANDER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NagoCharmanderHouseCharmander, -1
	object_event  4,  5, SPRITE_CHARMANDER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NagoCharmanderHouseCharmander, -1
	object_event  2,  3, SPRITE_CHARMANDER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NagoCharmanderHouseCharmander, -1
	object_event  1,  4, SPRITE_CHARMANDER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NagoCharmanderHouseCharmander, -1
	object_event  7,  4, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NagoCharmanderHouseTeacher, -1
