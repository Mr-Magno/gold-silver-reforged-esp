	const_def 2 ; object constants
	const ECRUTEAKCITY_GRAMPS1
	const ECRUTEAKCITY_GRAMPS2
	const ECRUTEAKCITY_LASS1
	const ECRUTEAKCITY_LASS2
	const ECRUTEAKCITY_FISHER
	const ECRUTEAKCITY_YOUNGSTER
	const ECRUTEAKCITY_GRAMPS3
	const ECRUTEAKCITY_ROCKET1
	const ECRUTEAKCITY_ROCKET2
	const ECRUTEAKCITY_ROCKET3
	const ECRUTEAKCITY_ROCKET4
	const ECRUTEAKCITY_LASS3
	const ECRUTEAKCITY_WORKER1
	const ECRUTEAKCITY_WORKER2

TeknosCity_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE8_NOTHING
	scene_script SceneRocketTakeOverScript ; SCENE_ROUTE8_GIRL

	db 3 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .TeknosBridgeRepair
	callback MAPCALLBACK_OBJECTS, .rockets
	
.rockets
	checkevent EVENT_WHITNEY_IN_BOULDER_MINES
	iffalse .canfight
	return
	
.canfight
	disappear ECRUTEAKCITY_ROCKET1
	disappear ECRUTEAKCITY_ROCKET1
	return
	
.TeknosBridgeRepair:
	checkevent EVENT_TEKNOS_BRIDGE_REPAIRED
	iftrue .Done
	changeblock 23,  5, $80 ; water
.Done:
	return

.FlyPoint:
	setflag ENGINE_FLYPOINT_ECRUTEAK
	return
	
.DummyScene0:
	end
	
SceneRocketTakeOverScript:
	checkevent EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	iftrue .SceneEcruteakNothing
	checkevent EVENT_ECRUTEAK_SCARED_LASS
	iftrue .SceneEcruteakNothing
	opentext
	writetext RocketsAreCommin
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, RIGHT
	applymovement PLAYER, WalkToCenter
	applymovement ECRUTEAKCITY_LASS3, LassRun1
	pause 6
	turnobject ECRUTEAKCITY_LASS3, RIGHT
	pause 6
	turnobject ECRUTEAKCITY_LASS3, LEFT
	pause 6
	turnobject ECRUTEAKCITY_LASS3, RIGHT
	pause 6
	turnobject ECRUTEAKCITY_LASS3, LEFT
	pause 6
	turnobject ECRUTEAKCITY_LASS3, DOWN
	pause 6
	turnobject ECRUTEAKCITY_LASS3, UP
	pause 6
	opentext
	writetext RocketsAreCommin2
	waitbutton
	closetext
	applymovement ECRUTEAKCITY_LASS3, LassRun2
	disappear ECRUTEAKCITY_LASS3
	setevent EVENT_ECRUTEAK_SCARED_LASS
	setmapscene TEKNOS_AQUARIUM_1F, SCENE_DEFAULT
	end
	
.SceneEcruteakNothing:
	end

WorkerScript:
	faceplayer
	opentext
	writetext WorkerText
	waitbutton
	closetext
	turnobject ECRUTEAKCITY_WORKER2, UP
	turnobject ECRUTEAKCITY_WORKER1, UP
	end
	

TeknosCityGramps1Script:
	jumptextfaceplayer TeknosCityGramps1Text

TeknosCityGramps2Script:
	faceplayer
	opentext
	checkevent EVENT_TEKNOS_BRIDGE_REPAIRED
	iftrue .Gramps2Script2
	writetext TeknosCityGramps2Text
	waitbutton
	closetext
	end
	
.Gramps2Script2:
	writetext TeknosCityGramps2Text2
	waitbutton
	closetext
	end

TeknosCityGramps3Script:
	jumptextfaceplayer TeknosCityGramps3Text

TeknosCityLass1Script:
	jumptextfaceplayer TeknosCityLass1Text

TeknosCityLass2Script:
	jumptextfaceplayer TeknosCityLass2Text

	
TeknosCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	iftrue .NoRockets
	writetext TeknosCityFisherText_TheresRockets
	waitbutton
	closetext
	end

.NoRockets:
	writetext TeknosCityFisherText
	waitbutton
	closetext
	end


TeknosCityRocket1Script:
	jumptextfaceplayer TeknosCityRocket1Text
	
TeknosCityRocket2Script:
	jumptextfaceplayer TeknosCityRocket2Text

TeknosCityYoungsterScript:
	jumptextfaceplayer TeknosCityYoungsterText

TeknosCitySign:
	jumptext TeknosCitySignText

TinTowerSign:
	jumptext TinTowerSignText

EcruteakGymSign:
	jumptext EcruteakGymSignText
	
