	const_def 2 ; object constants
	const BOARDWALK_BUG_CATCHER
	const BOARDWALK_SUPER_NERD2
	const BOARDWALK_SUPER_NERD3
	const BOARDWALK_FISHER
	const BOARDWALK_LASS
	const BOARDWALK_YOUNGSTER
	const BOARDWALK_INSTRUCTOR
	const BOARDWALK_POKEFAN_M
	const BOARDWALK_ITEMBALL

Boardwalk_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MoveTutor

.MoveTutor:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iffalse .MoveTutorDisappear
	checkitem COIN_CASE
	iffalse .MoveTutorDisappear
	appear BOARDWALK_POKEFAN_M
	return

.MoveTutorDisappear:
	disappear BOARDWALK_POKEFAN_M
	return

MoveTutorScript:
	faceplayer
	opentext
	writetext UnknownText_0x199042
	yesorno
	iffalse .Refused
	special DisplayCoinCaseBalance
	writetext UnknownText_0x199090
	yesorno
	iffalse .Refused2
	checkcoins 4000
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext UnknownText_0x1990ce
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal MOVETUTOR_FLAMETHROWER, .Flamethrower
	ifequal MOVETUTOR_THUNDERBOLT, .Thunderbolt
	ifequal MOVETUTOR_ICE_BEAM, .IceBeam
	jump .Incompatible

.Flamethrower:
	writebyte MOVETUTOR_FLAMETHROWER
	writetext UnknownText_0x1991cf
	special MoveTutor
	ifequal FALSE, .TeachMove
	jump .Incompatible

.Thunderbolt:
	writebyte MOVETUTOR_THUNDERBOLT
	writetext UnknownText_0x1991cf
	special MoveTutor
	ifequal FALSE, .TeachMove
	jump .Incompatible

.IceBeam:
	writebyte MOVETUTOR_ICE_BEAM
	writetext UnknownText_0x1991cf
	special MoveTutor
	ifequal FALSE, .TeachMove
	jump .Incompatible

.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "LANZALLAMAS@"
	db "RAYO@"
	db "RAYO HIELO@"
	db "SALIR@"

.Refused:
	writetext UnknownText_0x1990b4
	waitbutton
	closetext
	end

.Refused2:
	writetext UnknownText_0x199107
	waitbutton
	closetext
	end

.TeachMove:
	writetext UnknownText_0x19913a
	buttonsound
	takecoins 4000
	waitsfx
	playsound SFX_TRANSACTION
	special DisplayCoinCaseBalance
	writetext UnknownText_0x19918b
	waitbutton
	closetext
	end

.Incompatible:
	writetext UnknownText_0x1991a4
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext UnknownText_0x1991ac
	waitbutton
	closetext
	end
	

TrainerCamperSpencer:
	trainer CAMPER, SPENCER, EVENT_BEAT_CAMPER_SPENCER, CamperSpencerSeenText, CamperSpencerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperSpencerAfterBattleText
	waitbutton
	closetext
	end
	
TrainerInstructorCliff:
	trainer INSTRUCTOR, CLIFF, EVENT_BEAT_INSTRUCTOR_CLIFF, InstructorCliffSeenText, InstructorCliffBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext InstructorCliffAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacBrent:
	trainer POKEMANIAC, BRENT, EVENT_BEAT_POKEMANIAC_BRENT, PokemaniacBrentSeenText, PokemaniacBrentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacBrentAfterBattleText
	waitbutton
	closetext
	end
	
TrainerFledglingHidalgo:
	trainer FLEDGLING, HIDALGO, EVENT_BEAT_FLEDGLING_HIDALGO, FledglingHidalgoSeenText, FledglingHidalgoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FledglingHidalgoAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacRon:
	trainer POKEMANIAC, RON, EVENT_BEAT_POKEMANIAC_RON, PokemaniacRonSeenText, PokemaniacRonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacRonAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherMarvin:
	trainer FISHER, MARVIN, EVENT_BEAT_FISHER_MARVIN, FisherMarvinSeenText, FisherMarvinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMarvinAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerTiffany:
	trainer PICNICKER, TIFFANY, EVENT_BEAT_PICNICKER_TIFFANY, PicnickerTiffanySeenText, PicnickerTiffanyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerTiffanyWantsPicnicText
	waitbutton
	closetext
	end

BoardwalkRinringGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM12_PAY_DAY
	iftrue .GotPayday
	writetext BoardwalkRinringGuyText
	buttonsound
	verbosegiveitem TM_PAY_DAY
	iffalse .NoRoom
	setevent EVENT_GOT_TM12_PAY_DAY
.GotPayday:
	writetext BoardwalkRinringGuyPaydayText
	waitbutton
.NoRoom:
	closetext
	end

BoardwalkRinringScript:
	opentext
	writetext BoardwalkRinringText
	cry RINRING
	waitbutton
	closetext
	end

BoardwalkSign1:
	jumptext BoardwalkSign1Text

BoardwalkSign2:
	jumptext BoardwalkSign2Text

BoardwalkTrainerTips:
	jumptext BoardwalkTrainerTipsText

BoardwalkAmuletCoin:
	itemball AMULET_COIN

FledglingHidalgoSeenText:
	text "¿Puedo combatir"
	line "contra ti?"
	done
	
FledglingHidalgoBeatenText:
	text "¡Es duro!"
	done
	
FledglingHidalgoAfterBattleText:
	text "¡Trabajaré duro"
	line "para seguir"
	cont "mejorando!"
	done
	

InstructorCliffSeenText:
	text "¡Este nuevo"
	line "CASINO es genial!"
	para "Es una forma"
	line "divertida de"
	cont "escapar de tanto"
	cont "papeleo."
	done

InstructorCliffBeatenText:
	text "Es menos divertido"
	line "perder con los"
	cont "#MON…"
	done

InstructorCliffAfterBattleText:
	text "Nunca queda"
	line "suficiente tiempo"
	para "en el día después"
	line "del trabajo."
	done

PokemaniacBrentSeenText:
	text "¡Ey! ¿Tienes"
	line "#MON raros?"
	done

PokemaniacBrentBeatenText:
	text "Oh, ¡mis pobres"
	line "#MON!"
	done

PokemaniacBrentAfterBattleText:
	text "Sería feliz con"
	line "tan solo tener un"
	cont "#MON raro."
	done

PokemaniacRonSeenText:
	text "¿Quieres"
	line "esto?"

	para "¡Un tal <RIVAL>"
	line "me ganó!"

	para "¡Maldición! ¡Mis"
	line "#MON son"
	cont "lo más!"
	
	para "¡Seguro que a ti"
	line "te puedo ganar!"
	done

PokemaniacRonBeatenText:
	text "¡Mi equipo lo ha"
	line "hecho muy bien!"
	done

PokemaniacRonAfterBattleText:
	text "A la gente le"
	line "gusta tener"

	para "diferentes tipos"
	line "de #MON."

	para "No se trata de"
	line "tener al #MON"
	cont "más poderoso."
	done

FisherMarvinSeenText:
	text "No estoy en racha."

	para "Quizá sea por el"
	line "equipo que uso."

	para "Luchemos. A ver si"
	line "cambia mi suerte."
	done

FisherMarvinBeatenText:
	text "Aunque he perdido"
	line "me siento mejor."
	done

FisherMarvinAfterBattleText:
	text "Las CEBO BALL de"
	line "CÉSAR son las"
	para "mejores para"
	line "pescar #MON."

	para "Son mucho más"
	line "efectivas que las"
	cont "ULTRA BALL."
	done

CamperSpencerSeenText:
	text "Puedo hacer muchas"
	line "con mis #MON,"
	cont "¡mola mucho!"
	done

CamperSpencerBeatenText:
	text "Perder no mola"
	line "nada…"
	done

CamperSpencerAfterBattleText:
	text "¿Has estado alguna"
	line "vez en el BOSQUE"
	cont "JADE?"

	para "Teníamos pensado"
	line "acampar aquí."
	done

PicnickerTiffanySeenText:
	text "¿Vas al"
	line "CASINO?"

	para "¡Juguemos un"
	line "ratito!"
	done

PicnickerTiffanyBeatenText:
	text "¡He jugado mucho!"
	done

PicnickerTiffanyWantsPicnicText:
	text "Voy a ir de picnic"
	line "con mis #MON."

	para "¿No te vienes?"
	done

PicnickerTiffanyClefairyText:
	text "¿No es mi CLEFAIRY"
	line "lo más bonito del"
	cont "mundo?"
	done

BoardwalkSign1Text:
	text "PASARELA"
	
	para "PUEBLO SÁNSCRITO -"
	line "CIUDAD TEKNOS"
	done

