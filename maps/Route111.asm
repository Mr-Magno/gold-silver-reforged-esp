	const_def 2 ; object constants
	const ROUTE41_SWIMMER_GUY1
	const ROUTE41_SWIMMER_GIRL1

Route111_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route111WhirlIslandSign:
	jumptext Route111WhirlIslandSignText

TrainerSwimmerfKaylee:
	trainer SWIMMERF, KAYLEE, EVENT_BEAT_SWIMMERF_KAYLEE, SwimmerfKayleeSeenText, SwimmerfKayleeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKayleeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermMathew:
	trainer SWIMMERM, MATHEW, EVENT_BEAT_SWIMMERM_MATHEW, SwimmermMathewSeenText, SwimmermMathewBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermMathewAfterBattleText
	waitbutton
	closetext
	end
	
TrainerSwimmermGeorge:
	trainer SWIMMERM, GEORGE, EVENT_BEAT_SWIMMERM_GEORGE, SwimmermGeorgeSeenText, SwimmermGeorgeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermGeorgeAfterBattleText
	waitbutton
	closetext
	end
	
TrainerSwimmerfKara:
	trainer SWIMMERF, KARA, EVENT_BEAT_SWIMMERF_KARA, SwimmerfKaraSeenText, SwimmerfKaraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKaraAfterBattleText
	waitbutton
	closetext
	end

Route111Rock:
; unused
	jumpstd smashrock

Route111HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_41_HIDDEN_MAX_ETHER

Route111WhirlIslandSignText:
	text "ENTRADA A LA"
	line "ISLA REMOLINO"
	done

SwimmerfKayleeSeenText:
	text "¡Seguro que solo"
	line "vas montado en un"
	para "#MON porque no"
	line "puedes soportar el"
	cont "agua fría!"
	done

SwimmerfKayleeBeatenText:
	text "¿Así es como lo"
	line "haces?"
	done

SwimmerfKayleeAfterBattleText:
	text "Creo que debe ser"
	line "peligroso estar"
	para "mucho tiempo en"
	line "estas aguas."
	done
	
SwimmermMathewSeenText:
	text "¡Brr!"

	para "¡El agua fría"
	line "fortalece el"
	cont "carácter!"
	done

SwimmermMathewBeatenText:
	text "¡Ooh, tienes una"
	line "gran resistencia!"
	done

SwimmermMathewAfterBattleText:
	text "No puedo nadar más"
	line "al norte."

	para "El agua se vuelve"
	line "demasiado"
	cont "peligrosa."
	done
	
SwimmermGeorgeSeenText:
	text "Estoy cansado."
	line "Si gano, préstame"
	cont "tus #MON."
	done

SwimmermGeorgeBeatenText:
	text "Uf, uf…"
	done

SwimmermGeorgeAfterBattleText:
	text "PUEBLO ESCARCHA"
	line "está muy lejos."

	para "Pero tampoco es"
	line "fácil el viaje"
	cont "de vuelta por"
	cont "el BOSQUE AZUL."

	para "¿Qué debería"
	line "hacer?"
	done

SwimmerfKaraSeenText:
	text "Si necesitas des-"
	line "cansar, mantente"
	cont "a flote."

	para "Recuperarás el"
	line "aliento y podrás"

	para "seguir adelante"
	line "con fuerza."
	done

SwimmerfKaraBeatenText:
	text "¡Oh! ¡Tienes más"
	line "energía que yo."
	done

SwimmerfKaraAfterBattleText:
	text "He escuchado ru-"
	line "gidos provinentes"
	cont "de las ISLAS."
	done

Route111_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5, 31, WHIRL_ISLAND_1F, 1
	warp_event  8, 51, ROUTE_111_BLUE_FOREST_GATE, 1
	warp_event  9, 51, ROUTE_111_BLUE_FOREST_GATE, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4, 33, BGEVENT_ITEM, Route111HiddenMaxEther
	bg_event  7, 33, BGEVENT_READ, Route111WhirlIslandSign


	db 4 ; object events
	object_event 12, 17, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermMathew, -1
	object_event 12,  8, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfKaylee, -1
	object_event 11, 26, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermGeorge, -1
	object_event 10, 42, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfKara, -1

