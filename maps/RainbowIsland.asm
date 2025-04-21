	const_def 2
	const RI_BLUE1
	const RI_BLUE2

RainbowIsland_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .RainbowIslandRestored
	
.RainbowIslandRestored:
	checkevent EVENT_RAINBOW_ISLE_RESTORED
	iffalse .Done
	changeblock $C, $6, $48 ; the rainbow
	changeblock $C, $4, $44
	changeblock $E, $6, $49
	changeblock $E, $4, $45
	changeblock $10, $2, $52
	changeblock $10, $4, $53
	changeblock $12, $2, $50
	changeblock $12, $4, $51
	changeblock $14, $2, $4E
	changeblock $14, $4, $4F
	changeblock $16, $2, $4E
	changeblock $16, $4, $4F
	changeblock $18, $2, $4D
	changeblock $1A, $2, $4D
	changeblock $1C, $2, $4D
	changeblock $1E, $2, $4D
	changeblock $20, $2, $4D
	changeblock $22, $2, $4D
	changeblock $24, $2, $4D
	changeblock $26, $2, $4D	
	changeblock $28, $2, $4E
	changeblock $28, $4, $4F	
	changeblock $2A, $2, $4E
	changeblock $2A, $4, $4F
	changeblock $2C, $2, $50
	changeblock $2C, $4, $51
	changeblock $2E, $2, $52
	changeblock $2E, $4, $53
	changeblock $30, $4, $46
	changeblock $30, $6, $4A
	changeblock $32, $6, $4B
	changeblock $32, $4, $47
	
	changeblock $1C, $4, $23 ;battle arena at top of map
	changeblock $1C, $6, $22
	changeblock $20, $4, $23
	changeblock $20, $6, $22
	
	changeblock $1E, $12, $8B ; palmtrees
	changeblock $26, $12, $8B
	changeblock $14, $14, $12
	changeblock $C, $18, $12
	changeblock $E, $1A, $12
	changeblock $C, $1C, $12
	changeblock $C, $22, $12
	changeblock $A, $26, $12
	changeblock $C, $26, $12
	changeblock $8, $28, $12
	changeblock $A, $28, $12
	changeblock $C, $28, $12
	changeblock $8, $2A, $12
	changeblock $A, $2A, $12
	changeblock $16, $2A, $12
	changeblock $18, $28, $12
	changeblock $1E, $26, $12
	changeblock $20, $26, $12
	changeblock $26, $28, $12
	changeblock $28, $2A, $12
	changeblock $32, $26, $12
	changeblock $34, $26, $12
	changeblock $32, $28, $12
	changeblock $34, $28, $12
	changeblock $36, $28, $12
	changeblock $34, $2A, $12
	changeblock $36, $2A, $12
	changeblock $34, $1E, $12
	changeblock $32, $1C, $12
	changeblock $30, $1A, $12
	changeblock $2E, $18, $12
	changeblock $2C, $18, $12
	changeblock $22, $1A, $8B
	changeblock $20, $1A, $8B
	
	changeblock $E, $26, $40 ; flowers
	changeblock $E, $28, $40
	changeblock $C, $2A, $40
	changeblock $E, $2A, $40
	changeblock $10, $2C, $40
	changeblock $A, $2C, $40
	changeblock $C, $2C, $40
	changeblock $E, $2C, $40
	changeblock $C, $2E, $40
	changeblock $E, $2E, $40
	changeblock $10, $2E, $40
	changeblock $16, $2C, $40
	changeblock $18, $2A, $40
	changeblock $1A, $28, $40
	changeblock $1C, $28, $40
	changeblock $1E, $28, $40
	changeblock $20, $28, $40
	changeblock $22, $28, $40
	changeblock $24, $28, $40
	changeblock $26, $2A, $40
	changeblock $28, $2C, $40
	changeblock $30, $26, $40
	changeblock $30, $28, $40
	changeblock $30, $2A, $40
	changeblock $32, $2A, $40
	changeblock $2E, $2C, $40
	changeblock $30, $2C, $40
	changeblock $32, $2C, $40
	changeblock $34, $2C, $40
	changeblock $2E, $2E, $40
	changeblock $30, $2E, $40
	changeblock $32, $2E, $40
.Done:
	return

	

BlueFirstScript:
	faceplayer
	opentext
	writetext BluePt1Text
	waitbutton
	closetext
	turnobject RI_BLUE1, UP
	opentext
	writetext BluePt2Text
	waitbutton
	closetext
	faceplayer
	opentext
	writetext BluePt3Text
	waitbutton
	closetext
	special FadeOutPalettes
	disappear RI_BLUE1
	pause 10
	special LoadMapPalettes
	special FadeInPalettes
	;event setting here
	clearevent EVENT_RAINBOW_ISLE_CAVE_BLUE_HIDDEN
	setevent EVENT_RAINBOW_ISLE_BLUE_INTRO_HIDDEN
	end

BluePt1Text:
	text "¡Hola, <PLAY_G>!"
	line "¡Me sorprende"
	cont "veros a todos en"
	cont "la ISLA"
	cont "ARCOIRIS!"
	
	para "He venido aquí a"
	line "llevar a cabo"
	cont "una investigación"
	cont "#MON, pero"
	cont "me intriga algo…"
	done

BluePt2Text:
	text "Mira estas pal-"
	line "meras y hierba,"
	cont "¡son marrones!"
	
	para "Viejas historias"
	line "y leyendas de la"
	cont "isla dicen que"
	cont "solía ser un"
	cont "lugar colorido…"
	
	para "Pero ahora está"
	line "así. ¿Qué ha"
	cont "ocurrido aquí?"
	done