BoardwalkSign2Text:
	text "CASINO MARÍTIMO"
	para "¡Tu fuente de"
	line "diversión!"
	done

BoardwalkTrainerTipsText:
	text "PISTAS ENTRENADOR"

	para "Todos los #MON"
	line "tienen ventajas y"
	para "desventajas según"
	line "el tipo."

	para "Entre dos #MON"
	line "de distinto tipo,"
	para "puede perder el"
	line "de nivel superior."

	para "Aprende qué tipos"
	line "son fuertes o"
	para "débiles contra tu"
	line "tipo de #MON."
	done
	
	
UnknownText_0x199042:
	text "Si quieres, puedo"
	line "enseñar increíbles"
	para "movimientos a tus"
	line "#MON."

	para "¿Le enseño un"
	line "nuevo movimiento?"
	done

UnknownText_0x199090:
	text "Te costará 4000"
	line "fichas. ¿Vale?"
	done

UnknownText_0x1990b4:
	text "Ohh… Pero"
	line "son increíbles…"
	done

UnknownText_0x1990ce:
	text "¡Uajajaja! ¡No lo"
	line "lamentarás!"

	para "¿Qué movimiento"
	line "debo enseñar?"
	done

UnknownText_0x199107:
	text "Mm, qué mal."
	line "Tendré que coger"
	cont "algo de dinero de"
	cont "casa…"
	done

UnknownText_0x19913a:
	text "Si comprendes lo"
	line "increíble de este"
	para "movimiento, tu"
	line "entrenamiento será"
	cont "de alto nivel."
	done

UnknownText_0x19918b:
	text "¡Uajajaja!"
	line "¡Gracias, chico!"
	done

UnknownText_0x1991a4:
	text "Pe… Pero…"
	done

UnknownText_0x1991ac:
	text "No tienes sufi-"
	line "cientes fichas…"
	done

UnknownText_0x1991cf:
	text_start
	done

BoardwalkRinringGuyText:
	text "Nunca me"
	line "aburro en el"
	cont "CASINO."
	
	para "Cualquier pérdida"
	line "puede convertirse"
	cont "en una ganancia"
	cont "a largo plazo…"
	
	para "¡Compartiré mi"
	line "secreto contigo!"
	
	para "…¡No lo digas!"
	done

BoardwalkRinringGuyPaydayText:
	text "Es DÍA DE PAGO."
	
	para "Puedes usarlo"
	line "cuando necesites"
	cont "acumular dinero."
	
	para "Pero que sea"
	line "un secreto entre"
	cont "notros."
	
	para "¡O dejarás al"
	line "CASINO sin"
	cont "negocio!"
	done

BoardwalkRinringText:
	text "RINRING: ¡Ririri!"
	done

Boardwalk_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  6, 51, BOARDWALK_TEKNOS_GATE, 1
	warp_event  7, 51, BOARDWALK_TEKNOS_GATE, 2
	warp_event 14,  9, BOARDWALK_SANSKRIT_GATE, 3
	warp_event 14,  5, BOARDWALK_SANSKRIT_GATE, 1
	warp_event 15,  5, BOARDWALK_SANSKRIT_GATE, 2
	warp_event 15,  9, BOARDWALK_SANSKRIT_GATE, 4
	warp_event 10, 23, BOARDWALK_GAME_CORNER, 1
	warp_event 11, 23, BOARDWALK_GAME_CORNER, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event 10, 10, BGEVENT_READ, BoardwalkSign1
	bg_event  8, 24, BGEVENT_READ, BoardwalkSign2
	bg_event 12, 40, BGEVENT_READ, BoardwalkTrainerTips

	db 11 ; object events
	object_event 15, 16, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFledglingHidalgo, -1
	object_event  9, 32, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerPokemaniacBrent, -1
	object_event  8, 11, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacRon, -1
	object_event  4, 16, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherMarvin, -1
	object_event  7, 23, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerTiffany, -1
	object_event  8, 42, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperSpencer, -1
	object_event 13, 24, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerInstructorCliff, -1
	object_event  9, 24, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoveTutorScript, -1
	object_event 14, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BoardwalkAmuletCoin, EVENT_BOARDWALK_AMULET_COIN
	object_event  4, 28, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BoardwalkRinringGuyScript, -1
	object_event  5, 28, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BoardwalkRinringScript, -1
