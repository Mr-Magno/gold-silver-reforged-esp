	const_def 2 ; object constants
	const CROWN_PASS_SILVER

CrownPass_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RivalBattleFinal:
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	turnobject CROWN_PASS_SILVER, DOWN
	pause 15
	applymovement CROWN_PASS_SILVER, CrownPassSilverWalksToPlayer
	turnobject PLAYER, LEFT
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext CrownPassSilverBeforeText
	waitbutton
	closetext
	checkevent EVENT_GOT_CRUIZE_FROM_OAK
	iftrue .cruise
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .CHIKORITA
	winlosstext CrownPassSilverWinText, CrownPassSilverLossText
	loadtrainer RIVAL1, RIVAL1_5_CRUIZE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.cruise
	winlosstext CrownPassSilverWinText, CrownPassSilverLossText
	loadtrainer RIVAL1, RIVAL1_5_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.CHIKORITA
	winlosstext CrownPassSilverWinText, CrownPassSilverLossText
	loadtrainer RIVAL1, RIVAL1_5_FLAMBEAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.returnfrombattle
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext CrownPassSilverAfterText
	waitbutton
	closetext
	applymovement PLAYER, CrownPassPlayer1StepToTheSide
	applymovement CROWN_PASS_SILVER, CrownPassSilverLeavesMovement
	disappear CROWN_PASS_SILVER
	setscene SCENE_CROWN_PASS_NOTHING
	setevent EVENT_EMERGENCY_SWITCH
	setmapscene CROWN_CITY, SCENE_CROWN_PASS_MEET_RIVAL
	special HealParty
	special FadeOutMusic
	waitsfx
	playmapmusic
	pause 15
	end

CrownPassHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_CROWN_PASS_HIDDEN_FULL_RESTORE

CrownPassHiddenXSpecial:
	hiddenitem X_SPECIAL, EVENT_CROWN_PASS_HIDDEN_X_SPECIAL

CrownPassSilverWalksToPlayer:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	turn_head RIGHT
	step_end

CrownPassPlayer1StepToTheSide:
	step RIGHT
	turn_head LEFT
	step_end

CrownPassSilverLeavesMovement:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

CrownPassSilverBeforeText:
	text "¡Hola, <PLAY_G>!"

	para "Vas a escalar el"
	line "MT. FUJI, ¿no?"

	para "Ha sido un largo"
	line "viaje."

	para "Hemos pasado por"
	line "muchas cosas."

	para "¿Están tus #MON"
	line "listos?"

	para "¿Lo están los"
	line "míos?"

	para "¡Vamos a compro-"
	line "barlo, aquí y"
	cont "ahora!"

	para "¡Un combate entre"
	line "amigos!"
	done

CrownPassSilverWinText:
	text "…"
	done

CrownPassSilverLossText:
	text "…"
	done

CrownPassSilverAfterText:
	text "¿Sabes de qué me"
	line "he dado cuenta?"

	para "Me emocionaba"
	line "desafiar a la"
	cont "LIGA."

	para "Quería tener los"
	line "#MON más"
	cont "fuertes."

	para "Quería ser el"
	line "entrenador más"
	cont "poderoso."

	para "Pero lidiar con el"
	line "TEAM ROCKET me"
	cont "hizo pensar."

	para "Me he dado cuenta"
	line "que debo tratar"
	cont "a mi equipo con"
	cont "amor."

	para "Así que no creo"
	line "que esté listo"
	cont "para enfrentarme a"
	cont "la LIGA hasta que"
	cont "no haya trabajado"
	cont "en ello."

	para "<PLAY_G>,"
	line "buena suerte."

	para "Nos veremos."
	done

CrownPass_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10, 33, VICTORY_ROAD_GATE, 3
	warp_event 11,  1, CROWN_CITY, 1

	db 1 ; coord events
	coord_event 12,  7, SCENE_DEFAULT, RivalBattleFinal

	db 2 ; bg events
	bg_event  5, 16, BGEVENT_ITEM, CrownPassHiddenFullRestore
	bg_event 12, 14, BGEVENT_ITEM, CrownPassHiddenXSpecial

	db 1 ; object events
	object_event 11,  2, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_EMERGENCY_SWITCH
