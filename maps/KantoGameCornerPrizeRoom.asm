	const_def 2 ; object constants
	const CELADONGAMECORNERPRIZEROOM_GENTLEMAN
	const CELADONGAMECORNERPRIZEROOM_PHARMACIST
	const KANTOGAMECORNERPRIZEROOM_CLERK1
	const KANTOGAMECORNERPRIZEROOM_CLERK2
	const KANTOGAMECORNERPRIZEROOM_CLERK3

KantoGameCornerPrizeRoom_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonPrizeRoomGentlemanScript:
	jumptextfaceplayer CeladonPrizeRoomGentlemanText

CeladonPrizeRoomPharmacistScript:
	jumptextfaceplayer CeladonPrizeRoomPharmacistText

CeladonPrizeRoomTMVendor:
	opentext
	writetext CeladonPrizeRoom_PrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse CeladonPrizeRoom_NoCoinCase
	writetext CeladonPrizeRoom_AskWhichPrizeText
CeladonPrizeRoom_tmcounterloop:
	special DisplayCoinCaseBalance
	loadmenu CeladonPrizeRoom_TMMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .doubleteam
	ifequal 2, .psychic
	ifequal 3, .hyperbeam
	jump CeladonPrizeRoom_cancel

.doubleteam
	checkcoins 1500
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	itemtotext TM_DOUBLE_TEAM, MEM_BUFFER_0
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_cancel
	giveitem TM_DOUBLE_TEAM
	iffalse CeladonPrizeRoom_notenoughroom
	takecoins 1500
	jump CeladonPrizeRoom_purchased

.psychic
	checkcoins 3500
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	itemtotext TM_PSYCHIC_M, MEM_BUFFER_0
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_cancel
	giveitem TM_PSYCHIC_M
	iffalse CeladonPrizeRoom_notenoughroom
	takecoins 3500
	jump CeladonPrizeRoom_purchased

.hyperbeam
	checkcoins 7500
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	itemtotext TM_HYPER_BEAM, MEM_BUFFER_0
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_cancel
	giveitem TM_HYPER_BEAM
	iffalse CeladonPrizeRoom_notenoughroom
	takecoins 7500
	jump CeladonPrizeRoom_purchased

CeladonPrizeRoom_askbuy:
	writetext CeladonPrizeRoom_ConfirmPurchaseText
	yesorno
	end

CeladonPrizeRoom_purchased:
	waitsfx
	playsound SFX_TRANSACTION
	writetext CeladonPrizeRoom_HereYouGoText
	waitbutton
	jump CeladonPrizeRoom_tmcounterloop

CeladonPrizeRoom_notenoughcoins:
	writetext CeladonPrizeRoom_NotEnoughCoinsText
	waitbutton
	closetext
	end

CeladonPrizeRoom_notenoughroom:
	writetext CeladonPrizeRoom_NotEnoughRoomText
	waitbutton
	closetext
	end

CeladonPrizeRoom_cancel:
	writetext CeladonPrizeRoom_ComeAgainText
	waitbutton
	closetext
	end

CeladonPrizeRoom_NoCoinCase:
	writetext CeladonPrizeRoom_NoCoinCaseText
	waitbutton
	closetext
	end

CeladonPrizeRoom_TMMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "MT32    1500@"
	db "MT29    3500@"
	db "MT15    7500@"
	db "SALIR@"

CeladonPrizeRoomPokemonVendor:
	opentext
	writetext CeladonPrizeRoom_PrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse CeladonPrizeRoom_NoCoinCase
.loop
	writetext CeladonPrizeRoom_AskWhichPrizeText
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .pikachu
	ifequal 2, .dratini
	ifequal 3, .wolfan
	jump CeladonPrizeRoom_cancel

.pikachu
	checkcoins 2222
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, CeladonPrizeRoom_notenoughroom
	pokenamemem PIKACHU, MEM_BUFFER_0
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_cancel
	waitsfx
	playsound SFX_TRANSACTION
	writetext CeladonPrizeRoom_HereYouGoText
	waitbutton
	writebyte PIKACHU
	special GameCornerPrizeMonCheckDex
	givepoke PIKACHU, 25
	takecoins 2222
	jump .loop

