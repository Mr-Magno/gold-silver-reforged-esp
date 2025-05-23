	const_def 2 ; object constants
	const GOLDENRODDEPTSTORE4F_CLERK
	const GOLDENRODDEPTSTORE4F_COOLTRAINER_M
	const GOLDENRODDEPTSTORE4F_BUG_CATCHER
	const GOLDENRODDEPTSTORE4F_GAMEBOY_KID

WestportDeptStore4F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WestportDeptStore4FClerkScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_GOLDENROD_4F
	closetext
	end

WestportDeptStore4FCooltrainerMScript:
	jumptextfaceplayer WestportDeptStore4FCooltrainerMText

WestportDeptStore4FBugCatcherScript:
	jumptextfaceplayer WestportDeptStore4FBugCatcherText

WestportDeptStore4FGameboyKidScript:
	faceplayer
	opentext
	writetext WestportDeptStore4FGameboyKidText
	waitbutton
	closetext
	turnobject GOLDENRODDEPTSTORE4F_GAMEBOY_KID, DOWN
	end

WestportDeptStore4FDirectory:
	jumptext WestportDeptStore4FDirectoryText
	


WestportDeptStore4FElevatorButton:
	jumpstd elevatorbutton

WestportDeptStore4FCooltrainerMText:
	text "Me encantan los"
	line "#MON fuertes."

	para "Les doy PROTEÍNAS"
	line "para mejorar su"
	cont "ATAQUE."
	done

WestportDeptStore4FBugCatcherText:
	text "El HIERRO mejora"
	line "su DEFENSA."
	done

WestportDeptStore4FGameboyKidText:
	text "Algunos #MON"
	line "evolucionan al"
	para "intercambiarlos"
	line "con el Game Link."

	para "Por ejemplo:"
	line "MACHOKE, KADABRA,"
	para "HAUNTER y"
	line "GRAVELER."

	para "Dicen que hay"
	line "otros también."
	done

WestportDeptStore4FDirectoryText:
	text "¡Fortalecemos a"
	line "tus #MON!"

	para "P3 BOTIQUÍN"
	done

WestportDeptStore4F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  0, WESTPORT_DEPT_STORE_5F, 1
	warp_event 15,  0, WESTPORT_DEPT_STORE_3F, 2
	warp_event  2,  0, WESTPORT_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14,  0, BGEVENT_READ, WestportDeptStore4FDirectory
	bg_event  3,  0, BGEVENT_READ, WestportDeptStore4FElevatorButton

	db 4 ; object events
	object_event 13,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore4FClerkScript, -1
	object_event  8,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore4FCooltrainerMScript, -1
	object_event  7,  2, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore4FBugCatcherScript, -1
	object_event  5,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStore4FGameboyKidScript, -1
