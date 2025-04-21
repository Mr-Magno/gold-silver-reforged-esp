	const_def 2 ; object constants
	const RUINSOFALPHKABUTOCHAMBER_RECEPTIONIST
	const RUINSOFALPHKABUTOCHAMBER_SCIENTIST

RuinsOfAlphKabutoChamber_MapScripts:
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
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalse .FloorClosed
	return

.FloorClosed:
	changeblock 2, 2, $01 ; left floor
	changeblock 4, 2, $02 ; right floor
	return

.WallOpenScript:
	end

RuinsOfAlphKabutoChamberReceptionistScript:
	jumptextfaceplayer RuinsOfAlphKabutoChamberReceptionistText

RuinsOfAlphKabutoChamberPuzzle:
	refreshscreen
	writebyte UNOWNPUZZLE_KABUTO
	special UnownPuzzle
	closetext
	iftrue .PuzzleComplete
	end

.PuzzleComplete:
	setevent EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_KABUTO_PUZZLE
	setflag ENGINE_UNLOCKED_UNOWNS_A_TO_K
	setevent EVENT_RUINS_OF_ALPH_KABUTO_CHAMBER_RECEPTIONIST
	setmapscene RUINS_OF_ALPH_INNER_CHAMBER, SCENE_RUINSOFALPHINNERCHAMBER_STRANGE_PRESENCE
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock 2, 2, $18 ; left hole
	changeblock 4, 2, $19 ; right hole
	reloadmappart
	playsound SFX_STRENGTH
	earthquake 80
	applymovement PLAYER, RuinsOfAlphKabutoChamberSkyfallTopMovement
	playsound SFX_KINESIS
	waitsfx
	pause 20
	warpcheck
	end

RuinsOfAlphKabutoChamberScientistScript:
	faceplayer
	opentext
	checkcode VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .AllUnownCaught
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue .WallOpen
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalse .PuzzleIncomplete
	writetext UnknownText_0x589b8
	buttonsound
.PuzzleIncomplete:
	writetext UnknownText_0x588f5
	waitbutton
	closetext
	turnobject RUINSOFALPHKABUTOCHAMBER_SCIENTIST, UP
	end

.WallOpen:
	writetext UnknownText_0x5897c
	waitbutton
	closetext
	end

.AllUnownCaught:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotAllUnown
	waitbutton
	closetext
	end

RuinsOfAlphKabutoChamberAncientReplica:
	jumptext RuinsOfAlphKabutoChamberAncientReplicaText

RuinsOfAlphKabutoChamberDescriptionSign:
	jumptext RuinsOfAlphKabutoChamberDescriptionText

RuinsOfAlphKabutoChamberWallPatternLeft:
	opentext
	writetext RuinsOfAlphKabutoChamberWallPatternLeftText
	writebyte UNOWNWORDS_ESCAPE
	special DisplayUnownWords
	closetext
	end

RuinsOfAlphKabutoChamberWallPatternRight:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue .WallOpen
	end

.WallOpen:
	end

RuinsOfAlphKabutoChamberSkyfallTopMovement:
	skyfall_top
	step_end

RuinsOfAlphKabutoChamberReceptionistText:
	text "Bienvenidos a esta"
	line "cámara."

	para "Hay paneles móvi-"
	line "les que muestran"
	para "a un #MON"
	line "dibujado por los"
	cont "antepasados."

	para "Mueve los paneles"
	line "para formar el"
	cont "dibujo."

	para "A la derecha hay"
	line "una descripción"
	cont "del #MON."
	done

UnknownText_0x588f5:
	text "Recientemente,"
	line "han aparecido"
	cont "unos extraños"
	cont "patrones en la"
	cont "pared."

	para "Es raro. Hace"
	line "poco no estaban"
	cont "aquí…"

	para "Deberías echarles"
	line "un vistazo."
	done

UnknownText_0x5897c:
	text "¡Ah! ¡Aquí hay"
	line "otro agujero!"

	para "¡Es lo suficien-"
	line "temente grande"
	cont "como para"
	cont "meterse por él!"
	done

UnknownText_0x589b8:
	text "¡Ese temblor fue"
	line "muy aterrador!"

	para "Pero me preocupa"
	line "más esta pared"
	cont "de aquí…"
	done

RuinsOfAlphKabutoChamberUnusedText:
; unused
	text "¡Los patrones de"
	line "la pared parecen"
	cont "palabras!"

	para "Y los paneles"
	line "deslizantes"

	para "parecen alguna"
	line "señal de algo."

	para "Creo que hacen"
	line "aparecer #MON,"

	para "pero no está"
	line "claro todavía…"
	done

RuinsOfAlphKabutoChamberWallPatternLeftText:
	text "Han aparecido unos"
	line "patrones en las"
	cont "paredes…"
	done

RuinsOfAlphKabutoChamberUnownText:
; unused
	text "¡Es un texto UNOWN!"
	done

RuinsOfAlphKabutoChamberWallPatternRightText:
	text "Han aparecido unos"
	line "patrones en las"
	cont "paredes…"
	done

RuinsOfAlphKabutoChamberWallHoleText:
	text "¡Hay un agujero"
	line "en la pared!"
	done

RuinsOfAlphKabutoChamberAncientReplicaText:
	text "Es una réplica de"
	line "un #MON"
	cont "antiguo."
	done

RuinsOfAlphKabutoChamberDescriptionText:
	text "Un #MON que se"
	line "oculta en el mar."

	para "Con sus ojos"
	line "explora la zona."
	done

RuinsOfAlphKabutoChamber_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3,  9, RUINS_OF_ALPH_OUTSIDE, 2
	warp_event  4,  9, RUINS_OF_ALPH_OUTSIDE, 2
	warp_event  3,  3, RUINS_OF_ALPH_INNER_CHAMBER, 4
	warp_event  4,  3, RUINS_OF_ALPH_INNER_CHAMBER, 5

	db 0 ; coord events

	db 4 ; bg events
	bg_event  2,  3, BGEVENT_READ, RuinsOfAlphKabutoChamberAncientReplica
	bg_event  5,  3, BGEVENT_READ, RuinsOfAlphKabutoChamberAncientReplica
	bg_event  3,  2, BGEVENT_UP, RuinsOfAlphKabutoChamberPuzzle
	bg_event  4,  2, BGEVENT_UP, RuinsOfAlphKabutoChamberDescriptionSign

	db 1 ; object events
	object_event  5,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphKabutoChamberReceptionistScript, EVENT_RUINS_OF_ALPH_KABUTO_CHAMBER_RECEPTIONIST