.dratini
	checkcoins 5555
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, CeladonPrizeRoom_notenoughroom
	pokenamemem DRATINI, MEM_BUFFER_0
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_cancel
	waitsfx
	playsound SFX_TRANSACTION
	writetext CeladonPrizeRoom_HereYouGoText
	waitbutton
	writebyte DRATINI
	special GameCornerPrizeMonCheckDex
	givepoke DRATINI, 20
	takecoins 5555
	jump .loop

.wolfan
	checkcoins 8888
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, CeladonPrizeRoom_notenoughroom
	pokenamemem WOLFAN, MEM_BUFFER_0
	scall CeladonPrizeRoom_askbuy
	iffalse CeladonPrizeRoom_cancel
	waitsfx
	playsound SFX_TRANSACTION
	writetext CeladonPrizeRoom_HereYouGoText
	waitbutton
	writebyte WOLFAN
	special GameCornerPrizeMonCheckDex
	givepoke WOLFAN, 30
	takecoins 8888
	jump .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 17, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "PIKACHU    2222@"
	db "DRATINI    5555@"
	db "WOLFAN     8888@"
	db "SALIR@"
	
DummyVendorScript:
	end

KantoGameCornerDecorVendorScript:
	opentext
	writetext CeladonPrizeRoom_PrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse CeladonPrizeRoom_NoCoinCase
KantoGameCornerDecorVendor_LoopScript:
	writetext CeladonPrizeRoom_AskWhichPrizeText
	special DisplayCoinCaseBalance
	loadmenu KantoGameCornerDecorVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Poster
	ifequal 2, .Console
	ifequal 3, .BigDolls
	jump CeladonPrizeRoom_cancel
	
.Poster
	special DisplayCoinCaseBalance
	loadmenu KantoGameCornerPostersVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Pikachu
	ifequal 2, .Clefairy
	ifequal 3, .Jigglypuff
	jump CeladonPrizeRoom_cancel
	
.Pikachu
	checkcoins 1800
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	writetext SendItemToHomePCTextKanto
	yesorno
	iffalse CeladonPrizeRoom_cancel
	checkevent EVENT_DECO_POSTER_1
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_POSTER_1
	takecoins 1800
	jump KantoGameCornerDecorVendor_FinishScript
	end
	
.Clefairy
	checkcoins 1800
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	writetext SendItemToHomePCTextKanto
	yesorno
	iffalse CeladonPrizeRoom_cancel
	checkevent EVENT_DECO_POSTER_2
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_POSTER_2
	takecoins 1800
	jump KantoGameCornerDecorVendor_FinishScript
	end

.Jigglypuff
	checkcoins 1800
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	writetext SendItemToHomePCTextKanto
	yesorno
	iffalse CeladonPrizeRoom_cancel
	checkevent EVENT_DECO_POSTER_3
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_POSTER_3
	takecoins 1800
	jump KantoGameCornerDecorVendor_FinishScript
	end

.Console; COME_BACK2
	special DisplayCoinCaseBalance
	loadmenu KantoGameCornerConsoleVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .NESConsole
	ifequal 2, .SNESConsole
	ifequal 3, .VBConsole
	jump CeladonPrizeRoom_cancel
	
.NESConsole
	checkcoins 1800
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	writetext SendItemToHomePCTextKanto
	yesorno
	iffalse CeladonPrizeRoom_cancel
	checkevent EVENT_DECO_FAMICOM
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_FAMICOM
	takecoins 1800
	jump KantoGameCornerDecorVendor_FinishScript
	end
	
.SNESConsole
	checkcoins 1800
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	writetext SendItemToHomePCTextKanto
	yesorno
	iffalse CeladonPrizeRoom_cancel
	checkevent EVENT_DECO_SNES
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_SNES
	takecoins 1800
	jump KantoGameCornerDecorVendor_FinishScript
	end

.VBConsole
	checkcoins 1800
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	writetext SendItemToHomePCTextKanto
	yesorno
	iffalse CeladonPrizeRoom_cancel
	checkevent EVENT_DECO_VIRTUAL_BOY
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_VIRTUAL_BOY
	takecoins 1800
	jump KantoGameCornerDecorVendor_FinishScript
	end

.BigDolls; COME_BACK2
	special DisplayCoinCaseBalance
	loadmenu KantoGameCornerBigDollVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Onix
	ifequal 2, .Lapras
	jump CeladonPrizeRoom_cancel
	
