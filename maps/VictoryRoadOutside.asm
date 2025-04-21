	const_def 2 ; object constants
	const VictoryRoadOutside_POKEFAN_M
	const VictoryRoadOutside_SPORTSMAN
	const VictoryRoadOutside_LASS

VictoryRoadOutside_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerHikerBenjamin:
	trainer HIKER, BENJAMIN, EVENT_BEAT_HIKER_BENJAMIN, HikerBenjaminSeenText, HikerBenjaminBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerBenjaminAfterBattleText
	waitbutton
	closetext
	end
	
TrainerSportsmanArthur:
	trainer SPORTSMAN, ARTHUR, EVENT_BEAT_SPORTSMAN_ARTHUR, SportsmanArthurSeenText, SportsmanArthurBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SportsmanArthurAfterBattleText
	waitbutton
	closetext
	end

HealerLassScript:
	faceplayer
	opentext
	checkevent EVENT_SWITCH_9
	iftrue .LassHealSequence
	writetext LassIntroText
	setevent EVENT_SWITCH_9
	waitbutton
	jump .LassHealSequence
	end

.LassHealSequence
	writetext LassAsksToHeal
	yesorno
	iftrue .LassHealTime
	writetext NoHealThisTime
	waitbutton
	closetext
	end
	
.LassHealTime
	writetext LassHealTimeText
	waitbutton
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	pause 60
	special HealParty
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext LassHealTimeText2
	waitbutton
	closetext
	end
	
LassIntroText:
	text "Estamos bastane"
	line "altos en la"
	cont "montañana ya."
	para "¿Qué? Sí, soy"
	line "entrenadora, pero"
	cont "estoy descansando."
	para "Me he traido un"
	line "montón de medi-"
	cont "cinas."
	para "Si tus #MON"
	line "necesitan curarse,"
	para "dímelo y te"
	line "ayudaré."
	done
	
LassAsksToHeal:
	text "¿Quieres que"
	line "cure a tus"
	cont "#MON?"
	done
	
NoHealThisTime:
	text "De acuerdo."
	para "Estaré por aquí"
	line "si me necesitas."
	done
	
LassHealTimeText:
	text "De acuerdo,"
	line "déjame ver a"
	cont "tus #MON…"
	done
	
LassHealTimeText2:
	text "¡Listo!"
	para "¡Tu equipo vuelve"
	line "a estar a tope!"
	done

SportsmanArthurSeenText:
	text "Creo que puedo"
	line "correr hasta"
	cont "llegar a la cima."
	done

SportsmanArthurBeatenText:
	text "¡Sin aliento!"
	done

SportsmanArthurAfterBattleText:
	text "No soy un MONTA-"
	line "ÑERO, la verdad."
	done

HikerBenjaminSeenText:
	text "Ah, ¡qué bien"
	line "estar fuera!"
	cont "¡Me siento libre!"
	done

HikerBenjaminBeatenText:
	text "¡Jajajaja!"
	done

HikerBenjaminAfterBattleText:
	text "Lleva un rato"
	line "alcanzar la cima."
	para "¡Salir te"
	line "purifica!"
	done

VictoryRoadOutside_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 11, 15, VICTORY_ROAD, 2
	warp_event  5, 13, VICTORY_ROAD, 3
	warp_event 15, 11, VICTORY_ROAD, 4
	warp_event 11,  9, VICTORY_ROAD, 5
	warp_event  1,  7, VICTORY_ROAD, 6
	warp_event 17,  5, VICTORY_ROAD_2F, 1
	warp_event 11,  3, VICTORY_ROAD_2F, 2
	warp_event  7,  1, VICTORY_ROAD_2F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3, 14, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerBenjamin, -1
	object_event  3,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSportsmanArthur, -1
	object_event  7,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, HealerLassScript, -1
