	const_def 2 ; object constants
	const ROUTE34_YOUNGSTER3
	const ROUTE34_LASS
	const ROUTE34_OFFICER
	const ROUTE34_POKEFAN_M
	const ROUTE34_POKE_BALL
	const ROUTE34_OFFICER2

Route113_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerCamperTodd1:
	trainer CAMPER, TODD, EVENT_BEAT_CAMPER_TODD, CamperTodd1SeenText, CamperTodd1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperTodd1AfterText
	waitbutton
	closetext
	end

SoldierGeraldScript:
	trainer SOLDIER, GERALD, EVENT_BEAT_SOLDIER_GERALD, SoldierGeraldSeenText, SoldierGeraldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SoldierGeraldAfterText
	waitbutton
	closetext
	end

TrainerPicnickerGina1:
	trainer PICNICKER, GINA, EVENT_BEAT_PICNICKER_GINA, PicnickerGina1SeenText, PicnickerGina1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerGina1AfterText
	waitbutton
	closetext
	end

OfficerKeithScript:
	faceplayer
	opentext
	checktime NITE
	iffalse .NoFight
	checkevent EVENT_BEAT_OFFICER_KEITH
	iftrue .AfterScript
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext OfficerKeithSeenText
	waitbutton
	closetext
	winlosstext OfficerKeithWinText, 0
	loadtrainer OFFICER, KEITH
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICER_KEITH
	closetext
	end

.AfterScript:
	writetext OfficerKeithAfterText
	waitbutton
	closetext
	end

.NoFight:
	writetext OfficerKeithDaytimeText
	waitbutton
	closetext
	end

TrainerPokefanmBrandon:
	trainer POKEFANM, BRANDON, EVENT_BEAT_POKEFANM_BRANDON, PokefanmBrandonSeenText, PokefanmBrandonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmBrandonAfterText
	waitbutton
	closetext
	end


Route113IlexForestSign:
; unused
	jumptext Route113IlexForestSignText

Route113Sign:
	jumptext Route113SignText

Route113TrainerTips:
	jumptext Route113TrainerTipsText


Route113Nugget:
	itemball NUGGET

Route113HiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_ROUTE_34_HIDDEN_RARE_CANDY

Route113HiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_ROUTE_34_HIDDEN_SUPER_POTION


CamperTodd1SeenText:
	text "Confío en mi"
	line "capacidad para"
	cont "criar #MON."

	para "¿Quieres verlo?"
	done

CamperTodd1BeatenText:
	text "¿He fallado en mi"
	line "entrenamiento?"
	done

CamperTodd1AfterText:
	text "A lo mejor debería"
	line "empezar un plan de"
	cont "entrenamiento"
	cont "especial."
	done


PicnickerGina1SeenText:
	text "¿Entrenas #MON?"

	para "Practiquemos"
	line "combatiendo."
	done

PicnickerGina1BeatenText:
	text "¡Oh, no! No"
	line "puedo ganar…"
	done

PicnickerGina1AfterText:
	text "Eres demasiado"
	line "fuerte para prac-"
	cont "ticar contigo."
	done

OfficerKeithSeenText:
	text "¿Quién anda ahí?"
	line "No perteneces al"
	cont "TEAM ROCKET,"
	cont "¿verdad?"
	done

OfficerKeithWinText:
	text "Eres un chiquillo"
	line "duro de pelar."
	done

OfficerKeithAfterText:
	text "Hoy no veo nada"
	line "sospechoso. Últi-"
	cont "mamente tuvimos"
	cont "problemas con el"
	cont "TEAM ROCKET, pero"
	cont "parece que ya se"
	cont "han ido."
	done

OfficerKeithDaytimeText:
	text "Estoy buscando"
	line "individuos"
	cont "sospechosos."
	done

PokefanmBrandonSeenText:
	text "Creo que algún día"
	line "seré lo bastante"
	para "fuerte para desa-"
	line "fiar a la LIGA."
	done

PokefanmBrandonBeatenText:
	text "¿Por qué acaba"
	line "así?"
	done

PokefanmBrandonAfterText:
	text "No creo tener el"
	line "valor suficiente"
	para "para afrontar el"
	line "desafío de la"
	cont "LIGA."
	done


Route113IlexForestSignText:
; unused
	text "BOSQUE JADE"
	line "Tras el acceso"
	done

Route113SignText:
	text "RUTA 113"

	para "CIUDAD ENHIESTA -"
	line "KANTO"
	done

Route113TrainerTipsText:
	text "PISTAS ENTRENADOR"

	para "Todos los días"
	line "crecen BAYAS en"
	cont "los árboles."

	para "Toma nota de los"
	line "tipos de BAYAS que"
	cont "tiene cada árbol"
	done
	
SoldierGeraldSeenText:
	text "¡Firme! ¡Rétame a"
	line "un combate!"

	para "¡Es una orden!"
	done
	
SoldierGeraldBeatenText:
	text "¡Despedido!"
	done
	
SoldierGeraldAfterText:
	text "¡Un buen combate"
	line "siempre levanta el"
	cont "ánimo!"
	done



Route113_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 49, ROUTE_113_ROUTE_114_GATE, 1
	warp_event  9, 49, ROUTE_113_ROUTE_114_GATE, 2


	db 0 ; coord events

	db 4 ; bg events
	bg_event 13,  5, BGEVENT_READ, Route113Sign
	bg_event  9, 31, BGEVENT_READ, Route113TrainerTips
	bg_event  3, 39, BGEVENT_ITEM, Route113HiddenRareCandy
	bg_event 17, 19, BGEVENT_ITEM, Route113HiddenSuperPotion

	db 6 ; object events
	object_event 13, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperTodd1, -1
	object_event 16, 29, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerGina1, -1
	object_event  6,  6, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OfficerKeithScript, -1
	object_event 14, 47, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmBrandon, -1
;	object_event 17, 48, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerCooltrainerfIrene, -1
;	object_event 18, 42, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfJenn, -1
;	object_event 14, 46, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfKate, -1
	object_event 19, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route113Nugget, EVENT_ROUTE_34_NUGGET
	object_event 17, 44, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, SoldierGeraldScript, -1
