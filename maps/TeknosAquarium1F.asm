	const_def 2 ; object constants
	const AQUA1F_RECEPTIONIST
	const AQUA1F_ROCKET2
	const AQUA1F_ROCKETF1
	const AQUA1F_YOUNGSTER
	const AQUA1F_LASS
	const AQUA1F_WHITNEY
	const AQUA1F_ROCKET3
	const AQUA1F_ROCKETF2
	const AQUA1F_ROCKET4
	const AQUA1F_ROCKETF22 ;fighting whitney
	const AQUA1F_ROCKET42 ;fighting whitney
	const AQUA1F_TEST ;fighting whitney

TeknosAquarium1F_MapScripts:
	db 1 ; scene scripts
	scene_script .SceneWhitneyEnters 

	db 0 ; callbacks
	

.SceneWhitneyEnters:
	priorityjump .WhitneyEntersEvent
	end	


.WhitneyEntersEvent
	pause 15
	playsound SFX_ENTER_DOOR
	moveobject AQUA1F_WHITNEY, 13, 7
	appear AQUA1F_WHITNEY
	turnobject AQUA1F_WHITNEY, UP
	applymovement AQUA1F_WHITNEY, WhitneyDummyMovement
	pause 15
	applymovement AQUA1F_WHITNEY, WhitneyToCenter
	opentext
	writetext WhitneyThisisTerribleText
	waitbutton
	closetext
	pause 6
	turnobject AQUA1F_WHITNEY, RIGHT
	pause 6
	turnobject AQUA1F_WHITNEY, UP
	pause 6
	turnobject AQUA1F_WHITNEY, DOWN
	pause 6
	showemote EMOTE_SHOCK, AQUA1F_WHITNEY, 15
	applymovement AQUA1F_WHITNEY, WhitneyToPlayer
	opentext
	writetext WhitneyIRememberYouText
	waitbutton
	closetext
	applymovement AQUA1F_WHITNEY, WhitneyToRockets
	showemote EMOTE_SHOCK, AQUA1F_ROCKET3, 15
	turnobject AQUA1F_WHITNEY, UP
	applymovement AQUA1F_ROCKET4, RocketMtoWhitney
	turnobject AQUA1F_ROCKET4, UP
	turnobject AQUA1F_WHITNEY, DOWN
	applymovement AQUA1F_ROCKETF2, RocketFtoWhitney
	turnobject AQUA1F_WHITNEY, LEFT
	opentext
	writetext WhitneyWontGoEasyOnYouText
	waitbutton
	closetext
	appear AQUA1F_ROCKETF22
	appear AQUA1F_ROCKET42
	appear AQUA1F_TEST
	disappear AQUA1F_ROCKETF2
	disappear AQUA1F_ROCKET4
	disappear AQUA1F_WHITNEY
	setscene SCENE_AQUARIUM_ROCKET_TAKEOVER_1F_NOTHING
	clearevent WHITNEY_FIGHTING_ROCKETS
	setevent EVENT_AQUARIUM_ROCKETS_IDLE
	end

	
WhitneyDummyMovement:
	step_end
	
	
WhitneyToCenter:
	step UP
	step UP
	step LEFT
	step_end
	
WhitneyToPlayer:
	step DOWN
	step_end
	
WhitneyToRockets:
	step UP
	step LEFT
	step LEFT
	step_end
	
RocketMtoWhitney:
	big_step RIGHT
	big_step RIGHT
	step RIGHT
	step_end
	
RocketFtoWhitney:
	big_step RIGHT
	big_step RIGHT
	step_end

TrainerGruntM2:
	trainer GRUNTM, GRUNTM_2, EVENT_BEAT_ROCKET_GRUNTM_2, GruntM2SeenText, GruntM2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM2AfterBattleText
	waitbutton
	closetext
	end
	
TrainerGruntF1:
	trainer GRUNTF, GRUNTF_1, EVENT_BEAT_ROCKET_GRUNTF_1, GruntF1SeenText, GruntF1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF1AfterBattleText
	waitbutton
	closetext
	end
	
