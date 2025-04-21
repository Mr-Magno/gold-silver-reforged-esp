	const_def 2 ; object constants
	const ROUTE36RUINSOFALPHGATE_OFFICER
	const ROUTE36RUINSOFALPHGATE_GRAMPS
	const ROUTE36RUINSOFALPHGATE_RIVAL

Route112StandCityGate_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneRoute112StandCityGateRival ; SCENE_DEFAULT
	scene_script .SceneRoute112StandCityGateNothing ;

	db 0 ; callbacks

.SceneRoute112StandCityGateRival
	end

.SceneRoute112StandCityGateNothing
	end
	
R36GateMoveIntoPlace1:
	applymovement PLAYER, R36M1
	jump Route36GateRivalScript
	end
	
R36GateMoveIntoPlace2:
	applymovement PLAYER, R36M2
	jump Route36GateRivalScript
	end
	
R36GateMoveIntoPlace3:
	applymovement PLAYER, R36M3
	jump Route36GateRivalScript
	end
	
R36GateMoveIntoPlace4:
	applymovement PLAYER, R36M4
	jump Route36GateRivalScript
	end
	
Route36GateRivalScript:
	disappear ROUTE36RUINSOFALPHGATE_RIVAL
	pause 10
	playsound SFX_EXIT_BUILDING
	waitsfx
	playmusic MUSIC_RIVAL_ENCOUNTER
	moveobject ROUTE36RUINSOFALPHGATE_RIVAL, 4, 7
	appear ROUTE36RUINSOFALPHGATE_RIVAL
	applymovement ROUTE36RUINSOFALPHGATE_RIVAL, R36DummyMove
	pause 20
	opentext
	writetext R36GSilverGreets
	waitbutton
	closetext
	applymovement ROUTE36RUINSOFALPHGATE_RIVAL, R36GSilverWalksToYou
	opentext
	writetext R36GSilverGreets2
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ROUTE36RUINSOFALPHGATE_RIVAL, 15
	opentext
	writetext R36GSilverGreets3
	waitbutton
	closetext
	pause 5
	applymovement ROUTE36RUINSOFALPHGATE_RIVAL, SilverChecksGuard
	pause 25
	opentext
	writetext R36GSilverGreets3_5
	waitbutton
	closetext
	turnobject ROUTE36RUINSOFALPHGATE_RIVAL, RIGHT
	opentext
	writetext R36GSilverGreets4
	waitbutton
	closetext
	applymovement ROUTE36RUINSOFALPHGATE_RIVAL, SilverChecksGuard2
	pause 5
	checkevent EVENT_GOT_CRUIZE_FROM_OAK
	iftrue .R36GCruise
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .R36GCHIKORITA
	winlosstext Route36GSilverWinText, Route36GSilverLossText
	loadtrainer RIVAL1, RIVAL1_4_CRUIZE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .R36GAfterBattle

.R36GCruise:
	winlosstext Route36GSilverWinText, Route36GSilverLossText
	loadtrainer RIVAL1, RIVAL1_4_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .R36GAfterBattle

.R36GCHIKORITA:
	winlosstext Route36GSilverWinText, Route36GSilverLossText
	loadtrainer RIVAL1, RIVAL1_4_FLAMBEAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .R36GAfterBattle

.R36GAfterBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext Route36GRivalAfterText
	waitbutton
	closetext
	applymovement ROUTE36RUINSOFALPHGATE_RIVAL, Route36GRivalBattleExitMovement
	playsound SFX_ENTER_DOOR
	disappear ROUTE36RUINSOFALPHGATE_RIVAL
	setscene SCENE_ROUTE_36_RUINS_OF_ALPH_GATE_NOTHING
	setevent EVENT_GAVE_KENYA
	waitsfx
	playmapmusic
	end

	
Route112StandCityGateOfficerScript:
	jumptextfaceplayer Route112StandCityGateOfficerText

Route112StandCityGateGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_STAND_CITY_ROCKETS_DEPARTED
	iftrue .RocketsGoneRoute36Gate
	writetext StandCitySomethingIsUpText
	waitbutton
	closetext
	end
	
