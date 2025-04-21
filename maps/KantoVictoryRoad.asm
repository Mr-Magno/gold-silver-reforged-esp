	const_def 2 ; object constants
	const KANTOVICTORYROAD_POKE_BALL1
	const KANTOVICTORYROAD_POKE_BALL2
	const KANTOVICTORYROAD_POKE_BALL3
	const KANTOVICTORYROAD_POKE_BALL4
	const KANTOVICTORYROAD_POKE_BALL5
	const KANTOVICTORYROAD_COOLTRM1
	const KANTOVICTORYROAD_COOLTRM2
	const KANTOVICTORYROAD_COOLTRM3
	const KANTOVICTORYROAD_COOLTRF1
	const KANTOVICTORYROAD_COOLTRF2
	const KANTOVICTORYROAD_COOLTRF3

KantoVictoryRoad_MapScripts:
	db 0 ; scene scripts
	db 0 ; callbacks


KantoVictoryRoadTMEarthquake:
	itemball PROTEIN

KantoVictoryRoadMaxRevive:
	itemball REVIVE

KantoVictoryRoadFullRestore:
	itemball HYPER_POTION

KantoVictoryRoadFullHeal:
	itemball FULL_HEAL

KantoVictoryRoadHPUp:
	itemball HP_UP

KantoVictoryRoadHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_KANTO_VICTORY_ROAD_HIDDEN_MAX_POTION

KantoVictoryRoadHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_KANTO_VICTORY_ROAD_HIDDEN_FULL_HEAL


;----------------------------------------------------------

TrainerKVR1:
	trainer COOLTRAINERM, GAVEN, EVENT_BEAT_KANTO_VICTORY_ROAD_TRAINER1, CTGavenSeenText, CTGavenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CTGavenAfterBattleText
	waitbutton
	closetext
	end

TrainerKVR2:
	trainer COOLTRAINERM, EVERITT, EVENT_BEAT_KANTO_VICTORY_ROAD_TRAINER2, CTEverittSeenText, CTEverittBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CTEverittAfterBattleText
	waitbutton
	closetext
	end

TrainerKVR3:
	trainer COOLTRAINERM, CHESTER, EVENT_BEAT_KANTO_VICTORY_ROAD_TRAINER3, CTChesterSeenText, CTChesterBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CTChesterAfterBattleText
	waitbutton
	closetext
	end

TrainerKVR4:
	trainer COOLTRAINERF, BETH, EVENT_BEAT_KANTO_VICTORY_ROAD_TRAINER4, CTBethSeenText, CTBethBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CTBethAfterBattleText
	waitbutton
	closetext
	end

TrainerKVR5:
	trainer COOLTRAINERF, KENZIE, EVENT_BEAT_KANTO_VICTORY_ROAD_TRAINER5, CTKenzieSeenText, CTKenzieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CTKenzieAfterBattleText
	waitbutton
	closetext
	end

TrainerKVR6:
	trainer COOLTRAINERF, ALLY, EVENT_BEAT_KANTO_VICTORY_ROAD_TRAINER6, CTAllySeenText, CTAllyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CTAllyAfterBattleText
	waitbutton
	closetext
	end

;----------------------------------------------------------

CTGavenSeenText:
	text "¡Si apuntas a la"
	line "cima, ¡entonces"
	cont "tendrás que"
	cont "pasar por mí"
	cont "primero!"
	done

CTGavenBeatenText:
	text "¡Increíble!"
	done

CTGavenAfterBattleText:
	text "Aunque esta cueva"
	line "ya no esté dise-"
	cont "ñada como la"
	cont "verdadera CALLE"
	cont "VICTORIA, ¡aún"
	cont "tendrás que cru-"
	cont "zarla si quieres"
	cont "llegar a la"
	cont "LIGA #MON"
	done

CTEverittSeenText:
	text "¡Yiiaaa!"

	para "¡He entrenado"
	line "en esta cueva"
	cont "durante un año!"

	para "¡Serás mi últi-"
	line "mo rival antes"
	cont "de darlo todo"
	cont "en la MESETA"
	cont "AÑIL!"
	done

CTEverittBeatenText:
	text "¿Eh? ¿Qué"
	line "has dicho?"
	done

CTEverittAfterBattleText:
	text "¿Me estás dicien-"
	line "do que la LIGA"
	cont "#MON se"
	cont "ha mudado de"
	cont "sitio?"

	para "¿¡Y que ahora"
	line "tengo que conse-"
	cont "guir otras 8"
	cont "nuevas MEDALLAS!?"

	para "¡Ja! ¡Jajajajaja!"
	done


