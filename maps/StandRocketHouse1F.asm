	const_def 2 ; object constants
	const StandRocketHouse1F_ROCKET
	const StandRocketHouse1F_SILVER

StandRocketHouse1F_MapScripts:
	db 3 ; scene scripts
	scene_script .SceneStandRocketHouse1FRocketSpots ; SCENE_DEFAULT
	scene_script .SceneStandRocketHouse1FNothing ;
	scene_script .SceneStandRocketHouse1FBaseUncovered ;

	db 1 ; callbacks	
	callback MAPCALLBACK_TILES, .CheckStairsUncovered


.CheckStairsUncovered:
	checkevent EVENT_ROUTE_43_GATE_ROCKETS
	iffalse .NoStairsYet
	changeblock 19, 7, $2a 
	return

.NoStairsYet:
	return

.SceneStandRocketHouse1FRocketSpots
	end

.SceneStandRocketHouse1FNothing
	end
	
.SceneStandRocketHouse1FBaseUncovered
	end
SilverFindsStairsLeft:
	opentext
	writetext SilverShowsUpInBase
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 20
	turnobject PLAYER, DOWN
	pause 5
	moveobject StandRocketHouse1F_SILVER, 13, 5
	appear StandRocketHouse1F_SILVER
	applymovement StandRocketHouse1F_SILVER, SilverWalksToHiddenStairsMovementPart2
	opentext
	writetext SilverTellsYouAboutHiddenStairs
	waitbutton
	closetext
	applymovement StandRocketHouse1F_SILVER, SilverWalksToHiddenStairsMovement2Part2
	applymovement PLAYER, SilverWalksToHiddenStairsMovement2Part2
	jump SilverFindsStairsMain
	end
	
SilverFindsStairsDown:
	opentext
	writetext SilverShowsUpInBase
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 20
	pause 5
	moveobject StandRocketHouse1F_SILVER, 14, 5
	appear StandRocketHouse1F_SILVER
	applymovement StandRocketHouse1F_SILVER, SilverWalksToHiddenStairsMovement
	opentext
	writetext SilverTellsYouAboutHiddenStairs
	waitbutton
	closetext
	applymovement StandRocketHouse1F_SILVER, SilverWalksToHiddenStairsMovement2
	applymovement PLAYER, SilverWalksToHiddenStairsMovement2
	jump SilverFindsStairsMain
	end
	
SilverFindsStairsMain:
	opentext
	writetext SilverTellsYouAboutHiddenStairs2
	waitbutton
	closetext
	playsound SFX_STRENGTH
	earthquake 80
	waitsfx
	playsound SFX_ENTER_DOOR
	changeblock 19, 7, $2a ; stairs
	reloadmappart
	pause 15
	opentext
	writetext SilverLetsGoDownThere
	waitbutton
	closetext
	applymovement StandRocketHouse1F_SILVER, StairsTimeOneStepDown
	playsound SFX_EXIT_BUILDING
	disappear StandRocketHouse1F_SILVER
	waitsfx
	setscene SCENE_SAFARI_ZONE_WARDENS_HOME_NOTHING
	setevent EVENT_ROUTE_43_GATE_ROCKETS
	end
	
RocketSpotsTop1:
	turnobject StandRocketHouse1F_ROCKET, UP
	playmusic MUSIC_ROCKET_ENCOUNTER
	showemote EMOTE_SHOCK, StandRocketHouse1F_ROCKET, 30
	applymovement StandRocketHouse1F_ROCKET, ShockedRocket2Steps 
	turnobject PLAYER, DOWN
	opentext
	writetext RocketShockedText
	waitbutton
	closetext
	winlosstext ShockedRocketWinText, ShockedRocketLossText
	loadtrainer GRUNTM, GRUNTM_5
	startbattle
	reloadmapafterbattle
	turnobject StandRocketHouse1F_ROCKET, UP
	setscene SCENE_SAFARI_ZONE_WARDENS_HOME_NOTHING
	end
