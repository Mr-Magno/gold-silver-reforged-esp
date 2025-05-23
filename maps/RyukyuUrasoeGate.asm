	const_def 2 ; object constants
	const ROUTE6SAFFRONGATE_OFFICER
	const RYUKYUURASOEPARKGATE_CLERK

RyukyuUrasoeGate_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .DollSaturday

.DollSaturday:
	checkcode VAR_WEEKDAY
	ifequal SATURDAY, .DollSaturdayAppears
	disappear RYUKYUURASOEPARKGATE_CLERK
	return

.DollSaturdayAppears:
	appear RYUKYUURASOEPARKGATE_CLERK
	return

.DummyScene:
	end

Route6SaffronGuardScript:
	jumptextfaceplayer Route6SaffronGuardWelcomeText

;-------------
	
TravelingDollSalesmanSaturday:
	faceplayer
	opentext
	writetext DollSalesmanTextSaturday
	waitbutton
DollSalesmanSaturday_LoopScript:
	writetext DollSalesmanTextSaturday_AskWhichPrizeText
	special PlaceMoneyTopRight
	loadmenu DollSalesmanSaturdayMenu
	verticalmenu
	closewindow
	ifequal 1, .Doll1
	ifequal 2, .Doll2
	jump DollSalesmanSaturday_Cancel
	
.Doll1
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanSaturdayNoMoney
	writetext SendItemToPCTextDollSaturday
	yesorno
	iffalse DollSalesmanSaturday_Cancel
	checkevent EVENT_DECO_MACHOP_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_MACHOP_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanSaturday_FinishScript
	end
	
.Doll2
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, DollSalesmanSaturdayNoMoney
	writetext SendItemToPCTextDollSaturday
	yesorno
	iffalse DollSalesmanSaturday_Cancel
	checkevent EVENT_DECO_TENTACOOL_DOLL
	iftrue .AlreadyHaveDecorItem
	setevent EVENT_DECO_TENTACOOL_DOLL
	takemoney YOUR_MONEY, 5000
	jump DollSalesmanSaturday_FinishScript
	end
	

	
.AlreadyHaveDecorItem
	writetext AlreadyHaveDecorItemTextSalesmanSaturday
	waitbutton
	jump DollSalesmanSaturday_LoopScript

	
DollSalesmanSaturdayMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "MACHOP      5000¥@"
	db "TENTACOOL   5000¥@"
	db "SALIR@"
	
DollSalesmanSaturday_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext DollSalesmanSaturday_HereYouGoText
	waitbutton
	jump DollSalesmanSaturday_LoopScript

DollSalesmanSaturday_Cancel:
	writetext DollSalesmanSaturdayComeAgain
	waitbutton
	closetext
	end

	
DollSalesmanSaturdayNoMoney:
	writetext DollSalesmanSaturdayNoMoneyText
	waitbutton
	closetext
	end
	
SendItemToPCTextDollSaturday:
	text "¿Quieres enviar"
	line "este MUÑECO al PC"
	cont "de tu dormitorio?"
	done

AlreadyHaveDecorItemTextSalesmanSaturday:
	text "¡Ya tienes este"
	line "MUÑECO!"
	done

DollSalesmanSaturday_HereYouGoText:
	text "¡Listo!"
	done
	
DollSalesmanSaturdayComeAgain:
	text "¡Espero que"
	line "volvamos a vernos!"
	done
	
DollSalesmanSaturdayNoMoneyText:
	text "¡Lo siento, no"
	line "tienes suficiente"
	cont "dinero!"
	done
	
DollSalesmanTextSaturday:
	text "¡Hola!"
	
	para "¡Soy un vendedor"
	line "de MUÑECOS"
	cont "ambulante!"
	
	para "¿Sabes lo que"
	line "significa?"
	
	para "¡Que soy la"
	line "persona que buscas"
	para "si quieres decorar"
	line "tu dormitorio!"
	
	para "¡Mi ubicación y lo"
	line "que vendo cambia a"
	para "diario, así que no"
	line "me pierdas de"
	cont "vista!"
	done
	
DollSalesmanTextSaturday_AskWhichPrizeText:
	text "¿Qué MUÑECO"
	line "quieres?"
	done
	
;---------------------------------

Route6SaffronGuardWelcomeText:
	text "Hay días en los"
	line "que desearía dejar"
	para "mi puesto de"
	line "guardia e ir a"
	cont "relajarme a la"
	cont "playa."
	done


RyukyuUrasoeGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, RYUKYU_CITY, 4
	warp_event  5,  0, RYUKYU_CITY, 5
	warp_event  4,  7, URASOE_PARK, 1
	warp_event  5,  7, URASOE_PARK, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route6SaffronGuardScript, -1
	object_event  3,  2, SPRITE_CLERK, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TravelingDollSalesmanSaturday, EVENT_DOLL_SALESMAN_SATURDAY
