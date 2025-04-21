RuinsOfAlphAerodactylChamber_MapScripts:
	db 2 ; scene scripts
	scene_script .CheckWall ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .HiddenDoors

.CheckWall:
	end

.OpenWall:
	priorityjump .WallOpenScript
	end

.DummyScene:
	end

.HiddenDoors:
	checkevent EVENT_SOLVED_AERODACTYL_PUZZLE
	iffalse .FloorClosed
	return

.FloorClosed:
	changeblock 2, 2, $01 ; left floor
	changeblock 4, 2, $02 ; right floor
	return

.WallOpenScript:
	end

RuinsOfAlphAerodactylChamberPuzzle:
	refreshscreen
	writebyte UNOWNPUZZLE_AERODACTYL
	special UnownPuzzle
	closetext
	iftrue .PuzzleComplete
	end

.PuzzleComplete:
	setevent EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_AERODACTYL_PUZZLE
	setflag ENGINE_UNLOCKED_UNOWNS_S_TO_W
	setmapscene RUINS_OF_ALPH_INNER_CHAMBER, SCENE_RUINSOFALPHINNERCHAMBER_STRANGE_PRESENCE
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock 2, 2, $18 ; left hole
	changeblock 4, 2, $19 ; right hole
	reloadmappart
	playsound SFX_STRENGTH
	earthquake 80
	applymovement PLAYER, RuinsOfAlphAerodactylChamberSkyfallTopMovement
	playsound SFX_KINESIS
	waitsfx
	pause 20
	warpcheck
	end

RuinsOfAlphAerodactylChamberAncientReplica:
	jumptext RuinsOfAlphAerodactylChamberAncientReplicaText

RuinsOfAlphAerodactylChamberDescriptionSign:
	jumptext RuinsOfAlphAerodactylChamberDescriptionText

RuinsOfAlphAerodactylChamberWallPatternLeft:
	opentext
	writetext RuinsOfAlphAerodactylChamberWallPatternLeftText
	writebyte UNOWNWORDS_LIGHT
	special DisplayUnownWords
	closetext
	end

RuinsOfAlphAerodactylChamberWallPatternRight:
	checkevent EVENT_WALL_OPENED_IN_AERODACTYL_CHAMBER
	iftrue .WallOpen
	opentext
	writetext RuinsOfAlphAerodactylChamberWallPatternRightText
	writebyte UNOWNWORDS_LIGHT
	special DisplayUnownWords
	closetext
	end

.WallOpen:
	opentext
	writetext RuinsOfAlphAerodactylChamberWallHoleText
	waitbutton
	closetext
	end

RuinsOfAlphAerodactylChamberSkyfallTopMovement:
	skyfall_top
	step_end

RuinsOfAlphAerodactylChamberWallPatternLeftText:
	text "Han aparecido unos"
	line "patrones en las"
	cont "paredes…"
	done

RuinsOfAlphAerodactylChamberUnownText:
; unused
	text "¡Es un texto UNOWN!"
	done

RuinsOfAlphAerodactylChamberWallPatternRightText:
	text "Han aparecido unos"
	line "patrones en las"
	cont "paredes…"
	done

RuinsOfAlphAerodactylChamberWallHoleText:
	text "¡Hay un agujero"
	line "en la pared!"
	done

RuinsOfAlphAerodactylChamberAncientReplicaText:
	text "Es una réplica de"
	line "un #MON"
	cont "antiguo."
	done

RuinsOfAlphAerodactylChamberDescriptionText:
	text "Este #MON"
	line "volador ataca a"
	para "su presa con sus"
	line "fuertes colmillos."
	done

RuinsOfAlphAerodactylChamber_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3,  9, RUINS_OF_ALPH_OUTSIDE, 4
	warp_event  4,  9, RUINS_OF_ALPH_OUTSIDE, 4
	warp_event  3,  3, RUINS_OF_ALPH_INNER_CHAMBER, 8
	warp_event  4,  3, RUINS_OF_ALPH_INNER_CHAMBER, 9

	db 0 ; coord events

	db 4 ; bg events
	bg_event  2,  3, BGEVENT_READ, RuinsOfAlphAerodactylChamberAncientReplica
	bg_event  5,  3, BGEVENT_READ, RuinsOfAlphAerodactylChamberAncientReplica
	bg_event  3,  2, BGEVENT_UP, RuinsOfAlphAerodactylChamberPuzzle
	bg_event  4,  2, BGEVENT_UP, RuinsOfAlphAerodactylChamberDescriptionSign

	db 0 ; object events
