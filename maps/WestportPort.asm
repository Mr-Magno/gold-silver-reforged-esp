	const_def 2 ; object constants
	const WestportPort_SAILOR1
;	const WestportPort_SAILOR2
	const WestportPort_SAILOR3
	const WestportPort_FISHING_GURU1
	const WestportPort_FISHING_GURU2
	const WestportPort_YOUNGSTER
	const WestportPort_COOLTRAINER_F

WestportPort_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .LeaveFastShip ; SCENE_WestportPort_LEAVE_SHIP

	db 0 ; callbacks

.DummyScene0:
	end

.LeaveFastShip:
	priorityjump .LeaveFastShipScript
	end

.LeaveFastShipScript:
	disappear WestportPort_SAILOR1
	applymovement PLAYER, PlayerLeavesShip
	applymovement WestportPort_SAILOR3, SailorMovesAway
	applymovement PLAYER, PlayerLeavesShip2
	applymovement WestportPort_SAILOR3, SailorBlocksEntry
	setscene SCENE_DEFAULT
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	blackoutmod ALLOY_CITY
	appear WestportPort_SAILOR1
	end
	
WestportPortSailorGuardScript:
	faceplayer
	opentext
	checkflag ENGINE_HIVEBADGE
	iffalse .UnderMaintenance
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .E4notBeaten
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iffalse .FirstTime
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .MenuSWIsles
.E4notBeaten
	writetext WestportPortSailorGoToTekuText
	loadmenu WestportPortLocationMenu
	verticalmenu
	closewindow
	ifequal 1, .Going
	ifequal 2, .NotGoing
	jump .NotGoing
.FirstTime
	writetext WestportPortSailorFirstTimeIslesText
	jump .MenuSWIsles
.MenuSWIsles
	writetext WestportPortSailorGoToTekuText
	loadmenu WestportPortLocationMenu2
	verticalmenu
	closewindow
	ifequal 1, .Going
	ifequal 2, .GoingSW
	ifequal 3, .NotGoing
.NotGoing:
	writetext WestportPortSailorNotGoingToTekuText
	waitbutton
	closetext
	end
	
.Going
	writetext WestportPortSailorGoingToTeknosText
	waitbutton
	closetext
	applymovement PLAYER, PlayerWalkRight
	applymovement WestportPort_SAILOR3, SailorMovesAway
	applymovement PLAYER, PlayerWalksToShip
	opentext
	writetext WestportPortSailorBoardingSoonText
	closetext
	turnobject WestportPort_SAILOR1, DOWN
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear WestportPort_SAILOR1
	waitsfx
	applymovement PLAYER, PlayerEntersShip
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	warpfacing UP, TEKNOS_PORT, 4, 9
	end
	
.GoingSW
	writetext SailorSeeTicketText
	buttonsound
	checkitem S_S_TICKET
	iffalse .NoTicket
	writetext FlashedTheTicketText
	waitbutton
	writetext WestportPortSailorGoingToSWIsles
	waitbutton
	closetext
	applymovement PLAYER, PlayerWalkRight
	applymovement WestportPort_SAILOR3, SailorMovesAway
	applymovement PLAYER, PlayerWalksToShip
	opentext
	writetext WestportPortSailorBoardingSoonText
	closetext
	turnobject WestportPort_SAILOR1, DOWN
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear WestportPort_SAILOR1
	waitsfx
	applymovement PLAYER, PlayerEntersShip
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iffalse .FirstTimetoIslands
	clearevent EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	setevent EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	clearevent EVENT_BEAT_COOLTRAINERM_SEAN
	clearevent EVENT_BEAT_COOLTRAINERF_CAROL
	clearevent EVENT_BEAT_GENTLEMAN_EDWARD
	clearevent EVENT_BEAT_BEAUTY_CASSIE
	clearevent EVENT_BEAT_PSYCHIC_RODNEY
	clearevent EVENT_BEAT_SUPER_NERD_SHAWN
	clearevent EVENT_BEAT_SAILOR_GARRETT
	clearevent EVENT_BEAT_FISHER_JONAH
	clearevent EVENT_BEAT_BLACKBELT_WAI
.FirstTimetoIslands
	clearevent EVENT_FAST_SHIP_DESTINATION_WESTPORT
	appear WestportPort_SAILOR1
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_ENTER_SHIP
	warp FAST_SHIP_1F, 25, 1
	end
	
.UnderMaintenance
	writetext WestportPortSailorUnderMaintenanceText
	waitbutton
	closetext
	end
	
.NoTicket
	writetext SailorNoTicketText
	waitbutton
	closetext
	end

	
WestportPortLocationMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 4, 19, TEXTBOX_Y - 3
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 2 ; items
	db "CIUDAD TEKNOS@"
	db "SALIR@"

WestportPortLocationMenu2:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 3
	dw .MenuData2
	db 2 ; default option

.MenuData2:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "CIUDAD TEKNOS@"
	db "ISLAS PONIENTES@"
	db "SALIR@"


