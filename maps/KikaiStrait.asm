	const_def 2
	const KIKAISTRAIT_SWIMMER1
	const KIKAISTRAIT_SWIMMER2

KikaiStrait_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSwimmerfDenise:
	trainer SWIMMERF, DENISE, EVENT_BEAT_SWIMMERF_DENISE, SwimmerfDeniseSeenText, SwimmerfDeniseBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDeniseAfterBattleText
	waitbutton
	closetext
	end


TrainerSwimmerfWendy:
	trainer SWIMMERF, WENDY, EVENT_BEAT_SWIMMERF_WENDY, SwimmerfWendySeenText, SwimmerfWendyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfWendyAfterBattleText
	waitbutton
	closetext
	end

SwimmerfDeniseSeenText:
	text "¡No me puedo creer"
	line "el buen día que"
	cont "hace!"
	done

SwimmerfDeniseBeatenText:
	text "¡Oooh!"
	done

SwimmerfDeniseAfterBattleText:
	text "Quemarse al sol es"
	line "muy malo para la"
	cont "piel."
	done


SwimmerfWendySeenText:
	text "Por la noche, los"
	line "STARYU se reúnen"
	para "cerca de la"
	line "superficie."
	done

SwimmerfWendyBeatenText:
	text "¡Oh, vaya…!"
	done

SwimmerfWendyAfterBattleText:
	text "Los grupos de"
	line "STARYU se iluminan"
	cont "al mismo tiempo."

	para "Es muy bonito,"
	line "pero da miedo."
	done


KikaiStrait_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  8,  9, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfDenise, -1
	object_event 11, 14, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfWendy, -1