RocketSpotsTop2:
	turnobject StandRocketHouse1F_ROCKET, UP
	playmusic MUSIC_ROCKET_ENCOUNTER
	showemote EMOTE_SHOCK, StandRocketHouse1F_ROCKET, 30
	applymovement StandRocketHouse1F_ROCKET, ShockedRocket1Step 
	turnobject PLAYER, DOWN
	opentext
	writetext RocketShockedText
	waitbutton
	closetext
	winlosstext ShockedRocketWinText, ShockedRocketLossText
	loadtrainer GRUNTM, GRUNTM_5
	startbattle
	reloadmapafterbattle
	turnobject StandRocketHouse1F_ROCKET, UP
	setscene SCENE_SAFARI_ZONE_WARDENS_HOME_NOTHING
	end
RocketSpotsTop3:
	turnobject StandRocketHouse1F_ROCKET, UP
	playmusic MUSIC_ROCKET_ENCOUNTER
	showemote EMOTE_SHOCK, StandRocketHouse1F_ROCKET, 30
	turnobject PLAYER, DOWN
	opentext
	writetext RocketShockedText
	waitbutton
	closetext
	winlosstext ShockedRocketWinText, ShockedRocketLossText
	loadtrainer GRUNTM, GRUNTM_5
	startbattle
	reloadmapafterbattle
	turnobject StandRocketHouse1F_ROCKET, UP
	setscene SCENE_SAFARI_ZONE_WARDENS_HOME_NOTHING
	end
RocketSpotsBottom1:
	turnobject StandRocketHouse1F_ROCKET, DOWN
	playmusic MUSIC_ROCKET_ENCOUNTER
	showemote EMOTE_SHOCK, StandRocketHouse1F_ROCKET, 30
	turnobject PLAYER, UP
	opentext
	writetext RocketShockedText
	waitbutton
	closetext
	winlosstext ShockedRocketWinText, ShockedRocketLossText
	loadtrainer GRUNTM, GRUNTM_5
	startbattle
	reloadmapafterbattle
	turnobject StandRocketHouse1F_ROCKET, DOWN
	setscene SCENE_SAFARI_ZONE_WARDENS_HOME_NOTHING
	end
RocketSpotsBottom2:
	turnobject StandRocketHouse1F_ROCKET, DOWN
	playmusic MUSIC_ROCKET_ENCOUNTER
	showemote EMOTE_SHOCK, StandRocketHouse1F_ROCKET, 30
	applymovement StandRocketHouse1F_ROCKET, ShockedRocket1StepDown
	turnobject PLAYER, UP
	opentext
	writetext RocketShockedText
	waitbutton
	closetext
	winlosstext ShockedRocketWinText, ShockedRocketLossText
	loadtrainer GRUNTM, GRUNTM_5
	startbattle
	reloadmapafterbattle
	turnobject StandRocketHouse1F_ROCKET, DOWN
	setscene SCENE_SAFARI_ZONE_WARDENS_HOME_NOTHING
	end
RocketSpotsBottom3:
	turnobject StandRocketHouse1F_ROCKET, DOWN
	playmusic MUSIC_ROCKET_ENCOUNTER
	showemote EMOTE_SHOCK, StandRocketHouse1F_ROCKET, 30
	applymovement StandRocketHouse1F_ROCKET, ShockedRocket2StepsDown
	turnobject PLAYER, UP
	opentext
	writetext RocketShockedText
	waitbutton
	closetext
	winlosstext ShockedRocketWinText, ShockedRocketLossText
;	loadtrainer SABRINA, SABRINA1,
	loadtrainer GRUNTM, GRUNTM_5
	startbattle
	reloadmapafterbattle
	turnobject StandRocketHouse1F_ROCKET, DOWN
	setscene SCENE_SAFARI_ZONE_WARDENS_HOME_NOTHING
	end
	
StandRocketHouse1F1FPoster:
	jumptext StandRocketHouse1F1FPosterText

StandRocketHouse1F1FTV:
	jumptext StandRocketHouse1F1FTVText

WardensGranddaughter:
	jumptextfaceplayer WardensGranddaughterText1
	
