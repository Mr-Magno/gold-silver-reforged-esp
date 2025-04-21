	const_def 2 ; object constants
	const BATTLETOWEROUTSIDE_STANDING_YOUNGSTER
	const BATTLETOWEROUTSIDE_BUENA
	const BATTLETOWEROUTSIDE_SAILOR
	const BATTLETOWEROUTSIDE_LASS

BattleTowerOutside_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .Callback1
	callback MAPCALLBACK_OBJECTS, .Callback2

.Callback1:
	return

.Callback2:
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	return

BattleTowerOutsideYoungsterScript:
	jumptextfaceplayer BattleTowerOutsideYoungsterText

BattleTowerOutsideBuenaScript:
	jumptextfaceplayer BattleTowerOutsideBuenaText

BattleTowerOutsideSailorScript:
	jumptextfaceplayer BattleTowerOutsideSailorText

BattleTowerOutsideSign:
	jumptext BattleTowerOutsideSignText
	
TatsugoPathSign:
	jumptext TatsugoPathSignText
	
ThiefNewBTScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_EXTRA_THIEF_TM
	iftrue .afterwards
	writetext ThiefManIntroText
	waitbutton
	verbosegiveitem TM_THIEF
	setevent EVENT_GOT_EXTRA_THIEF_TM
.afterwards:
	writetext ThiefManSecondText
	waitbutton
	closetext
	end
	
ThiefManIntroText:
	text "Pss…"
	line "Ey, chaval…"
	
	para "¿Quieres saber"
	line "cómo ganar en"
	cont "la TORRE BATALLA?"
	
	para "Necesitas equipar"
	line "objetos a tus"
	cont "#MON."
	
	para "Pero algunos"
	line "objetos son"
	cont "difíciles de con-"
	cont "seguir, ¿verdad?"
	
	para "Toma, ¡con ésto"
	line "será más fácil"
	cont "conseguirlos!"
	done

ThiefManSecondText:
	text "Con LADRÓN,"
	line "¡puedes quitarle"
	cont "los objetos a"
	cont "los entrenadores!"
	done


BattleTowerOutsideYoungsterText:
	text "¡Uau! ¡La"
	line "TORRE BATALLA"
	cont "es enorme!"
	done

BattleTowerOutsideBuenaText:
	text "Solo puedes usar"
	line "tres #MON."

	para "Es tan difícil"
	line "decidir con qué"

	para "tres debería"
	line "combatir…"
	done

BattleTowerOutsideSailorText:
	text "Jejeje, me"
	line "escabullí del"
	cont "trabajo."

	para "¡No puedo irme"
	line "hasta que gane!"

	para "¡Tengo que"
	line "ganarlo todo!"
	done

BattleTowerOutsideSignText:
	text "TORRE BATALLA"

	para "¡El desafío"
	line "definitivo de"
	cont "todo entrenador!"
	done

TatsugoPathSignText:
	text "CAMINO TATSUGO"
	
	para "PUEBLO AMAMI -"
	line "VILLA KIKAI"
	done

BattleTowerOutside_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  8,  9, BATTLE_TOWER_1F, 1
	warp_event  9,  9, BATTLE_TOWER_1F, 2
	warp_event 10, 21, AMAMI_BATTLE_TOWER_GATE, 3
	warp_event 11, 21, AMAMI_BATTLE_TOWER_GATE, 4
	warp_event 12, 24, AMAMI_BATTLE_TOWER_GATE, 5
	warp_event 12, 25, AMAMI_BATTLE_TOWER_GATE, 6
	
	db 0 ; coord events

	db 2 ; bg events
	bg_event 12, 10, BGEVENT_READ, BattleTowerOutsideSign
	bg_event 18, 22, BGEVENT_READ, TatsugoPathSign

	db 4 ; object events
	object_event  6, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideYoungsterScript, -1
	object_event 13, 13, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideBuenaScript, -1
	object_event 12, 18, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideSailorScript, EVENT_BATTLE_TOWER_OUTSIDE_SAILOR_NEW
	object_event  5, 17, SPRITE_PHARMACIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ThiefNewBTScript, -1
