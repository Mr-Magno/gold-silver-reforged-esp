	const_def 2 ; object constants
	const PAGOTACITY_LASS
	const PAGOTACITY_SUPER_NERD
	const PAGOTACITY_GRAMPS
	const PAGOTACITY_YOUNGSTER
	const PAGOTACITY_FRUIT_TREE
	const PAGOTACITY_POKE_BALL1
	const PAGOTACITY_POKE_BALL2
	const PAGOTACITY_GRAMPS2

PagotaCity_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_OBJECTS, .grampsgone

.FlyPoint:
	setflag ENGINE_FLYPOINT_VIOLET
	return
	
.grampsgone
	checkevent EVENT_TALKED_TO_KURT_AND_FALKNER
	iftrue .gone
	return
	
.gone
	disappear PAGOTACITY_GRAMPS2
	return

PagotaCityLassScript:
	jumptextfaceplayer PagotaCityLassText

PagotaCitySuperNerdScript:
	jumptextfaceplayer PagotaCitySuperNerdText

PagotaCityGrampsScript:
	jumptextfaceplayer PagotaCityGrampsText
	
PagotaCityGrampsScript2:
	jumptextfaceplayer PagotaCityGramps2Text

PagotaCityYoungsterScript:
	jumptextfaceplayer PagotaCityYoungsterText

KurtsHouseSign:
	jumptext KurtsHouseSignText

PagotaCitySign:
	jumptext PagotaCitySignText

PagotaGymSign:
	jumptext PagotaGymSignText

BrassTowerSign:
	jumptext BrassTowerSignText

EarlsPokemonAcademySign:
	jumptext EarlsPokemonAcademySignText

BillsHouseSign2:
	jumptext BillsHouseSign2Text

PagotaCityPokecenterSign:
	jumpstd pokecentersign

PagotaCityMartSign:
	jumpstd martsign

PagotaCityPPUp:
	itemball PP_UP

PagotaCityRareCandy:
	itemball RARE_CANDY
	

PagotaCityFruitTree:
	fruittree FRUITTREE_PAGOTA_CITY 

PagotaCityHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_PAGOTA_CITY_HIDDEN_HYPER_POTION
	
KurtsDoorLockedScript:
	opentext
	writetext KurtsDoorLockedText
	waitbutton
	closetext
	applymovement PLAYER, KurtsDoorLocked_Movement
	end
	
KurtsDoorLocked_Movement:
	step DOWN
	step_end

	
KurtsDoorLockedText:
	text "Está cerrado…"
	done

PagotaCityLassText:
	text "Dicen que en la"
	line "TORRE GODAI hay"
	cont "fantasmas."

	para "Y que los #MON"
	line "de tipo normal no"
	cont "afectan a los"
	cont "fantasmas."
	done

PagotaCitySuperNerdText:
	text "¿Entrenas #MON?"

	para "¡Si ganas a este"
	line "LÍDER de GIMNASIO,"
	para "estarás en el"
	line "camino del éxito!"
	done

PagotaCityGrampsText:
	text "¡PEGASO, del"
	line "GIMNASIO #MON"
	para "de CIUDAD PAGOTA,"
	line "es magnífico!"

	para "Sus #MON de"
	line "tipo volador están"
	para "entrenados para"
	line "actuar en desfiles"
	cont "y otros eventos."
	done
	
PagotaCityGramps2Text:
	text "Lo siento…"
	para "Están limpiando"
	line "la TORRE ahora."

	para "Vuelves más"
	line "tarde."
	done
	
PagotaCityGuardText:
	text "El LÍDER de"
	para "GIMNASIO no"
	line "está ahora."

	para "Vuelves más"
	line "tarde."
	done

PagotaCityYoungsterText:
	text "¡Detrás de mí está"
	line "la TORRE GODAI!"
	
	para "Mucho intentan"
	line "llegar a la cima"
	cont "para recibir la"
	cont "bendición."
	
	para "Sin ella, no"
	line "puedes desafiar"
	cont "al GIMNASIO."
	done

PagotaCitySignText:
	text "CIUDAD PAGOTA"

	para "Tan eterna como"
	line "las estrellas"
	cont "sobre ella"
	done

PagotaGymSignText:
	text "LÍDER DEL GIMNASIO"
	line "#MON DE CIUDAD"
	cont "PAGOTA: PEGASO"

	para "El elegante"
	line "maestro de los"
	cont "#MON voladores"
	done

BrassTowerSignText:
	text "TORRE LATÓN"

	para "Experimenta el"
	line "Camino de los"
	cont "#MON"
	done

EarlsPokemonAcademySignText:
	text "GALERÍA DE ARTE"
	line "DE GABRIEL"
	done
	
KurtsHouseSignText:
	text "CASA DE CÉSAR"
	done
	
BillsHouseSign2Text:
	text "CASA DE BILL"
	done
	


PagotaCity_MapEvents:
	db 0, 0 ; filler

	db 14 ; warp events
	warp_event  3, 26, PAGOTA_MART, 1
	warp_event 26, 14, PAGOTA_GYM, 1
	warp_event 27, 14, PAGOTA_GYM, 2
	warp_event 10, 26, PAGOTA_NICKNAME_SPEECH_HOUSE, 1
	warp_event 27, 28, PAGOTA_POKECENTER_1F, 1
	warp_event 22, 26, PAGOTA_TRAINER_SCHOOL, 1
	warp_event 11, 17, BRASS_TOWER_1F, 1
	warp_event 19, 31, ROUTE_101_PAGOTA_GATE, 2
	warp_event 18, 31, ROUTE_101_PAGOTA_GATE, 1
	warp_event  3, 31, KURTS_HOUSE, 1
	warp_event 12, 17, BRASS_TOWER_1F, 2
	warp_event  4, 14, EARLS_ART_HOUSE, 1
	warp_event  5, 14, EARLS_ART_HOUSE, 2
	warp_event 30, 22, BILLS_FAMILYS_HOUSE, 1

	db 1 ; coord events
	coord_event  3, 32, SCENE_KURTS_HOUSE_LOCKED, KurtsDoorLockedScript

	db 9 ; bg events
	bg_event 20, 29, BGEVENT_READ, PagotaCitySign
	bg_event 28, 16, BGEVENT_READ, PagotaGymSign
	bg_event  8, 16, BGEVENT_READ, BrassTowerSign
	bg_event  8, 14, BGEVENT_READ, EarlsPokemonAcademySign
	bg_event 28, 28, BGEVENT_READ, PagotaCityPokecenterSign
	bg_event  4, 26, BGEVENT_READ, PagotaCityMartSign
	bg_event 14, 11, BGEVENT_ITEM, PagotaCityHiddenHyperPotion
	bg_event  4, 32, BGEVENT_READ, KurtsHouseSign
	bg_event 26, 22, BGEVENT_READ, BillsHouseSign2

	db 8 ; object events
	object_event 26, 30, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PagotaCityLassScript, -1
	object_event 24, 18, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PagotaCitySuperNerdScript, -1
	object_event 15, 25, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PagotaCityGrampsScript, -1
	object_event 10, 21, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PagotaCityYoungsterScript, -1
	object_event 23, 21, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PagotaCityFruitTree, -1
	object_event 16,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PagotaCityPPUp, EVENT_PAGOTA_CITY_PP_UP
	object_event 23,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PagotaCityRareCandy, EVENT_PAGOTA_CITY_RARE_CANDY
	object_event  9, 19, SPRITE_GRAMPS, SPRITEMOVEDATA_STILL, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PagotaCityGrampsScript2, 0
