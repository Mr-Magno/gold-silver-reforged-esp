	const_def 2 ; object constants
	const CROWN_CITY_LASS
	const CROWN_CITY_ROCKER
	const CROWN_CITY_JANINE

CrownCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CROWN
	return

CrownCityLassCoordScript:
	turnobject PLAYER, RIGHT
	turnobject CROWN_CITY_LASS, LEFT
	opentext
	writetext GoTrainerText
	waitbutton
	closetext
	setscene SCENE_CROWNCITY_NOTHING
	end

CrownCityLassScript:
	faceplayer
	opentext
	writetext GoTrainerText
	waitbutton
	closetext
	setscene SCENE_CROWNCITY_NOTHING
	end
	
CrownCityPokecenterSign:
	jumpstd pokecentersign
	
CrownCityMartSign:
	jumpstd martsign
	
CrownCitySign:
	jumptext CrownCitySignText
	
CrownCitySign2:
	jumptext CrownCitySign2Text
	
CrownCityRockerScript:
	jumptextfaceplayer CrownCityRockerText
	
CrownCityJanineScript:
	jumptextfaceplayer CrownCityJanineText
	
CrownCityJanineText:
	text "Mi hermano mayor"
	line "desafió una vez a"
	cont "la LIGA."

	para "No pudo"
	line "derrotarles."
	done
	
CrownCityRockerText:
	text "A pesar de lo"
	line "imponente que es"
	para "el MT. FUJI, esta"
	line "ciudad en la"
	para "ladera de la mon-"
	line "taña es realmente"
	cont "pintoresca."
	done
	
CrownCitySign2Text:
	text "CIUDAD CORONA"
	line "CASA DEL"
	cont "ENTRENADOR"
	done
	
CrownCitySignText:
	text "CIUDAD CORONA"

	para "El campamento para"
	line "los aspirantes de"
	cont "la LIGA"
	done
	
GoTrainerText:
	text "¡Entrenador!"

	para "¡Estás aquí porque"
	line "te has comprometi-"
	cont "do a escalar el"
	cont "MT. FUJI!"

	para "¡Reúne tu mejor"
	line "equipo #MON y"
	cont "todo tu poder!"

	para "¡Sube por la"
	line "cascada y comienza"
	cont "a escalar!"

	para "¡La LIGA te"
	line "espera!"
	done

CrownCity_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event 10, 25, CROWN_PASS, 2
	warp_event 11, 25, CROWN_PASS, 2
	warp_event  5, 22, CROWN_POKECENTER_1F, 1
	warp_event 11, 22, CROWN_MART, 1
	warp_event  9,  1, VICTORY_ROAD, 1
	warp_event  3, 17, CROWN_CITY_SCOPE_LENS_HOUSE, 1
	warp_event 15, 19, CROWN_CITY_SPEECH_HOUSE, 1
	warp_event 14, 15, CROWN_CITY_TRAINER_HOUSE, 1
	warp_event 15, 15, CROWN_CITY_TRAINER_HOUSE, 2

	db 1 ; coord events
	coord_event  8, 16, SCENE_CROWN_PASS_MEET_RIVAL, CrownCityLassCoordScript

	db 4 ; bg events
	bg_event  6, 22, BGEVENT_READ, CrownCityPokecenterSign
	bg_event 12, 22, BGEVENT_READ, CrownCityMartSign
	bg_event 10, 16, BGEVENT_READ, CrownCitySign
	bg_event 16, 16, BGEVENT_READ, CrownCitySign2

	db 3 ; object events
	object_event  9, 16, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CrownCityLassScript, -1
	object_event 12, 19, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CrownCityRockerScript, -1
	object_event  4, 19, SPRITE_BETA_GIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CrownCityJanineScript, -1
