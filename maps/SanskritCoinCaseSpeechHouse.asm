	const_def 2 ; object constants
	const MAHOGANYREDGYARADOSSPEECHHOUSE_BLACK_BELT

SanskritCoinCaseSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


SanskritCoinCaseSpeechHouseBlackBeltScript:
	faceplayer
	opentext
	checkevent EVENT_GOLDENROD_UNDERGROUND_COIN_CASE
	iftrue .GotCoinCase
	writetext SanskritCoinCaseSpeechHouseBlackBeltText_Question
	yesorno
	iffalse .Refused
	writetext SanskritCoinCaseSpeechHouseBlackBeltText_Yes
	buttonsound
	verbosegiveitem COIN_CASE
	writetext SanskritCoinCaseSpeechHouseBlackBeltText_GiveCoinCase
	waitbutton
	closetext
	setevent EVENT_GOLDENROD_UNDERGROUND_COIN_CASE
	end

.Refused:
	writetext SanskritCoinCaseSpeechHouseBlackBeltText_No
	waitbutton
	closetext
	end

.GotCoinCase:
	writetext SanskritCoinCaseSpeechHouseBlackBeltText_After
	waitbutton
	closetext
	end


SanskritCoinCaseSpeechHouseBlackBeltText_Question:
	text "PUEBLO SÁNSCRITO"
	line "nunca ha destacado"
	cont "por sus activida-"
	cont "des de ocio."
	
	para "Hasta que abrieron"
	line "el CASINO aquí"
	cont "cerca, claro."
	
	para "Paso mucho tiempo"
	line "allí."

	para "¡Ya sé! ¡Deberías"
	line "quedarte esto!"
	done

SanskritCoinCaseSpeechHouseBlackBeltText_Yes:
	text "¡Bien! ¡Quizá tú"
	line "serás más respon-"
	cont "sable que yo!"
	done

SanskritCoinCaseSpeechHouseBlackBeltText_GiveCoinCase:
	text "¡El CASINO es"
	line "divertidísimo!"

	para "Pero ten cuidado,"
	line "no dejes que sea"
	cont "una adicción."
	done

SanskritCoinCaseSpeechHouseBlackBeltText_No:
	text "Vaya. Creo que más"
	line "bien debería"
	para "trabajar en mi"
	line "autocontrol…"
	done

SanskritCoinCaseSpeechHouseBlackBeltText_After:
	text "Vaya peso me he"
	line "quitado de encima."
	done


SanskritCoinCaseSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, SANSKRIT_TOWN, 2
	warp_event  5,  7, SANSKRIT_TOWN, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  8,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritCoinCaseSpeechHouseBlackBeltScript, -1
