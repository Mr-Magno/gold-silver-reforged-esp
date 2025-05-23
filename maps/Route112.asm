	const_def 2 ; object constants
	const ROUTE112_YOUNGSTER2
	const ROUTE112_YOUNGSTER3
	const ROUTE112_LASS1
	const ROUTE112_POKE_BALL1
	const ROUTE112_FRIEDA
	const ROUTE112_POKE_BALL2
	const ROUTE112_OFFICER
	const ROUTE112_WORKER1
	const ROUTE112_WORKER2
	const ROUTE112_FRUIT_TREE
	const ROUTE112_POKE_BALL3

Route112_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_ROUTE32_OFFER_SLOWPOKETAIL
	scene_script .DummyScene2 ; SCENE_ROUTE32_NOTHING

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Frieda

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

.Frieda:
	checkcode VAR_WEEKDAY
	ifequal FRIDAY, .FriedaAppears
	disappear ROUTE112_FRIEDA
	return

.FriedaAppears:
	appear ROUTE112_FRIEDA
	return


TrainerCamperRoland:
	trainer CAMPER, ROLAND, EVENT_BEAT_CAMPER_ROLAND, CamperRolandSeenText, CamperRolandBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperRolandAfterText
	waitbutton
	closetext
	end

TrainerFisherWilton1:
	trainer FISHER, WILTON, EVENT_BEAT_FISHER_WILTON, FisherWilton1SeenText, FisherWilton1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherWiltonHugePoliwagText
	waitbutton
	closetext
	end

TrainerPicnickerLiz1:
	trainer PICNICKER, LIZ, EVENT_BEAT_PICNICKER_LIZ, PicnickerLiz1SeenText, PicnickerLiz1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerLiz1AfterText
	waitbutton
	closetext
	end

TrainerYoungsterGordon:
	trainer YOUNGSTER, GORDON, EVENT_BEAT_YOUNGSTER_GORDON, YoungsterGordonSeenText, YoungsterGordonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterGordonAfterText
	waitbutton
	closetext
	end


FriedaScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	iftrue .Friday
	checkcode VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checkevent EVENT_MET_FRIEDA_OF_FRIDAY
	iftrue .MetFrieda
	writetext MeetFriedaText
	buttonsound
	setevent EVENT_MET_FRIEDA_OF_FRIDAY
.MetFrieda:
	writetext FriedaGivesGiftText
	buttonsound
	verbosegiveitem POISON_BARB
	iffalse .Done
	setevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	writetext FriedaGaveGiftText
	waitbutton
	closetext
	end

.Friday:
	writetext FriedaFridayText
	waitbutton
.Done:
	closetext
	end

.NotFriday:
	writetext FriedaNotFridayText
	waitbutton
	closetext
	end

Route112UltraBall:
	itemball ULTRA_BALL

Route112MaxRepel:
	itemball MAX_REPEL

Route112Sign:
	jumptext Route112SignText

Route112FruitTree:
	fruittree FRUITTREE_ROUTE_112

Route112HiddenGreatBall:
	hiddenitem GREAT_BALL, EVENT_ROUTE_32_HIDDEN_GREAT_BALL

Route112HiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_ROUTE_32_HIDDEN_SUPER_POTION
	
Route112Elixer:
	itemball ELIXER


Route112OfficerScript:
	jumptextfaceplayer Route112OfficerText
	
Route112Worker1Script:
	jumptextfaceplayer Route112Worker1Text

Route112Worker2Script:
	jumptextfaceplayer Route112Worker2Text

Route112OfficerText:
	text "Una tormenta de"
	line "nieve destrozó"
	cont "este acceso hace"
	cont "poco."

	para "Estamos trabajando"
	line "para repararlo."
	done
	
	para "Te pido que vuel-"
	line "vas más tarde,"
	cont "por favor."
	done
	
Route112Worker1Text:
	text "¡Uf!"
	
	para "¡La tormenta ha"
	line "arrastrado nieve"
	cont "por la colina y ha"
	cont "acabado en este"
	cont "acceso!"
	done
	
Route112Worker2Text:
	text "¡Cuidado, chico!"

	para "Podría haber"
	line "cristales rotos"
	cont "por aquí."

	para "No deberías seguir"
	line "hasta que hayamos"
	cont "reparado todo."
	done

