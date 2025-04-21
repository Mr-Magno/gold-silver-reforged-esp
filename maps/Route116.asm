	const_def 2 ; object constants
	const ROUTE2_BUG_CATCHER3
	const ROUTE2_HIKER
	const ROUTE2_POKE_BALL2
	const ROUTE2_FRUIT_TREE

Route116_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .TeknosBridgeIsRepaired

.TeknosBridgeIsRepaired:
	setevent EVENT_TEKNOS_BRIDGE_REPAIRED
	return

TrainerJugglerDwayne:
	trainer JUGGLER, DWAYNE, EVENT_BEAT_JUGGLER_DWAYNE, JugglerDwayneSeenText, JugglerDwayneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerDwayneAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherDoug:
	trainer BUG_CATCHER, DOUG, EVENT_BEAT_BUG_CATCHER_DOUG, BugCatcherDougSeenText, BugCatcherDougBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherDougAfterBattleText
	waitbutton
	closetext
	end
	
TrainerHikerRussell:
	trainer HIKER, RUSSELL, EVENT_BEAT_HIKER_RUSSELL, HikerRussellSeenText, HikerRussellBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerRussellAfterBattleText
	waitbutton
	closetext
	end

Route116Sign:
	jumptext Route116SignText



Route116MaxPotion:
	itemball SUPER_POTION


Route116FruitTree:
	fruittree FRUITTREE_ROUTE_116


BugCatcherDougSeenText:
	text "¿Por qué a las"
	line "chicas no les"
	para "gustan los"
	line "#MON bicho?"
	done

BugCatcherDougBeatenText:
	text "¡Muy mal!"
	done

BugCatcherDougAfterBattleText:
	text "Los #MON bicho"
	line "parecen muñecos de"
	para "goma cuando les"
	line "aprietas la tripa."

	para "¡Me encanta"
	line "tocarlos!"
	done

HikerRussellSeenText:
	text "¡Intento cruzar"
	line "todo NIHON!"
	done

HikerRussellBeatenText:
	text "¡Estoy agotado!"
	done

HikerRussellAfterBattleText:
	text "Creo que me pararé"
	line "por aquí a"
	cont "descansar un rato."
	done
	
JugglerDwayneSeenText:
	text "¿Puedes aguantar"
	line "la mirada en la"
	cont "BALL?"
	done

JugglerDwayneBeatenText:
	text "¡Me tropecé!"
	done

JugglerDwayneAfterBattleText:
	text "Hacer malabares"
	line "no es nada fácil."
	done

Route116SignText:
	text "RUTA 116"
	
	para "PUEBLO BIRDON -"
	line "PUEBLO SÁNSCRITO"
	done


Route116_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 29, ROUTE_116_GATE, 1
	warp_event  9, 29, ROUTE_116_GATE, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6, 26, BGEVENT_READ, Route116Sign


	db 5 ; object events
	object_event  7, 24, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBugCatcherDoug, -1
	object_event  8, 17, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerHikerRussell, -1
	object_event  4, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route116MaxPotion, EVENT_ROUTE_2_MAX_POTION
	object_event  5, 20, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route116FruitTree, -1
	object_event  6,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerJugglerDwayne, -1