CTChesterSeenText:
	text "¡Mmm! Si un niño"
	line "de los confines"
	cont "de PUEBLO PALETA"
	cont "pudo llegar a ser"
	cont "CAMPEÓN de la LI-"
	cont "GA y un LÍDER de"
	cont "GIMNASIO, enton-"
	cont "ces alguien tan"
	cont "sofisticado como"
	cont "no debería tener"
	cont "ningún problema."
	done

CTChesterBeatenText:
	text "¿P-perdón?"
	done

CTChesterAfterBattleText:
	text "¿Oh? ¿Y tú de"
	line "dónde vienes?"

	para "…"

	para "¿PUEBLO SILENTE?"
	line "¡Jamás había oído"
	cont "hablar de él!"
	done

CTBethSeenText:
	text "MESETA AÑIL…"

	para "Este lugar solía"
	line "ser la cima del"
	cont "logro para todos"
	cont "entrenadores"
	cont "#MON…"

	para "¡Demuéstrame que"
	line "mereces estar"
	cont "aquí!"
	done

CTBethBeatenText:
	text "Entendido…"
	done

CTBethAfterBattleText:
	text "Este solía ser"
	line "el lugar de la"
	cont "LIGA #MON,"
	cont "sin discusión."

	para "Ahora es solo un"
	line "punto de paso"
	cont "en un viaje más"
	cont "grande desde que"
	cont "la expandieron"
	cont "a nivel nacional."
	done

CTKenzieSeenText:
	text "¿ROJO? La verdad,"
	line "¡yo soy más fan"
	cont "de AZUL!"
	done

CTKenzieBeatenText:
	text "¡Nos vemos luego!"
	done

CTKenzieAfterBattleText:
	text "¡Vamos, por favor!"
	line "¡ROJO no tiene ni"
	cont "la mitad de caris-"
	cont "ma que tenía AZUL"
	cont "como CAMPEÓN!"

	para "¡Ni siquiera"
	line "decía nada!"
	cont "¿Qué le pasa?"
	done

CTAllySeenText:
	text "¡Tengo 7"
	line "MEDALLAS de NIHON"
	cont "hasta ahora! ¡Y"
	cont "tú pareces un"
	cont "rival duro para"
	cont "ponerme a prueba!"
	done

CTAllyBeatenText:
	text "¿Tú también"
	done

CTAllyAfterBattleText:
	text "¡Pues claro que"
	line "tienes 7"
	cont "MEDALLAS, si no"
	cont "¿por qué estarías"
	cont "por estas cuevas?"
	done

KantoVictoryRoad_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event  8, 67, KANTO_REGION, 30 ; entrance
	warp_event  1, 49, KANTO_VICTORY_ROAD, 3
	warp_event  1, 35, KANTO_VICTORY_ROAD, 2
	warp_event 13, 31, KANTO_VICTORY_ROAD, 5
	warp_event 13, 17, KANTO_VICTORY_ROAD, 4
	warp_event 17, 33, KANTO_VICTORY_ROAD, 7
	warp_event 17, 19, KANTO_VICTORY_ROAD, 6
	warp_event  0, 11, KANTO_VICTORY_ROAD, 9
	warp_event  0, 27, KANTO_VICTORY_ROAD, 8
	warp_event 13,  5, KANTO_REGION, 33 ; exit

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 29, BGEVENT_ITEM, KantoVictoryRoadHiddenMaxPotion
	bg_event  3, 65, BGEVENT_ITEM, KantoVictoryRoadHiddenFullHeal

	db 11 ; object events
	object_event  3, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KantoVictoryRoadTMEarthquake, EVENT_KANTO_VICTORY_ROAD_TM_EARTHQUAKE
	object_event 12, 48, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KantoVictoryRoadMaxRevive, EVENT_KANTO_VICTORY_ROAD_MAX_REVIVE
	object_event 18, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KantoVictoryRoadFullRestore, EVENT_KANTO_VICTORY_ROAD_FULL_RESTORE
	object_event 15, 48, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KantoVictoryRoadFullHeal, EVENT_KANTO_VICTORY_ROAD_FULL_HEAL
	object_event  7, 38, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KantoVictoryRoadHPUp, EVENT_KANTO_VICTORY_ROAD_HP_UP
	object_event  5, 65, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerKVR1, -1
	object_event 14,  9, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerKVR2, -1
	object_event 10, 35, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerKVR3, -1
	object_event  4, 50, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerKVR4, -1
	object_event 12, 28, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerKVR5, -1
	object_event  1, 19, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerKVR6, -1