.RocketsGoneRoute36Gate
	writetext StandCityIsDoingBetterText
	waitbutton
	closetext
	end

SilverChecksGuard2:
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

SilverChecksGuard:
	step LEFT
	step LEFT
	step_end

Route36GRivalBattleExitMovement:
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step_end

R36DummyMove:
	step_end
	
R36M1:
	step DOWN
	step RIGHT
	step DOWN
	step_end
	
R36M2:
	step DOWN
	step DOWN
	step_end
	
R36M3:
	step LEFT
	step DOWN
	step DOWN
	step_end
	
R36M4:
	step DOWN
	step LEFT
	step LEFT
	step DOWN
	step_end
	
R36GSilverWalksToYou:
	step UP
	step UP
	step UP
	step_end
	
Route36GSilverWinText:
	text "What? Again!?"
	done
	
Route36GSilverLossText:
	text "¡Jaja! ¡Toma!"
	done
	
Route36GRivalAfterText:
	text "¡Uau, sí que te"
	line "estás esforzando"
	para "en criar a tus"
	line "#MON para que"
	cont "sean tan fuertes!"

	para "¡Voy a tener que"
	line "hacerlo aún más!"

	para "Por cierto,"
	line "cuidado si vas a"
	cont "CIUDAD ENHIESTA."

	para "Parece que hay"
	line "algunos #MON"
	cont "enfermos."

	para "¡No dejes que los"
	line "tuyos se enfermen"
	cont "si quieres que se"
	cont "fortalezcan!"

	para "¡Bueno, me voy!"
	line "¡Nos vemos!"
	done
	
R36GSilverGreets:
	text "¡<PLAY_G>!"
	done
	
R36GSilverGreets2:
	text "¡Cuánto tiempo!"

	para "¿Cómo te ha ido"
	line "en tu viaje?"
	para "¡Espera!"

	para "¡La verdad es que"
	line "no me importa!"

	para "¡Lo que quiero"
	line "saber es cómo de"
	para "fuerte se ha hecho"
	line "tu equipo!"

	para "¡Mis #MON son"
	line "muy fuertes!"

	para "¡Ya casi estoy"
	line "listo para la"
	cont "LIGA!"

	para "¡Te lo voy a"
	line "demostrar!"
	done
	
R36GSilverGreets3:
	text "¡Ah, espera!"

	para "¡Debemos asegurar-"
	line "nos de que podemos"
	cont "combatir aquí!"
	done
	
R36GSilverGreets3_5:
	text "…"
	done
	
R36GSilverGreets4:
	text "¡Bien!"

	para "¡Ha dicho que"
	line "podemos mientras"
	cont "tengamos cuidado!"

	para "¡Allá voy!"
	done
	
StandCityIsDoingBetterText:
	text "Me alegra que los"
	line "#MON se sientan"
	cont "mejor."
	done

Route112StandCityGateOfficerText:
	text "CIUDAD ENHIESTA es"
	line "conocida por sus"
	cont "preciosos parques"
	cont "y espacios verdes."
	done

StandCitySomethingIsUpText:
	text "Está pasando"
	line "algo en CIUDAD"
	cont "ENHIESTA."

	para "Juraría que he"
	line "visto a unos tipos"
	cont "que parecen"
	cont "miembros del"
	cont "TEAM ROCKET."
	done

Route112StandCityGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_112, 1
	warp_event  5,  0, ROUTE_112, 2
	warp_event  4,  7, STAND_CITY, 7
	warp_event  5,  7, STAND_CITY, 8

	db 4 ; coord events
	coord_event 3, 1, SCENE_DEFAULT, R36GateMoveIntoPlace1
	coord_event 4, 1, SCENE_DEFAULT, R36GateMoveIntoPlace2
	coord_event 5, 1, SCENE_DEFAULT, R36GateMoveIntoPlace3
	coord_event 6, 1, SCENE_DEFAULT, R36GateMoveIntoPlace4

	db 0 ; bg events

	db 3 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route112StandCityGateOfficerScript, -1
	object_event  7,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route112StandCityGateGrampsScript, -1
	object_event  4,  9, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GAVE_KENYA
