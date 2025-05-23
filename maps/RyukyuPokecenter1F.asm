	const_def 2 ; object constants
	const SAFFRONPOKECENTER1F_NURSE
	const SAFFRONPOKECENTER1F_TEACHER
	const SAFFRONPOKECENTER1F_FISHER
	const SAFFRONPOKECENTER1F_YOUNGSTER

RyukyuPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RyukyuPokecenter1FNurseScript:
	jumpstd pokecenternurse

RyukyuPokecenter1FTeacherScript:
	jumptextfaceplayer RyukyuPokecenter1FTeacherText

RyukyuPokecenter1FFisherScript:
	faceplayer
	opentext
	checkevent EVENT_REPAIRED_SHIP_FUEL_LINE
	iftrue .SolvedKantoPowerCrisis
	writetext RyukyuPokecenter1FFisherText
	waitbutton
	closetext
	end

.SolvedKantoPowerCrisis:
	writetext RyukyuPokecenter1FFisherReturnedMachinePartText
	waitbutton
	closetext
	end

RyukyuPokecenter1FYoungsterScript:
	jumptextfaceplayer RyukyuPokecenter1FYoungsterText

RyukyuPokecenter1FTeacherText:
	text "¿Cómo son los"
	line "CENTROS #MON"
	cont "del continente?"

	para "Ya veo…"

	para "Así que no son"
	line "muy distintos a"
	cont "los de aquí."

	para "¡Entonces puedo"
	line "viajar sin"
	cont "preocupaciones!"
	done



RyukyuPokecenter1FFisherText:
	text "Yo vengo de"
	line "PUEBLO AMAMI."

	para "¿Pasa algo con el"
	line "S.S.AQUA?"
	done

RyukyuPokecenter1FFisherReturnedMachinePartText:
	text "Parece que los"
	line "viajes hacia"
	para "PUEBLO AMAMI se"
	line "han reanudado."
	done

RyukyuPokecenter1FYoungsterText:
	text "Esta ciudad es una"
	line "atracción turís-"
	cont "tica muy popular."
	done

RyukyuPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, RYUKYU_CITY, 2
	warp_event  6,  7, RYUKYU_CITY, 2
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RyukyuPokecenter1FNurseScript, -1
	object_event  9,  2, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RyukyuPokecenter1FTeacherScript, -1
	object_event 10,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RyukyuPokecenter1FFisherScript, -1
	object_event  3,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RyukyuPokecenter1FYoungsterScript, -1
