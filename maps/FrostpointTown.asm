	const_def 2 ; object constants
	const FROSTPOINTTOWN_TWIN
	const FROSTPOINTTOWN_ROCKER
	const FROSTPOINTTOWN_TEACHER
	const FROSTPOINTTOWN_FRUIT_TREE

FrostpointTown_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_FROSTPOINT
	return

FrostpointTownFruitTree:
	fruittree FRUITTREE_FROSTPOINT_TOWN
	
FrostpointTownGymSign:
	jumptext FrostpointTownGymSignText

FrostpointTownSign:
	jumptext FrostpointTownSignText

FrostpointTownPokecenterSign:
	jumpstd pokecentersign

FrostpointTownMartSign:
	jumpstd martsign

FrostpointTownHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_FROSTPOINT_TOWN_HIDDEN_RARE_CANDY

FrostpointTownTwinScript:
	jumptextfaceplayer FrostpointTownTwinText

FrostpointTownRockerScript:
	jumptextfaceplayer FrostpointTownRockerText

FrostpointTownTeacherScript:
	jumptextfaceplayer FrostpointTownTeacherText

FrostpointTownTwinText:
	text "¡Me encanta la"
	line "nieve!"

	para "Y nadar también,"
	line "pero aquí hace"
	cont "demasiado frío"
	cont "para eso."
	done

FrostpointTownRockerText:
	text "El aire de aquí es"
	line "muy fresco y"
	cont "limpio."

	para "Nunca podría vivir"
	line "en una ciudad"
	cont "contaminada."
	done

FrostpointTownTeacherText:
	text "¿Has venido por el"
	line "PASAJE ABISAL?"
	cont "Es difícil llegar"
	cont "así hasta aquí por"
	cont "los remolinos que"
	cont "hay en el agua."

	para "La esposa de FREDO"
	line "conoce una técnica"
	cont "secreta que le"
	cont "permite a los"
	cont "#MON"
	cont "atravesarlos."
	done

FrostpointTownGymSignText:
	text "ENTRADA NORTE DEL"
	line "PASAJE ABISAL"
	done

FrostpointTownSignText:
	text "PUEBLO ESCARCHA"

	para "La gélida tierra"
	line "de la gente fuerte"
	done

FrostpointTown_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 13, 12, FROSTPOINT_POKECENTER_1F, 1
	warp_event 11,  5, DEEPWATER_PASSAGE_1F, 8
	warp_event 15,  8, FROSTPOINT_MART, 1
	warp_event  5,  7, PRYCES_FAMILY_HOUSE, 1
	warp_event  5, 11, FROSTPOINT_SPEECH_HOUSE, 1

	db 0 ; coord events

	db 5 ; bg events
	bg_event 14, 12, BGEVENT_READ, FrostpointTownPokecenterSign
	bg_event 16,  8, BGEVENT_READ, FrostpointTownMartSign
	bg_event 12,  6, BGEVENT_READ, FrostpointTownGymSign
	bg_event  8, 14, BGEVENT_READ, FrostpointTownSign
	bg_event  8,  6, BGEVENT_ITEM, FrostpointTownHiddenRareCandy

	db 4 ; object events
	object_event  8, 11, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FrostpointTownTwinScript, -1
	object_event 13,  7, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FrostpointTownRockerScript, -1
	object_event  6,  9, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FrostpointTownTeacherScript, -1
	object_event 10,  9, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FrostpointTownFruitTree, -1
