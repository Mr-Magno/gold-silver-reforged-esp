	const_def 2 ; object constants
	const CIANWOODPOKECENTER1F_NURSE
	const CIANWOODPOKECENTER1F_LASS
	const CIANWOODPOKECENTER1F_GYM_GUY
	const CIANWOODPOKECENTER1F_SUPER_NERD

SunpointPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SunpointPokecenter1FNurseScript:
	jumpstd pokecenternurse

SunpointPokecenter1FLassScript:
	jumptextfaceplayer SunpointPokecenter1FLassText

CianwoodGymGuyScript:
	faceplayer
	checkevent EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	iftrue .CianwoodGymGuyWinScript
	opentext
	writetext CianwoodGymGuyText
	waitbutton
	closetext
	end

.CianwoodGymGuyWinScript:
	opentext
	writetext CianwoodGymGuyWinText
	waitbutton
	closetext
	end

SunpointPokecenter1FSuperNerdScript:
	jumptextfaceplayer SunpointPokecenter1FSuperNerdText

SunpointPokecenter1FLassText:
	text "¿A veces no te dan"
	line "ganas de enseñar"
	cont "tus #MON a tus"
	cont "amigos?"
	para "Yo siempre presumo"
	line "de mi precioso"
	cont "BELLRUN."
	done

CianwoodGymGuyText:
	text "¿Has ido al"
	line "MUELLE?"
	para "Se está cociendo"
	line "algo sospechoso"
	cont "allí."
	done

CianwoodGymGuyWinText:
	text "¿Esos que estaban"
	line "en el MUELLE no"
	para "eran miembros del"
	line "TEAM ROCKET?"
	para "¡No puedo creer"
	line "que hayan vuelto"
	cont "a dar la cara!"
	done


SunpointPokecenter1FSuperNerdText:
	text "Me encanta enseñar"
	line "los #MON que"
	cont "he criado."

	para "¿A ti no?"
	para "¡Voy a participar"
	line "en muchos combates"
	para "para poder mostrar"
	line "a mis #MON!"
	done

SunpointPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, SUNPOINT_CITY, 2
	warp_event  6,  7, SUNPOINT_CITY, 2
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunpointPokecenter1FNurseScript, -1
	object_event  1,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SunpointPokecenter1FLassScript, -1
	object_event 10,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodGymGuyScript, -1
	object_event 12,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SunpointPokecenter1FSuperNerdScript, -1