YoungsterGordonSeenText:
	text "¡He encontrado"
	line "#MON muy buenos"
	cont "en la hierba!"

	para "¡Creo que me"
	line "servirán!"
	done

YoungsterGordonBeatenText:
	text "¡Maldición! Creía"
	line "que podía ganar."
	done

YoungsterGordonAfterText:
	text "En la hierba hay"
	line "cosas pegajosas."
	done

CamperRolandSeenText:
	text "Estoy pasando el"
	line "día acampando en"
	para "la base de esta"
	line "colina nevada."
	done

CamperRolandBeatenText:
	text "¡Mmmm!"
	line "¡Qué decepción!"
	done

CamperRolandAfterText:
	text "¡Una colina nevada"
	line "es buen sitio para"
	cont "acampar!"
	done

PicnickerLiz1SeenText:
	text "Sí. Y sabes que…"

	para "¿Luchar? ¡Estoy"
	line "al teléfono!"

	para "Vale. Pero que sea"
	line "rápido."
	done

PicnickerLiz1BeatenText:
	text "¡Oh! ¡Tengo que"
	line "aliviar mi enfado!"
	done

PicnickerLiz1AfterText:
	text "Yo también estaba"
	line "charlando."
	done

FisherWilton1SeenText:
	text "¡Noo! ¡Me has"
	line "hecho perder un"
	cont "POLIWAG!"

	para "¿Qué vas a hacer"
	line "al respecto?"
	done

FisherWilton1BeatenText:
	text "Olvídalo, anda."
	done

FisherWiltonHugePoliwagText:
	text "Ese POLIWAG que"
	line "se escapó…"
	cont "Era enorme."

	para "¡Parecía de"
	line "medio metro!"
	done

MeetFriedaText:
	text "VICKI: ¡Yuju!"
	line "¡Es viernes!"

	para "Soy VICKI, por"
	line "viernes."

	para "¡Mucho gusto!"
	done

FriedaGivesGiftText:
	text "¡Toma una FLECHA"
	line "VENENOSA!"
	done

FriedaGaveGiftText:
	text "VICKI: Dásela a un"
	line "#MON de tipo"
	cont "veneno."

	para "¡Oh!"

	para "¡Es terrible!"

	para "¡Te sorprenderá"
	line "ver cómo mejora"
	para "los movimientos"
	line "de tipo veneno!"
	done

FriedaFridayText:
	text "VICKI: ¡Hola! ¿Qué"
	line "día prefieres?"

	para "A mí me gusta el"
	line "viernes. Sin duda."

	para "¿No crees que es"
	line "genial?"
	done

FriedaNotFridayText:
	text "VICKI: ¿Hoy no es"
	line "viernes?"

	para "¡Me aburro cuando"
	line "no lo es!"
	done

Route112SignText:
	text "RUTA 112"

	para "BOSQUE AZUL -"
	line "CIUDAD ENHIESTA"
	done


Route112_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10, 47, ROUTE_112_STAND_CITY_GATE, 1
	warp_event 11, 47, ROUTE_112_STAND_CITY_GATE, 2


	db 0 ; coord events


	db 3 ; bg events
	bg_event  8,  2, BGEVENT_READ, Route112Sign
	bg_event 14, 47, BGEVENT_ITEM, Route112HiddenGreatBall
	bg_event 16, 18, BGEVENT_ITEM, Route112HiddenSuperPotion

	db 13 ; object events
	object_event 10,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterGordon, -1
	object_event  8, 36, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperRoland, -1
	object_event 13, 28, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerLiz1, -1
	object_event  5, 38, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route112UltraBall, EVENT_ROUTE_32_GREAT_BALL
	object_event  7, 22, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FriedaScript, EVENT_ROUTE_32_FRIEDA_OF_FRIDAY
	object_event 13, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route112MaxRepel, EVENT_ROUTE_32_REPEL
	object_event 10, 46, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 3, Route112OfficerScript, EVENT_ROUTE_112_WORKERS_AT_STAND_GATE
	object_event 11, 47, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 3, Route112Worker1Script, EVENT_ROUTE_112_WORKERS_AT_STAND_GATE
	object_event 13, 47, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 3, Route112Worker2Script, EVENT_ROUTE_112_WORKERS_AT_STAND_GATE
	object_event  3, 16, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route112FruitTree, -1
	object_event 11, 42, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route112Elixer, EVENT_ROUTE_32_REPEL
	object_event  4, 36, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherWilton1, -1