AquaReceptionistScript:
	faceplayer
	opentext
	checkevent EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	iftrue .ReceptionistNoRockets
	writetext AquaReceptionistRocketsText
	waitbutton
	closetext
	end

.ReceptionistNoRockets:
	writetext AquaReceptionistNoRocketsText
	waitbutton
	closetext
	end
	
AquaYoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	iftrue .YoungsterNoRockets
	writetext AquaYoungsterRocketsText
	waitbutton
	closetext
	end

.YoungsterNoRockets:
	writetext AquaYoungsterNoRocketsText
	waitbutton
	closetext
	end
	
AquaLassScript:
	faceplayer
	opentext
	checkevent EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	iftrue .LassNoRockets
	writetext AquaLassRocketsText
	waitbutton
	closetext
	end

.LassNoRockets:
	writetext AquaLassNoRocketsText
	waitbutton
	closetext
	end
	
Aqua1FExhibit1Script:
	jumptext Aqua1FExhibit1Text
	
Aqua1FExhibit2Script:
	jumptext Aqua1FExhibit2Text
	
Aqua1FExhibit3Script:
	jumptext Aqua1FExhibit3Text
	
Aqua1FExhibit4Script:
	jumptext Aqua1FExhibit4Text
	
WhitneyAquariumScript:
	jumptext WhitneyIwillHandlethisText
	
RocketGruntWhitney1Script:
	jumptext RocketGruntWhitney1Text
	
RocketGruntWhitney2Script:
	jumptext RocketGruntWhitney2Text
	
RocketGruntWhitney3Script:
	jumptext RocketGruntWhitney3Text
	
Aqua1FExhibit1Text:
	text "A los KRABBY les"
	line "gusta esconderse"
	cont "bajo la arena."

	para "Mira atentamente"
	line "para descubrir a"
	cont "los #MON"
	cont "enterrados."
	done
	
Aqua1FExhibit2Text:
	text "NUEVA EXHIBICIÓN"
	line "PRÓXIMAMENTE"
	done

Aqua1FExhibit3Text:
	text "Los CORASUN y"
	line "los MAGIKARP"
	para "pueden compartir"
	line "sin problemas el"
	cont "mismo espacio."

	para "Estos #MON"
	line "suelen vivir en"
	cont "las mismas aguas."
	done
	
GruntM2SeenText:
	text "¡Vamos a entrar,"
	line "robar lo que que-"
	cont "ramos y venderlo!"

	para "¡Necesitamos"
	line "dinero porque"
	para "tenemos grandes"
	line "planes, chaval!"
	done
	
Aqua1FExhibit4Text:
	text "ESTATUA DE LAPRAS"
	para "Se ha informado en"
	line "varias ocasiones"
	para "de que se pueden"
	line "encontrar LAPRAS"
	para "en las profundida-"
	line "des de la MINA"
	cont "al oeste de la"
	cont "ciudad."
	done

GruntM2BeatenText:
	text "Simplemente…"
	line "Muy fuerte…"
	done

GruntM2AfterBattleText:
	text "¡Pronto sabrás más"
	line "de nosotros!"
	done
	

AquaReceptionistRocketsText:
	text "¡Cuidado! No"
	line "debería haber"
	cont "niños aquí ahora."
	
	para "Estamos teniendo"
	line "problemas con una"
	para "peligrosa activi-"
	line "dad criminal."
	done

AquaReceptionistNoRocketsText:
	text "¡Bienvenido al"
	line "ACUARIO DE CIUDAD"
	cont "TEKNOS!"

	para "No dudes en echar"
	line "un vistazo."
	done

GruntF1SeenText:
	text "¡Este sitio tiene"
	line "#MON raros que"
	para "podemos robar para"
	line "venderlos!"

	para "¡Aparta de nuestro"
	line "camino, niñato!"
	done
	
WhitneyThisisTerribleText:
	text "¡Oh, no!"
	line "¡Esto es horrible!"
	done
	
