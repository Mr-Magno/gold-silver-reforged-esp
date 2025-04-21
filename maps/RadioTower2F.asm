	const_def 2 ; object constants
	const RADIOTOWER2F_JIGGLYPUFF
	const RADIOTOWER2F_BUENA
	const RADIOTOWER2F_RECEPTIONIST
	const RADIOTOWER2F_ROCKER
	const RADIOTOWER2F_GRUNTM24
	const RADIOTOWER2F_GRUNTM26
;	const RADIOTOWER2F_LILY

RadioTower2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RadioTower2FUnusedDummyScene:
; unused
	end


RadioTowerJigglypuff:
	opentext
	writetext RadioTowerJigglypuffText
	cry JIGGLYPUFF
	waitbutton
	closetext
	end

Buena:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover
	checkevent EVENT_MET_BUENA
	iffalse .Introduction
	checkflag ENGINE_BUENAS_PASSWORD_2
	iftrue .PlayedAlready
	checkcode VAR_HOUR
	ifless 18, .TooEarly
	checkflag ENGINE_BUENAS_PASSWORD
	iffalse .TuneIn
	checkitem BLUE_CARD
	iffalse .NoBlueCard
	checkcode VAR_BLUECARDBALANCE
	ifequal 30, .BlueCardCapped0
	playmusic MUSIC_BUENAS_PASSWORD
	writetext UnknownText_0x5de35
	special AskRememberPassword
	iffalse .ForgotPassword
	writetext UnknownText_0x5de84
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	checkcode VAR_FACING
	ifnotequal RIGHT, .DontNeedToMove
	applymovement PLAYER, MovementData_0x5d921
.DontNeedToMove:
	turnobject PLAYER, RIGHT
	opentext
	writetext UnknownText_0x5dedd
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, DOWN
	refreshscreen
	special BuenasPassword
	closetext
	iffalse .WrongAnswer
	opentext
	writetext UnknownText_0x5dfc1
	waitbutton
	closetext
	checkcode VAR_BLUECARDBALANCE
	addvar 1
	writevarcode VAR_BLUECARDBALANCE
	waitsfx
	playsound SFX_TRANSACTION
	setflag ENGINE_BUENAS_PASSWORD_2
	pause 20
	turnobject RADIOTOWER2F_BUENA, RIGHT
	opentext
	writetext UnknownText_0x5e054
	waitbutton
	closetext
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	checkcode VAR_BLUECARDBALANCE
	ifequal 30, .BlueCardCapped1
	end

.Introduction:
	writetext UnknownText_0x5dcf4
	buttonsound
	setevent EVENT_MET_BUENA
	verbosegiveitem BLUE_CARD
.TuneIn:
	writetext UnknownText_0x5de10
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered0
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered0:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.ForgotPassword:
	writetext UnknownText_0x5df29
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.PlayedAlready:
	writetext UnknownText_0x5df6c
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered1
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered1:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 10
	end

.WrongAnswer:
	setflag ENGINE_BUENAS_PASSWORD_2
	opentext
	writetext UnknownText_0x5e01c
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 20
	opentext
	writetext UnknownText_0x5e054
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.MidRocketTakeover:
	writetext UnknownText_0x5e0c2
	waitbutton
	closetext
	end

.NoBlueCard:
	writetext UnknownText_0x5e192
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered2
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
.Registered2:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.BlueCardCapped0:
	writetext UnknownText_0x5e0f1
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered3
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
.Registered3:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.TooEarly:
	writetext UnknownText_0x5e131
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered4
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered4:
	end

.BlueCardCapped1:
	checkcellnum PHONE_BUENA
	iftrue .HasNumber
	pause 20
	turnobject RADIOTOWER2F_BUENA, DOWN
	pause 15
	turnobject PLAYER, UP
	pause 15
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
	showemote EMOTE_SHOCK, RADIOTOWER2F_BUENA, 15
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	opentext
	writetext UnknownText_0x5e1ee
	jump .AskForNumber

.OfferedNumberBefore:
	opentext
	writetext UnknownText_0x5e2bf
.AskForNumber:
	askforphonenumber PHONE_BUENA
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	writetext UnknownText_0x5e2f3
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	buttonsound
	writetext UnknownText_0x5e310
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	addcellnum PHONE_BUENA
	end

.NumberDeclined:
	writetext UnknownText_0x5e33c
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.PhoneFull:
	writetext UnknownText_0x5e35e
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
.HasNumber:
	end

RadioTowerBuenaPrizeReceptionist:
	faceplayer
	opentext
	checkitem BLUE_CARD
	iffalse .NoCard
	writetext UnknownText_0x5e392
	buttonsound
	special BuenaPrize
	closetext
	end

.NoCard:
	writetext UnknownText_0x5e3d8
	buttonsound
	closetext
	end

RadioTower2FSalesSign:
	jumptext RadioTower2FSalesSignText

