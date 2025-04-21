	const_def 2 ; object constants
	const DAISYSNOTE

BluesHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DaisysLetter:
	jumptext DaisysLetterText
	
DaisysLetterText:
	text "DAISY ha dejado"
	line "esta nota:"
	
	para "Pásate por casa"
	line "de vez en cuando"
	cont "mientras prepa-"
	cont "ramos el LAB."
	cont "de SILENT."
	
	para "Puede que tardemos"
	line "un poco en volver,"
	cont "pero el abuelo"
	cont "está muy emocio-"
	cont "nado con su nuevo"
	cont "proyecto en este"
	cont "pueblo."
	
	para "Si ROJO necesita"
	line "algo, siempre hay"
	cont "algo de comida"
	cont "en la nevera."
	
	para "¡Gracias por"
	line "ser un buen"
	cont "vecino!"
	
	para "-DAISY OAK"
	done


BluesHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KANTO_REGION, 20
	warp_event  5,  7, KANTO_REGION, 20

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  4, SPRITE_PAPER, 0, 0, 0, -1, -1, PAL_OW_SILVER, OBJECTTYPE_SCRIPT, 0, DaisysLetter, -1
