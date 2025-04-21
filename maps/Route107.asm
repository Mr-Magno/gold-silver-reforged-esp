	const_def 2 ; object constants
	const ROUTE21_SWIMMER_GIRL
	const ROUTE21_SWIMMER_GUY
	const ROUTE21_FISHER
	const ROUTE21_FISHER2
	const ROUTE21_SWIMMER_GUY2
	const ROUTE21_SWIMMER_GIRL2

Route107_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSwimmermSeth:
	trainer SWIMMERM, SETH, EVENT_BEAT_SWIMMERM_SETH, SwimmermSethSeenText, SwimmermSethBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermSethAfterBattleText
	waitbutton
	closetext
	end
	
TrainerSwimmermBerke:
	trainer SWIMMERM, BERKE, EVENT_BEAT_SWIMMERM_BERKE, SwimmermBerkeSeenText, SwimmermBerkeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermBerkeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfNikki:
	trainer SWIMMERF, NIKKI, EVENT_BEAT_SWIMMERF_NIKKI, SwimmerfNikkiSeenText, SwimmerfNikkiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfNikkiAfterBattleText
	waitbutton
	closetext
	end
	
TrainerFisherHenry:
	trainer FISHER, HENRY, EVENT_BEAT_FISHER_HENRY, FisherHenrySeenText, FisherHenryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherHenryAfterText
	waitbutton
	closetext
	end
	
TrainerSwimmerfSusie:
	trainer SWIMMERF, SUSIE, EVENT_BEAT_SWIMMERF_SUSIE, SwimmerfSusieSeenText, SwimmerfSusieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfSusieAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherArnold:
	trainer FISHER, ARNOLD, EVENT_BEAT_FISHER_ARNOLD, FisherArnoldSeenText, FisherArnoldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherArnoldAfterBattleText
	waitbutton
	closetext
	end

SwimmermSethSeenText:
	text "Tierra a la vista."
	line "¡Sigamos adelante!"
	done

SwimmermSethBeatenText:
	text "¡Glup…!"
	done

SwimmermSethAfterBattleText:
	text "Un día me gustaría"
	line "entrenar con la"
	para "maestra dragón de"
	line "ISLA KOBAN."
	done

SwimmerfNikkiSeenText:
	text "¡Si gano, tienes"
	line "que ayudarme con"
	cont "la loción solar!"
	done

SwimmerfNikkiBeatenText:
	text "No quiero"
	line "quemarme…"
	done

SwimmerfNikkiAfterBattleText:
	text "Debería tener"
	line "cuidado con las"
	para "manchas causadas"
	line "por el sol."
	done

FisherArnoldSeenText:
	text "Estoy aburrido de"
	line "pescar. ¡Luchemos!"
	done

FisherArnoldBeatenText:
	text "Qué fracaso…"
	done

FisherArnoldAfterBattleText:
	text "Voy a volver a"
	line "pescar…"
	done
	
SwimmermBerkeSeenText:
	text "¿Y-yo?…"
	line "¿Fr-frío?"

	para "¡N-ni de broma!"
	done

SwimmermBerkeBeatenText:
	text "N-no…"
	line "¡N-no tengo frío!"
	done

SwimmermBerkeAfterBattleText:
	text "…"

	para "…"

	para "…"
	
	para "Va-vale, u-un"
	line "poco sí…"
	done
	
FisherHenrySeenText:
	text "¿Mis #MON?"
	line "¡Recién"
	cont "capturados!"
	done

FisherHenryBeatenText:
	text "¿Salpicadura?"
	done

FisherHenryAfterText:
	text "Los #MON"
	line "recién captura-"
	cont "dos no son ideales"
	cont "para combatir."
	done
	
SwimmerfSusieSeenText:
	text "Estás muy ele-"
	line "gante subido a"
	cont "tu #MON."
	done

SwimmerfSusieBeatenText:
	text "Me he chocado…"
	done

SwimmerfSusieAfterBattleText:
	text "¿No había una"
	line "canción de un"
	cont "chico y su LAPRAS?"
	done

Route107_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 49, ROUTE_107_ALLOY_GATE, 1
	warp_event  9, 49, ROUTE_107_ALLOY_GATE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event 10, 31, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfNikki, -1
	object_event  9, 40, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermSeth, -1
	object_event 12, 26, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherArnold, -1
	object_event  6,  9, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherHenry, -1
	object_event  5, 13, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermBerke, -1
	object_event 11,  5, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfSusie, -1
