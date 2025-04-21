	const_def 2 ; object constants
	const BRASSTOWER1F_SAGE1
	const BRASSTOWER1F_SAGE2
	const BRASSTOWER1F_SAGE3
	const BRASSTOWER1F_POKE_BALL

BrassTower1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSageChow:
	trainer SAGE, CHOW, EVENT_BEAT_SAGE_CHOW, SageChowSeenText, SageChowBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageChowAfterBattleText
	waitbutton
	closetext
	end

BrassTower1FParlyzHeal:
	itemball PARLYZ_HEAL

BrassTower1FStatue:
	jumptext BrassTower1FStatueText

BrassTower1FSign:
	jumptext BrassTower1FSignText

SageChowSeenText:
	text "Montamos guardia"
	line "en esta torre."

	para "Expresamos nuestra"
	line "gratitud para"
	cont "honrar a todos"
	cont "los #MON."
	done

SageChowBeatenText:
	text "¡Gra-Gracias!"
	done

SageChowAfterBattleText:
	text "Todos los seres"
	line "vivos coexisten"
	cont "mediante la"
	cont "cooperación."

	para "Debemos estar"
	line "agradecidos."
	done

TrainerSageNico:
	trainer SAGE, NICO, EVENT_BEAT_SAGE_NICO, SageNicoSeenText, SageNicoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageNicoAfterBattleText
	waitbutton
	closetext
	end


SageNicoSeenText:
	text "La TORRE LATÓN"
	line "fue construida"
	cont "hace siglos."
	para "Es un honor"
	line "para nosotros"
	cont "mantener sagrado"
	cont "este lugar."
	done


SageNicoBeatenText:
	text "Parece que lo"
	line "entiendes."
	done

SageNicoAfterBattleText:
	text "Esperamos que la"
	line "torre siga en pie"
	para "tanto tiempo como"
	line "como ha permane-"
	cont "cido hasta ahora."
	done

TrainerSageTroy:
	trainer SAGE, TROY, EVENT_BEAT_SAGE_TROY, SageTroySeenText, SageTroyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageTroyAfterBattleText
	waitbutton
	closetext
	end


SageTroySeenText:
	text "¿Por qué constru-"
	line "yeron esta torre?"
	para "Nadie lo sabe."
	para "Pero hace tiempo"
	line "sirvió de nido"
	cont "para un ave"
	cont "legendaria."
	done

SageTroyBeatenText:
	text "Asegúrate de"
	line "honrar la torre."
	done

SageTroyAfterBattleText:
	text "Sé deliberado"
	line "con cada paso a"
	cont "medida que subes."
	done

BrassTower1FStatueText:
	text "Una estatua"
	line "#MON…"

	para "Parece muy"
	line "distinguida."
	done
	
BrassTower1FSignText:
	text "Esta es la"
	line "TORRE LATÓN."
	para "Un antiguo"
	line "monumento dedi-"
	para "cado a los"
	line "#MON que"
	para "enriquecieron a"
	line "las vidas de los"
	cont "humanos."
	para "Lee atentamente"
	line "la información"
	para "de cada estatua"
	line "para comprender"
	cont "lo que significa."
	done

BrassTower1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5, 11, PAGOTA_CITY, 7
	warp_event  6, 11, PAGOTA_CITY, 11
	warp_event  0,  1, BRASS_TOWER_2F, 1


	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  1, BGEVENT_READ, BrassTower1FSign
	

	db 4 ; object events
	object_event  0,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageChow, EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	object_event  2, 11, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSageNico, EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	object_event 10,  6, SPRITE_SAGE, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSageTroy, EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	object_event  0,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BrassTower1FParlyzHeal, EVENT_BRASS_TOWER_1F_PARLYZ_HEAL
