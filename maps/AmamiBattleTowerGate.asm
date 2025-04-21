	const_def 2 ; object constants
	const AMAMIBATTLETOWERGATE_ROCKER
	const AMAMIBATTLETOWERGATE_TWIN

AmamiBattleTowerGate_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ShowSailor

.ShowSailor:
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR_NEW
	return

AmamiBattleTowerGateRockerScript:
	jumptextfaceplayer AmamiBattleTowerGateRockerText

AmamiBattleTowerGateTwinScript:
	jumptextfaceplayer AmamiBattleTowerGateTwinText

AmamiBTGateCopScript:
	jumptextfaceplayer AmamiBTGateCopText

UnknownText_0x9f66f:
	text "¿También has"
	line "venido a ver"
	cont "la TORRE BATALLA?"

	para "Aunque supongo"
	line "que todavía no"
	cont "puedes entrar."
	done

UnknownText_0x9f6ba:
	text "La TORRE BATALLA"
	line "ha abierto."

	para "Quiero ir, pero"
	line "no he pensado en"

	para "una frase guay"
	line "para cuando gane."
	done

AmamiBattleTowerGateRockerText:
	text "¿Vas a la"
	line "TORRE BATALLA?"

	para "Es un secreto,"
	line "pero si ganas un"

	para "montón, podrás"
	line "conseguir regalos"
	cont "especiales."
	done

UnknownText_0x9f783:
	text "Voy a entrenar a"
	line "mis #MON, así"

	para "estaré bien pre-"
	line "parado para la"
	cont "TORRE BATALLA."
	done

AmamiBattleTowerGateTwinText:
	text "Los niveles de"
	line "los #MON que"

	para "quiero usar son"
	line "todos diferentes."

	para "¡Debo ir a"
	line "entrenarlos!"
	done

AmamiBTGateCopText:
	text "Si sigues al"
	line "este, llegarás"
	cont "a PUEBLO"
	cont "KIKAI."
	
	para "Aunque mucha"
	line "gente viene por"
	cont "la TORRE BATALLA."
	done


AmamiBattleTowerGate_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  0,  4, AMAMI_TOWN, 10
	warp_event  0,  5, AMAMI_TOWN, 9
	warp_event  7,  0, BATTLE_TOWER_OUTSIDE, 3
	warp_event  8,  0, BATTLE_TOWER_OUTSIDE, 4
	warp_event  9,  4, BATTLE_TOWER_OUTSIDE, 5
	warp_event  9,  5, BATTLE_TOWER_OUTSIDE, 6

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3,  1, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AmamiBattleTowerGateRockerScript, EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	object_event  5,  4, SPRITE_TWIN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AmamiBattleTowerGateTwinScript, -1
	object_event  4,  7, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AmamiBTGateCopScript, -1