WhitneyIRememberYouText:
	text "¡Ey! ¡Te recuer-"
	line "do de la MINA!"
	
	para "Escucha…"
	
	para "¡El TEAM ROCKET"
	line "está intentando"
	cont "hacerse con el"
	cont "ACUARIO!"
	
	para "¡Eso maleantes!"
	
	para "Como LÍDER de"
	line "GIMNASIO, ¡no"
	cont "puedo permitirlo!"
	
	para "¿Puedes ayudarme"
	line "a afrontarlos?"
	
	para "Su comandante"
	line "debe estar en el"
	cont "1r piso…"
	
	para "¡A por ellos!"
	done
	
WhitneyWontGoEasyOnYouText:
	text "…risilla…"
	
	para "¡No creas que"
	line "te lo pondré"
	cont "fácil por ser una"
	cont "chica bonita!"
	done
	
WhitneyIwillHandlethisText:
	text "Me encargaré de"
	line "estos idiotas…"
	
	para "¡Tú ve a por"
	line "su comandante!"
	done

GruntF1BeatenText:
	text "¡Mocoso!"
	done

GruntF1AfterBattleText:
	text "¡El TEAM ROCKET"
	line "recordará esto!"
	done
	
AquaYoungsterRocketsText:
	text "Mmm… Creo que esos"
	line "tipos de negro no"
	cont "deberían estar"
	cont "aquí…"
	done

AquaYoungsterNoRocketsText:
	text "Esperaba ver un"
	line "ANCHORAGE en per-"
	cont "sona, pero aquí"
	cont "no hay ninguno."
	done
	
AquaLassRocketsText:
	text "¡Auxilio!"

	para "Ah, no vas con"
	line "ellos."

	para "Esa gente me"
	line "asusta."

	para "Creo que debería"
	line "irme."
	done

AquaLassNoRocketsText:
	text "El ACUARIO es"
	line "nuevo."

	para "Todavía no tienen"
	line "mucho que mostrar."
	done
	
RocketGruntWhitney1Text:
	text "¡Piérdete, mocoso!"
	done
	
RocketGruntWhitney2Text:
	text "¿Quién te crees"
	line "que eres?"
	
	para "¡Búscate un lu-"
	line "gar para robar!"
	done
	
RocketGruntWhitney3Text:
	text "¡Bah!"
	
	para "¡Es tan mona"
	line "como dura!"
	
	para "Sobre todo su"
	line "MILTANK."
	done

TeknosAquarium1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 12,  7, TEKNOS_CITY, 5
	warp_event 13,  7, TEKNOS_CITY, 6
	warp_event  0,  7, TEKNOS_AQUARIUM_2F, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event  1,  3, BGEVENT_READ, Aqua1FExhibit1Script
	bg_event  7,  3, BGEVENT_READ, Aqua1FExhibit2Script
	bg_event 10,  3, BGEVENT_READ, Aqua1FExhibit3Script
	bg_event  4,  1, BGEVENT_READ, Aqua1FExhibit4Script


	db 12 ; object events
	object_event 15,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AquaReceptionistScript, -1
	object_event  7,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM2, EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	object_event  5,  7, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGruntF1, EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	object_event 13,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AquaYoungsterScript, -1
	object_event  3,  5, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AquaLassScript, -1
	object_event 10,  5, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WhitneyAquariumScript, WHITNEY_FIGHTING_ROCKETS
	object_event 10,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketGruntWhitney1Script, EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	object_event  7,  5, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RocketGruntWhitney2Script, EVENT_AQUARIUM_ROCKETS_IDLE
	object_event  7,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketGruntWhitney3Script, EVENT_AQUARIUM_ROCKETS_IDLE
	object_event  9,  5, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RocketGruntWhitney2Script, WHITNEY_FIGHTING_ROCKETS
	object_event 10,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketGruntWhitney3Script, WHITNEY_FIGHTING_ROCKETS
	object_event 10,  5, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WhitneyAquariumScript, WHITNEY_FIGHTING_ROCKETS
