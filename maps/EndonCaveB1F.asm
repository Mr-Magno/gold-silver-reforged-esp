	const_def 2 ; object constants
	const ENDONCAVEB1F_SAILOR
	const ENDONCAVEB1F_GENTLEMAN
	const ENDONCAVEB1F_YOUNGSTER
	const ENDONCAVEB1F_POKE_BALL
	const ENDONCAVEB1F_POKE_BALL_2

EndonCaveB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	

EndonCaveB1FElixer:
	itemball ELIXER


TrainerBirdKeeperTheo:
	trainer BIRD_KEEPER, THEO, EVENT_BEAT_BIRD_KEEPER_THEO, BirdKeeperTheoSeenText, BirdKeeperTheoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperTheoAfterBattleText
	waitbutton
	closetext
	end



TrainerSailorTerrell:
	trainer SAILOR, TERRELL, EVENT_BEAT_SAILOR_TERRELL, SailorTerrellSeenText, SailorTerrellBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorTerrellAfterBattleText
	waitbutton
	closetext
	end
	
TrainerCooltrainermNick:
	trainer COOLTRAINERM, NICK, EVENT_BEAT_COOLTRAINERM_NICK, CooltrainermNickSeenText, CooltrainermNickBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermNickAfterBattleText
	waitbutton
	closetext
	end
	

EndonCaveB1FSmokeBall:
	itemball SMOKE_BALL

BirdKeeperTheoSeenText:
	text "¡Mis preciosos"
	line "pájaros no pueden"
	cont "VOLAR aquí!"
	done

BirdKeeperTheoBeatenText:
	text "¿Sabes cómo se"
	line "sale de aquí?"
	done

BirdKeeperTheoAfterBattleText:
	text "¿Cómo rayos se"
	line "sale?"
	
	para "¡Quiero VOLAR!"
	line "¡VOLAR muy lejos!"
	done

SailorTerrellSeenText:
	text "Los marineros"
	line "somos fuertes y"
	cont "simpáticos. ¿Y tú?"
	done

SailorTerrellBeatenText:
	text "Eres fuerte y"
	line "amable…"
	done

SailorTerrellAfterBattleText:
	text "He oído que han"
	line "abierto una nueva"
	para "PASARELA al sur de"
	line "PUEBLO SÁNSCRITO."
	done
	
CooltrainermNickSeenText:
	text "¿Tus #MON"
	line "tienen la habili-"
	cont "dad de llevarte"
	cont "por el agua?"

	para "¡En BIRDON hay un"
	line "anciano que se lo"
	cont "enseñó al mío!"
	done

CooltrainermNickBeatenText:
	text "¿Lo conoces?"
	done

CooltrainermNickAfterBattleText:
	text "No mucha gente"
	line "viene aquí a"
	cont "combatir."
	done


EndonCaveB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3, 15, ENDON_CAVE_1F, 3
	warp_event 51, 11, ENDON_CAVE_1F, 4

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event 34, 13, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSailorTerrell, -1
	object_event 48, 13, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainermNick, -1
	object_event  8,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBirdKeeperTheo, -1
	object_event 21,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, EndonCaveB1FSmokeBall, EVENT_ENDON_CAVE_B1F_SMOKE_BALL
	object_event  2,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, EndonCaveB1FElixer, EVENT_ENDON_CAVE_B1F_ELIXER
