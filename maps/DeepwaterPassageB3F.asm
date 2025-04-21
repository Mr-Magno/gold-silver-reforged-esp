	const_def 2 ; object constants
	const DEEPWATERPASSAGEB3F_PRYCE
	const DEEPWATERPASSAGEB3F_ITEMBALL_1
	const DEEPWATERPASSAGEB3F_ITEMBALL_2
	const DEEPWATERPASSAGEB3F_ITEMBALL_3
	const DEEPWATERPASSAGEB3F_ITEMBALL_4

DeepwaterPassageB3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
DeepwaterPassageB3FMaxRevive:
	itemball MAX_REVIVE

DeepwaterPassageB3FRareCandy:
	itemball RARE_CANDY

DeepwaterPassageB3FMaxEther:
	itemball MAX_ETHER
	
DeepwaterPassageB3FTMSwagger:
	itemball TM_SWAGGER

DeepwaterPassageB3FPryceScript:
	faceplayer
	opentext
	writetext PryceGreetingText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal RIGHT, .PryceWalksAroundPlayer
	applymovement DEEPWATERPASSAGEB3F_PRYCE, PryceLeavesMovement
	disappear DEEPWATERPASSAGEB3F_PRYCE
	setevent EVENT_DEEPWATER_PASSAGE_PRYCE_GONE
	clearevent EVENT_HIDE_FROSTPOINT_PRYCE
	end
	
.PryceWalksAroundPlayer:
	applymovement DEEPWATERPASSAGEB3F_PRYCE, PryceLeavesMovementAlt
	disappear DEEPWATERPASSAGEB3F_PRYCE
	setevent EVENT_DEEPWATER_PASSAGE_PRYCE_GONE
	clearevent EVENT_HIDE_FROSTPOINT_PRYCE
	end

PryceGreetingText:
	text "Oh, hola."

	para "No suelo recibir"
	line "visitas aquí."

	para "Me llamo FREDO."
	
	para "Soy el LÍDER de"
	line "GIMNASIO del"
	cont "BOSQUE AZUL."
	
	para "Pero me gusta"
	line "salir a menudo de"
	para "mi GIMNASIO para"
	line "venir a entrenar"
	para "en las profundida-"
	line "des de esta cueva."
	
	para "…"
	
	para "¿Un desafío?"
	
	para "Tendrá que"
	line "esperar."
	
	para "Tengo familia"
	line "que vive en"
	cont "PUEBLO ESCARCHA."
	
	para "Ya les he dicho"
	line "que iría de"
	cont "visita."

	para "La familia es"
	line "muy importante."

	para "Si insistes en"
	line "combatir, ven"
	cont "a mi familia en"
	cont "PUEBLO ESCARCHA."

	para "Regresaré al"
	line "GIMNASIO cuando ya"
	cont "los haya visitado."
	done

PryceLeavesMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
PryceLeavesMovementAlt:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

DeepwaterPassageB3F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  3, 33, DEEPWATER_PASSAGE_B2F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event 26, 31, SPRITE_PRYCE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, DeepwaterPassageB3FPryceScript, EVENT_DEEPWATER_PASSAGE_PRYCE_GONE
	object_event  5, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageB3FTMSwagger, EVENT_OLIVINE_LIGHTHOUSE_5F_TM_SWAGGER
	object_event 14, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageB3FMaxEther, EVENT_ROUTE_43_MAX_ETHER
	object_event 18, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageB3FMaxRevive, EVENT_ROUTE_44_MAX_REVIVE
	object_event 16, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DeepwaterPassageB3FRareCandy, EVENT_OLIVINE_LIGHTHOUSE_5F_RARE_CANDY

