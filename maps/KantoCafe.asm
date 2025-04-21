	const_def 2 ; object constants
	const CELADONCAFE2_SUPER_NERD
	const CELADONCAFE2_FISHER1
	const CELADONCAFE2_FISHER2
	const CELADONCAFE2_FISHER3
	const CELADONCAFE2_TEACHER

KantoCafe_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonCafe2Chef:
	faceplayer
	opentext
	writetext ChefText_Eatathon
	waitbutton
	closetext
	end

CeladonCafe2Fisher1:
	opentext
	writetext Fisher1Text_Snarfle
	waitbutton
	closetext
	faceplayer
	opentext
	writetext Fisher1Text_Concentration
	waitbutton
	closetext
	turnobject CELADONCAFE2_FISHER1, LEFT
	end

CeladonCafe2Fisher2:
	opentext
	writetext Fisher2Text_GulpChew
	waitbutton
	closetext
	faceplayer
	opentext
	writetext Fisher2Text_Quantity
	waitbutton
	closetext
	turnobject CELADONCAFE2_FISHER2, RIGHT
	end

CeladonCafe2Fisher3:
	opentext
	writetext Fisher3Text_MunchMunch
	waitbutton
	closetext
	faceplayer
	opentext
	writetext Fisher3Text_GoldenrodIsBest
	waitbutton
	closetext
	turnobject CELADONCAFE2_FISHER3, RIGHT
	end

CeladonCafe2Teacher:
	checkitem COIN_CASE
	iftrue .HasCoinCase
	opentext
	writetext TeacherText_CrunchCrunch
	waitbutton
	closetext
	faceplayer
	opentext
	writetext TeacherText_NoCoinCase
	waitbutton
	closetext
	turnobject CELADONCAFE2_TEACHER, LEFT
	end

.HasCoinCase:
	opentext
	writetext TeacherText_KeepEating
	waitbutton
	closetext
	turnobject CELADONCAFE2_TEACHER, RIGHT
	opentext
	writetext TeacherText_MoreChef
	waitbutton
	closetext
	turnobject CELADONCAFE2_TEACHER, LEFT
	end

EatathonContestPoster:
	jumptext EatathonContestPosterText

CeladonCafe2Trashcan:
	checkevent EVENT_FOUND_MYSTERY_BERRY_IN_CELADON_CAFE
	iftrue .TrashEmpty
	giveitem MYSTERYBERRY
	iffalse .PackFull
	opentext
	itemtotext MYSTERYBERRY, MEM_BUFFER_0
	writetext FoundLeftoversText2
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	setevent EVENT_FOUND_MYSTERY_BERRY_IN_CELADON_CAFE
	end

.PackFull:
	opentext
	itemtotext MYSTERYBERRY, MEM_BUFFER_0
	writetext FoundLeftoversText2
	buttonsound
	writetext NoRoomForLeftoversText2
	waitbutton
	closetext
	end

.TrashEmpty:
	jumpstd trashcan

ChefText_Eatathon:
	text "¡Hola!"

	para "Estamos llevando"
	line "a cabo un"
	cont "concurso de"
	cont "comida."

	para "Disculpa, no te"
	line "podemos atender"
	cont "ahora mismo."
	done

Fisher1Text_Snarfle:
	text "…Masticar…"
	done

Fisher1Text_Concentration:
	text "¡No me hables!"

	para "¡Harás que me"
	line "distraiga!"
	done

Fisher2Text_GulpChew:
	text "…Tragar…"
	done

Fisher2Text_Quantity:
	text "Prefiero cantidad"
	line "a calidad."

	para "¡Soy feliz"
	line "comiendo!"
	done

Fisher3Text_MunchMunch:
	text "…Mascar…"
	done

Fisher3Text_GoldenrodIsBest:
	text "No está mal la"
	line "comida de aquí,"
	cont "¡pero el CAFÉ"
	cont "ALEACIÓN tiene la"
	cont "mejor comida!"
	done

TeacherText_CrunchCrunch:
	text "…Crujir…"
	done

TeacherText_NoCoinCase:
	text "Nadie de por"
	line "aquí te dará un"
	cont "MONEDERO. Busca"
	cont "en otro lugar."
	done

TeacherText_KeepEating:
	text "…Crujir…"

	para "¡No puedo parar"
	cont "de comer!"
	done

TeacherText_MoreChef:
	text "¡Más, CHEF!"
	done

EatathonContestPosterText:
	text "¡Concurso de"
	line "comer! ¡Sin"
	cont "límite de tiempo!"

	para "¡Una batalla sin"
	line "fin! ¡El que más"
	cont "coma, se lo"
	cont "lleva todo"
	cont "gratis!"
	done

FoundLeftoversText2:
	text "<PLAYER> encontró"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

NoRoomForLeftoversText2:
	text "Pero <PLAYER> no"
	line "tiene espacio…"
	done

KantoCafe_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  9, KANTO_REGION, 31
	warp_event  5,  9, KANTO_REGION, 31

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  0, BGEVENT_READ, EatathonContestPoster
	bg_event  0,  1, BGEVENT_READ, CeladonCafe2Trashcan

	db 5 ; object events
	object_event  5,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeladonCafe2Chef, -1
	object_event  2,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCafe2Fisher1, -1
	object_event  7,  8, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCafe2Fisher2, -1
	object_event  7,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCafe2Fisher3, -1
	object_event  2,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCafe2Teacher, -1