TekuCityDocksSign:
	jumptext TekuCityDocksText

EcruteakDanceTheaterSign:
	jumptext EcruteakDanceTheaterSignText

BurnedTowerSign:
	jumptext BurnedTowerSignText

TeknosCityPokecenterSign:
	jumpstd pokecentersign

TeknosCityMartSign:
	jumpstd martsign

TeknosCityHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ECRUTEAK_CITY_HIDDEN_HYPER_POTION
	
TeknosCityRocketTrainer1Script:
	trainer GRUNTM, GRUNTM_32, EVENT_BEAT_TEKU_CITY_GRUNT1, TeknosCityRocket1SeenText, TeknosCityRocket1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeknosCityRocket1AfterBattleText
	waitbutton
	closetext
	end
	
TeknosCityRocketTrainer2Script:
	trainer GRUNTM, GRUNTM_33, EVENT_BEAT_TEKU_CITY_GRUNT2, TeknosCityRocket2SeenText, TeknosCityRocket2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeknosCityRocket2AfterBattleText
	waitbutton
	closetext
	end
	
TeknosCityRocket1SeenText:
	text "¡Eh, niño!"
	
	para "¿Qué crees que"
	line "estás haciendo?"
	
	para "¡Esto está fuera"
	line "de los límites!"
	done

TeknosCityRocket1BeatenText:
	text "¿Qué ha pasado?"
	done

TeknosCityRocket1AfterBattleText:
	text "No te molestes"
	line "en entrar."

	para "No hay nada que"
	line "un niño como tú"
	cont "pueda hacer."
	done
	
TeknosCityRocket2SeenText:
	text "¡Espera!"
	
	para "¡Los niños no"
	line "deberían inter-"
	cont "ponerse en nues-"
	cont "tro camino!"
	done

TeknosCityRocket2BeatenText:
	text "¿Qu-Quién eres?"
	done

TeknosCityRocket2AfterBattleText:
	text "¡El ACUARIO debe-"
	line "ría tener muchos"
	cont "#MON para"
	cont "poder venderlos!"
	done

TeknosCityRocket1Text:
	text "¿Que me aparte?"
	
	para "Perdona chaval,"
	line "¡los adultos"
	cont "estamos ocupados!"
	done
	
TeknosCityRocket2Text:
	text "¿Qué quieres?"
	
	para "Ve a jugar a"
	line "la MINA o"	
	cont "algo…"
	done

TeknosCityGramps1Text:
	text "He vivido aquí"
	line "toda mi vida."

	para "La ciudad es mucho"
	line "más bulliciosa que"
	cont "cuando era joven."
	done

TeknosCityGramps2Text:
	text "La ciudad va a"
	line "crecer aún más"
	para "cuando hayan"
	line "terminado la"
	cont "PASARELA."
	
TeknosCityGramps2Text2:
	text "Debo admitirlo, me"
	line "encanta el CASINO"
	para "que acaba de abrir"
	line "al norte de aquí."
	done

TeknosCityLass1Text:
	text "TEKNOS solía ser"
	line "tranquila."

	para "Pero ha crecido"
	line "rápido, y creo que"
	para "no todo el mundo"
	line "se ha acostumbrado"
	cont "todavía."
	done

TeknosCityLass2Text:
	text "¡BLANCA es nuestra"
	line "LÍDER de GIMNASIO!"

	para "¡Siempre ha sido"
	line "de gran ayuda para"
	cont "la ciudad!"

	para "A veces es difícil"
	line "encontrarla en el"
	para "GIMNASIO, porque"
	line "suele estar fuera"
	para "comprobando si"
	line "puede ayudar en"
	cont "algo."
	done

TeknosCityLass2Text_ReleasedBeasts:
	text "Tres #MON"
	line "huyeron en tres"
	cont "direcciones."
	cont "¿Qué eran?"
	done

TeknosCityFisherText:
	text "A los MARINEROS"
	line "como yo no nos"
	cont "interesa mucho el"
	cont "ACUARIO."

	para "¡Ya vemos a todos"
	line "estos #MON en"
	cont "el mar! ¡Jojojo!"
	done

TeknosCityFisherText_TheresRockets:
	text "Esos tipos parecen"
	line "miembros del TEAM"
	cont "ROCKET."

	para "¿No se habían"
	line "esfumado?"
	done

TeknosCityYoungsterText:
	text "Lo he intentado"
	line "muchas veces, pero"
	para "nunca he podido"
	line "derrotar a BLANCA…"
	done

TeknosCityGramps3Text:
	text "TEKNOS empieza a"
	line "ser otra ciudad"
	cont "portuaria más."

	para "Siempre me ha"
	line "gustado visitarla."

	para "¡Espero que no"
	line "llegue a llenarse"
	cont "de gente!"
	done

