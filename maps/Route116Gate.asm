	const_def 2 ; object constants
	const ROUTE2GATE_SCIENTIST
	const ROUTE2GATE_ROCKET1
	const ROUTE2GATE_ROCKET2

Route116Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
Route116GateRocket1Script:
	opentext
	writetext Route116GateRocket1Text
	waitbutton
	closetext
	end
	
Route116GateRocket2Script:
	opentext
	writetext Route116GateRocket2Text
	waitbutton
	closetext
	end

Route116GateScientistScript:
	faceplayer
	opentext
	checkevent EVENT_RIVAL_BURNED_TOWER
	iftrue .NoAzaleaRockets
	writetext Route116GateScientistText
	waitbutton
	closetext
	end

.NoAzaleaRockets:
	writetext Route116GateScientistTextNoRockets
	waitbutton
	closetext
	end

Route116GateAideScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_EVERSTONE_FROM_ELM
	iftrue .AlreadyGotEverstone
	writetext AideGivesEverstoneText1
	buttonsound
	verbosegiveitem EVERSTONE
	iffalse .NoRoomForEverstone
	writetext AideGivesEverstoneText2
	waitbutton
	setevent EVENT_GOT_EVERSTONE_FROM_ELM
	closetext
	end

.NoRoomForEverstone:
	writetext AideGivesEverstoneText3
	waitbutton
	closetext
	end
	
.AlreadyGotEverstone
	writetext AideGivesEverstoneText2
	buttonsound
	closetext
	end

AideGivesEverstoneText1:
	text "¡Hola,"
	line "<PLAY_G>!"
	
	para "¿Me recuerdas?"
	
	para "Soy un AYUDANTE"
	line "del PROF. OAK."
	
	para "Se le olvidó darte"
	line "esto antes de"
	cont "que te fueras."
	done

AideGivesEverstoneText2:
	text "La PIEDRAETERNA"
	line "evita evolucionar"
	cont "a quien la tenga"
	cont "equipada."
	done

AideGivesEverstoneText3:
	text "Oh, cielos…"

	para "No tienes espacio"
	cont "para esto."
	done
	
Route116GateRocket1Text:
	text "Jujujuju…"
	para "Nuestro equipo de"
	line "caza de SLOWPOKE"
	para "debería volver"
	line "pronto con el"
	cont "siguiente lote de"
	cont "COLAS…"
	done
	
Route116GateRocket2Text:
	text "Jejejeje…"
	para "Nadie se dará"
	line "cuenta de que le"
	para "faltan COLAS a los"
	line "SLOWPOKE hasta que"
	cont "sea demasiado"
	cont "tarde…"
	done

Route116GateScientistText:
	text "Esos hombres"
	line "parecen miembros"
	cont "del TEAM ROCKET."

	para "¿De verdad lo son?"
	para "Ojalá dejasen de"
	line "bloquear el paso,"
	cont "pero les tengo"
	cont "miedo…"
	done
	
Route116GateScientistTextNoRockets:
	text "Si sigues por"
	line "aquí, hay un"
	para "sinuoso laberinto"
	line "de árboles y una"
	cont "cueva difícil de"
	cont "atravesar."

	para "¡Asegúrate de"
	line "estar preparado!"
	done

Route116Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_116, 1
	warp_event  5,  0, ROUTE_116, 2
	warp_event  4,  7, BIRDON_TOWN, 7
	warp_event  5,  7, BIRDON_TOWN, 8

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route116GateScientistScript, -1
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route116GateRocket1Script, EVENT_RIVAL_BURNED_TOWER
	object_event  5,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route116GateRocket2Script, EVENT_RIVAL_BURNED_TOWER
	object_event  3,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route116GateAideScript, EVENT_BIRDON_AIDE_HIDDEN