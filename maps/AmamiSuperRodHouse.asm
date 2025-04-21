	const_def 2 ; object constants
	const AMAMISUPERRODHOUSE_FISHING_GURU

AmamiSuperRodHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AmamiSuperRodHouseFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SUPER_ROD
	iftrue .GotSuperRod
	writetext OfferSuperRodText
	yesorno
	iffalse .Refused
	writetext GiveSuperRodText
	buttonsound
	verbosegiveitem SUPER_ROD
	iffalse .NoRoom
	setevent EVENT_GOT_SUPER_ROD
.GotSuperRod:
	writetext GaveSuperRodText
	waitbutton
	closetext
	end

.Refused:
	writetext DontWantSuperRodText
	waitbutton
.NoRoom:
	closetext
	end

OfferSuperRodText:
	text "Puedo ver que te"
	line "gusta pescar."

	para "¡No tengo"
	line "ninguna duda!"

	para "Estoy en lo"
	line "correcto, ¿verdad?"
	done

GiveSuperRodText:
	text "Sí, sí. ¡Justo"
	line "como me imaginaba!"

	para "¡Toma esto fan"
	line "de la pesca! Es"
	cont "una SUPER CAÑA."
	done

GaveSuperRodText:
	text "Prueba suerte pes-"
	line "cando allá donde"
	cont "haya agua."

	para "Recuerda: puedes"
	line "pescar diferentes"

	para "#MON utilizando"
	line "distintas CAÑAS."
	
	para "¡La SUPER CAÑA"
	line "es la mejor de"
	cont "todas!"
	done

DontWantSuperRodText:
	text "¿Me han engañado"
	line "mis ojos?"
	done

AmamiSuperRodHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, AMAMI_TOWN, 7
	warp_event  5,  7, AMAMI_TOWN, 7

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AmamiSuperRodHouseFishingGuruScript, -1