WestportPortFishingGuru1Script:
	faceplayer
	opentext
	writetext WestportPortFishingGuru1Text
	waitbutton
	closetext
	turnobject WestportPort_FISHING_GURU1, UP
	end

WestportPortFishingGuru2Script:
	faceplayer
	opentext
	writetext WestportPortFishingGuru2Text
	waitbutton
	closetext
	turnobject WestportPort_FISHING_GURU2, UP
	end

WestportPortYoungsterScript:
	faceplayer
	opentext
	writetext WestportPortYoungsterText
	waitbutton
	closetext
	turnobject WestportPort_YOUNGSTER, DOWN
	end

WestportPortCooltrainerFScript:
	faceplayer
	opentext
	writetext WestportPortCooltrainerFText
	waitbutton
	closetext
	turnobject WestportPort_COOLTRAINER_F, DOWN
	end

WestportPortHiddenProtein:
	hiddenitem PROTEIN, EVENT_OLIVINE_PORT_HIDDEN_PROTEIN

SailorBlocksEntry:
	step RIGHT
	step DOWN
	turn_head UP
	step_end

SailorMovesAway:
	step UP
	step LEFT
	turn_head RIGHT
	step_end

PlayerWalkRight:
	step RIGHT
	turn_head LEFT
	step_end

PlayerWalksToShip:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
PlayerEntersShip:
	step DOWN
	step_end
	
PlayerLeavesShip:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end
	
PlayerLeavesShip2:	
	step UP
	step UP
	step RIGHT
	step_end

WestportPortSailorNotGoingToTekuText:
	text "¡Esperamos volver"
	line "a verte!"
	done

WestportPortSailorGoToTekuText:
	text "Bienvenido al"
	line "MUELLE PONIENTE."

	para "¿Te gustaría ir en"
	line "barco hasta CIUDAD"
	cont "TEKNOS?"
	done
	
WestportPortSailorFirstTimeIslesText:
	text "Bienvenido al"
	line "MUELLE PONIENTE."

	para "Nuestros servicios"
	line "ahora incluyen"
	para "viajes tanto a"
	line "CIUDAD TEKNOS"
	para "como a ISLAS"
	line "PONIENTES."

	para "¿Dónde te gustaría"
	line "ir hoy?"
	done

WestportPortSailorGoingToTeknosText:
	text "¡Muy bien!"

	para "Zarpamos a CIUDAD"
	line "TEKNOS."
	done

WestportPortSailorBoardingSoonText:
	text "El barco va a"
	line "zarpar. Por favor,"
	cont "sube a bordo."
	done

WestportPortSailorGoingToSWIsles:
	text "¡Muy bien!"

	para "Zarpamos a PUEBLO"
	line "AMAMI en las"
	cont "ISLAS PONIENTES."
	done

SailorSeeTicketText:
	text "¿Puedo ver tu"
	line "TICKET BARCO?"
	done


UnknownText_0x74af6:
	text "¡Esperamos volver"
	line "a verte!"
	done

FlashedTheTicketText:
	text "<PLAYER> enseña"
	line "el TICKET BARCO."

	para "Muy bien."
	line "¡Gracias, joven!"
	done

SailorNoTicketText:
	text "¡Lo siento!"
	line "Para viajar a"
	para "ISLAS PONIENTES,"
	line "necesitas un"
	cont "TICKET BARCO."
	done

WestportPortFishingGuru1Text:
	text "Aquí es fácil"
	line "atrapar SHELLDER."

	para "En otros sitios"
	line "son raros."
	done

WestportPortFishingGuru2Text:
	text "¿Tienes alguna"
	line "CAÑA?"

	para "Las distintas"
	line "CAÑAS sirven para"
	cont "atrapar distintos"
	cont "#MON."
	done

WestportPortYoungsterText:
	text "¡El S.S. AQUA usa"
	line "propulsores para"
	cont "surcar las olas!"
	done

WestportPortCooltrainerFText:
	text "En las ISLAS hay"
	line "muchos #MON."

	para "¡Ojalá pudiera ir!"
	done

WestportPortSailorUnderMaintenanceText:
	text "Lo sentimos mucho,"
	line "pero por ahora,"
	para "el MUELLE PONIENTE"
	line "está cerrado por"
	cont "mantenimiento."
	done


WestportPort_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 11,  7, WESTPORT_PORT_PASSAGE, 5
	warp_event  7, 23, FAST_SHIP_1F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  1, 22, BGEVENT_ITEM, WestportPortHiddenProtein

	db 6 ; object events
	object_event  7, 23, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  7, 16, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportPortSailorGuardScript, -1
	object_event  4, 12, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestportPortFishingGuru1Script, EVENT_WESTPORT_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event  3,  9, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WestportPortFishingGuru2Script, EVENT_WESTPORT_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event  2, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportPortYoungsterScript, EVENT_WESTPORT_PORT_SPRITES_AFTER_HALL_OF_FAME
	object_event 11, 15, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportPortCooltrainerFScript, EVENT_WESTPORT_PORT_SPRITES_AFTER_HALL_OF_FAME
