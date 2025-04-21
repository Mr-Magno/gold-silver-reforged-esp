	const_def 2 ; object constants
	const ROUTE110_SWIMMER_GUY
	const ROUTE110_LASS1
	const ROUTE110_MONICA
	const ROUTE110_POKEFAN_M
	const ROUTE110_SUPER_NERD
	const ROUTE110_FRUIT_TREE

Route110_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MonicaCallback

.MonicaCallback:
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	checkcode VAR_WEEKDAY
	ifequal MONDAY, .MonicaAppears
	disappear ROUTE110_MONICA
	return

.MonicaAppears:
	appear ROUTE110_MONICA
	return


TrainerSwimmermSimon:
	trainer SWIMMERM, SIMON, EVENT_BEAT_SWIMMERM_SIMON, SwimmermSimonSeenText, SwimmermSimonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermSimonAfterBattleText
	waitbutton
	closetext
	end

Route110Lass1Script:
	jumptextfaceplayer Route110Lass1Text

Route110PokefanMScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer Route110PokefanMText

.mobile
	jumptextfaceplayer Route110PokefanMText_Mobile



MonicaScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	iftrue .Monday
	checkcode VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checkevent EVENT_MET_MONICA_OF_MONDAY
	iftrue .MetMonica
	writetext MeetMonicaText
	buttonsound
	setevent EVENT_MET_MONICA_OF_MONDAY
.MetMonica:
	writetext MonicaGivesGiftText
	buttonsound
	verbosegiveitem SHARP_BEAK
	iffalse .done
	setevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	writetext MonicaGaveGiftText
	waitbutton
	closetext
	end

.Monday:
	writetext MonicaMondayText
	waitbutton
.done:
	closetext
	end

.NotMonday:
	writetext MonicaNotMondayText
	waitbutton
	closetext
	end

Route110Sign:
	jumptext Route110SignText
	

TrainerEngineerRicardo:
	trainer ENGINEER, RICARDO, EVENT_BEAT_ENGINEER_RICARDO, EngineerRicardoSeenText, EngineerRicardoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext EngineerRicardoAfterText
	waitbutton
	closetext
	end
	



Route110HiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ROUTE_40_HIDDEN_HYPER_POTION

MovementData_0x1a621c:
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x1a6224:
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x1a622a:
	step UP
	step UP
	step UP
	step UP
	step_end

Route110FruitTree:
	fruittree FRUITTREE_ROUTE_110

EngineerRicardoSeenText:
	text "¡El aire aquí"
	line "sopla con fuerza!"
	done

EngineerRicardoBeatenText:
	text "¡Electrocutado!"
	done

EngineerRicardoAfterText:
	text "El escozor del"
	line "aire frío me"
	para "recuerda al de"
	line "una descarga"
	cont "eléctrica."
	done

SwimmermSimonSeenText:
	text "Ojalá el agua de"
	line "aquí fuese más"
	cont "cálida."
	done

SwimmermSimonBeatenText:
	text "¡Vale! ¡Me rindo!"
	done

SwimmermSimonAfterBattleText:
	text "Moverse constante-"
	line "mente ayuda a que"
	cont "el cuerpo se"
	cont "mantenga en calor."
	done

Route110Lass1Text:
	text "¿Has buscado"
	line "#MON en la"
	cont "hierba nevada?"
	done

Route110PokefanMText:
	text "Hay una mujer"
	line "misteriosa que"
	para "vive en esa casa"
	line "sobre el agua."
	done

Route110PokefanMText_Mobile:
	text "¡Mm! Mira a esos"
	line "entrenadores tan"
	cont "serios."

	para "¿Qué? ¿Qué?"
	done

MeetMonicaText:
	text "LUNA: Encantada de"
	line "conocerte. Soy"
	cont "LUNA, por lunes."
	done

MonicaGivesGiftText:
	text "¡Como prueba de"
	line "nuestra amistad,"
	cont "tengo un regalo"
	cont "para ti!"
	done

MonicaGaveGiftText:
	text "LUNA: Es un objeto"
	line "que aumenta el"
	cont "poder de los"
	cont "movimientos de"
	cont "tipo volador."

	para "Deberías dar este"
	line "objeto a un"
	cont "#MON pájaro."
	done

MonicaMondayText:
	text "LUNA: Mis hermanos"
	line "y hermanas están"
	cont "por todas partes."

	para "¡A ver si los"
	line "encuentras!"
	done

MonicaNotMondayText:
	text "LUNA: No creo que"
	line "hoy sea lunes."
	cont "¡Qué pena…!"
	done

Route110SignText:
	text "RUTA 110"
	
	para "CIUDAD ALEAR -"
	line "BOSQUE AZUL"
	done

Route110_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6, 13, ROUTE_109_ROUTE_110_GATE, 3
	warp_event  7, 13, ROUTE_109_ROUTE_110_GATE, 4
	warp_event  9,  5, ROUTE_110_SANDSTORM_HOUSE, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 10,  6, BGEVENT_READ, Route110Sign
	bg_event 33, 13, BGEVENT_ITEM, Route110HiddenHyperPotion

	db 6 ; object events
	object_event 22,  9, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermSimon, -1
	object_event 37, 11, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route110Lass1Script, -1
	object_event 44,  5, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MonicaScript, EVENT_ROUTE_40_MONICA_OF_MONDAY
	object_event 40,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route110PokefanMScript, -1
	object_event 40,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerEngineerRicardo, -1
	object_event 45,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route110FruitTree, -1
