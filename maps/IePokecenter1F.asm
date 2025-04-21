	const_def 2 ; object constants
	const IE_PC_NURSE
	const IEPC_NPC1
	const IEPC_NPC2

IePokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

IePokecenter1FNurseScript:
	jumpstd pokecenternurse

IePCNPC1Script:
	jumptextfaceplayer IePCNPC1Text

IePCNPC2Script:
	jumptextfaceplayer IePCNPC2Text


IePCNPC1Text:
	text "¡La vi!"
	line "¡Vi el fantasma"
	cont "de la triste"
	cont "mujer sobre el"
	cont "balcón del"
	cont "CASTILLO!"
	
	para "¡Nadie me cree,"
	line "pero es verdad!"
	done

IePCNPC2Text:
	text "¡Iría a explorar"
	line "el interior de"
	cont "la MONTAÑA del"
	cont "CASTILLO pero no"
	cont "quiero tener un"
	cont "encontronazo con"
	cont "el DRAGÓN VERDE!"
	done


IePokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, IE_TOWN, 1
	warp_event  6,  7, IE_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IePokecenter1FNurseScript, -1
	object_event 10,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IePCNPC1Script, -1
	object_event  8,  5, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IePCNPC2Script, -1