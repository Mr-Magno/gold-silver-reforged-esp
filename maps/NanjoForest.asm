	const_def 2 ; object constants
	const NANJO_FOREST_YOUNGSTER
	const NANJO_FOREST_BUG_CATCHER
	const NANJO_FOREST_SILVER
	const NANJO_FOREST_ITEMBALL_1
	const NANJO_FOREST_ITEMBALL_2
	const NANJO_FOREST_ITEMBALL_3
	const NANJO_FOREST_ITEMBALL_4

NanjoForest_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TriWingYoungsterScript:
	faceplayer
	checkevent EVENT_RECEIVED_TRI_WING_FROM_YOUNGSTER
	iftrue .AlreadyGaveTriWing
	checkevent EVENT_REPAIRED_SHIP_FUEL_LINE
	iftrue .TryGivingTriWing
.NoTriWingYet
	opentext
	writetext NoTriWingYetText
	waitbutton
	closetext
	turnobject NANJO_FOREST_YOUNGSTER, RIGHT
	end
	
.TryGivingTriWing
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .NoTriWingYet
	checkevent EVENT_TRI_WING_YOUNGSTER_SETUP
	iffalse .SetUpTriWing
	opentext
	writetext HeresTriWingText
	waitbutton
	verbosegiveitem TRI_WING
	writetext WhatDoesTriWingDoText
	waitbutton
	closetext
	setevent EVENT_RECEIVED_TRI_WING_FROM_YOUNGSTER
	turnobject NANJO_FOREST_YOUNGSTER, RIGHT
	end
	
.SetUpTriWing
	opentext
	writetext NoTriWingYetText
	waitbutton
	closetext
	setevent EVENT_TRI_WING_YOUNGSTER_SETUP
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	turnobject NANJO_FOREST_YOUNGSTER, RIGHT
	end
	
.AlreadyGaveTriWing
	opentext
	writetext AlreadyGaveTriWingText
	waitbutton
	closetext
	turnobject NANJO_FOREST_YOUNGSTER, RIGHT
	end
	
TriWingBugCatcherScript:
	faceplayer
	opentext
	writetext TriWingBugCatcherText
	waitbutton
	closetext
	turnobject NANJO_FOREST_BUG_CATCHER, RIGHT
	end
	
NanjoForestSilverScript:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .TalkToSilverAfterBattle
	playmusic MUSIC_RIVAL_ENCOUNTER
	faceplayer
	opentext
	writetext NanjoForestSilverBefore
	waitbutton
	closetext
	checkevent EVENT_GOT_CRUIZE_FROM_OAK
	iftrue .Cruise
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .CHIKORITA
	winlosstext NanjoForestSilverTextWin, NanjoForestSilverTextLoss
	loadtrainer RIVAL2, RIVAL2_1_CRUIZE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.Cruise:
	winlosstext NanjoForestSilverTextWin, NanjoForestSilverTextLoss
	loadtrainer RIVAL2, RIVAL2_1_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.CHIKORITA:
	winlosstext NanjoForestSilverTextWin, NanjoForestSilverTextLoss
	loadtrainer RIVAL2, RIVAL2_1_FLAMBEAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .FinishBattle

.FinishBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext NanjoForestSilverAfter
	waitbutton
	closetext
	setevent EVENT_NANJO_FOREST_RIVAL_DEFEATED
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	playmapmusic
	end
	
.TalkToSilverAfterBattle
	faceplayer
	opentext
	writetext NanjoForestSilverAfter
	waitbutton
	closetext
	end
	

NanjoForestMaxRevive:
	itemball MAX_REVIVE

NanjoForestUltraBall:
	itemball ULTRA_BALL

NanjoForestFullHeal:
	itemball FULL_HEAL

NanjoForestFullRestore:
	itemball FULL_RESTORE
	
NanjoForestSign:
	jumptext NanjoForestSignText
	
