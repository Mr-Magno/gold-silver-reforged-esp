	const_def 2 ; object constants
	const ROUTE7_FISHER1
	const ROUTE7_FISHER2
	const ROUTE7_ROCKET1
	const ROUTE7_ROCKET2
	const LAKEOFRAGE_WESLEY
	const ROUTE7_ITEMBALL_1
	const ROUTE7_ITEMBALL_2
	const ROUTE7_COOLTRAINER_M

Route119_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Wesley


.Wesley:
	checkcode VAR_WEEKDAY
	ifequal WEDNESDAY, .WesleyAppears
	disappear LAKEOFRAGE_WESLEY
	return

.WesleyAppears:
	appear LAKEOFRAGE_WESLEY
	return
	
Route119Roar:
	itemball TM_ROAR

Route119UndergroundPathSign:
	jumptext Route119UndergroundPathSignText

Route119LockedDoor:
	jumptext Route119LockedDoorText
	
TrainerFisherJustin:
	trainer FISHER, JUSTIN, EVENT_BEAT_FISHER_JUSTIN, FisherJustinSeenText, FisherJustinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherJustinAfterText
	waitbutton
	closetext
	end



TrainerFisherRalph1:
	trainer FISHER, RALPH, EVENT_BEAT_FISHER_RALPH, FisherRalph1SeenText, FisherRalph1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherRalphAfterText
	waitbutton
	closetext
	end

Route119Rocket1Script:
	opentext
	writetext Route119Rocket1Text
	waitbutton
	closetext
	end
	
Route119Rocket2Script:
	opentext
	writetext Route119Rocket2Text
	waitbutton
	closetext
	end
	
WesleyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	iftrue WesleyWednesdayScript
	checkcode VAR_WEEKDAY
	ifnotequal WEDNESDAY, WesleyNotWednesdayScript
	checkevent EVENT_MET_WESLEY_OF_WEDNESDAY
	iftrue .MetWesley
	writetext MeetWesleyText
	buttonsound
	setevent EVENT_MET_WESLEY_OF_WEDNESDAY
.MetWesley:
	writetext WesleyGivesGiftText
	buttonsound
	verbosegiveitem BLACKBELT
	iffalse WesleyDoneScript
	setevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	writetext WesleyGaveGiftText
	waitbutton
	closetext
	end

WesleyWednesdayScript:
	writetext WesleyWednesdayText
	waitbutton
WesleyDoneScript:
	closetext
	end

WesleyNotWednesdayScript:
	writetext WesleyNotWednesdayText
	waitbutton
	closetext
	end


Route119SoftSand:
	itemball SOFT_SAND
	
TrainerSportsmanBryson:
	trainer SPORTSMAN, BRYSON, EVENT_BEAT_SPORTSMAN_BRYSON, SportsmanBrysonSeenText, SportsmanBrysonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SportsmanBrysonAfterText
	waitbutton
	closetext
	end
	
Route119FruitTree:
	fruittree FRUITTREE_ROUTE_119

SportsmanBrysonSeenText:
	text "¡Uf!"

	para "¡Nada como correr"
	line "un poco por la"
	cont "playa!"
	done

SportsmanBrysonBeatenText:
	text "¡Tengo arena en"
	line "las zapatillas!"
	done

SportsmanBrysonAfterText:
	text "En realidad, la"
	line "playa no es el"
	cont "mejor sitio para"
	cont "correr."
	done

FisherJustinSeenText:
	text "¡Vaya!"

	para "¡Se me escapó ese"
	line "pez por tu culpa!"
	done

FisherJustinBeatenText:
	text "¡Chas!"
	done

FisherJustinAfterText:
	text "Paciencia… La"
	line "base de la pesca"
	para "y de los #MON"
	line "es la misma."
	done

FisherRalph1SeenText:
	text "Soy muy bueno,"
	line "tanto pescando"
	para "como con los"
	line "#MON."

	para "¡No voy a perder"
	line "con alguien tan"
	cont "joven!"
	done

FisherRalph1BeatenText:
	text "Intenté acelerar"
	line "las cosas…"
	done

FisherRalphAfterText:
	text "¡Pescar es una"
	line "pasión eterna y"
	para "los #MON son"
	line "amigos eternos!"
	done

FisherRalphSwarmText:
	text "Uno, dos, tres…"
	line "¡Jajajajaja!"

	para "¡Qué gran botín!"

	para "¡Vale! ¡Sigue y"
	line "atrapa tantos como"
	cont "puedas!"
	done

Route119UndergroundPathSignText:
	text "RUTA 119"
	
	para "CIUDAD TEKNOS"
	line "al ESTE"
	done

Route119LockedDoorText:
	text "Cruza el acceso"
	line "para llegar a"
	cont "CIUDAD CALORINA"
	done
	
Route119Rocket1Text:
	text "Jujujuju…"
	para "¿Por qué se supone"
	line "que estamos aquí?"
	done
	
Route119Rocket2Text:
	text "Jejejeje…"
	para "Creo que no le"
	line "caemos muy bien al"
	cont "jefe…"
	done
	
MeetWesleyText:
	text "MIGUEL: Hola,"
	line "¿qué tal estás?"

	para "Hoy es miércoles"
	line "y yo soy MIGUEL,"
	para "por lo de"
	line "miércoles."
	done

WesleyGivesGiftText:
	text "Encantado de"
	line "conocerte. Toma"
	cont "un recuerdo."
	done

WesleyGaveGiftText:
	text "MIGUEL: CINTURÓN"
	line "NEGRO potencia los"
	cont "ataques de lucha."
	done

WesleyWednesdayText:
	text "MIGUEL: Si me"
	line "has encontrado,"
	para "habrás visto a"
	line "mis hermanos."

	para "¿O es que has"
	line "tenido suerte?"
	done

WesleyNotWednesdayText:
	text "MIGUEL: Hoy no es"
	line "miércoles."
	cont "¡Qué pena!"
	done


Route119_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10,  9, ROUTE_119_SUNPOINT_GATE, 3
	warp_event 11,  9, ROUTE_119_SUNPOINT_GATE, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event 12, 44, BGEVENT_READ, Route119UndergroundPathSign
	bg_event  8, 10, BGEVENT_READ, Route119LockedDoor

	db 9 ; object events
	object_event  6, 46, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherJustin, -1
	object_event 10, 41, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherRalph1, -1
	object_event 10, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119Rocket1Script, EVENT_RIVAL_BURNED_TOWER
	object_event 11, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119Rocket2Script, EVENT_RIVAL_BURNED_TOWER
	object_event 10, 23, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WesleyScript, EVENT_LAKE_OF_RAGE_WESLEY_OF_WEDNESDAY
	object_event  7, 49, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route119Roar, EVENT_ROUTE_46_X_SPEED
	object_event 10, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route119SoftSand, EVENT_PICKED_UP_CHARCOAL_FROM_HO_OH_ITEM_ROOM
	object_event  4, 16, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSportsmanBryson, -1
	object_event  3, 37, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119FruitTree, -1
