	const_def 2 ; object constants
	const BOULDERMINES1F_POKE_BALL1
	const BOULDERMINES1F_POKE_BALL2
	const BOULDERMINES1F_POKE_BALL3
	const BOULDERMINES1F_MINE_1
	const BOULDERMINES1F_MINE_2
	const BOULDERMINES1F_MINE_3
	const BOULDERMINES1F_TWIN
	const BOULDERMINES1F_COOLTRAINERF
	const BOULDERMINES1F_POKEMANIAC
	const BOULDERMINES1F_TWIN2

BoulderMines1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GirlInMineScript:
	setmapscene ROUTE_120, SCENE_ROUTE8_GIRL_AND_GRAMPS
	faceplayer
	opentext
	writetext Text_FoundMe
	waitbutton
	closetext
	setevent EVENT_LITTLE_GIRL_IN_BOULDER_MINES
	clearevent EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	clearevent EVENT_TEKNOS_GRAMPA_AT_HOME
	clearevent EVENT_LITTLE_GIRL_AT_HOME
	clearevent EVENT_LITTLE_GIRL_AT_BOULDER_MINES_ENTRANCE
	special FadeOutPalettes
	wait 10
	warpfacing DOWN, BOULDER_MINES_1F, 2, 14
	opentext
	writetext Text_WayOut
	waitbutton
	closetext
	end

GirlInMineScript2:
	opentext
	writetext Text_WayOut
	waitbutton
	closetext
	end

BoulderMines1FGreatBall:
	itemball GREAT_BALL

BoulderMines1FXAttack:
	itemball X_ATTACK

BoulderMines1FPotion:
	itemball POTION
	
TrainerCooltrainerfEmma:
	trainer COOLTRAINERF, EMMA, EVENT_BEAT_COOLTRAINERF_EMMA, CooltrainerFEmmaSeenText, CooltrainerFEmmaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerFEmmaAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacLarry:
	trainer POKEMANIAC, LARRY, EVENT_BEAT_POKEMANIAC_LARRY, PokemaniacLarrySeenText, PokemaniacLarryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacLarryAfterBattleText
	waitbutton
	closetext
	end
	
BoulderMines1FBoulder:
	jumpstd strengthboulder
	
CooltrainerFEmmaSeenText:
	text "En esta cueva"
	line "puedes perderte"
	cont "con facilidad."
	done

CooltrainerFEmmaBeatenText:
	text "¡No he podido"
	line "ganarte!"
	done
	
CooltrainerFEmmaAfterBattleText:
	text "Espero que nadie"
	line "se pierda por"
	cont "aquí."
	
	para "Sería algo"
	line "aterrador."
	done

PokemaniacLarrySeenText:
	text "Me pregunto qué se"
	line "mina en esta"
	cont "cueva…"
	done

PokemaniacLarryBeatenText:
	text "¿Cómo eres tan"
	line "fuerte?"
	done
	
PokemaniacLarryAfterBattleText:
	text "Me pregunto si hay"
	line "algo que valga la"
	cont "pena…"
	done

Text_FoundMe:
	text "¡Uy, hola!"
	
	para "Esto… ¿Sabes cómo"
	line "salir de aquí?"
	
	para "…"
	
	para "¡Oh! ¿El abuelo me"
	line "está buscando?"

	para "No quería"
	line "preocuparlo…"
	
	para "¡Vale! ¿Me ayudas"
	line "a salir de aquí?"
	
	para "¡Vamos!"
	done
	
Text_WayOut:
	text "¡Bien!"
	
	para "¡Hemos encontrado"
	line "la salida!"
	
	para "¡Vamos a buscar"
	line "al abuelo!"
	done

BoulderMines1F_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event  2, 15, ROUTE_120, 1
	warp_event 31,  5, BOULDER_MINES_B1F, 3
	warp_event 43,  5, BOULDER_MINES_B1F, 4
	warp_event 53, 13, BOULDER_MINES_B1F, 7
	warp_event 51, 17, BOULDER_MINES_B1F, 8
	warp_event  3, 11, BOULDER_MINES_1F, 7
	warp_event 17,  3, BOULDER_MINES_1F, 6

	db 0 ; coord events

	db 0 ; bg events

	db 10 ; object events
	object_event 28,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMines1FGreatBall, EVENT_BOULDER_MINES_1F_GREAT_BALL
	object_event 15, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMines1FXAttack, EVENT_BOULDER_MINES_1F_X_ATTACK
	object_event 15, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoulderMines1FPotion, EVENT_BOULDER_MINES_1F_POTION
	object_event 37, 17, SPRITE_MINELR, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BoulderMines1FBoulder, -1
	object_event 49, 11, SPRITE_MINEUD, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BoulderMines1FBoulder, -1
	object_event 19, 12, SPRITE_MINEUD, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BoulderMines1FBoulder, -1
	object_event 22, 16, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GirlInMineScript, EVENT_LITTLE_GIRL_IN_BOULDER_MINES
	object_event 24, 10, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfEmma, -1
	object_event 33,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerPokemaniacLarry, -1
	object_event 2, 13, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GirlInMineScript2,EVENT_LITTLE_GIRL_AT_BOULDER_MINES_ENTRANCE


