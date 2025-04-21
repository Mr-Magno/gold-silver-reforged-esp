	const_def 2 ; object constants
	const ECRUTEAKPOKECENTER1F_NURSE
	const ECRUTEAKPOKECENTER1F_POKEFAN_M
	const ECRUTEAKPOKECENTER1F_COOLTRAINER_F
	const ECRUTEAKPOKECENTER1F_GYM_GUY
	const ECRUTEAKPOKECENTER1F_BILL

TeknosPokecenter1F_MapScripts:
	db 2 ; scene scripts
	scene_script .MeetBill ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.MeetBill:
	priorityjump .BillActivatesTimeCapsule
	end

.DummyScene:
	end

.BillActivatesTimeCapsule:
	pause 30
	appear ECRUTEAKPOKECENTER1F_BILL
	applymovement ECRUTEAKPOKECENTER1F_BILL, TeknosPokecenter1FBillMovement1
	opentext
	writetext TeknosPokecenter1F_BillText1
	waitbutton
	closetext
	applymovement ECRUTEAKPOKECENTER1F_BILL, TeknosPokecenter1FBillMovement2
	playsound SFX_EXIT_BUILDING
	disappear ECRUTEAKPOKECENTER1F_BILL
	setflag ENGINE_TIME_CAPSULE
	clearevent EVENT_TEKNOS_GRAMPA_LOOKING_FOR_LITTLE_GIRL
	clearevent EVENT_LITTLE_GIRL_IN_BOULDER_MINES
	clearevent EVENT_WHITNEY_IN_BOULDER_MINES
	setscene SCENE_FINISHED
	waitsfx
	end

TeknosPokecenter1FNurseScript:
	jumpstd pokecenternurse

TeknosPokecenter1FPokefanMScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer TeknosPokecenter1FPokefanMText

.mobile
	jumptextfaceplayer TeknosPokecenter1FPokefanMTextMobile

TeknosPokecenter1FCooltrainerFScript:
	jumptextfaceplayer TeknosPokecenter1FCooltrainerFText

TeknosPokecenter1FGymGuyScript:
	jumptextfaceplayer TeknosPokecenter1FGymGuyText

TeknosPokecenter1FBillMovement1:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step UP
	step RIGHT
	step LEFT
	step UP
	step RIGHT
	step DOWN
	step LEFT
	step DOWN
	step_end

TeknosPokecenter1FBillMovement2:
	step RIGHT
	step DOWN
	step_end

TeknosPokecenter1FPlayerMovement1:
	step UP
	step UP
	step UP
	step_end

TeknosPokecenter1F_BillText1:
	text "¡Ay, mi madre!"
	
	para "¡Aquí tampoco"
	line "está!"
	
	para "¡Ay, mi madre!"
	
	para "Perdona, chico."
	line "¿No habrás visto"
	cont "por aquí a una"
	cont "niña pequeña, no?"
	
	para "Es mi nieta."
	
	para "¡No la encuentro"
	line "por ninguna parte!"

	para "Oh, no. Espero que"
	line "no haya ido a la"
	cont "MINA…"
	
	para "¿Podrías ir a"
	line "comprobar si mi"
	cont "nieta se ha"
	cont "quedado atrapada"
	cont "allí?"

	para "Hay una MINA"
	line "justo al salir"
	cont "de la ciudad."
	
	para "Espero que no"
	line "haya ido ahí…"

	para "¡Ay, mi madre!"
	done

TeknosPokecenter1FPokefanMText:
	text "Tus #MON serán"
	line "más amigables"
	para "contigo si los"
	line "tratas bien."
	done

TeknosPokecenter1FPokefanMTextMobile:
	text "Supongo que"
	line "quieres combatir"
	cont "contra más gente,"
	cont "¿verdad?"
	
	para "Pues hay un lugar"
	line "donde suelen"
	cont "reunirse los"
	cont "entrenadores."

	para "¿Que dónde, dices?"

	para "Está un poco más"
	line "allá de CIUDAD"
	cont "OLIVO."
	done

TeknosPokecenter1FCooltrainerFText:
	text "Tus #MON"
	line "conocen movimien-"
	cont "tos de MO, ¿no?"
	
	para "Pueden usarse"
	line "fuera de combate"
	para "incluso si el"
	line "#MON está"
	cont "debilitado."
	done

TeknosPokecenter1FGymGuyText:
	text "¿Has estado alguna"
	line "vez en el MUELLE"
	cont "CALORINA?"
	
	para "Olvídate de"
	line "cualquier otro"
	para "MUELLE en NIHON,"
	line "ahí es donde más"
	cont "se comercia."
	done

TeknosPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, TEKNOS_CITY, 3
	warp_event  6,  7, TEKNOS_CITY, 3
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosPokecenter1FNurseScript, -1
	object_event 12,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosPokecenter1FPokefanMScript, -1
	object_event  1,  4, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TeknosPokecenter1FCooltrainerFScript, -1
	object_event 10,  1, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeknosPokecenter1FGymGuyScript, -1
	object_event 11,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_POKE_CENTER_BILL
