	const_def 2
	const DAITO_APPLEFARMER


AppleOrchardHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AppleFarmerScript:
	jumptextfaceplayer AppleFarmerText
	
AppleFarmerText:
	text "¡Bueno, bueno!"
	
	para "¡Un entrenador"
	line "que ha venido"
	cont "hasta aquí, a"
	cont "mi HUERTO!"
	
	para "Podrías ayudarme,"
	line "chico."
	
	para "¡Mis MANZANAs se"
	line "venden por un"
	cont "dineral en el"
	cont "continente por su"
	cont "saber crujiente"
	cont "y fresco!"
	
	para "Aunque es muy"
	line "duro venderlas"
	cont "tan lejos."
	
	para "¿Por qué no las"
	line "coges y lo"
	cont "haces por mí?"
	
	para "¡Puedes quedarte"
	line "parte de las"
	cont "ganancias! No te"
	cont "preocupes,"
	cont "recuperaré mi"
	cont "parte en la"
	cont "TIENDA."
	done


AppleOrchardHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, DAITO_APPLE_ORCHARD, 1
	warp_event  5,  7, DAITO_APPLE_ORCHARD, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 7, 4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AppleFarmerScript, -1
