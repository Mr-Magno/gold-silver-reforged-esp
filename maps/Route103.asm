	const_def 2 ; object constants
	const ROUTE35_YOUNGSTER1
	const ROUTE35_LASS2
	const ROUTE35_YOUNGSTER3
	const ROUTE35_SUPER_NERD
	const ROUTE35_FRUIT_TREE
	const ROUTE35_POKE_BALL
	const ROUTE35_FISHER
	const ROUTE35_SLOWPOKE1
	const ROUTE35_SLOWPOKE2

Route103_MapScripts:
	db 2 ; scene scripts
	scene_script .Scene35SlowpokeTail ; SCENE_DEFAULT
	scene_script .Scene35Nothing ;

	db 0 ; callbacks

.Scene35SlowpokeTail
	end

.Scene35Nothing
	end
	
Route103SlowpokeScript:
	opentext
	writetext Route103SlowpokeText1
	pause 60
	writetext Route103SlowpokeText2
	cry SLOWPOKE
	waitbutton
	closetext
	end
	
Route103SlowpokeGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_WHITNEY
	iftrue .slowpokegone
	writetext SlowpokeGuyText1
	waitbutton
	closetext
	end
	
.slowpokegone
	writetext SlowpokeGuyText2
	waitbutton
	closetext
	end

SlowpokeVendor:
	faceplayer
	turnobject PLAYER, UP
	opentext
	writetext Text_MillionDollarSlowpokeTail
	yesorno
	iffalse .scenerefused
	writetext Text_ThoughtKidsWereLoaded
	waitbutton
	closetext
	setscene SCENE_ROUTE_35_NOTHING
	end

.scenerefused
	writetext Text_RefusedToBuySlowpokeTail
	waitbutton
	closetext
	setscene SCENE_ROUTE_35_NOTHING
	end

TrainerBirdKeeperBryan:
	trainer BIRD_KEEPER, BRYAN, EVENT_BEAT_BIRD_KEEPER_BRYAN, BirdKeeperBryanSeenText, BirdKeeperBryanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBryanAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerIrwin:
	trainer JUGGLER, IRWIN, EVENT_BEAT_JUGGLER_IRWIN, JugglerIrwin1SeenText, JugglerIrwin1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerIrwinAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperIvan:
	trainer CAMPER, IVAN, EVENT_BEAT_CAMPER_IVAN, CamperIvanSeenText, CamperIvanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperIvanAfterBattleText
	waitbutton
	closetext
	end


TrainerPicnickerKim:
	trainer PICNICKER, KIM, EVENT_BEAT_PICNICKER_KIM, PicnickerKimSeenText, PicnickerKimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerKimAfterBattleText
	waitbutton
	closetext
	end

Route103Sign:
	jumptext Route103SignText

Route103TMRollout:
	itemball TM_ROLLOUT
	
Route103SuperPotion:
	itemball SUPER_POTION

Route103FruitTree:
	fruittree FRUITTREE_ROUTE_103
	

SlowpokeTailSalesmanScript:
	faceplayer
	opentext
	writetext Text_MillionDollarSlowpokeTail
	yesorno
	iffalse .refused
	writetext Text_ThoughtKidsWereLoaded
	waitbutton
	closetext
	end

.refused
	writetext Text_RefusedToBuySlowpokeTail
	waitbutton
	closetext
	end
	

Text_MillionDollarSlowpokeTail:
	text "¡Eh, tú!"

	para "¿Te gustaría tener"
	line "esta sabrosa y"
	para "nutritiva"
	line "COLASLOWPOKE?"

	para "¡Sólo te costará"
	line "1.000.000¥!"

	para "¡Te gustará!"
	
	para "¿Qué me dices?"
	done

Text_ThoughtKidsWereLoaded:
	text "¡Vaya! Pensaba que"
	line "los niños de hoy"
	cont "en día estaban"
	cont "forrados…"
	done