RadioTower2FOaksPKMNTalkSign:
	jumptext RadioTower2FOaksPKMNTalkSignText

RadioTower2FPokemonRadioSign:
	jumptext RadioTower2FPokemonRadioSignText
	
RadioTower2fRocker:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover2fRocker
	writetext RadioTower2fRockerText
	waitbutton
	closetext
	end
.MidRocketTakeover2fRocker
	writetext RadioTower2fRockerTextTakeover
	waitbutton
	closetext
	end
	
TrainerGruntM24:
	trainer GRUNTF, GRUNTF_8, EVENT_BEAT_ROCKET_GRUNTM_24, GruntM24SeenText, GruntM24BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM24AfterBattleText
	waitbutton
	closetext
	end
	
TrainerGruntM26:
	trainer GRUNTM, GRUNTM_26, EVENT_BEAT_ROCKET_GRUNTM_26, GruntM26SeenText, GruntM26BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM26AfterBattleText
	waitbutton
	closetext
	end
	
;RadioTower2fLily:
;	faceplayer
;	opentext
;	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
;	iftrue .MidRocketTakeover2fLily
;	writetext RadioTower2fLilyText
;	waitbutton
;	closetext
;	end
;.MidRocketTakeover2fLily
;	writetext RadioTower2fLilyTextTakeover
;	waitbutton
;;	closetext
;	end
	
;RadioTower2fLilyText:
;	text "LILY: Be sure to"
;	line "tune in to hear me"
;	para "talk about all of"
;	line "my favorite people"
;	cont "and locations!"
;	done
;	
;RadioTower2fLilyTextTakeover:
;	text "LILY: TEAM ROCKET"
;	line "members are my"
;	cont "least favorite!"
;	done
	
GruntM24SeenText:
	text "El TEAM ROCKET"
	line "puede operar en"
	cont "bases secretas."

	para "¡Pero no tenemos"
	line "inconveniente en"
	para "irrumpir y llevar-"
	line "nos lo que haga"
	cont "falta si es"
	cont "necesario!"
	done
	
	
GruntM24BeatenText:
	text "¡Tú no has tenido"
	line "inconveniente en"
	cont "derrotarme!"
	done
	
GruntM24AfterBattleText:
	text "¿Conoces a nuestro"
	line "líder?"
	para "Me da a mí que no"
	line "os llevaríais"
	cont "bien."
	done

GruntM26SeenText:
	text "¿Que por qué"
	line "estamos aquí?"
	para "¡Porque tu amigo y"
	line "tú destruisteis"
	cont "nuestra antena!"

	para "¿Por qué crear"
	line "otra cuando pode-"
	cont "mos robar esta?"
	done
	
GruntM26BeatenText:
	text "¡Auch!"
	done
	
GruntM26AfterBattleText:
	text "¡Hemos tenido"
	line "muchos problemas"
	cont "por vuestra culpa!"
	done

	
RadioTower2fRockerTextTakeover:
	text "¡Todas las"
	line "estaciones de"
	para "radio están"
	line "hablando sobre el"
	cont "TEAM ROCKET!"
	done

RadioTower2fRockerText:
	text "¿Has escuchado la"
	line "Marcha #MON?"
	para "Hace que aparezcan"
	line "más #MON"
	cont "salvajes."
	done

MovementData_0x5d921:
;	slow_step DOWN
;	slow_step RIGHT
	step_end


RadioTowerJigglypuffText:
	text "JIGGLYPUFF:"
	line "Jiggly…"
	done

UnknownText_0x5dcf4:
	text "BUENA: ¡Hola!"
	line "¡Soy BUENA!"

	para "¿Conoces el"
	line "programa de"
	cont "radio llamado"
	cont "CONTRASEÑA?"

	para "Si puedes decirme"
	line "la contraseña del"
	cont "programa, conse-"
	cont "guirás puntos."

	para "¡Ahorra puntos y"
	line "cámbialos con"
	cont "la jovenzuela"
	cont "de ahí por unos"
	cont "premios selectos!"

	para "¡Ahí tienes!"

	para "¡Es una tarjeta"
	line "de puntos!"
	done

UnknownText_0x5de10:
	text "BUENA: ¡Sinto-"
	line "niza el programa"
	cont "CONTRASEÑA!"
	done

UnknownText_0x5de35:
	text "BUENA: ¡Hola!"
	line "¿Has sintonizado"
	cont "el programa?"

	para "¿Recuerdas la"
	line "contraseña de hoy?"
	done

UnknownText_0x5de84:
	text "BUENA: Oh,"
	line "¡vaya! ¡Gracias!"

	para "¿Cómo te llamas?"

	para "<PLAY_G>, ¡Bien!"

	para "Ven, <PLAY_G>."
	line "¡Únete al"
	cont "programa!"
	done

UnknownText_0x5dedd:
	text "BUENA: ¿Todo el"
	line "mundo listo?"

	para "¡Gritad la con-"
	line "traseña de hoy"

	para "para"
	line "<PLAY_G>!"
	done

