	const_def 2 ; object constants
	const AMAMIFISHINGSPEECHHOUSE_FISHING_GURU

AmamiFishingSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FishingDude:
	jumptextfaceplayer FishingDudeText

FishingDudesHousePhoto:
	jumptext FishingDudesHousePhotoText

FishingDudeText:
	text "Soy el GURÚ PESCA-"
	line "DOR, el mayor de"
	para "los HERMANOS"
	line "PESCADORES."

	para "¿Conoces al GURÚ"
	line "PESCADOR del"
	cont "LAGO de la FURIA?"

	para "Sueña con ver al"
	line "MAGIKARP más"
	cont "grande del mundo."

	para "¿Podrías, por"
	line "favor, enseñarle"

	para "cualquier MAGIKARP"
	line "que captures?"

	para "Quién sabe, puede"
	line "que captures al"
	cont "MAGIKARP de sus"
	cont "sueños."
	done

FishingDudesHousePhotoText:
	text "Es una foto de"
	line "gente pescando…"

	para "Lo están pasando"
	line "muy bien…"
	done

AmamiFishingSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, AMAMI_TOWN, 8
	warp_event  5,  7, AMAMI_TOWN, 8

	db 0 ; coord events

	db 1 ; bg events
	bg_event  3,  0, BGEVENT_READ, FishingDudesHousePhoto

	db 1 ; object events
	object_event  2,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FishingDude, -1