Text_RefusedToBuySlowpokeTail:
	text "¿No la quieres?"
	line "Pues lárgate."
	done

CamperIvanSeenText:
	text "He estado cogiendo"
	line "datos de #MON"
	para "de mi radio. Creo"
	line "que soy bueno."
	done

CamperIvanBeatenText:
	text "¡Me rindo!"
	done

CamperIvanAfterBattleText:
	text "La música de la"
	line "radio cambia el"

	para "ánimo de los"
	line "#MON salvajes."
	done

PicnickerKimSeenText:
	text "¿Has ido a algún"
	line "GIMNASIO #MON?"
	done

PicnickerKimBeatenText:
	text "¡Vaya! No pude"
	line "ganar…"
	done

PicnickerKimAfterBattleText:
	text "Me gustan las"
	line "MEDALLAS de los"
	cont "GIMNASIOS."

	para "Las colecciono."
	done

BirdKeeperBryanSeenText:
	text "¿Qué tipo de"
	line "# BALL usas?"
	done

BirdKeeperBryanBeatenText:
	text "¡Vaya! ¡No lo"
	line "bastante rápido!"
	done

BirdKeeperBryanAfterBattleText:
	text "Algunos #MON"
	line "huyen enseguida."

	para "Si puedes hazte"
	line "con algunas"
	para "RAPID BALLS de"
	line "CÉSAR, te ayudarán"
	cont "contra #MON"
	cont "escurridizos."
	done

JugglerIrwin1SeenText:
	text "¡Observa cómo uso"
	line "las # BALL!"
	done

JugglerIrwin1BeatenText:
	text "¡Uauuu! ¡Vaya"
	line "sacudida!"
	done

JugglerIrwinAfterBattleText:
	text "Te iba a"
	line "deslumbrar con mi"
	cont "preciado #MON."

	para "¡Pero tu habilidad"
	line "me electrificó!"
	done
	
Route103SlowpokeText1:
	text "SLOWPOKE: …"

	para "<……> <……> <……>"
	done

Route103SlowpokeText2:
	text "¿<……> <……>?"
	done

Route103SignText:
	text "RUTA 103"
	
	para "CIUDAD PONIENTE -"
	line "PUEBLO BIRDON"
	done
	
SlowpokeGuyText1:
	text "Sí…"
	
	para "Estos SLOWPOKE"
	line "siempre están"
	cont "vagueando."
	
	para "Puede que lleve"
	line "un rato despejar"
	cont "el camino…"
	done
	
SlowpokeGuyText2:
	text "Parece que los"
	line "SLOWPOKE al"
	cont "fin se fueron."
	
	para "Ya puedes ir a"
	line "PUEBLO BIRDON"
	cont "si quieres."
	done

Route103_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 12, 49, ROUTE_103_WESTPORT_GATE, 1
	warp_event 13, 49, ROUTE_103_WESTPORT_GATE, 2

	db 1 ; coord events
	coord_event  8, 14, SCENE_DEFAULT, SlowpokeVendor

	db 1 ; bg events
	bg_event  6, 44, BGEVENT_READ, Route103Sign

	db 11 ; object events
	object_event 11,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperIvan, -1
	object_event  6, 23, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerKim, -1
	object_event 10, 44, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperBryan, -1
	object_event  8, 37, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerJugglerIrwin, -1
	object_event 14, 31, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route103FruitTree, -1
	object_event 15, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route103TMRollout, EVENT_ROUTE_35_TM_ROLLOUT
	object_event  8, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeTailSalesmanScript, EVENT_RIVAL_BURNED_TOWER
	object_event 10, 28, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route103SlowpokeScript, EVENT_BEAT_WHITNEY
	object_event 11, 28, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route103SlowpokeScript, EVENT_BEAT_WHITNEY
	object_event  8, 30, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route103SlowpokeGuyScript, -1
	object_event 15, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route103SuperPotion, EVENT_ROUTE_35_SUPER_POTION