BluePt3Text:
	text "Investigué un"
	line "poco más y creo"
	cont "que tengo una"
	cont "hipótesis."
	
	para "Aunque…"
	line "Puede que sea"
	cont "una posibilidad"
	cont "remota."
	
	para "¡Encuéntrame en"
	line "la cueva del"
	cont "noreste de la"
	cont "isla y te"
	cont "explicaré más!"
	
	para "¡Necesitarás"
	line "CASCADA para"
	cont "llegar ahí!"
	done

BlueBattleScript:
	faceplayer
	checkevent EVENT_BEAT_BLUE_ONCE_BEFORE
	iftrue .bluerematch
	opentext
	writetext BlueCommendsText
	waitbutton
	closetext
	special FadeOutMusic
	opentext
	writetext BlueFirstChallengeText
	waitbutton ; added this just now
	winlosstext BlueFirstWinText, 0
	loadtrainer BLUE, BLUE1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special FadeOutMusic
	opentext
	writetext BlueFirstAfterText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear RI_BLUE2
	setevent EVENT_BEAT_BLUE_ONCE_BEFORE
	setevent EVENT_RAINBOW_ISLE_BLUE_BATTLE_HIDDEN
	pause 15
	special FadeInQuickly
	pause 30
	special HealParty
	checkevent EVENT_PACKAGE_TAKEN_NO_SHOW
	iffalse .skipPackages1 ; if package is sitting there unopened
	checkevent EVENT_TAKEN_GOLD_TROPHY
	iftrue .skipPackages1
	setevent EVENT_GOLD_TROPHY_IN_PACKAGE
	clearevent EVENT_PACKAGE_TAKEN_NO_SHOW
.skipPackages1:
	refreshscreen
	credits
	end
	
.bluerematch
	opentext
	writetext BlueSecondChallengeText
	waitbutton
	winlosstext BlueSecondWinText, 0
	loadtrainer BLUE, BLUE1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special FadeOutMusic
	opentext
	writetext BlueSecondAfterText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear RI_BLUE2
	setevent EVENT_RAINBOW_ISLE_BLUE_BATTLE_HIDDEN
	pause 15
	special FadeInQuickly
	pause 30
	special HealParty
	checkevent EVENT_PACKAGE_TAKEN_NO_SHOW
	iffalse .skipPackages2 ; if package is sitting there unopened
	checkevent EVENT_TAKEN_GOLD_TROPHY
	iftrue .skipPackages2
	setevent EVENT_GOLD_TROPHY_IN_PACKAGE
	clearevent EVENT_PACKAGE_TAKEN_NO_SHOW
.skipPackages2:
	refreshscreen
	credits
	end


BlueCommendsText:
	text "Increíble…"
	
	para "<PLAY_G>, ¡de"
	line "verdad que tienes"
	cont "un talento para"
	cont "hacer posible lo"
	cont "imposible!"
	
	para "Desde que nos"
	line "vimos en PUEBLO"
	cont "SILENTE, has"
	cont "crecido mucho…"
	
	para "¡Pero esto se"
	line "tiene que llevar"
	cont "la palma, siendo"
	cont "lo más increíble"
	cont "que haya visto!"
	
	para "¡Ha sido un"
	line "verdadero honor"
	cont "haberte ayudado a"
	cont "llegar tan lejos!"
	done

BlueFirstChallengeText:
	text "Si te diera una"
	line "recompensa por"
	cont "una ocasión como"
	cont "esta…"

	para "Bueno… Sólo hay"
	line "una cosa que"
	cont "imagino que"
	cont "querrás."
	
	para "¡<PLAY_G>!"
	
	para "Como antiguo"
	line "CAMPEÓN de la"
	cont "LIGA #MON,"
	cont "¡te desafío!"
	done
	
BlueFirstWinText:
	text "¡Se acabó!"

	para "¡Ha sido un"
	line "combate histórico,"
	cont "sin duda!"
	done

BlueFirstAfterText:
	text "Uf…"

	para "¡Nadie me había"
	line "puesto en tantos"
	para "aprietos desde que"
	line "combatí contra mi"
	para "viejo amigo cuando"
	line "era CAMPEÓN!"

	para "Todavía parece"
	line "que fue ayer…"
	
	para "¡Bueno! ¡Es hora"
	line "de concluir mi"
	cont "gira de"
	cont "investigación."
	
	para "¡Nos lo hemos"
	line "pasado bien!"
	
	para "¡<PLAY_G>!"
	line "Yo…"
	
	para "¡Nos vemos luego!"
	done


BlueSecondChallengeText:
	text "¡Hola <PLAY_G>!"
	
	para "¿Vienes a por la"
	line "segunda ronda?"
	
	para "Bueno, ¡no te"
	line "creas que te"
	cont "lo pondré nada"
	cont "fácil!"
	
	para "¡Vamos allá!"
	done


BlueSecondAfterText:
	text "¡Fiuu!"
	line "¡Entrenaré un"
	cont "poco más!"
	
	para "Hasta entonces,"
	line "¡nos vemos!"
	done


BlueSecondWinText:
	text "¡Eres bueno!"
	
	para "¡Sigue haciéndote"
	line "más fuerte!"
	done


RainbowIsland_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 49, 15, RAINBOW_ISLAND_CAVE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 32, 42, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlueFirstScript, EVENT_RAINBOW_ISLE_BLUE_INTRO_HIDDEN ; one
	object_event 31,  5, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlueBattleScript, EVENT_RAINBOW_ISLE_BLUE_BATTLE_HIDDEN ; two
	