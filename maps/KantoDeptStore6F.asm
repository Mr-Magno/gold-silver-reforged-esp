	const_def 2 ; object constants
	const CELADONDEPTSTORE6F_SUPER_NERD
	const CELADONDEPTSTORE6F_YOUNGSTER

KantoDeptStore6F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .HideRooftopStairs

.HideRooftopStairs:
	changeblock 12, 0, $03 ; wall
	return

KantoDeptStore6FSuperNerdScript:
	jumptextfaceplayer KantoDeptStore6FSuperNerdText

KantoDeptStore6FYoungsterScript:
	jumptextfaceplayer KantoDeptStore6FYoungsterText

KantoDeptStore6FVendingMachine:
	opentext
	writetext CeladonVendingText
.Start:
	special PlaceMoneyTopRight
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .FreshWater
	ifequal 2, .SodaPop
	ifequal 3, .Lemonade
	closetext
	end

.FreshWater:
	checkmoney YOUR_MONEY, 200
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem FRESH_WATER
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 200
	itemtotext FRESH_WATER, MEM_BUFFER_0
	jump .VendItem

.SodaPop:
	checkmoney YOUR_MONEY, 300
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem SODA_POP
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 300
	itemtotext SODA_POP, MEM_BUFFER_0
	jump .VendItem

.Lemonade:
	checkmoney YOUR_MONEY, 350
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem LEMONADE
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 350
	itemtotext LEMONADE, MEM_BUFFER_0
	jump .VendItem

.VendItem:
	pause 10
	playsound SFX_ENTER_DOOR
	writetext CeladonClangText
	buttonsound
	itemnotify
	jump .Start

.NotEnoughMoney:
	writetext CeladonVendingNoMoneyText
	waitbutton
	jump .Start

.NotEnoughSpace:
	writetext CeladonVendingNoSpaceText
	waitbutton
	jump .Start

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "AGUA FRESCA  200¥@"
	db "REFRESCO     300¥@"
	db "LIMONADA     350¥@"
	db "SALIR@"

KantoDeptStore6FDirectory:
	jumptext KantoDeptStore6FDirectoryText

; unused
KantoDeptStore6FElevatorButton:
	jumpstd elevatorbutton

CeladonVendingText:
	text "¡Una máquina"
	line "expendedora!"
	done

CeladonClangText:
	text "¡Clang!"

	para "Salió"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

CeladonVendingNoMoneyText:
	text "¡Uups, no tienes"
	line "bastantes dinero!"
	done

CeladonVendingNoSpaceText:
	text "No hay sitio"
	line "para nada más…"
	done

KantoDeptStore6FSuperNerdText:
	text "Una máquina expen-"
	line "dedora con una"
	cont "ruleta de premios…"

	para "Nunca verás"
	line "nada igual."
	done

KantoDeptStore6FYoungsterText:
	text "¡Auu! ¡Aquí no"
	line "hay juegos!"

	para "Quería jugar…"
	done

KantoDeptStore6FDirectoryText:
	text "P5: AZOTEA"
	line "EXPENDEDORAS"
	done

KantoDeptStore6F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 15,  0, KANTO_DEPT_STORE_5F, 2
	warp_event  2,  0, KANTO_DEPT_STORE_ELEVATOR, 1

	db 0 ; coord events

	db 6 ; bg events
	bg_event 14,  0, BGEVENT_READ, KantoDeptStore6FDirectory
	bg_event  3,  0, BGEVENT_READ, KantoDeptStore1FElevatorButton
	bg_event  8,  1, BGEVENT_UP, KantoDeptStore6FVendingMachine
	bg_event  9,  1, BGEVENT_UP, KantoDeptStore6FVendingMachine
	bg_event 10,  1, BGEVENT_UP, KantoDeptStore6FVendingMachine
	bg_event 11,  1, BGEVENT_UP, KantoDeptStore6FVendingMachine

	db 2 ; object events
	object_event  9,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoDeptStore6FSuperNerdScript, -1
	object_event 12,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KantoDeptStore6FYoungsterScript, -1