TeknosCitySignText:
	text "CIUDAD TEKNOS"
	
	para "Una ciudad que"
	line "abraza el futuro"
	done

TinTowerSignText:
	text "¡PASARELA y CASINO"
	line "MARÍTIMO al norte!"

	para "¡Juegos, premios y"
	line "diversión!"
	done

EcruteakGymSignText:
	text "LÍDER DEL GIMNASIO"
	line "#MON DE CIUDAD"
	cont "TEKNOS: BLANCA"

	para "¡Enérgica y"
	line "ambiciosa!"
	done

EcruteakDanceTheaterSignText:
	text "ACUARIO DE"
	line "CIUDAD TEKNOS"
	done

BurnedTowerSignText:
	text "CASA DEL GURÚ"
	line "PESCADOR ARNOLDO"
	done
	
TekuCityDocksText:
	text "MUELLE TEKNOS"
	done
	
RocketsAreCommin:
	text "¡Vaya!"
	done
	
RocketsAreCommin2:
	text "¡Ayuda!"
	
	para "¡El TEAM ROCKET"
	line "está intentando"
	cont "hacerse con el"
	cont "ACUARIO!"
	done
	
WorkerText:
	text "Esos ROCKET han"
	line "dañado el puente…"
	
	para "Nos llevará un"
	line "tiempo repararlo."
	done
	
WalkToCenter:
	step RIGHT
	step_end
	
LassRun1:
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step LEFT
	step_end
	
LassRun2:
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

TeknosCity_MapEvents:
	db 0, 0 ; filler

	db 13 ; warp events
	warp_event 22, 31, TEKNOS_PORT_PASSAGE, 1
	warp_event 23, 31, TEKNOS_PORT_PASSAGE, 2
	warp_event 31, 10, TEKNOS_POKECENTER_1F, 1
	warp_event  7, 17, TEKNOS_OLD_ROD_HOUSE, 1
	warp_event  6, 27, TEKNOS_AQUARIUM_1F, 1
	warp_event  7, 27, TEKNOS_AQUARIUM_1F, 1
	warp_event 31, 16, TEKNOS_MART, 1
	warp_event 15, 17, TEKNOS_GRAMPS_ITEMFINDER_HOUSE, 1
	warp_event 22,  1, BOARDWALK_TEKNOS_GATE, 3
	warp_event 23,  1, BOARDWALK_TEKNOS_GATE, 4
	warp_event 10, 11, TEKNOS_GYM, 1
	warp_event 11, 11, TEKNOS_GYM, 2
	warp_event 33, 20, TEKNOS_KYLES_HOUSE, 1

	db 1 ; coord events
	coord_event 15, 18, SCENE_ECRUTEAK_ROCKET_TAKEOVER, SceneRocketTakeOverScript

	db 9 ; bg events
	bg_event 18, 21, BGEVENT_READ, TeknosCitySign
	bg_event 24,  8, BGEVENT_READ, TinTowerSign
	bg_event 12, 12, BGEVENT_READ, EcruteakGymSign
	bg_event 10, 27, BGEVENT_READ, EcruteakDanceTheaterSign
	bg_event 10, 17, BGEVENT_READ, BurnedTowerSign
	bg_event 32, 10, BGEVENT_READ, TeknosCityPokecenterSign
	bg_event 32, 16, BGEVENT_READ, TeknosCityMartSign
	bg_event 33, 13, BGEVENT_ITEM, TeknosCityHiddenHyperPotion
	bg_event 24, 29, BGEVENT_READ, TekuCityDocksSign

	db 14 ; object events
	object_event 14, 21, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosCityGramps1Script, -1
	object_event 19,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosCityGramps2Script, -1
	object_event 28, 27, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeknosCityLass1Script, -1
	object_event 23, 14, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosCityLass2Script, -1
	object_event  9, 30, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeknosCityFisherScript, -1
	object_event 10, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TeknosCityYoungsterScript, -1
	object_event 22, 13, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeknosCityGramps3Script, -1
	object_event  5, 28, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TeknosCityRocketTrainer1Script, EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	object_event  8, 28, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TeknosCityRocketTrainer2Script, EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	object_event  6, 28, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosCityRocket1Script, EVENT_WHITNEY_IN_BOULDER_MINES
	object_event  7, 28, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosCityRocket2Script, EVENT_WHITNEY_IN_BOULDER_MINES
	object_event  22, 22, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_SCARED_LASS
	object_event 22,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, WorkerScript, EVENT_TEKNOS_BRIDGE_REPAIRED
	object_event 23,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WorkerScript, EVENT_TEKNOS_BRIDGE_REPAIRED

	