	const_def 2 ; object constants
	const PrycesFamilyHouse_POKEFAN_F
	const PrycesFamilyHouse_TWIN
	const PrycesFamilyHouse_PRYCE

PrycesFamilyHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PrycesFamilyHousePokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_DEEPWATER_PASSAGE_PRYCE_GONE
	iffalse .PryceVisitsSoonG
	checkevent EVENT_HIDE_FROSTPOINT_PRYCE
	iffalse .PryceIsVisitingG
	checkflag ENGINE_GLACIERBADGE
	iffalse .GoBeatPryce
	checkevent EVENT_GOT_HM06_WHIRLPOOL
	iftrue .AlreadyGotWhirlpool
	writetext HereIsWhirlpool
	waitbutton
	verbosegiveitem HM_WHIRLPOOL
	setevent EVENT_GOT_HM06_WHIRLPOOL
	writetext NowYouHaveWhirlpool
	waitbutton
	closetext
	end
	
.AlreadyGotWhirlpool
	writetext PryceVisitingIsMyFavoriteG
	waitbutton
	closetext
	end
	
.PryceVisitsSoonG
	writetext PryceIsComingToVisitG
	waitbutton
	closetext
	end
	
.PryceIsVisitingG
	writetext PryceIsHereG
	waitbutton
	closetext
	end
	
.GoBeatPryce
	writetext GoBeatHimPryce
	waitbutton
	closetext
	end

PrycesFamilyHouseTwinScript:
	faceplayer
	opentext
	checkevent EVENT_DEEPWATER_PASSAGE_PRYCE_GONE
	iffalse .PryceVisitsSoon
	checkevent EVENT_HIDE_FROSTPOINT_PRYCE
	iffalse .PryceIsVisiting
	writetext PryceVisitingIsMyFavorite
	waitbutton
	closetext
	end
	
.PryceVisitsSoon
	writetext PryceIsComingToVisit
	waitbutton
	closetext
	end
	
.PryceIsVisiting
	writetext PryceIsHere
	waitbutton
	closetext
	end
	
PrycesFamilyHousePryceScript:
	faceplayer
	opentext
	writetext PrycesFamilyHousePryceText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .PryceWalksAroundPlayer2
	applymovement PrycesFamilyHouse_PRYCE, PryceLeavesMovement2
	playsound SFX_EXIT_BUILDING
	disappear PrycesFamilyHouse_PRYCE
	setevent EVENT_HIDE_FROSTPOINT_PRYCE
	clearevent EVENT_PRYCE_IN_GYM
	waitsfx
	end

.PryceWalksAroundPlayer2
	applymovement PrycesFamilyHouse_PRYCE, PryceLeavesMovement2Alt
	playsound SFX_EXIT_BUILDING
	disappear PrycesFamilyHouse_PRYCE
	setevent EVENT_HIDE_FROSTPOINT_PRYCE
	clearevent EVENT_PRYCE_IN_GYM
	waitsfx
	end
	
PryceLeavesMovement2Alt:
	step RIGHT
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end
	
PryceLeavesMovement2:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step DOWN
	step_end

PrycesFamilyHouseBookshelf:
	jumpstd picturebookshelf
	
HereIsWhirlpool:
	text "Veo que has reci-"
	line "bido la MEDALLA"
	cont "GLACIAR de mi"
	cont "marido."

	para "Tengo algo que te"
	line "será de utilidad."
	done
	
NowYouHaveWhirlpool:
	text "Esta MO enseña"
	line "TORBELLINO."

	para "Es muy útil para"
	line "atravesar las"
	para "aguas bravas del"
	line "norte de NIHON."
	done
	
PryceVisitingIsMyFavoriteG:
	text "Siempre he respe-"
	line "tado la dedicación"
	para "que FREDO tiene"
	line "por sus deberes."
	done
	
PryceIsComingToVisitG:
	text "Mi marido, FREDO,"
	line "es el LÍDER de"
	para "GIMNASIO del"
	line "BOSQUE AZUL."

	para "Tiene que ir allí"
	line "a menudo para"
	cont "combatir."

	para "Pasa también mucho"
	line "tiempo entrenando"
	cont "en el PASAJE"
	cont "ABISAL."

	para "Pero siempre saca"
	line "tiempo para venir"
	cont "a casa."

	para "Debería llegar"
	line "pronto."
	done
	
PryceIsHereG:
	text "Siempre es un"
	line "placer que FREDO"
	cont "esté en casa."
	done
	
GoBeatHimPryce:
	text "FREDO está"
	line "esperando a que"
	cont "combatas contra"
	cont "él."

	para "Derrótalo y ven a"
	line "verme."

	para "Tendré un regalo"
	line "para ti."
	done

PryceVisitingIsMyFavorite:
	text "Me encanta cuando"
	line "el abuelo viene de"
	cont "visita."
	done
	
PryceIsComingToVisit:
	text "¡El abuelo debería"
	line "llegar pronto!"
	done
	
PryceIsHere:
	text "¡Yupi! ¡Ha venido"
	line "el abuelo!"
	done
	
PrycesFamilyHousePryceText:
	text "Me alegra que"
	line "hayas venido."

	para "Todo entrenador"
	line "que pueda llegar"
	para "hasta mi lugar de"
	line "entrenamiento"
	cont "tiene mi respeto."

	para "Por cierto, ¿cuál"
	line "es tu nombre?"
	para "¿<PLAY_G>?"
	para "Bueno, <PLAY_G>,"
	line "como te prometí,"
	cont "regresaré a mi"
	cont "GIMNASIO."

	para "Espero que seas un"
	line "gran oponente."
	done

PrycesFamilyHousePokefanFText:
	text "PUEBLO LAVANDA es"
	line "un pequeño y"
	para "apacible lugar,"
	line "al pie de las"
	cont "montañas."

	para "Desde que se"
	line "construyó la TORRE"
	para "RADIO, acude algo"
	line "más de gente."
	done

PrycesFamilyHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, FROSTPOINT_TOWN, 4
	warp_event  5,  7, FROSTPOINT_TOWN, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  0, BGEVENT_READ, PrycesFamilyHouseBookshelf
	bg_event  0,  0, BGEVENT_READ, PrycesFamilyHouseBookshelf

	db 3 ; object events
	object_event  1,  2, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PrycesFamilyHousePokefanFScript, -1
	object_event  5,  2, SPRITE_TWIN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PrycesFamilyHouseTwinScript, -1
	object_event  7,  4, SPRITE_PRYCE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PrycesFamilyHousePryceScript, EVENT_HIDE_FROSTPOINT_PRYCE
