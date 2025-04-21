	const_def 2 ; object constants
	const SUNPOINTCITY_STANDING_YOUNGSTER
	const SUNPOINTCITY_POKEFAN_M
	const SUNPOINTCITY_LASS
	const SUNPOINTCITY_ROCK1
	const SUNPOINTCITY_ROCK3
	const SUNPOINTCITY_POKEFAN_F
	const SUNPOINTCITY_BALL
	const SUNPOINTCITY_FRUIT_TREE_1
	const SUNPOINTCITY_FRUIT_TREE_2


SunpointCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CIANWOOD
	setevent EVENT_TEKNOS_BRIDGE_REPAIRED
	return


SunpointCityChucksWife:
	jumptextfaceplayer ChucksWifeFlySpeechText

SunpointCityYoungster:
	jumptextfaceplayer SunpointCityYoungsterText

SunpointCityPokefanM:
	jumptextfaceplayer SunpointCityPokefanMText

SunpointCityLass:
	jumptextfaceplayer SunpointCityLassText

SunpointCitySign:
	jumptext SunpointCitySignText
	
SunpointHiddenWaterStone:
	hiddenitem WATER_STONE, EVENT_SOUTH_POINT_HIDDEN_WATER_STONE

SunpointPharmacySign:
	jumpstd martsign

SunpointPhotoStudioSign:
	jumptext SunpointPhotoStudioSignText

SunpointPokeSeerSign:
	jumptext SunpointPokeSeerSignText

SunpointPokecenterSign:
	jumpstd pokecentersign

SunpointCityRock:
	jumpstd smashrock

SunpointCityHiddenRevive:
	hiddenitem REVIVE, EVENT_CIANWOOD_CITY_HIDDEN_REVIVE

SunpointCityHiddenMaxEther:
	itemball MAX_ETHER
	
SunpointFruitTree1:
	fruittree FRUITTREE_SUNPOINT_CITY_1
	
SunpointFruitTree2:
	fruittree FRUITTREE_SUNPOINT_CITY_2

ChucksWifeFlySpeechText:
	text "El clima en esta"
	line "parte de NIHON es"
	para "mucho más cálido"
	line "que en el resto."
	done

ChucksWifeChubbyText:
	text "Mi marido perdió"
	line "contra ti. Debería"
	cont "entrenarse más."

	para "Menos mal, porque"
	line "ya estaba"
	cont "engordando."
	done

SunpointCityYoungsterText:
	text "¿Has ido alguna"
	line "vez al BOSQUE"
	cont "AZUL?"
	para "Hace frío y está"
	line "cubierto de nieve."

	para "¡No podría vivir"
	line "allí!"

	para "No estoy hecho"
	line "para el frío."
	done

SunpointCityPokefanMText:
	text "Se dice que viven"
	line "#MON raros en"
	cont "el EJE MAGMA."

	para "Es difícil entrar"
	line "en la cueva porque"
	para "suelen desplomarse"
	line "las rocas y"
	cont "bloquean la"
	cont "entrada."
	done

SunpointCityLassText:
	text "Esta ciudad no"
	line "tiene GIMNASIO."

	para "No creo que"
	line "necesite uno, de"
	cont "todos modos."
	done

SunpointCitySignText:
	text "CIUDAD CALORINA"
	
	para "El enclave de"
	line "NIHON para el"
	cont "comercio"
	cont "internacional"
	done

SunpointPharmacySignText:
	text "FARMACIA de"
	line "CIUDAD CALORINA"

	para "Atendemos tus"
	line "consultas médicas"
	done

SunpointPhotoStudioSignText:
	text "PISTAS ENTRENADOR"
	
	para "¡Hacen falta"
	line "MEDALLAS para usar"
	para "los movimientos de"
	line "MO fuera de"
	cont "combate!"

	para "Aun así, pueden"
	line "usarse en combate."
	done

SunpointPokeSeerSignText:
	text "AVISO:"
	
	para "Desplome frecuente"
	line "de rocas peligro-"
	cont "sas desde el EJE"
	cont "MAGMA."

	para "Toma la debida"
	line "precaución si te"
	cont "acercas."
	done

SunpointCity_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event 18, 13, MAGMA_SHAFT_1F, 1
	warp_event 33, 16, SUNPOINT_POKECENTER_1F, 1
	warp_event 19, 24, SUNPOINT_MART, 1
	warp_event 33, 25, SUNPOINT_PHOTO_STUDIO, 1
	warp_event 35, 11, ROUTE_118_SUNPOINT_GATE, 1
	warp_event 26, 12, POKE_SEERS_HOUSE, 1
	warp_event 30,  5, SUNPOINT_DOCKS_SUNPOINT_GATE, 3
	warp_event 31,  5, SUNPOINT_DOCKS_SUNPOINT_GATE, 4
	warp_event 30, 31, ROUTE_119_SUNPOINT_GATE, 1
	warp_event 31, 31, ROUTE_119_SUNPOINT_GATE, 2
	warp_event 25, 23, SKATEBOARDER_HOUSE, 1

	db 0 ; coord events

	db 7 ; bg events
	bg_event 28, 20, BGEVENT_READ, SunpointCitySign
	bg_event 23, 33, BGEVENT_ITEM, SunpointHiddenWaterStone
	bg_event 34, 16, BGEVENT_READ, SunpointPokecenterSign
	bg_event 20, 24, BGEVENT_READ, SunpointPharmacySign
	bg_event 16, 24, BGEVENT_READ, SunpointPhotoStudioSign
	bg_event 30, 16, BGEVENT_READ, SunpointPokeSeerSign
	bg_event 35, 27, BGEVENT_ITEM, SunpointCityHiddenRevive

	db 9 ; object events
	object_event 27, 15, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SunpointCityYoungster, -1
	object_event 16, 29, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunpointCityPokefanM, -1
	object_event 32, 21, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunpointCityLass, -1
	object_event 19, 19, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunpointCityRock, -1
	object_event 17, 18, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunpointCityRock, -1
	object_event 15, 29, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunpointCityChucksWife, -1
	object_event 7,  26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SunpointCityHiddenMaxEther, EVENT_CIANWOOD_CITY_HIDDEN_MAX_ETHER
	object_event  1,  8, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunpointFruitTree1, -1
	object_event  2,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunpointFruitTree2, -1
