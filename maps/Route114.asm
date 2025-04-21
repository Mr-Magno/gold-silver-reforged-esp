	const_def 2 ; object constants
	const Route114_YOUNGSTER1
	const Route114_LASS1
	const Route114_YOUNGSTER2
	const Route114_LASS2
	const Route114_POKEFAN_M1
	const Route114_POKEFAN_M2
	const Route114_COOLTRAINER
	const Route114_FRUIT_TREE

Route114_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerCamperDean:
	trainer CAMPER, DEAN, EVENT_BEAT_CAMPER_DEAN, CamperDeanSeenText, CamperDeanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperDeanAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerHeidi:
	trainer PICNICKER, HEIDI, EVENT_BEAT_PICNICKER_HEIDI, PicnickerHeidiSeenText, PicnickerHeidiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHeidiAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperSid:
	trainer CAMPER, SID, EVENT_BEAT_CAMPER_SID, CamperSidSeenText, CamperSidBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperSidAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerEdna:
	trainer PICNICKER, EDNA, EVENT_BEAT_PICNICKER_EDNA, PicnickerEdnaSeenText, PicnickerEdnaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerEdnaAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerTim:
	trainer HIKER, TIM, EVENT_BEAT_HIKER_TIM, HikerTimSeenText, HikerTimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerTimAfterBattleText
	waitbutton
	closetext
	end

TrainerSportsmanJacob:
	trainer SPORTSMAN, JACOB, EVENT_BEAT_SPORTSMAN_JACOB, SportsmanJacobSeenText, SportsmanJacobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SportsmanJacobAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerSidney:
	trainer HIKER, SIDNEY, EVENT_BEAT_HIKER_SIDNEY, HikerSidneySeenText, HikerSidneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerSidneyAfterBattleText
	waitbutton
	closetext
	end

Route114Sign:
	jumptext Route114SignText

Route114HiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_9_HIDDEN_ETHER
	
Route114FruitTree:
	fruittree FRUITTREE_ROUTE_114
	
SportsmanJacobSeenText:
	text "Estoy descansando"
	line "tras haber corrido"
	cont "hasta aquí."
	done
	
SportsmanJacobBeatenText:
	text "Eso no es lo que"
	line "esperaba."
	done
	
SportsmanJacobAfterBattleText:
	text "Correr con tus"
	line "#MON es una"
	cont "buena forma de"
	cont "entrenar."
	done

CamperDeanSeenText:
	text "¿Has estado alguna"
	line "vez en KANTO?"
	done

CamperDeanBeatenText:
	text "¡Uau! Peligroso."
	done

CamperDeanAfterBattleText:
	text "Prefiero acampar"
	line "en el BOSQUE JADE."
	done

PicnickerHeidiSeenText:
	text "¿Has estado alguna"
	line "vez de picnic?"

	para "¡Son muy"
	line "divertidos!"
	done

PicnickerHeidiBeatenText:
	text "¡Ohhhh!"
	done

PicnickerHeidiAfterBattleText:
	text "Hacemos dulces y"
	line "los repartimos"
	para "entre todos."
	line "¡Son deliciosos!"
	done

CamperSidSeenText:
	text "¡Eh, tú!"
	line "¡No tires basura!"
	done

CamperSidBeatenText:
	text "Sólo estaba"
	line "diciendo que…"
	done

CamperSidAfterBattleText:
	text "Perdón. No estabas"
	line "tirando basura."
	cont "Me he equivocado."
	done

PicnickerEdnaSeenText:
	text "La gente no"
	line "debería dejar la"
	cont "basura por ahí."
	done

PicnickerEdnaBeatenText:
	text "¡Ohh…! Perdí…"
	done

PicnickerEdnaAfterBattleText:
	text "Ahorrar energía es"
	line "importante, pero"
	cont "el entorno aún lo"
	cont "es más."
	done

HikerTimSeenText:
	text "Cuando venga, lo"
	line "hará por el"
	cont "MT. FUJI…"
	done

HikerTimBeatenText:
	text "Estaba ocupado"
	line "cantando…"
	done

HikerTimAfterBattleText:
	text "Los combates son"
	line "cuestión de"
	cont "concentración."
	done

HikerSidneySeenText:
	text "Te contaré un"
	line "secreto."

	para "Pero primero,"
	line "¡luchemos!"
	done

HikerSidneyBeatenText:
	text "¡Caray!"
	line "He perdido…"
	done

HikerSidneyAfterBattleText:
	text "Lo del secreto era"
	line "broma."

	para "No sé nada"
	line "interesante."
	done

Route114SignText:
	text "RUTA 114"

	para "CIUDAD ENHIESTA -"
	line "REGIÓN de KANTO"
	done

Route114_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 28,  5, ROUTE_113_ROUTE_114_GATE, 3
	warp_event 29,  5, ROUTE_113_ROUTE_114_GATE, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event 19, 11, BGEVENT_READ, Route114Sign
	bg_event 35, 14, BGEVENT_ITEM, Route114HiddenEther

	db 8 ; object events
	object_event 18, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerCamperDean, -1
	object_event 28, 10, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerHeidi, -1
	object_event  6,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerCamperSid, -1
	object_event  8, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerEdna, -1
	object_event 14, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerHikerTim, -1
	object_event 21,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerSidney, -1
	object_event 31,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSportsmanJacob, -1
	object_event 36, 10, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route114FruitTree, -1
