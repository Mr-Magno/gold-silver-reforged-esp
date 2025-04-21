	const_def 2 ; object constants
	const CROWN_SCOPE_LENS_HOUSE_GRANNY

CrownCityScopeLensHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
CrownCityScopeLensHouseGrannyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SCOPE_LENS_IN_CROWN_CITY
	iftrue .alreadygavescopelens
	writetext CrownCityScopeLensHouseGrannyText1
	waitbutton
	verbosegiveitem SCOPE_LENS
	iffalse .Done
	setevent EVENT_GOT_SCOPE_LENS_IN_CROWN_CITY
	jump .alreadygavescopelens
	end
	
.alreadygavescopelens
	writetext CrownCityScopeLensHouseGrannyText2
	waitbutton
	closetext
	end
	
.Done
	closetext
	end
	
CrownCityScopeLensHouseGrannyText1:
	text "Una vez desafié"
	line "a la LIGA"
	cont "#MON."
	para "¿Sabes cuál es"
	line "el secreto?"
	para "La estrategia. Es"
	line "saber cómo usar"
	cont "los objetos."
	para "Tengo uno muy"
	line "bueno, toma."
	done
	
CrownCityScopeLensHouseGrannyText2:
	text "El PERISCOPIO"
	line "hace que tus"
	para "#MON tengan"
	line "más probabilidades"
	cont "de asestar un"
	cont "golpe crítico."
	para "¡No sabrán qué"
	line "les ha golpeado!"
	done

CrownCityScopeLensHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, CROWN_CITY, 6
	warp_event  5,  7, CROWN_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CrownCityScopeLensHouseGrannyScript, -1
