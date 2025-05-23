	const_def 2 ; object constants
	const GOLDENRODDEPTSTORE5F_CLERK
	const GOLDENRODDEPTSTORE5F_LASS
	const GOLDENRODDEPTSTORE5F_MIKE
	const GOLDENRODDEPTSTORE5F_POKEFAN_M
	const GOLDENRODDEPTSTORE5F_RECEPTIONIST

WestportDeptStore5F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .CheckIfSunday

.CheckIfSunday:
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, .yes
	disappear GOLDENRODDEPTSTORE5F_RECEPTIONIST
	return

.yes
	appear GOLDENRODDEPTSTORE5F_RECEPTIONIST
	return

WestportDeptStore5FClerkScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM02_HEADBUTT
	iftrue .headbutt
;	checkevent EVENT_GOT_TM08_ROCK_SMASH
;	iftrue .onlyrocksmash
	jump .neither

.headbutt
;	checkevent EVENT_GOT_TM08_ROCK_SMASH
;	iftrue .both
	jump .onlyheadbutt

.neither
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_5F_1
	closetext
	end

.onlyheadbutt
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_5F_2
	closetext
	end

.onlyrocksmash
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_5F_3
	closetext
	end

.both
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_5F_4
	closetext
	end

WestportDeptStore5FReceptionistScript:
	faceplayer
	opentext
	checkcode VAR_WEEKDAY
	ifnotequal SUNDAY, .EventIsOver
	checkflag ENGINE_GOLDENROD_DEPT_STORE_TM27_RETURN
	iftrue .EventIsOver
	special GetFirstPokemonHappiness
	writetext UnknownText_0x56143
	buttonsound
	ifgreater 150 - 1, .VeryHappy
	ifgreater 50 - 1, .SomewhatHappy
	jump .NotVeryHappy

.VeryHappy:
	writetext UnknownText_0x5615a
	buttonsound
	verbosegiveitem TM_RETURN
	iffalse .Done
	setflag ENGINE_GOLDENROD_DEPT_STORE_TM27_RETURN
	closetext
	end

.SomewhatHappy:
	writetext UnknownText_0x561a6
	waitbutton
	closetext
	end

.NotVeryHappy:
	writetext UnknownText_0x561d8
	buttonsound
	verbosegiveitem BERRY
	iffalse .Done
	setflag ENGINE_GOLDENROD_DEPT_STORE_TM27_RETURN
	closetext
	end

.EventIsOver:
	writetext UnknownText_0x56202
	waitbutton
.Done:
	closetext
	end

Carrie:
	faceplayer
	opentext
	special GameboyCheck
	ifnotequal GBCHECK_CGB, .NotGBC ; This is a dummy check from Gold/Silver
	writetext UnknownText_0x56241
	waitbutton
	closetext
	special UnlockMysteryGift
	end

.NotGBC:
	writetext UnknownText_0x56279
	waitbutton
	closetext
	end

WestportDeptStore5FLassScript:
	jumptextfaceplayer WestportDeptStore5FLassText

Mike:
	faceplayer
	opentext
	trade NPC_TRADE_MIKE
	waitbutton
	closetext
	end
	
WestportDeptStore5FPoliScript:
	faceplayer
	opentext
	writetext WestportDeptStore5FPoliText
	cry POLIWRATH
	waitbutton
	closetext
	end


WestportDeptStore5FDirectory:
	jumptext WestportDeptStore5FDirectoryText

WestportDeptStore5FElevatorButton:
	jumpstd elevatorbutton

UnknownText_0x56143:
	text "Hola. ¡Oh, tu"
	line "#MON…!"
	done

UnknownText_0x5615a:
	text "Está muy unido a"
	line "ti."

	para "Este movimiento"
	line "sería perfecto"
	cont "para vosotros."
	done

UnknownText_0x561a6:
	text "¡Es adorable!"

	para "Enséñale unas"
	line "potentes MT."
	done

UnknownText_0x561d8:
	text "Parece enfadado."
	line "¿Quizás una BAYA"
	cont "lo animará?"
	done

UnknownText_0x56202:
	text "Seguro que hay MT"
	line "que serían"
	cont "perfectas para tus"
	cont "#MON."
	done

UnknownText_0x56241:
	text "REGALO MISTERIOSO."

	para "Con un simple bip,"
	line "recibes un regalo."

	para "Búscalo en el"
	line "menú."
	done

UnknownText_0x56279:
	text "La opción REGALO"
	line "MISTERIOSO es para"
	cont "Game Boy Color."
	done

WestportDeptStore5FLassText:
	text "Algunos #MON,"
	line "como EEVEE, pueden"
	para "evolucionar en"
	line "distintas formas."
	
	para "Mi POLIWRATH"
	line "evolucionó de"
	cont "POLIWHIRL."
	
	para "Pero también"
	line "podría haber"
	cont "evolucionado a"
	cont "POLITOED."
	done

WestportDeptStore5FPoliText:
	text "POLIWRATH:"
	line "¡Polipoli!"
	done


WestportDeptStore5FDirectoryText:
	text "Personaliza a tus"
	line "#MON"

	para "P4 TIENDA DE MT"
	done

WestportDeptStore5F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, WESTPORT_DEPT_STORE_4F, 1
	warp_event 15,  0, WESTPORT_DEPT_STORE_6F, 1
	warp_event  2,  0, WESTPORT_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, WestportDeptStore5FDirectory
	bg_event  3,  0, BGEVENT_READ, WestportDeptStore5FElevatorButton

	db 5 ; object events
	object_event  8,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore5FClerkScript, -1
	object_event  3,  6, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Mike, -1
	object_event 13,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore5FLassScript, -1
	object_event 13,  4, SPRITE_POLIWHIRL, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore5FPoliScript, -1
	object_event  7,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WestportDeptStore5FReceptionistScript, EVENT_GOLDENROD_DEPT_STORE_5F_HAPPINESS_EVENT_LADY
