	const_def 2 ; object constants
	const CROWN_CITY_TRAINER_HOUSE_SUPER_NERD
	const CROWN_CITY_TRAINER_HOUSE_COOLTRAINER_F
	const CROWN_CITY_TRAINER_HOUSE_COOLTRAINER_M
	const CROWN_CITY_TRAINER_HOUSE_ROCKER
	const CROWN_CITY_TRAINER_HOUSE_LASS

CrownCityTrainerHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CrownCityTrainerHouseSuperNerdScript:
	jumptextfaceplayer CrownCityTrainerHouseSuperNerdText

CrownCityTrainerHouseCooltrainerfScript:
	jumptextfaceplayer CrownCityTrainerHouseCooltrainerfText

CrownCityTrainerHouseCooltrainermScript:
	jumptextfaceplayer CrownCityTrainerHouseCooltrainermText

CrownCityTrainerHouseRockerScript:
	jumptextfaceplayer CrownCityTrainerHouseRockerText

CrownCityTrainerHouseBookshelf:
	jumpstd magazinebookshelf

CrownCityTrainerHouseLassScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM42_DREAM_EATER
	iftrue .GotDreamEater
	writetext CrownCityDreamEaterFisherText
	buttonsound
	verbosegiveitem TM_DREAM_EATER
	iffalse .NoRoomForDreamEater
	setevent EVENT_GOT_TM42_DREAM_EATER
.GotDreamEater:
	writetext CrownCityDreamEaterFisherGotDreamEaterText
	waitbutton
.NoRoomForDreamEater:
	closetext
	end

CrownCityDreamEaterFisherText:
	text "¡Qué sueño!"

	para "He estado entre-"
	line "nando mucho"
	cont "últimamente…"

	para "Estoy tan cansada"
	line "que podría dormir-"
	cont "me aquí mismo."

	para "¿Sabías que hay un"
	line "movimiento que"
	para "solo es efectivo"
	line "contra #MON"
	cont "dormidos?"

	para "Toma, compruébalo."
	done

CrownCityDreamEaterFisherGotDreamEaterText:
	text "MT42 contiene"
	line "COMESUEÑOS…"

	para "¡Zzzzz…!"
	done

CrownCityTrainerHouseRockerText:
	text "¿Cuál de mis"
	line "#MON es lo"
	para "bastante fuerte"
	line "para enfrentarse a"
	cont "la LIGA?"
	done

CrownCityTrainerHouseCooltrainermText:
	text "¡Estoy listo!"

	para "¡Puedo hacerlo!"

	para "Solo me estoy"
	line "mentalizando."
	done

CrownCityTrainerHouseSuperNerdText:
	text "He oído que en la"
	line "LIGA hay entrena-"
	para "dores que usan los"
	line "tipos psíquico,"
	para "veneno, fantasma,"
	line "agua y dragón."
	done

CrownCityTrainerHouseCooltrainerfText:
	text "Tuve que esforzar-"
	line "me mucho para"
	cont "conseguir las ocho"
	cont "MEDALLAS."

	para "Creo que debo"
	line "entrenar más antes"
	cont "de desafiar a la"
	cont "LIGA."
	done

CrownCityTrainerHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7,  7, CROWN_CITY, 8
	warp_event  8,  7, CROWN_CITY, 9

	db 0 ; coord events

	db 4 ; bg events
	bg_event  8,  1, BGEVENT_READ, CrownCityTrainerHouseBookshelf
	bg_event  9,  1, BGEVENT_READ, CrownCityTrainerHouseBookshelf
	bg_event 10,  1, BGEVENT_READ, CrownCityTrainerHouseBookshelf
	bg_event 11,  1, BGEVENT_READ, CrownCityTrainerHouseBookshelf

	db 5 ; object events
	object_event  2,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CrownCityTrainerHouseSuperNerdScript, -1
	object_event  1,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CrownCityTrainerHouseCooltrainerfScript, -1
	object_event  4,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CrownCityTrainerHouseCooltrainermScript, -1
	object_event 10,  3, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CrownCityTrainerHouseRockerScript, -1
	object_event 13,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CrownCityTrainerHouseLassScript, -1
