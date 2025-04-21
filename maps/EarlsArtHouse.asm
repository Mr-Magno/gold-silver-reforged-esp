	const_def 2 ; object constants
	const EARLSARTHOUSE_FISHER
	const EARLSARTHOUSE_BIRD
	const EARLSARTHOUSE_DRAGON
	const EARLSARTHOUSE_LASS
	const EARLSARTHOUSE_POKEFAN_M

EarlsArtHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
BirdScript:
	opentext
	writetext BirdText
	waitbutton
	closetext
	end

DragonScript:
	opentext
	writetext DragonText
	waitbutton
	closetext
	end

EarlScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .JustShowedSomething
	checkevent EVENT_MET_EARL
	iftrue .MetEarl
	writetext EarlIntroText
	buttonsound
	setevent EVENT_MET_EARL
.MetEarl:
	checkevent EVENT_SHOWED_DRATINI_TO_EARL
	iftrue .ShowedDratini
	checkevent EVENT_SHOWED_FARFETCHD_TO_EARL
	iftrue .ShowedFarfetchd
	writetext EarlFarfetchdText
	buttonsound
	writetext EarlAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal FARFETCH_D, .WrongPokemon
	writetext EarlShownPokemonText
	buttonsound
	setevent EVENT_SHOWED_FARFETCHD_TO_EARL
	jump .ShowedFarfetchd

.GotExpShare:
	writetext EarlDratiniText
	buttonsound
	writetext EarlAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal DRATINI, .WrongPokemon
	writetext EarlShownPokemonText
	buttonsound
	setevent EVENT_SHOWED_DRATINI_TO_EARL
	jump .ShowedDratini


.ShowedDratini:
	checkevent EVENT_GOT_LUCKY_EGG_FROM_EARL
	iftrue .GotLuckyEgg
	scall .ReceiveItem
	verbosegiveitem LUCKY_EGG
	iffalse .BagFull
	setevent EVENT_GOT_LUCKY_EGG_FROM_EARL
	clearevent EVENT_EARL_DRATINI_STATUE_GONE
	closetext
	end

.ShowedFarfetchd:
	checkevent EVENT_GOT_EXP_SHARE_FROM_EARL
	iftrue .GotExpShare
	scall .ReceiveItem
	verbosegiveitem EXP_SHARE
	iffalse .BagFull
	setevent EVENT_GOT_EXP_SHARE_FROM_EARL
	clearevent EVENT_EARL_BIRD_STATUE_GONE
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	closetext
	end
	
.GotLuckyEgg
	writetext EarlShownAllThePokemonText
	waitbutton
	closetext
	end

.ExcitedToSee:
	writetext EarlExcitedToSeeText
	buttonsound
	end

.SaidNo:
	writetext EarlYouDontHaveItTextText
	waitbutton
	closetext
	end

.ReceiveItem:
	writetext EarlTokenOfAppreciationText
	buttonsound
	end

.JustShowedSomething:
	writetext EarlComeAgainText
	waitbutton
	closetext
	end

.WrongPokemon:
	writetext EarlWrongPokemonText
	waitbutton
	closetext
	end

.BagFull:
	closetext
	end

EggStatue:
	jumptext EggStatueText

ArtSign:
	jumptext ArtSignText

ArtHouseLassScript:
	jumptextfaceplayer ArtHouseLassText

ArtHousePokefanMScript:
	jumptextfaceplayer ArtHousePokefanMText

ArtHousePokefanMText:
	text "¡Las obras de este"
	line "artista son"
	cont "impresionantes!"
	done

ArtHouseLassText:
	text "Para serte"
	line "sincera, el HUEVO"
	cont "es mi estatua"
	cont "favorita."
	done

EggStatueText:
	text "ESTATUA DE"
	line "HUEVO #MON,"
	cont "hecha por GABRIEL"
	done

ArtSignText:
	text "GALERÍA DE ARTE"
	line "DE GABRIEL"
	para "No tocar, por"
	line "favor."
	done

EarlIntroText:
	text "Oh, soy un"
	line "fracasado."

	para "Soy GABRIEL, y soy"
	line "un artista."

	para "Nunca me siento"
	line "inspirado."

	para "Abrí esta GALERÍA"
	line "de ARTE para"
	para "mostrar mis obras,"
	line "pero la única"
	para "escultura que he"
	line "logrado terminar"
	para "es una de un HUEVO"
	line "#MON."

	para "¡Tengo que hacer"
	line "algo que"
	cont "impresione!"

	para "He estado"
	line "trabajando en una"
	para "estatua del"
	line "#MON FARFETCH'D,"
	para "pero aún no la he"
	line "terminado."
	done

EarlAskToSeeMonText:
	text "Si tienes ese"
	line "#MON, ¿me"
	cont "dejas verlo?"
	done

EarlExcitedToSeeText:
	text "¿Me lo dejas ver?"
	line "¡Qué amable eres!"
	done

EarlYouDontHaveItTextText:
	text "¿No lo tienes?"
	line "¡Qué pena…!"
	done

EarlShownPokemonText:
	text "¡Ah, sí! ¡Es un"
	line "@"
	text_ram wStringBuffer3
	text "!"

	para "¡Me siento"
	line "inspirado!"
	done

EarlTokenOfAppreciationText:
	text "Toma esto como"
	line "agradecimiento."
	done

EarlComeAgainText:
	text "Vuelve cuando"
	line "quieras."
	done

EarlShownAllThePokemonText:
	text "Gracias por"
	line "enseñarme ese"
	cont "#MON."

	para "¡Con tu ayuda,"
	line "ahora estoy mucho"
	para "más cerca de"
	line "cumplir mi sueño!"
	done

EarlWrongPokemonText:
	text "¿Eh?"

	para "Ese no es el"
	line "#MON en que"
	cont "estaba pensando."
	done

EarlFarfetchdText:
	text "Si pudiera ver un"
	line "FARFETCH'D en"
	para "persona, me"
	line "sentiría inspirado"
	cont "para terminar mi"
	cont "estatua."
	done

EarlDratiniText:
	text "¡He terminado mi"
	line "estatua de"
	cont "FARFETCH'D!"

	para "Ahora, me gustaría"
	line "terminar mi"
	cont "estatua de"
	cont "DRATINI."

	para "Si pudiera ver un"
	line "DRATINI en"
	para "persona, me"
	line "sentiría inspirado"
	cont "para terminar mi"
	cont "estatua."
	done

BirdText:
	text "ESTATUA DE"
	line "FARFETCH'D,"
	cont "hecha por GABRIEL"
	done

DragonText:
	text "ESTATUA DE"
	line "DRATINI,"
	cont "hecha por GABRIEL"
	done

EarlsArtHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, PAGOTA_CITY, 12
	warp_event  3,  7, PAGOTA_CITY, 13

	db 0 ; coord events

	db 2 ; bg events
	bg_event 13, 4, BGEVENT_READ, EggStatue
	bg_event 2, 3, BGEVENT_READ, ArtSign

	db 5 ; object events
	object_event  1,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EarlScript, -1
	object_event  5,  4, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BirdScript, EVENT_EARL_BIRD_STATUE_GONE
	object_event  9,  4, SPRITE_EKANS, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DragonScript, EVENT_EARL_DRATINI_STATUE_GONE
	object_event 13,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ArtHouseLassScript, EVENT_EARL_DRATINI_STATUE_GONE
	object_event  5,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ArtHousePokefanMScript, EVENT_EARL_DRATINI_STATUE_GONE
