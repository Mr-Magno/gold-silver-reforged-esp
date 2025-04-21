	const_def 2 ; object constants
	const ECRUTEAKBLISSEYSPEECHHOUSE_FISHER

TeknosOldRodHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


BlisseySpeechHouseRadio:
	jumpstd radio2
	

Route32Pokecenter1FFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_OLD_ROD
	iftrue .GotOldRod
	writetext Route32Pokecenter1FFishingGuruText_Question
	yesorno
	iffalse .Refused
	writetext Route32Pokecenter1FFishingGuruText_Yes
	buttonsound
	verbosegiveitem OLD_ROD
	writetext Route32Pokecenter1FFishingGuruText_GiveOldRod
	waitbutton
	closetext
	setevent EVENT_GOT_OLD_ROD
	end

.Refused:
	writetext Route32Pokecenter1FFishingGuruText_No
	waitbutton
	closetext
	end

.GotOldRod:
	writetext Route32Pokecenter1FFishingGuruText_After
	waitbutton
	closetext
	end


Route32Pokecenter1FFishingGuruText_Question:
	text "El río de la RUTA"
	line "119 es un punto de"
	cont "pesca popular."
	
	para "¿Quieres pescar?"

	para "¿Quieres una de"
	line "mis CAÑAS?"
	done

Route32Pokecenter1FFishingGuruText_Yes:
	text "Eso está bien."

	para "¡Ahora ya puedes"
	line "pescar!"
	done

Route32Pokecenter1FFishingGuruText_GiveOldRod:
	text "¡Pescar es genial!"

	para "Si ves agua, ya"
	line "sea el mar o un"
	cont "río, utiliza tu"
	cont "CAÑA."
	done

Route32Pokecenter1FFishingGuruText_No:
	text "¡Vaya! Me has"
	line "decepcionado…"
	done

Route32Pokecenter1FFishingGuruText_After:
	text "Hola."
	line "¿Están picando?"
	done

TeknosOldRodHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, TEKNOS_CITY, 4
	warp_event  5,  7, TEKNOS_CITY, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  1, BGEVENT_READ, BlisseySpeechHouseRadio

	db 1 ; object events
	object_event  7,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32Pokecenter1FFishingGuruScript, -1
