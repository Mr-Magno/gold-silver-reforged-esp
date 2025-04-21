	const_def 2 ; object constants
	const FOSSIL_LAB_SCIENTIST_1
	const FOSSIL_LAB_SCIENTIST_2
	const FOSSIL_LAB_GENTLEMAN

KantoFossilLab_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KantoFossilLabFossilScientist:
	faceplayer
	opentext
	checkitem HELIX_FOSSIL
	iftrue .GetOmanyte
	checkitem DOME_FOSSIL
	iftrue .GetKabuto
	checkitem OLD_AMBER 
	iftrue .GetAerodactyl
	writetext FossilScientistIntroText
	waitbutton
	closetext
	end
	
.GetOmanyte
	writetext FossilScientistIntroText
	waitbutton
	writetext YouHaveHelixFossilText
	yesorno
	iftrue .GetOmanyte2
	writetext AnotherTimeFossilText
	waitbutton
	closetext
	end
	
.GetOmanyte2
	writetext TimeToGetAFossilmonText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullOmanyte
	closetext
	pause 15
	applymovement FOSSIL_LAB_SCIENTIST_1, ScientistGoesToMachine1
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 15
	applymovement FOSSIL_LAB_SCIENTIST_1, ScientistGoesToMachine2
	playsound SFX_BOOT_PC
	waitsfx
	pause 15
	playsound SFX_POTION
	waitsfx
	applymovement FOSSIL_LAB_SCIENTIST_1, ScientistGoesToMachine3
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 15
	applymovement FOSSIL_LAB_SCIENTIST_1, ScientistGoesToMachine4
	opentext
	writetext ScientistHereYouGoText
	waitbutton
	writetext PlayerGetsAnOmanyte
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke OMANYTE, 15
	takeitem HELIX_FOSSIL
	writetext IfYouHaveAnyOtherFossilsText
	waitbutton
	closetext
	end
	
.PartyFullOmanyte
	writetext NoRoomForFossilmon
	waitbutton
	closetext
	end
	

.GetKabuto
	writetext FossilScientistIntroText
	waitbutton
	writetext YouHaveDomeFossilText
	yesorno
	iftrue .GetKabuto2
	writetext AnotherTimeFossilText
	waitbutton
	closetext
	end
	
.GetKabuto2
	writetext TimeToGetAFossilmonText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullKabuto
	closetext
	pause 15
	applymovement FOSSIL_LAB_SCIENTIST_1, ScientistGoesToMachine1
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 15
	applymovement FOSSIL_LAB_SCIENTIST_1, ScientistGoesToMachine2
	playsound SFX_BOOT_PC
	waitsfx
	pause 15
	playsound SFX_POTION
	waitsfx
	applymovement FOSSIL_LAB_SCIENTIST_1, ScientistGoesToMachine3
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 15
	applymovement FOSSIL_LAB_SCIENTIST_1, ScientistGoesToMachine4
	opentext
	writetext ScientistHereYouGoText
	waitbutton
	writetext PlayerGetsAKabuto
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke KABUTO, 15
	takeitem DOME_FOSSIL
	writetext IfYouHaveAnyOtherFossilsText
	waitbutton
	closetext
	end
	
.PartyFullKabuto
	writetext NoRoomForFossilmon
	waitbutton
	closetext
	end
	
	
.GetAerodactyl
	writetext FossilScientistIntroText
	waitbutton
	writetext YouHaveOldAmberText
	yesorno
	iftrue .GetAerodactyl2
	writetext AnotherTimeFossilText
	waitbutton
	closetext
	end
	
.GetAerodactyl2
	writetext TimeToGetAFossilmonText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullAerodactyl
	closetext
	pause 15
	applymovement FOSSIL_LAB_SCIENTIST_1, ScientistGoesToMachine1
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 15
	applymovement FOSSIL_LAB_SCIENTIST_1, ScientistGoesToMachine2
	playsound SFX_BOOT_PC
	waitsfx
	pause 15
	playsound SFX_POTION
	waitsfx
	applymovement FOSSIL_LAB_SCIENTIST_1, ScientistGoesToMachine3
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	waitsfx
	pause 15
	applymovement FOSSIL_LAB_SCIENTIST_1, ScientistGoesToMachine4
	opentext
	writetext ScientistHereYouGoText
	waitbutton
	writetext PlayerGetsAnAerodactyl
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke AERODACTYL, 15
	takeitem OLD_AMBER
	writetext IfYouHaveAnyOtherFossilsText
	waitbutton
	closetext
	end
	
.PartyFullAerodactyl
	writetext NoRoomForFossilmon
	waitbutton
	closetext
	end
	
	
	
KantoFossilLabScientist1Script:
	jumptextfaceplayer KantoFossilLabScientist1Text
	
KantoFossilLabGentlemanScript:
	jumptextfaceplayer KantoFossilLabGentlemanText
	
KantoFossilLabBookshelf:
	jumpstd difficultbookshelf

	
