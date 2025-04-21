	const_def 2 ; object constants
	const ROUTE38_LASS
	const ROUTE38_YOUNGSTER
	const ROUTE38_FRUIT_TREE
	const ROUTE38_BUENA2

Route108_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBirdKeeperToby:
	trainer BIRD_KEEPER, TOBY, EVENT_BEAT_BIRD_KEEPER_TOBY, BirdKeeperTobySeenText, BirdKeeperTobyBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BirdKeeperTobyAfterBattleText
	waitbutton
	closetext
	end

TrainerLassDana1:
	trainer LASS, DANA, EVENT_BEAT_LASS_DANA, LassDana1SeenText, LassDana1BeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext UnknownText_0x1a20ec
	waitbutton
	closetext
	end

TrainerBeautyOlivia:
	trainer BEAUTY, OLIVIA, EVENT_BEAT_BEAUTY_OLIVIA, BeautyOliviaSeenText, BeautyOliviaBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BeautyOliviaAfterBattleText
	waitbutton
	closetext
	end

Route108Sign:
	jumptext Route108SignText

Route108TrainerTips:
	jumptext Route108TrainerTipsText

Route108FruitTree:
	fruittree FRUITTREE_ROUTE_108

BirdKeeperTobySeenText:
	text "¡Vuela alto hacia"
	line "el cielo, querido"
	cont "#MON pájaro!"
	done

BirdKeeperTobyBeatenText:
	text "¡Me apetece salir"
	line "volando ahora!"
	done

BirdKeeperTobyAfterBattleText:
	text "Estoy pensando en"
	line "entrenar en el"
	para "DOJO KARATE de"
	line "CIUDAD ALEAR."

	para "Los #MON vola-"
	line "dores son fuertes"
	para "contra los del"
	line "tipo lucha…"
	para "¿No es una ventaja"
	line "injusta?"
	done

LassDana1SeenText:
	text "Parece que sabes"
	line "de #MON."

	para "Si es así, ¿por"
	line "qué no me das"
	cont "algún consejo?"
	done

LassDana1BeatenText:
	text "Ya veo. De modo"
	line "que luchas así."
	done

UnknownText_0x1a20ec:
	text "¡Tengo una buena"
	line "noticia!"

	para "¡La LECHE MU-MU es"
	line "una bebida nutri-"
	cont "tiva para los"
	cont "#MON!"

	para "Puedes comprarla"
	line "en CIUDAD"
	cont "ENHIESTA."
	done

BeautyOliviaSeenText:
	text "¿No crees que mis"
	line "#MON y yo"
	cont "somos bonitos?"
	done

BeautyOliviaBeatenText:
	text "Mantengo a mi"
	line "#MON como es"
	cont "debido."
	done

BeautyOliviaAfterBattleText:
	text "¿Alguna vez has"
	line "estado en la pelu-"
	cont "quería #MON de"
	cont "CIUDAD PONIENTE?"
	done

Route108SignText:
	text "RUTA 108"
	
	para "CIUDAD ALEAR -"
	line "BOSQUE AZUL"
	done

Route108TrainerTipsText:
	text "PISTAS ENTRENADOR"

	para "Si un #MON"
	line "va a evolucionar,"
	cont "puedes pararlo."

	para "Pulsa el Botón B"
	line "mientras intenta"
	cont "evolucionar."

	para "Esto asusta al"
	line "#MON y detiene"
	cont "su evolución."
	done

Route108_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 2 ; bg events
	bg_event  6,  4, BGEVENT_READ, Route108Sign
	bg_event 18,  4, BGEVENT_READ, Route108TrainerTips

	db 4 ; object events
	object_event  8,  7, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassDana1, -1
	object_event 13, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperToby, -1
	object_event 28,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route108FruitTree, -1
	object_event 23,  5, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyOlivia, -1
