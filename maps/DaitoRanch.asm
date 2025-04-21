	const_def 2
	const DAITO_MILTANK1
	const DAITO_MILTANK2
	const DAITO_MILTANK3
	const DAITO_MILTANK4
	const DAITO_FARMER1
	const DAITO_FARMER2
	const DAITO_GEOFFREY

DaitoRanch_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setevent EVENT_GEOFFREY_GONE_TO_DAITO
	setflag ENGINE_FLYPOINT_DAITO
	return

DaitoRanchSign:
	jumptext DaitoRanchSignText
	
DaitoRanchSignText:
	text "RANCHO DAITO"

	para "Productores de"
	line "leche de las ISLAS"
	cont "PONIENTES"
	done

SummerHomeSign:
	jumptext SummerHomeSignText
	
SummerHomeSignText:
	text "CASA DE VERANEO DE"
	line "GODOFREDO EL"
	cont "JARDINERO"
	done

Route39Miltank:
	opentext
	writetext Route39MiltankText
	cry MILTANK
	waitbutton
	closetext
	end

Route39MiltankText:
	text "MILTANK: ¡Muu!"
	done
	
DaitoFarmer1Script:
	jumptextfaceplayer DaitoFarmer1Text
	
DaitoFarmer1Text:
	text "¿Ves esos árboles?"

	para "Esto es lo que se"
	line "llama un"
	cont "cortavientos."

	para "Protege los"
	line "cultivos de ser"
	cont "dañados por el"
	cont "vendaval."
	done

DaitoFarmer2Script:
	jumptextfaceplayer DaitoFarmer2Text
	
DaitoFarmer2Text:
	text "Este campo de"
	line "cultivo ahora está"
	para "lleno de flores"
	line "porque estamos"
	para "ciclando la tierra"
	line "de cara a la"
	para "próxima estación"
	line "de siembra."

	para "Si miras bien a lo"
	line "mejor encuentras"
	cont "algunas bayas."
	done

HiddenBerry1:
	hiddenitem MIRACLEBERRY, EVENT_DAITO_HIDDENBERRY1
	
HiddenBerry2:
	hiddenitem GOLD_BERRY, EVENT_DAITO_HIDDENBERRY2
	
HiddenBerry3:
	hiddenitem MYSTERYBERRY, EVENT_DAITO_HIDDENBERRY3
	
HiddenBerry4:
	hiddenitem BITTER_BERRY, EVENT_DAITO_HIDDENBERRY4


DaitoGeoffPatioScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BERRY_JUICE_FROM_GEOFF
	iftrue .geoffpart2
	writetext GeoffThanksVisitText
	buttonsound
	verbosegiveitem BERRY_JUICE
	iffalse .NoRoom
	setevent EVENT_GOT_BERRY_JUICE_FROM_GEOFF
.geoffpart2:
	writetext GeoffIslandLifeText
	waitbutton
.NoRoom:
	closetext
	end

GeoffThanksVisitText:
	text "Oye, un visitante"
	line "en mi terraza"
	cont "del patio."
	
	para "Since you took"
	para "Ya que te has"
	line "tomado la molestia"
	para "de venir hasta"
	line "aquí para verme,"
	para "¡a esta bebida"
	line "invita la casa!"
	done

GeoffIslandLifeText:
	text "¿Qué te parece"
	line "este sitio?"

	para "Una vista"
	line "preciosa, ¿verdad?"

	para "Mucho mejor que el"
	line "esperpento de la"
	cont "RUTA 104."

	para "¡Aquí también"
	line "puedo cultivar"
	para "toda clase de"
	line "plantas"
	cont "tropicales!"

	para "Ven más tarde y te"
	line "contaré todo sobre"
	cont "ellas."
	done


DaitoRanch_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 11,  8, DAITO_RANCH_HOUSE, 1
	warp_event  8,  9, DAITO_RANCH_BARN, 1
	warp_event 19, 14, DAITO_GG_HOUSE, 1

	db 0 ; coord events

	db 6 ; bg events
	bg_event 12, 11, BGEVENT_READ, DaitoRanchSign
	bg_event 20, 16, BGEVENT_READ, SummerHomeSign
	
	bg_event 10, 27, BGEVENT_ITEM, HiddenBerry1
	bg_event 13, 26, BGEVENT_ITEM, HiddenBerry2
	bg_event 11, 25, BGEVENT_ITEM, HiddenBerry3
	bg_event 15, 25, BGEVENT_ITEM, HiddenBerry4

	db 7 ; object events
	object_event  8, 17, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event 11, 16, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event 10, 19, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event 13, 18, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event 16, 23, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DaitoFarmer1Script, -1
	object_event 11, 26, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, DaitoFarmer2Script, -1
	object_event 20, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT,0, 0, -1, DAY, PAL_NPC_BROWN , OBJECTTYPE_SCRIPT, 0, DaitoGeoffPatioScript, -1