.Onix
	checkcoins 2500
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	writetext SendItemToHomePCTextKanto
	yesorno
	iffalse CeladonPrizeRoom_cancel
	checkevent EVENT_DECO_BIG_ONIX_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_BIG_ONIX_DOLL
	takecoins 2500
	jump KantoGameCornerDecorVendor_FinishScript
	end

.Lapras
	checkcoins 2500
	ifequal HAVE_LESS, CeladonPrizeRoom_notenoughcoins
	writetext SendItemToHomePCTextKanto
	yesorno
	iffalse CeladonPrizeRoom_cancel
	checkevent EVENT_DECO_BIG_LAPRAS_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_BIG_LAPRAS_DOLL
	takecoins 2500
	jump KantoGameCornerDecorVendor_FinishScript
	end



.AlreadyHaveDecorItem
	writetext AlreadyHaveDecorItemTextKanto
	waitbutton
	jump KantoGameCornerDecorVendor_LoopScript


KantoGameCornerDecorVendor_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext CeladonPrizeRoom_HereYouGoText
	waitbutton
	jump KantoGameCornerDecorVendor_LoopScript

KantoGameCornerBigDollVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "ONIX GIGANTE 2500@"
	db "LAPRAS GIGA. 2500@"
	db "SALIR@"	

KantoGameCornerConsoleVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "NES          1800@"
	db "SUPER NES    1800@"
	db "VIRTUAL BOY  1800@"
	db "SALIR@"

KantoGameCornerPostersVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "PIKACHU      1800@"
	db "CLEFAIRY     1800@"
	db "JIGGLYPUFF   1800@"
	db "SALIR@"	
	
KantoGameCornerDecorVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "POSTERS@"
	db "CONSOLAS@"
	db "MUÑECOS@"
	db "SALIR@"

;----------------------------------

AlreadyHaveDecorItemTextKanto:
	text "Ya tienes este"
	line "objeto."
	done

SendItemToHomePCTextKanto:
	text "¿Quieres enviar"
	line "este objeto al PC"
	cont "de tu habitación?"
	done

CeladonPrizeRoomGentlemanText:
	text "Quería un PORYGON,"
	line "pero sólo tenía"
	cont "100 fichas…"
	done

CeladonPrizeRoomPharmacistText:
	text "¡Buff…!"

	para "Debo permanecer"
	line "tranquilo…"

	para "No puedo perder la"
	line "cabeza o lo echaré"
	cont "todo a perder…"
	done

CeladonPrizeRoom_PrizeVendorIntroText:
	text "¡Hola!"
	line "¡Aquí te cambiamos"
	cont "tus fichas por"
	cont "premios fabulosos!"
	done

CeladonPrizeRoom_AskWhichPrizeText:
	text "¿Qué premio"
	line "quieres?"
	done

CeladonPrizeRoom_ConfirmPurchaseText:
	text "De acuerdo,"
	line "¿@"
	text_ram wStringBuffer3
	text "?"
	done

CeladonPrizeRoom_HereYouGoText:
	text "¡Aquí tienes!"
	done

CeladonPrizeRoom_NotEnoughCoinsText:
	text "No tienes"
	line "bastantes fichas."
	done

CeladonPrizeRoom_NotEnoughRoomText:
	text "No tienes espacio"
	line "suficiente."
	done

CeladonPrizeRoom_ComeAgainText:
	text "¡Vuelve cuando"
	line "tengas fichas!"
	done

CeladonPrizeRoom_NoCoinCaseText:
	text "¡Vaya! No tienes"
	line "MONEDERO."
	done

KantoGameCornerPrizeRoom_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KANTO_REGION, 7
	warp_event  5,  7, KANTO_REGION, 7

	db 0 ; coord events

	db 3 ; bg events
	bg_event  2,  2, BGEVENT_READ, CeladonPrizeRoomTMVendor
	bg_event  4,  2, BGEVENT_READ, CeladonPrizeRoomPokemonVendor
	bg_event  6,  2, BGEVENT_READ, KantoGameCornerDecorVendorScript

	db 5 ; object events
	object_event  0,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonPrizeRoomGentlemanScript, -1
	object_event  8,  4, SPRITE_PHARMACIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonPrizeRoomPharmacistScript, -1
	object_event  2,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DummyVendorScript, -1
	object_event  4,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DummyVendorScript, -1
	object_event  6,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DummyVendorScript, -1
