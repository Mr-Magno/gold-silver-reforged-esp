	const_def 2 ; object constants
	const ROUTE105_YOUNGSTER3
	const ROUTE105_YOUNGSTER4
	const ROUTE105_COOLTRAINER_F
	const ROUTE105_POKE_BALL
	const ROUTE105_POKE_BALL2
	const ROUTE105_FRUIT_TREE_1
	const ROUTE105_FRUIT_TREE_2

Route105_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerYoungsterMikey:
	trainer YOUNGSTER, MIKEY, EVENT_BEAT_YOUNGSTER_MIKEY, YoungsterMikeySeenText, YoungsterMikeyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterMikeyAfterText
	waitbutton
	closetext
	end


Route105YoungsterScript:
	jumptextfaceplayer Route105YoungsterText_DirectionsToMrPokemonsHouse

Route105CooltrainerFScript:
	jumptextfaceplayer Route105CooltrainerFText

Route105Sign:
	jumptext Route105SignText

MrPokemonsHouseDirectionsSign:
	jumptext MrPokemonsHouseDirectionsSignText

MrPokemonsHouseSign:
	jumptext MrPokemonsHouseSignText

Route105TrainerTips:
	jumptext Route105TrainerTipsText

Route105MaxEther:
	itemball MAX_ETHER
	
Route105PoisonStone:
	itemball POISON_STONE

Route105FruitTree1:
	fruittree FRUITTREE_ROUTE_105_1

Route105FruitTree2:
	fruittree FRUITTREE_ROUTE_105_2

Route105HiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ROUTE_30_HIDDEN_HYPER_POTION


YoungsterMikeySeenText:
	text "Entrenas #MON,"
	line "¿verdad?"

	para "¡Pues entonces"
	line "luchemos!"
	done

YoungsterMikeyBeatenText:
	text "¡Qué extraño!"
	line "¡Creí que ganaría!"
	done

YoungsterMikeyAfterText:
	text "Es muy duro llegar"
	line "a ser un buen"
	cont "entrenador."

	para "Tengo que luchar"
	line "contra más gente"
	cont "para mejorar."
	done





Route105YoungsterText_DirectionsToMrPokemonsHouse:
	text "Estoy agotado."

	para "No quiero caminar"
	line "más."

	para "Ojalá mi #MON"
	line "pudiera VOLAR para"
	cont "llevarme a algún"
	cont "pueblo."
	done

Route105CooltrainerFText:
	text "Estoy buscando"
	line "#MON de tipo"
	cont "eléctrico."

	para "Sé que hay varias"
	line "especies que viven"
	cont "en esta hierba"
	cont "alta."
	done

Route105SignText:
	text "RUTA 105"
	
	para "TRAS EL ACCESO"
	line "BOSQUE JADE"
	done

MrPokemonsHouseDirectionsSignText:
	text "CASA del SR."
	line "#MON"
	cont "JUSTO DELANTE"
	done

MrPokemonsHouseSignText:
	text "CASA del SR."
	line "#MON"
	done

Route105TrainerTipsText:
	text "PISTAS ENTRENADOR"

	para "¡No robes #MON"
	line "de la gente!"

	para "¡Usa # BALLS"
	line "con #MON"
	cont "salvajes!"
	done



Route105_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 31, ROUTE_105_ROUTE_106_GATE, 1
	warp_event  9, 31, ROUTE_105_ROUTE_106_GATE, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  6, 28, BGEVENT_READ, Route105Sign
	bg_event 19, 28, BGEVENT_ITEM, Route105HiddenHyperPotion

	db 7 ; object events
	object_event  8, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterMikey, -1
	object_event  7, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route105YoungsterScript, -1
	object_event 10,  6, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route105CooltrainerFScript, -1
	object_event 14,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route105MaxEther, EVENT_ROUTE_30_MAX_ETHER
	object_event 17, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route105PoisonStone, EVENT_ROUTE_30_POISON_STONE
	object_event 17,  4, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route105FruitTree1, -1
	object_event  5, 14, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route105FruitTree1, -1
