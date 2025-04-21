	const_def 2
	const CM_B1F_EXEC
	const CM_B1F_DRAGONITE
	const CM_B1F_ITEMBALL1
	const CM_B1F_ITEMBALL2

CastleMountainB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DragoniteSteps:
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	step_end


ArianaDungeonScript:
	faceplayer
	opentext
	writetext OuchFallText
	waitbutton
	closetext
	playsound SFX_RAGE
	pause 15
	special FadeOutMusic
	turnobject CM_B1F_EXEC, UP
	opentext
	writetext DidYouHearThatText
	waitbutton
	closetext
	turnobject PLAYER, UP
	playsound SFX_SURF
	pause 10
	appear CM_B1F_DRAGONITE
	applymovement CM_B1F_DRAGONITE, DragoniteSteps
	pause 10
	opentext
	writetext DragoniteCryText
	cry DRAGONITE
	pause 15
	closetext
	opentext
	writetext IThinkHesAngryText
	waitbutton
	writetext DragoniteCryText
	cry DRAGONITE
	pause 15
	loadwildmon DRAGONITE, 60
	writecode VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	disappear CM_B1F_DRAGONITE
	reloadmapafterbattle
	turnobject CM_B1F_EXEC, RIGHT
	turnobject PLAYER, LEFT
	opentext
	writetext DontForgetTRText
	waitbutton
	closetext
	special FadeOutPalettes
	disappear CM_B1F_EXEC
	playsound SFX_ESCAPE_ROPE
	pause 10
	special LoadMapPalettes
	special FadeInPalettes
	setevent EVENT_CASTLE_B1F_SPRITES_NOT_SHOWN
	setevent EVENT_CASTLE_MTN_EVENTS_COMPLETE
	setevent EVENT_CM3A_NUGGET1
	setevent EVENT_CM3A_NUGGET2
	setevent EVENT_CM3A_NUGGET3
	setevent EVENT_CM3A_NUGGET4
	setevent EVENT_CM3A_NUGGET5
	setevent EVENT_CM3A_NUGGET6
	setevent EVENT_CM3A_NUGGET7
	setevent EVENT_CM3A_NUGGET8
	clearevent EVENT_DESERTER_ROCKET_GRUNT
	end
	
OuchFallText:
	text "Vaya… Debería"
	line "haber mirado las"
	cont "palancas de la"
	cont "trampilla con"
	cont "más cuidado…"
	
	para "¡Todo esto es"
	line "culpa tuya!"
	
	para "¡Si no hubieras"
	line "desmantelado la"
	cont "operación en la"
	cont "TORRE RADIO mi"
	cont "unidad no estaría"
	cont "escondida en"
	cont "este vertedero!"
	done

DidYouHearThatText:
	text "…¿Has oído"
	line "algo?"
	done


DragoniteCryText:
	text "DRAGONITE: ¡Nite!"
	done

	
IThinkHesAngryText:
	text "¡No puede ser!"
	line "¡La leyenda del"
	cont "pueblo era real!"
	cont "¡Es el DRAGÓN"
	cont "VERDE!"
	
	para "¡Y pa-parece muy"
	line "en-enfadado!"
	done

DontForgetTRText:
	text "Buf…"
	
	para "¡No creas que voy"
	line "a dejar pasar lo"
	cont "que has hecho"
	cont "aquí!"
	
	para "¡Viste la verdad"
	line "por ti mismo en"
	cont "la LIGA NIHON!"
	
	para "¡GIOVANNI sigue"
	line "siendo igual de"
	cont "poderoso que"
	cont "siempre!"
	
	para "¡El TEAM ROCKET"
	line "tiene operativos"
	cont "por todas partes"
	cont "del mundo!"
	
	para "¡Volveremos!"
	line "¡Cuenta con"
	cont "ello, mocoso!"
	done

CMB1Itemball1:
	itemball KINGS_ROCK
	
CMB1Itemball2:
	itemball ESCAPE_ROPE

CastleMountainB1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 25,  3, CASTLE_MOUNTAIN_1F_STAIRS, 5
	warp_event  4, 27, CASTLE_MOUNTAIN_3FB, 0
	warp_event 15,  7, CASTLE_MOUNTAIN_3FB, 0

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 14,  7, SPRITE_ROCKET_EXECUTIVE_F, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ArianaDungeonScript, EVENT_CASTLE_B1F_SPRITES_NOT_SHOWN
	object_event 14,  2, SPRITE_DRAGON, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CASTLE_DRAGONITE_NOT_SHOWN
	object_event 26, 23, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CMB1Itemball1, EVENT_CMB1_ITEMBALL1
	object_event 15, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CMB1Itemball2, EVENT_CMB1_ITEMBALL2