UnknownText_0x5df29:
	text "BUENA: Vuelve"
	line "tras haber es-"
	cont "cuchado mi pro-"
	cont "grama. ¡Chao!"
	done

UnknownText_0x5df6c:
	text "BUENA: Perdona…"

	para "Sólo tienes una"
	line "oportunidad al"

	para "día. ¡Vuelve"
	line "mañana!"
	done

UnknownText_0x5dfc1:
	text "BUENA: ¡Olé!"
	line "¡Correcto!"

	para "¡La has acertado!"
	line "¡Qué feliz estoy!"

	para "¡Ganas un punto!"
	line "¡Felicidades!"
	done

UnknownText_0x5e01c:
	text "BUENA: Ohh…"
	line "Has fallado…"

	para "¿Te has olvidado"
	line "de la contraseña?"
	done

UnknownText_0x5e054:
	text "BUENA: ¡Sí!"
	line "¡Nuestro con-"

	para "cursante era"
	line "<PLAY_G>."

	para "¡Gracias por"
	line "venir! Al resto,"

	para "¡nos vemos"
	line "pronto!"
	done

UnknownText_0x5e0c2:
	text "BUENA: ¿Qué?"
	line "¿La contraseña"
	cont "de hoy?"

	para "HELP, ¡claro!"
	done

UnknownText_0x5e0f1:
	text "BUENA: Tu"
	line "TARJ. AZUL"
	cont "está llena."

	para "¡Cámbiala por"
	line "premios geniales!"
	done

UnknownText_0x5e131:
	text "BUENA: Sinto-"
	line "niza CONTRASEÑA"

	para "cada día de seis"
	line "hasta media noche."

	para "¡Hazlo y pásate"
	line "por aquí!"
	done

UnknownText_0x5e192:
	text "BUENA: ¿Oh?"
	line "¿Has olvidado tu"
	cont "TARJETA AZUL?"

	para "No te puedo dar"
	line "puntos si no"
	cont "la llevas encima."
	done

UnknownText_0x5e1ee:
	text "BUENA: ¡Oh! ¡Tu"
	line "TARJETA AZUL ha"

	para "llegado a 30"
	line "puntos hoy!"

	para "¡Vaya locura!"
	line "No tenemos premio"
	cont "para esos 30"
	cont "puntos… Pero ya"
	cont "que vienes tan"
	cont "a menudo, te haré"
	cont "un trato especial."

	para "¿Quieres mi núm."
	line "de teléfono?"
	done

UnknownText_0x5e2bf:
	text "BUENA: <PLAY_G>,"
	line "¿quieres"

	para "registrar mi"
	line "número?"
	done

UnknownText_0x5e2f3:
	text "<PLAYER> registró"
	line "el número de"
	cont "BUENA."
	done

UnknownText_0x5e310:
	text "BUENA: ¡Espero"
	line "que me llames!"
	done

UnknownText_0x5e33c:
	text "BUENA: Ohh… Es un"
	line "premio especial…"
	done

UnknownText_0x5e35e:
	text "BUENA: <PLAY_G>,"
	line "tu lista de"

	para "contactos está"
	line "llena…"
	done

UnknownText_0x5e392:
	text "Puedes cambiar"
	line "tus puntos por"

	para "premios a tu"
	line "elección."
	done

UnknownText_0x5e3d8:
	text "No puedes cambiar"
	line "puntos sin tu"
	cont "TARJETA AZUL."

	para "¡No te la"
	line "olvides!"
	done

RadioTower2FSalesSignText:
	text "P1 ESTUDIO 1"
	done

RadioTower2FOaksPKMNTalkSignText:
	text "LA HORA #MON"
	line "DEL PROF. OAK"

	para "¡El mejor programa"
	line "de la radio!"
	done

RadioTower2FPokemonRadioSignText:
	text "A cualquier hora"
	line "y en todas partes."
	done

RadioTower2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  0, RADIO_TOWER_3F, 1
	warp_event  7,  0, RADIO_TOWER_1F, 3

	db 0 ; coord events

	db 3 ; bg events
	bg_event  5,  0, BGEVENT_READ, RadioTower2FSalesSign
	bg_event  6, -1, BGEVENT_READ, RadioTower2FOaksPKMNTalkSign
	bg_event  3,  0, BGEVENT_READ, RadioTower2FPokemonRadioSign

	db 6 ; object events
;	object_event  0,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower2FBlackBelt1Script, EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
;	object_event  1,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower2FBlackBelt2Script, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event  4,  1, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTowerJigglypuff, -1
	object_event  0,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Buena, -1
	object_event  4,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTowerBuenaPrizeReceptionist, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event  6,  5, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower2fRocker, -1
	object_event  2,  1, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerGruntM24, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerGruntM26, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
;	object_event  6,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower2fLily, -1
