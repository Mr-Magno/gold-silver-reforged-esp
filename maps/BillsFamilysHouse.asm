	const_def 2 ; object constants
	const BILLSFAMILYSHOUSE_BILL
	const BILLSFAMILYSHOUSE_POKEFAN_F
	const BILLSFAMILYSHOUSE_TWIN

BillsFamilysHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BillScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM01_CUT
	iftrue .GotCut
	writetext BillTakeThisCutText
	waitbutton
	verbosegiveitem HM_CUT
	setevent EVENT_GOT_HM01_CUT
	setevent EVENT_ROUTE36_GARDENER
	clearevent EVENT_ROUTE36_GARDENER_CHOPPED
	writetext BillGoodLuckText
	waitbutton
	closetext
	end

.GotCut:
	writetext BillAdventuresGoingWellText
	waitbutton
	closetext
	end

BillsMomScript:
	faceplayer
	opentext
	checkevent EVENT_MET_BILL
	iffalse .HaventMetBill
	writetext BillsMomText
	waitbutton
	closetext
	end

.HaventMetBill:
	writetext BillsMomText
	waitbutton
	closetext
	end

BillsSisterScript:
	faceplayer
	opentext
	checkcellnum PHONE_BILL
	iftrue .GotBillsNumber
	writetext BillsSisterUsefulNumberText
	askforphonenumber PHONE_BILL
	ifequal PHONE_CONTACTS_FULL, .NoRoom
	ifequal PHONE_CONTACT_REFUSED, .Refused
	waitsfx
	addcellnum PHONE_BILL
	writetext RecordedBillsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	buttonsound
.GotBillsNumber:
	writetext BillsSisterStorageSystemText
	waitbutton
	closetext
	end

.Refused:
	writetext BillsSisterRefusedNumberText
	waitbutton
	closetext
	end

.NoRoom:
	writetext BillsSisterPhoneFullText
	buttonsound
	jump .Refused

BillsHouseBookshelf1:
	jumpstd picturebookshelf

BillsHouseBookshelf2:
	jumpstd magazinebookshelf

BillsHouseRadio:
	jumpstd radio2

BillTakeThisCutText:
	text "BILL: ¡Hola!"
	line "Bueno, permite"
	cont "que me presente."
	
	para "¡Soy BILL! ¡Yo"
	line "creé el Sistema de"
	para "Almacenamiento"
	line "#MON de los PC!"
	
	para "Espero que te sea"
	line "útil."
	
	para "Por cierto, si"
	line "piensas hacer un"
	para "largo viaje, tengo"
	line "algo que podría"
	cont "ayudarte."
	done

BillGoodLuckText:
	text "¡CORTE permite que"
	line "tu #MON corte"
	cont "arbustos!"
	
	para "¡Es algo"
	line "indispensable!"
	
	para "Y recuerda que,"
	line "a diferencia de"
	para "las MT, ¡puedes"
	line "usar las MO las"
	cont "veces que quieras!"
	
	para "¡Buena suerte en"
	line "tus objetivos como"
	cont "entrenador!"
	
	para "¡Nos vemos!"
	done


BillAdventuresGoingWellText:
	text "BILL: Ey, <PLAY_G>!"
	line "¡Espero que tu"
	para "aventura esté"
	line "yendo bien!"
	done

BillsMomText:
	text "Mi marido era"
	line "conocido como un"
	para "#MANÍACO."
	line "BILL ha debido de"
	para "seguir los pasos"
	line "de su padre."
	done

BillsSisterUsefulNumberText:
	text "¿Entrenas #MON?"
	line "Tengo un número de"
	para "teléfono que te"
	line "será útil."
	done

RecordedBillsNumberText:
	text "<PLAYER> grabó el"
	line "n.° de BILL."
	done

BillsSisterRefusedNumberText:
	text "Mi hermano creó el"
	line "Sistema de"

	para "Almacenamiento de"
	line "#MON del PC."

	para "Te iba a dar el"
	line "teléfono de BILL…"
	done

BillsSisterPhoneFullText:
	text "No puedes grabar"
	line "ningún número más."
	done

BillsSisterStorageSystemText:
	text "Mi hermano BILL"
	line "creó el Sistema de"

	para "Almacenamiento de"
	line "los #MON."
	done

BillsFamilysHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, PAGOTA_CITY, 14
	warp_event  4,  7, PAGOTA_CITY, 14

	db 0 ; coord events

	db 3 ; bg events
	bg_event  2,  1, BGEVENT_READ, BillsHouseBookshelf2
	bg_event  3,  1, BGEVENT_READ, BillsHouseBookshelf1
	bg_event  6,  1, BGEVENT_READ, BillsHouseRadio

	db 3 ; object events
	object_event  5,  4, SPRITE_BILL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillScript, EVENT_MET_BILL
	object_event  2,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillsMomScript, -1
	object_event  7,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BillsSisterScript, -1