ScientistGoesToMachine1:
	step UP
	step UP
	turn_head LEFT
	step_end
	
ScientistGoesToMachine2:
	step RIGHT
	step DOWN
	step RIGHT
	turn_head UP
	step_end
	
ScientistGoesToMachine3:
	step LEFT
	step UP
	step LEFT
	step_end
	
ScientistGoesToMachine4:
	step DOWN
	step DOWN
	step_end
	
KantoFossilLabGentlemanText:
	text "Este lugar es"
	line "un centro de"
	cont "reunión para los"
	cont "investigadores"
	cont "más brillantes"
	cont "de NIHON."
	done
	
KantoFossilLabScientist1Text:
	text "¿Sabías qué?"
	para "¡Hemos logrado"
	line "grandes avances en"
	cont "tecnología fósil"
	cont "#MON."
	para "¡Ahora somos ca-"
	line "paces de traer"
	cont "de vuelta a"
	cont "#MON fosili-"
	cont "zados en segundos!"
	done

ScientistHereYouGoText:
	text "¡Hecho!"
	line "¡Aquí tienes!"
	done
	
IfYouHaveAnyOtherFossilsText:
	text "Si te encuentras"
	line "con otros fósi-"
	cont "les, ¡no dudes"
	cont "en decírmelo!"
	done
	
NoRoomForFossilmon:
	text "¡Oh, espera!"
	line "¡No tienes espacio"
	cont "para quedarte con"
	cont "este #MON!"
	cont "#MON!"
	para "¡Vuelve cuando"
	line "tengas esapcio en"
	cont "tu equipo!"
	done
	
PlayerGetsAnOmanyte:
	text "¡<PLAY_G> recibió"
	line "a OMANYTE!"
	done
	
PlayerGetsAnAerodactyl:
	text "¡<PLAY_G> recibió"
	line "a AERODACTYL!"
	done
	
PlayerGetsAKabuto:
	text "¡<PLAY_G> recibió"
	line "a KABUTO!"
	done
	
TimeToGetAFossilmonText:
	text "Muy bien, déjame"
	line "ver ese fósil y"
	para "y traeremos de"
	line "vuelta a la vida"
	cont "en un segundo."
	done
	
YouHaveHelixFossilText:
	text "Oh, ¿y eso?"
	para "¡Tienes un FÓSIL"
	line "HELIX!"
	para "¿Quieres que lo"
	line "convierta en"
	cont "un #MON?"
	done
	
YouHaveDomeFossilText:
	text "Oh, ¿y eso?"
	para "¡Tienes un FÓSIL"
	line "DOMO!"
	para "¿Quieres que lo"
	line "convierta en"
	cont "un #MON?"
	done
	
YouHaveOldAmberText:
	text "Oh, ¿y eso?"
	para "¡Tienes un ÁMBAR"
	line "VIEJO!"
	para "¿Quieres que lo"
	line "convierta en"
	cont "un #MON?"
	done
	
AnotherTimeFossilText:
	text "Oh, ¿de verdad?"
	para "Bueno, si cambias"
	line "de opinión"
	cont "dímelo."
	done
	
FossilScientistIntroText:
	text "¡Buenas! ¡Soy"
	line "un científico"
	para "especializado en"
	line "fósiles #MON!"
	para "Si tienes algún"
	line "fósil, dímelo."
	para "¡Puedo traerlo"
	line "de vuelta a"
	cont "la vida!"
	done

KantoFossilLab_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  2, 15, KANTO_REGION, 29
	warp_event  3, 15, KANTO_REGION, 29
	warp_event 14, 10, KANTO_FOSSIL_LAB, 4
	warp_event  2,  7, KANTO_FOSSIL_LAB, 3
	warp_event  3,  7, KANTO_FOSSIL_LAB, 3
	warp_event 10, 10, KANTO_FOSSIL_LAB, 7
	warp_event 14,  5, KANTO_FOSSIL_LAB, 6
	warp_event 15,  5, KANTO_FOSSIL_LAB, 6

	db 0 ; coord events

	db 8 ; bg events
	bg_event 15,  1, BGEVENT_READ, KantoFossilLabBookshelf
	bg_event 14,  1, BGEVENT_READ, KantoFossilLabBookshelf
	bg_event 13,  1, BGEVENT_READ, KantoFossilLabBookshelf
	bg_event 12,  1, BGEVENT_READ, KantoFossilLabBookshelf
	bg_event  7, 13, BGEVENT_READ, KantoFossilLabBookshelf
	bg_event  6, 13, BGEVENT_READ, KantoFossilLabBookshelf
	bg_event  5, 13, BGEVENT_READ, KantoFossilLabBookshelf
	bg_event  4, 13, BGEVENT_READ, KantoFossilLabBookshelf

	db 3 ; object events
	object_event  2,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoFossilLabFossilScientist, -1
	object_event 13,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoFossilLabScientist1Script, -1
	object_event 16, 14, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoFossilLabGentlemanScript, -1
