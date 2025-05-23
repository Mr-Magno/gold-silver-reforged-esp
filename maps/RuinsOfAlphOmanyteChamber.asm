RuinsOfAlphOmanyteChamber_MapScripts:
	db 2 ; scene scripts
	scene_script .CheckWall ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .HiddenDoors

.CheckWall:
	end

.OpenWall:
	end

.DummyScene:
	end

.HiddenDoors:
	checkevent EVENT_SOLVED_OMANYTE_PUZZLE
	iffalse .FloorClosed
	return

.FloorClosed:
	changeblock 2, 2, $01 ; left floor
	changeblock 4, 2, $02 ; right floor
	return

.WallOpenScript:
	end

RuinsOfAlphOmanyteChamberPuzzle:
	refreshscreen
	writebyte UNOWNPUZZLE_OMANYTE
	special UnownPuzzle
	closetext
	iftrue .PuzzleComplete
	end

.PuzzleComplete:
	setevent EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_OMANYTE_PUZZLE
	setflag ENGINE_UNLOCKED_UNOWNS_L_TO_R
	setmapscene RUINS_OF_ALPH_INNER_CHAMBER, SCENE_RUINSOFALPHINNERCHAMBER_STRANGE_PRESENCE
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock 2, 2, $18 ; left hole
	changeblock 4, 2, $19 ; right hole
	reloadmappart
	playsound SFX_STRENGTH
	earthquake 80
	applymovement PLAYER, RuinsOfAlphOmanyteChamberSkyfallTopMovement
	playsound SFX_KINESIS
	waitsfx
	pause 20
	warpcheck
	end

RuinsOfAlphOmanyteChamberAncientReplica:
	jumptext RuinsOfAlphOmanyteChamberAncientReplicaText

RuinsOfAlphOmanyteChamberDescriptionSign:
	jumptext RuinsOfAlphOmanyteChamberDescriptionText

RuinsOfAlphOmanyteChamberWallPatternLeft:
	opentext
	writetext RuinsOfAlphOmanyteChamberWallPatternLeftText
	writebyte UNOWNWORDS_WATER
	special DisplayUnownWords
	closetext
	end

RuinsOfAlphOmanyteChamberWallPatternRight:
	checkevent EVENT_WALL_OPENED_IN_OMANYTE_CHAMBER
	iftrue .WallOpen
	opentext
	writetext RuinsOfAlphOmanyteChamberWallPatternRightText
	writebyte UNOWNWORDS_WATER
	special DisplayUnownWords
	closetext
	end

.WallOpen:
	opentext
	writetext RuinsOfAlphOmanyteChamberWallHoleText
	waitbutton
	closetext
	end

RuinsOfAlphOmanyteChamberSkyfallTopMovement:
	skyfall_top
	step_end

RuinsOfAlphOmanyteChamberWallPatternLeftText:
	text "Han aparecido unos"
	line "patrones en las"
	cont "paredes…"
	done

RuinsOfAlphOmanyteChamberUnownText:
; unused
	text "¡Es un texto UNOWN!"
	done

RuinsOfAlphOmanyteChamberWallPatternRightText:
	text "Han aparecido unos"
	line "patrones en las"
	cont "paredes…"
	done

RuinsOfAlphOmanyteChamberWallHoleText:
	text "¡Hay un agujero"
	line "en la pared!"
	done

RuinsOfAlphOmanyteChamberAncientReplicaText:
	text "Es una réplica de"
	line "un #MON"
	cont "antiguo."
	done

RuinsOfAlphOmanyteChamberDescriptionText:
	text "Este #MON"
	line "se desplazaba por"
	para "el mar con sus"
	line "diez tentáculos."
	done

RuinsOfAlphOmanyteChamber_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3,  9, RUINS_OF_ALPH_OUTSIDE, 3
	warp_event  4,  9, RUINS_OF_ALPH_OUTSIDE, 3
	warp_event  3,  3, RUINS_OF_ALPH_INNER_CHAMBER, 6
	warp_event  4,  3, RUINS_OF_ALPH_INNER_CHAMBER, 7

	db 0 ; coord events

	db 4 ; bg events
	bg_event  2,  3, BGEVENT_READ, RuinsOfAlphOmanyteChamberAncientReplica
	bg_event  5,  3, BGEVENT_READ, RuinsOfAlphOmanyteChamberAncientReplica
	bg_event  3,  2, BGEVENT_UP, RuinsOfAlphOmanyteChamberPuzzle
	bg_event  4,  2, BGEVENT_UP, RuinsOfAlphOmanyteChamberDescriptionSign

	db 0 ; object events