SilverWalksToHiddenStairsMovement2Part2:
	step DOWN
	step DOWN
	step RIGHT
	step DOWN
	step DOWN
	step_end
	
StairsTimeOneStepDown:
	step DOWN
	step_end
	
SilverWalksToHiddenStairsMovementPart2:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step_end

SilverWalksToHiddenStairsMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end
	
SilverWalksToHiddenStairsMovement2:
	step DOWN
	step DOWN
	step DOWN
	step_end

ShockedRocket1StepDown:
	step DOWN
	step_end
	
ShockedRocket2StepsDown:
	step DOWN
	step DOWN
	step_end

ShockedRocket2Steps:
	step UP
	step UP
	step_end
	
ShockedRocket1Step:
	step UP
	step_end
	
StandRocketHouse1F1FTVText:
	text "No está encendido…"
	done
	
StandRocketHouse1F1FPosterText:
	text "¡Todo #MON"
	line "existe para el"
	cont "beneficio del TEAM"
	cont "ROCKET!"
	done
	
SilverLetsGoDownThere:
	text "¡Tenemos que"
	line "echarle un"
	cont "vistazo!"
	done
	
SilverTellsYouAboutHiddenStairs2:
	text "¡Aquí!"

	para "¡El TEAM ROCKET se"
	line "esconde aquí"
	cont "abajo!"
	done
	
SilverShowsUpInBase:
	text "<RIVAL>: <PLAY_G>!"
	para "¡Espera, no te"
	line "vayas!"
	done
	
SilverTellsYouAboutHiddenStairs:
	text "¡Creo que algo"
	line "más está"
	cont "ocurriendo aquí!"
	para "Escuché decir a"
	line "un miembro del"
	cont "TEAM ROCKET que"
	para "tienen una base"
	line "secreta en este"
	cont "edificio."
	done
	
ShockedRocketWinText:
	text "¡Argh!"
	done

ShockedRocketLossText:
	text "¿Argh?"
	done

RocketShockedText:
	text "¿Y tú quién eres?"
	para "¡Espero que no"
	line "pensases que"
	para "podrías pasar a"
	line "través de mí!"

	para "¡Nadie puede"
	line "hacerlo!"
	done
	
WardensGranddaughterText1:
	text "Puede que no seas"
	line "capaz de pasar a"
	para "través de mí, pero"
	line "desde luego puedes"
	para "seguir si tienes"
	line "#MON tan"
	cont "fuertes…"
	done



StandRocketHouse1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  6,  7, STAND_CITY, 6
	warp_event  7,  7, STAND_CITY, 6
	warp_event 19,  7, TEAM_ROCKET_BASE_B1F, 1
	warp_event 19,  1, STAND_ROCKET_HOUSE_2F, 1

	db 8 ; coord events
	coord_event 15,  1, SCENE_DEFAULT, RocketSpotsTop1
	coord_event 15,  2, SCENE_DEFAULT, RocketSpotsTop2
	coord_event 15,  3, SCENE_DEFAULT, RocketSpotsTop3
	coord_event 15,  5, SCENE_DEFAULT, RocketSpotsBottom1
	coord_event 15,  6, SCENE_DEFAULT, RocketSpotsBottom2
	coord_event 15,  7, SCENE_DEFAULT, RocketSpotsBottom3
	coord_event 18,  1, SCENE_SAFARI_ZONE_WARDENS_HOME_BASE_UNCOVERED, SilverFindsStairsLeft
	coord_event 19,  2, SCENE_SAFARI_ZONE_WARDENS_HOME_BASE_UNCOVERED, SilverFindsStairsDown

	db 2 ; bg events
	bg_event  6,  0, BGEVENT_READ, StandRocketHouse1F1FPoster
	bg_event 12,  1, BGEVENT_READ, StandRocketHouse1F1FTV

	db 2 ; object events
	object_event 15,  4, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, WardensGranddaughter, EVENT_GOT_HP_UP_FROM_RANDY
	object_event -5, -5, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
