	const_def 2
	const IETOWN_NPC1
	const IETOWN_NPC2

IeTown_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_IE
	return

IeTownPokecenterSign:
	jumpstd pokecentersign

IeTownSign:
	jumptext IeTownSignText
	
TMShopSign:
	jumptext TMShopSignText
	
IeTownSignText:
	text "PUEBLO IE -"
	line "El incondicional"
	cont "pubelo del"
	cont "CASTILLO."
	done

TMShopSignText:
	text "EMPORIO MT"
	line "Consigue los"
	cont "movimientos"
	cont "competitivos más"
	cont "candentes."
	done

IeTownNPC1Script:
	jumptextfaceplayer IeTownNPC1Text

IeTownNPC2Script:
	jumptextfaceplayer IeTownNPC2Text


IeTownNPC1Text:
	text "La gente de aquí"
	line "dicen haber"
	cont "escuchado ruidos"
	cont "por la noche"
	cont "provinentes del"
	cont "CASTILLO."
	
	para "Me pregunto si"
	line "será el DRAGÓN"
	cont "VERDE que supues-"
	cont "tamente vive"
	cont "ahí dentro…"
	done

IeTownNPC2Text:
	text "He visto unos"
	line "tipos sospechosos"
	cont "alrededor del"
	cont "CASTILLo por"
	cont "la noche."
	
	para "Creo que no"
	line "son de aquí."
	done


IeTown_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event  5,  6, IE_POKECENTER_1F, 1
	warp_event 22,  7, IE_TM_SHOP, 1
	warp_event 23,  7, IE_TM_SHOP, 2
	warp_event  8, 11, IE_HOUSE_1, 1
	warp_event 20, 11, IE_HOUSE_2, 1
	warp_event 13,  5, CASTLE_MOUNTAIN_1F, 1
	warp_event 14,  5, CASTLE_MOUNTAIN_1F, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event 26,  6, BGEVENT_READ, IeTownSign
	bg_event 19,  7, BGEVENT_READ, TMShopSign
	bg_event  6,  6, BGEVENT_READ, IeTownPokecenterSign

	db 2 ; object events
	object_event 15, 13, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IeTownNPC1Script, -1
	object_event 12,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IeTownNPC2Script, -1