NanjoForestSignText:
	text "“PROHIBIDO TIRAR"
	line "BASURA”"

	para "Por favor,"
	line "recógela tú mismo."
	done
	
NanjoForestSilverBefore:
	text "<RIVAL>: ¡Hola,"
	line "<PLAY_G>!"
	para "¡Cuánto tiempo!"

	para "He venido a las"
	line "ISLAS a seguir"
	cont "entrenando y"
	cont "estrechando lazos"
	cont "con mis #MON."

	para "He aprendido más"
	line "sobre cómo"
	cont "trabajar en equipo"
	cont "con ellos."

	para "Nos hemos unido"
	line "mucho últimamente."

	para "¡Pero también nos"
	line "hemos hecho mucho"
	cont "más fuertes!"

	para "¡Ya sabes lo que"
	line "eso significa!"
	done
	
NanjoForestSilverTextWin:
	text "¡Me has ganado!"
	done
	
NanjoForestSilverTextLoss:
	text "¡Bien!"
	done
	
NanjoForestSilverAfter:
	text "Uf, menudo"
	line "combate."

	para "Creo que ya he"
	line "entrenado lo"
	cont "suficiente por"
	cont "aquí."
	
	para "He escuchado que"
	line "AZUL está por"
	cont "las ISLAS lle-"
	cont "vando a cabo"
	cont "investigación."
	done
	
WhatDoesTriWingDoText:
	text "Me pregunto de"
	line "dónde viene."

	para "¿Podrá ser un"
	line "#MON?"
	done
	
HeresTriWingText:
	text "¡Oye, mira esto!"

	para "¡He encontrado"
	line "algo!"

	para "Es un ala tri-"
	line "color."

	para "Ni idea, pero"
	line "puedes quedártelo."
	done
	
AlreadyGaveTriWingText:
	text "Nunca sabes qué te"
	line "podrás encontrar"
	cont "por aquí."
	done
	
NoTriWingYetText:
	text "Estoy buscando"
	line "cosas interesantes"
	cont "que llegan a la"
	cont "orilla."

	para "Encuentro muchos"
	line "objetos como"
	cont "POCIONES y CURA"
	cont "TOTAL."

	para "¡Una vez incluso"
	line "encontré una"
	cont "PEPITA!"

	para "Seguro que tú"
	line "también encuentras"
	cont "algo que merezca"
	cont "la pena."

	para "Vuelve en otra"
	line "ocasión para"
	cont "buscar conmigo."

	para "Compartiré algo de"
	line "lo que encuentre"
	cont "contigo."
	done
	
TriWingBugCatcherText:
	text "¡Mi hermano y yo"
	line "encontramos un"
	para "montón de cosas"
	line "chulas que llegan"
	cont "a la orilla!"

	para "¡No todo es"
	line "basura, a veces"
	cont "encontramos"
	cont "tesoros!"
	done	

NanjoForest_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0, 22, URASOE_TRAIL, 3
	warp_event  0, 23, URASOE_TRAIL, 4
	warp_event 43,  5, GREAT_EAST_STRAIT, 1
	warp_event 43,  4, GREAT_EAST_STRAIT, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event 29, 25, BGEVENT_READ, NanjoForestSign

	db 7 ; object events
	object_event 27, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TriWingYoungsterScript, -1
	object_event 27, 10, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TriWingBugCatcherScript, -1
	object_event  6, 12, SPRITE_SILVER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NanjoForestSilverScript, EVENT_NANJO_FOREST_RIVAL_DEFEATED
	object_event 26, 34, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestMaxRevive, EVENT_NANJO_FOREST_MAX_REVIVE
	object_event 15,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestUltraBall, EVENT_NANJO_FOREST_ULTRA_BALL
	object_event  8, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestFullHeal, EVENT_NANJO_FOREST_FULL_HEAL
	object_event 31, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NanjoForestFullRestore, EVENT_NANJO_FOREST_FULL_RESTORE
