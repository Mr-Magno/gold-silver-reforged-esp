	const_def 2 ; object constants
	const AMPARECAVERNB1F_ROCK1
	const AMPARECAVERNB1F_ROCK2
	const AMPARECAVERNB1F_ROCK3
	const AMPARECAVERNB1F_ROCK4
	const AMPARECAVERNB1F_POKE_BALL2
	const AMPARECAVERNB1F_POKE_BALL3
	const AMPARECAVERNB1F_POKE_BALL4
	const AMPARECAVERNB1F_RAIKOU
	const AMPARECAVERNB1F_POKE_BALL5

AmpareCavernB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RaikouEvent:
	faceplayer
	opentext
	writetext RaikouText
	cry RAIKOU
	pause 15
	closetext
	setevent EVENT_FOUGHT_RAIKOU
	writecode VAR_BATTLETYPE, BATTLETYPE_ROAMING
	loadwildmon RAIKOU, 40
	startbattle
	disappear AMPARECAVERNB1F_RAIKOU
	reloadmapafterbattle
	end
	
RaikouText:
	text "¡Raaai!"
	done


AmpareCavernB1FTMZapCannon:
	itemball TM_ZAP_CANNON


AmpareCavernB1FFullHeal:
	itemball FULL_HEAL

AmpareCavernB1FHyperPotion:
	itemball HYPER_POTION

AmpareCavernB1FDireHit:
	itemball DIRE_HIT

AmpareCavernB1FRock:
	jumpstd smashrock

AmpareCavernB1FHiddenElixer:
	hiddenitem ELIXER, EVENT_DARK_CAVE_VIOLET_ENTRANCE_HIDDEN_ELIXER

AmpareCavernB1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2, 31, AMPARE_CAVERN_B1F, 3
	warp_event  3, 21, AMPARE_CAVERN_1F, 2
	warp_event 29,  5, AMPARE_CAVERN_B1F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 23,  6, BGEVENT_ITEM, AmpareCavernB1FHiddenElixer

	db 9 ; object events
	object_event 31,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmpareCavernB1FRock, -1
	object_event 28,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmpareCavernB1FRock, -1
	object_event 34, 10, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmpareCavernB1FRock, -1
	object_event 29,  7, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmpareCavernB1FRock, -1
	object_event 18,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AmpareCavernB1FFullHeal, EVENT_DARK_CAVE_VIOLET_ENTRANCE_FULL_HEAL
	object_event 10, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AmpareCavernB1FHyperPotion, EVENT_DARK_CAVE_VIOLET_ENTRANCE_HYPER_POTION
	object_event 18, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AmpareCavernB1FDireHit, EVENT_DARK_CAVE_VIOLET_ENTRANCE_DIRE_HIT
	object_event 10, 27, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RaikouEvent, EVENT_FOUGHT_RAIKOU
	object_event  2,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, AmpareCavernB1FTMZapCannon, EVENT_ROUTE_26_MAX_ELIXER
