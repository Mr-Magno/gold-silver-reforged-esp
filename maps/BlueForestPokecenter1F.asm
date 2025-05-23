	const_def 2 ; object constants
	const BLUEFORESTPOKECENTER1F_NURSE
	const BLUEFORESTPOKECENTER1F_GENTLEMAN
	const BLUEFORESTPOKECENTER1F_TWIN
	const BLUEFORESTPOKECENTER1F_COOLTRAINER_M

BlueForestPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlueForestPokecenter1FNurseScript:
	jumpstd pokecenternurse

BlueForestPokecenter1FGentlemanScript:
	jumptextfaceplayer BlueForestPokecenter1FGentlemanText

BlueForestPokecenter1FTwinScript:
	jumptextfaceplayer BlueForestPokecenter1FTwinText

BlueForestPokecenter1FCooltrainerMScript:
	jumpstd happinesschecknpc

BlueForestPokecenter1FGentlemanText:
	text "En la cima del MT."
	line "FUJI se encuentra"
	cont "la LIGA de NIHON."

	para "Dicen que allí se"
	line "reúnen los mejores"
	para "entrenadores de"
	line "todo el país."
	done

BlueForestPokecenter1FTwinText:
	text "Tenía un"
	line "movimiento que"
	para "quería enseñar"
	line "a mi #MON."

	para "Así que usé el"
	line "QUITA-MOVIMIENTOS"
	cont "y eliminé una MO."
	done

BlueForestPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, BLUE_FOREST, 5
	warp_event  6,  7, BLUE_FOREST, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlueForestPokecenter1FNurseScript, -1
	object_event 10,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlueForestPokecenter1FGentlemanScript, -1
	object_event  1,  4, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlueForestPokecenter1FTwinScript, -1
	object_event 10,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlueForestPokecenter1FCooltrainerMScript, -1
