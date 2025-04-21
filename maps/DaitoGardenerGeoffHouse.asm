	const_def 2
	const DAITOHOUSE_GEOFFREY
	const DAITOHOUSE_GNOTE

DaitoGardenerGeoffHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


GeoffInsideScript:
	faceplayer
	checkevent EVENT_GOT_BERRY_JUICE_FROM_GEOFF
	iftrue gotjuiceoutside
	opentext
	writetext GeoffInsideMeetText
	buttonsound
	verbosegiveitem BERRY_JUICE
	iffalse NoRoomGeoff
	setevent EVENT_GOT_BERRY_JUICE_FROM_GEOFF
gotjuiceoutside:
	opentext
	writetext WantFactText
	yesorno
	iffalse EndConvo
	random 5
	jump GeoffJumptable
EndConvo:
	writetext AhOkText
	waitbutton
NoRoomGeoff:
	closetext
	end
	
GeoffJumptable:
	ifequal 0, papayas
	ifequal 1, coconuts
	ifequal 2, mangoes
	ifequal 3, bananas
	ifequal 4, pineapples
	
papayas:
	writetext PapayaText
	waitbutton
	jump NoRoomGeoff
	
	
WantFactText:
	text "¿Quieres oír"
	line "sobre algunas"
	cont "de las frutas"
	cont "tropicales que"
	cont "he estado?"
	cont "cultivando?"
	done
	
AhOkText:
	text "Ah, está bien,"
	line "tal vez en"
	cont "otra ocasión."
	done
	
PapayaText:
	text "Las papayas son"
	line "una de las frutas"
	cont "tropicales más"
	cont "fáciles de culti-"
	cont "var, todo lo que"
	cont "necesitas es"
	cont "tirar las"
	cont "semillas en tu"
	cont "jardín y ver"
	cont "cómo brotan por"
	cont "sí solas."
	
	para "Las plantas macho"
	line "no producen"
	cont "ninguna fruta, así"
	cont "qu puedes cortar-"
	cont "las sin problema."
	done
	
coconuts:
	writetext CoconutText
	waitbutton
	jump NoRoomGeoff
	
CoconutText:
	text "La gente suele"
	line "pensar en un"
	cont "coco como una"
	cont "esfera marrón"
	cont "peluda."
	
	para "En realidad,"
	line "sólo se ven así"
	cont "después de que"
	cont "se les quite"
	cont "la cáscara."
	
	para "La mejor forma"
	line "de quitársela"
	cont "es con la parte"
	cont "del martillo que"
	cont "quita clavos,"
	cont "haciendo cortes"
	cont "en la cáscara y"
	cont "pelándola por"
	cont "partes."
	
	para "Prueba este truco"
	line "si alguna vez"
	cont "te pierdes en"
	cont "una isla con un"
	cont "carpintero."
	done
	
mangoes:
	writetext MangoText
	waitbutton
	jump NoRoomGeoff
	
MangoText:
	text "Los mangos tardan"
	line "unos meses en"
	cont "madurar en el"
	cont "árbol."
	
	para "Y los árboles"
	line "en sí pueden"
	cont "tardar años en"
	cont "crecer lo sufi-"
	cont "ciente como para"
	cont "dar un solo."
	cont "mango."
	
	para "En algunas cul-"
	line "turas comen"
	cont "mangos verdes."
	
	para "Son dolorosamente"
	line "difíciles de"
	cont "morder y muy"
	cont "ácidos."
	
	para "¡Aun así me los"
	line "como porque"
	cont "soy impaciente!"
	done
	
	
bananas:
	writetext BananaText
	waitbutton
	jump NoRoomGeoff
	
BananaText:
	text "Los plátanos son"
	line "una de las fru-"
	cont "tas más recono-"
	cont "cibles que hay."
	
	para "¿Pero sabías que"
	line "todos los plátanos"
	cont "que ves en el"
	cont "supermercado son"
	cont "genéticamente"
	cont "iguales?"
	
	para "Los cultivos co-"
	line "mercial no tienen"
	cont "semillas debido a"
	cont "la domesticación,"
	cont "así que deben"
	cont "propagarse por"
	cont "tallos."
	
	para "Ello significa"
	line "que todas las"
	cont "plantas de plá-"
	cont "tanos son prác-"
	cont "ticamente igua-"
	cont "les en un"
	cont "cultivo."
	done
	
	
	
pineapples:
	writetext PineappleText
	waitbutton
	jump NoRoomGeoff

PineappleText:
	text "Similares al"
	line "plátano, muchas"
	cont "piñas son exac-"
	cont "tamente iguales"
	cont "por la forma en"
	cont "la que se pro-"
	cont "pagan."
	
	para "Prueba esto en"
	line "casa si vives en"
	cont "un lugar cálido:"
	
	para "Guarda la parte"
	line "de arriba de tu"
	cont "piña del super"
	cont "y plántala de"
	cont "nuevo en la"
	cont "tierra."
	
	para "Riégala y"
	line "cuídala bien y"
	cont "pronto verás que"
	cont "vuelve a crecer,"
	cont "¡y hasta"
	cont "producirá otra"
	cont "piña!"

	para "Repite este pro-"
	line "ceso para tener"
	cont "un suministro"
	cont "infinito de"
	cont "piñas gratis."
	done

GeoffInsideMeetText:
	text "¡Te recuerdo!"
	line "¡Eres el de la"
	cont "RUTA 104, has"
	cont "venido desde"
	cont "muy lejos para"
	cont "llegar a mi"
	cont "casa de verano!"
	
	para "Aquí es donde"
	line "vengo a descan-"
	cont "sar y relajarme"
	cont "lejos del duro"
	cont "desierto."
	
	para "Ya que te has"
	line "molestado en"
	cont "venir, ¡te"
	cont "invito a esta"
	cont "bebida!"
	done


GeoffOutNote:
	jumptext GeoffOutNoteText
	
GeoffOutNoteText:
	text "Salí a comprar"
	line "suministros,"
	cont "vuelvo por la"
	cont "tarde."
	cont "- GODOFREDO"
	done

DaitoGardenerGeoffHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, DAITO_RANCH, 3
	warp_event  5,  7, DAITO_RANCH, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 7,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN,0, 0, -1, NITE, PAL_NPC_BROWN , OBJECTTYPE_SCRIPT, 0, GeoffInsideScript, -1
	object_event  5,  4, SPRITE_PAPER, 0, 0, 0, -1, MORN, PAL_OW_SILVER, OBJECTTYPE_SCRIPT, 0, GeoffOutNote, -1
