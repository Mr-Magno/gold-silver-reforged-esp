	const_def 2 ; object constants
	const KOBANISLAND_GRANNY
	const KOBANISLAND_TWIN
	const KOBANISLAND_GRAMPS
	const KOBANISLAND_CLAIR

KobanIsland_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_KOBAN
	return

KobanIslandTeacherScript:
	jumptextfaceplayer KobanIslandTeacherText

KobanIslandGrampsScript:
	jumptextfaceplayer KobanIslandGrampsText

KobanIslandFisherScript:
	jumptextfaceplayer KobanIslandFisherText

KobanPokecenterSign:
	jumpstd pokecentersign

KobanMartSign:
	jumpstd martsign

KobanIslandSign:
	jumptext KobanIslandSignText

DragonsMawSign:
	jumptext DragonsMawSignText
	
KobanIslandClairScript:
	faceplayer
	opentext
	writetext ClairGreetingsText
	waitbutton
	closetext
	wait 2
	checkcode VAR_FACING
	ifequal RIGHT, .ClairWalksAroundPlayer
	applymovement KOBANISLAND_CLAIR, ClairLeavesMovement
	disappear KOBANISLAND_CLAIR
	setevent EVENT_KOBAN_ISLAND_CLAIR_BLOCKING_DRAGONS_MAW
	clearevent EVENT_CLAIRS_HOUSE_HIDE_CLAIR
	end

.ClairWalksAroundPlayer
	applymovement KOBANISLAND_CLAIR, ClairLeavesMovement2
	disappear KOBANISLAND_CLAIR
	setevent EVENT_KOBAN_ISLAND_CLAIR_BLOCKING_DRAGONS_MAW
	clearevent EVENT_CLAIRS_HOUSE_HIDE_CLAIR
	end

KobanIslandTeacherText:
	text "Las corrientes de"
	line "agua mantienen"
	cont "esta isla algo más"
	cont "cálida que el"
	cont "BOSQUE AZUL, al"
	cont "este de aquí."
	done

KobanIslandGrampsText:
	text "Es una vieja"
	line "tradición en este"
	cont "pueblo que los"
	cont "entrenadores críen"
	cont "dragones."
	done

KobanIslandFisherText:
	text "¡Un día quiero"
	line "criar un dragón!"
	done

KobanIslandSignText:
	text "ISLA KOBAN"
	
	para "Una pequeña isla"
	line "con una gran"
	cont "historia"
	done

DragonsMawSignText:
	text "MANDÍBULA DRAGÓN"
	done
	
ClairGreetingsText:
	text "Hola."

	para "¿Quién eres?"
	
	para "…"
	
	para "Vale, <PLAY_G>,"
	line "me llamo DÉBORA."
	
	para "Soy la mejor"
	line "maestra dragón de"
	cont "NIHON."

	para "Bueno… la segunda"
	line "mejor."

	para "Pero a lo que voy"
	line "es que detrás de"
	cont "mí se encuentra la"
	cont "MANDÍBULA DRAGÓN."

	para "Es un lugar"
	line "místico, y se dice"
	cont "que es donde"
	cont "vivieron los"
	cont "primeros #MON"
	cont "dragón."
	
	para "¿Tienes algún"
	line "#MON dragón?"
	cont "Si quieres ser"
	cont "respetado entre"
	cont "los entrenadores"
	cont "dragón, deberías"
	cont "entrenar en esta"
	cont "cueva."
	
	para "Dentro hay muchos"
	line "de ellos."
	
	para "Uno de ellos tiene"
	line "la DRAGOESFERA."
	
	para "Encuentra al"
	line "entrenador que la"
	cont "tiene, y tráemela."
	
	para "Este es tu primer"
	line "paso para conver-"
	cont "tirte en un digno"
	cont "entrenador dragón."

	para "Te estaré esperan-"
	line "do en mi casa."
	done

ClairLeavesMovement:
	step LEFT
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end
	
ClairLeavesMovement2:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

KobanIsland_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  5,  5, KOBAN_CLAIRS_HOUSE, 1
	warp_event  5, 10, KOBAN_MART, 1
	warp_event  9, 10, KOBAN_POKECENTER_1F, 1
	warp_event 15,  9, KOBAN_FISHER_HOUSE, 1
	warp_event 13,  5, DRAGONS_MAW, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event 10, 10, BGEVENT_READ, KobanPokecenterSign
	bg_event  6, 10, BGEVENT_READ, KobanMartSign
	bg_event 10, 14, BGEVENT_READ, KobanIslandSign
	bg_event 14,  6, BGEVENT_READ, DragonsMawSign

	db 4 ; object events
	object_event  9,  6, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KobanIslandTeacherScript, -1
	object_event  8, 12, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, KobanIslandFisherScript, -1
	object_event 13, 11, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KobanIslandGrampsScript, -1
	object_event 13,  6, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0 , -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KobanIslandClairScript, EVENT_KOBAN_ISLAND_CLAIR_BLOCKING_DRAGONS_MAW
