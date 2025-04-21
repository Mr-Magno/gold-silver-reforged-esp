	const_def 2
	const FORKED_STRAIT_GATE_COP
	const FORKED_STRAIT_GATE_SCIENTIST1
	const FORKED_STRAIT_GATE_SCIENTIST2
	const FORKED_STRAIT_GATE_SCIENTIST3

ForkedStraitGate_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 0 ; callbacks

.DummyScene:
	end

NeedToWalkOverOneTile:
	step LEFT
	step_end

CredCheckLeft:
	checkevent EVENT_DONE_FORKED_STRAIT_GATE_CHECK
	iftrue .finish
	opentext
	writetext EventCopHALT
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	opentext
	writetext EventCopText
	waitbutton
	closetext
	setevent EVENT_DONE_FORKED_STRAIT_GATE_CHECK
	setevent EVENT_BLUE_IN_OAKS_LAB ; blue no longer in the lab at silent town
	setevent EVENT_MEW_SPOT_2_FOUND ; islands events initializing
	setevent EVENT_MEW_SPOT_3_FOUND
	setevent EVENT_MEW_SPOT_4_FOUND
	setevent EVENT_MEW_SPOT_5_FOUND
	setevent EVENT_MEW_SPOT_6_FOUND
	setevent EVENT_MEW_SPOT_7_FOUND
	setevent EVENT_MEW_SPOT_8_FOUND
	setevent EVENT_RAINBOW_ISLE_CAVE_OBJECTS_HIDDEN
	setevent EVENT_RAINBOW_ISLE_CAVE_BLUE_HIDDEN
	setevent EVENT_RAINBOW_ISLE_BLUE_BATTLE_HIDDEN
.finish
	end

CredCheckRight:
	checkevent EVENT_DONE_FORKED_STRAIT_GATE_CHECK
	iftrue .finish
	opentext
	writetext EventCopHALT
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	applymovement PLAYER, NeedToWalkOverOneTile
	opentext
	writetext EventCopText
	waitbutton
	closetext
	setevent EVENT_DONE_FORKED_STRAIT_GATE_CHECK
	setevent EVENT_MEW_SPOT_2_FOUND ; islands events initializing
	setevent EVENT_MEW_SPOT_3_FOUND
	setevent EVENT_MEW_SPOT_4_FOUND
	setevent EVENT_MEW_SPOT_5_FOUND
	setevent EVENT_MEW_SPOT_6_FOUND
	setevent EVENT_MEW_SPOT_7_FOUND
	setevent EVENT_MEW_SPOT_8_FOUND
	setevent EVENT_RAINBOW_ISLE_CAVE_OBJECTS_HIDDEN
	setevent EVENT_RAINBOW_ISLE_CAVE_BLUE_HIDDEN
	setevent EVENT_RAINBOW_ISLE_BLUE_BATTLE_HIDDEN
.finish
	end


EventCopHALT:
	text "¡ALTO!"
	done

EventCopText:
	text "¡Esta es una zona"
	line "restringida!"

	para "No se permiten"
	line "entrenadores"
	cont "#MON a partir"
	cont "de…"

	para "Un momento."
	
	para "… … …"
	line "… … …"
	
	para "Eres…"
	
	para "¿<PLAY_G>, el"
	line "nuevo CAMPEÓN de"
	cont "la LIGA de NIHON?"
	
	para "¡En efecto!"
	line "¡Mis disculpas!"
	
	para "No se permite el"
	line "paso a las ISLAS"
	cont "DEL SUR a gente de"
	cont "a pie, pero puedo"
	cont "permitir que viaje"
	cont "hasta allí alguien"
	cont "con una autoridad"
	cont "como la tuya."
	
	para "Esas ISLAS son"
	line "paraísos naturales"
	cont "de los #MON,"
	cont "libres de la"
	cont "intervención"
	cont "humana."
	
	para "Es por ese motivo"
	line "que tienen un gran"
	cont "valor para la"
	cont "investigación"
	cont "científica."
	
	para "Supongo que AZUL"
	line "te ha informado"
	cont "sobre ello."
	
	para "Fue hacia allí"
	line "para realizar una"
	cont "investigación en"
	cont "la ISLA ARCOÍRIS,"
	cont "al oeste."
	
	para "¡Puedes continuar!"
	done

ForkedStraitGateCopScript:
	jumptextfaceplayer ForkedStraitGateCopNormalText
	
ForkedStraitGateCopNormalText:
	text "¡<PLAY_G>!"
	line "¡Puedes pasar!"
	done


ForkedStraitGateScientist1Script:
	jumptextfaceplayer ForkedStraitGateScientist1Text
	
ForkedStraitGateScientist1Text:
	text "¡La ISLA TROPICAL,"
	line "al este, está"
	cont "llena de especies"
	cont "raras de #MON!"

	para "Estoy investigando"
	line "una potencial"
	cont "NUEVA ESPECIE en"
	cont "la isla."
	done

ForkedStraitGateScientist2Script:
	jumptextfaceplayer ForkedStraitGateScientist2Text
	
ForkedStraitGateScientist2Text:
	text "Soy una de las"
	line "pocas personas que"
	cont "ha tenido la"
	cont "suerte de obtener"
	cont "una autorización"
	cont "para estudiar las"
	cont "ISLAS DEL SUR."

	para "¡Incluso están"
	line "imprimiendo un"
	cont "conjunto de tarje-"
	cont "tas promocionales"
	cont "con las increíbles"
	cont "fotos que tomamos"
	cont "a los #MON"
	cont "durante nuestro"
	cont "viaje de"
	cont "investigación!"
	done


ForkedStraitGateScientist3Script:
	jumptextfaceplayer ForkedStraitGateScientist3Text
	
ForkedStraitGateScientist3Text:
	text "Existen antiguos"
	line "manuscritos que"
	cont "describen la ISLA"
	cont "ARCOÍRIS como un"
	cont "lugar milagroso"
	cont "que siempre está"
	cont "envuelto en una"
	cont "luz iridiscente."

	para "Me pregunto si es"
	line "solo una leyenda o"
	cont "si realmente la"
	cont "isla tiene algún"
	cont "poder especial…"
	done

TropicalSign:
	jumptext TropicalSignText
	
RainbowSign:
	jumptext RainbowSignText
	
TropicalSignText:
	text "HACIA EL ESTE,"
	line "ISLA TROPICAL"
	done
	
RainbowSignText:
	text "HACIA EL OESTE,"
	line "ISLA ARCOÍRIS"
	done


ForkedStraitGate_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 10,  0,  FORKED_STRAIT, 1
	warp_event 11,  0,  FORKED_STRAIT, 2
	warp_event 21, 10,  FORKED_STRAIT_EAST_EXIT, 1
	warp_event 21, 11,  FORKED_STRAIT_EAST_EXIT, 2
	warp_event  0, 10, FORKED_STRAIT_WEST_EXIT, 1
	warp_event  0, 11, FORKED_STRAIT_WEST_EXIT, 2

	db 2 ; coord events
	coord_event 10,  3, SCENE_DEFAULT, CredCheckLeft
	coord_event 11,  3, SCENE_DEFAULT, CredCheckRight

	db 2 ; bg events
	bg_event 20,  8, BGEVENT_READ, TropicalSign
	bg_event  0,  8, BGEVENT_READ, RainbowSign

	db 4 ; object events
	object_event  8,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ForkedStraitGateCopScript, -1
	object_event 16,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ForkedStraitGateScientist1Script, -1
	object_event  9, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ForkedStraitGateScientist2Script, -1
	object_event  4,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ForkedStraitGateScientist3Script, -1
	