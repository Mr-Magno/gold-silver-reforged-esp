	const_def 2
	const PLANT_SURGE
	const PP_VOLTORB1
	const PP_VOLTORB2
	const PP_VOLTORB3
	const PP_VOLTORB4
	const PP_VOLTORB5
	const PP_VOLTORB6
	const PP_VOLTORB7
	const PP_VOLTORB8
	const PP_ITEM1
	const PP_ITEM2
	const PP_ITEM3
	const PP_ITEM4

KantoPowerPlant_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SurgeScript:
	faceplayer
	checkevent EVENT_WON_SURGE_BATTLE
	iftrue Surge_afterbattle
	opentext
	writetext Surge_beforebattletext
	waitbutton
	closetext
	winlosstext Surge_beatentext, 0
	loadtrainer LT_SURGE, LT_SURGE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_WON_SURGE_BATTLE
	;fallthrough

Surge_afterbattle:
	checkevent EVENT_TOOK_THE_PICHU
	iftrue Surge_afterpichu
	opentext
	writetext SurgeTakeThisPichuText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullSurge
	writetext SurgePlayerReceivedPichuText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke PICHU, 15
	special GivePichu
	setevent EVENT_TOOK_THE_PICHU
	writetext SurgeExplainPichuMetronomeText
	waitbutton
	closetext
	end

.PartyFullSurge:
	writetext SurgePartyFullText
	waitbutton
	closetext
	end

Surge_afterpichu:
	opentext
	writetext SurgeFinalText
	waitbutton
	closetext
	end

Surge_beforebattletext:
	text "SURGE: ¡Oye,"
	line "chaval!"

	para "¿Qué lleva a un"
	line "crío como tú"
	cont "venir a este"
	cont "vertedero aban-"
	cont "donado?"

	para "¡Aquí es donde"
	line "vengo a entrenar"
	cont "a mis poderosos"
	cont "#MON del"
	cont "tipo ELÉCTRICO!"

	para "Si has venido"
	line "buscando un"
	cont "desafío, ¡vaya"
	cont "si lo has"
	cont "encontrado!"

	para "¡Te paralizaré"
	line "igual que hice"
	cont "con mis enemigos"
	cont "en la guerra!"
	done

Surge_beatentext:
	text "SURGE: ¡Arrrgh!"
	line "¡Eres fuerte!"

	para "¡No eres un cha"
	line "val cualquiera!"
	done

SurgeTakeThisPichuText:
	text "¡Bueno, bueno!"

	para "¡No hay nada que"
	line "encontrar en"
	cont "este viejo lugar"
	cont "aparte de los"
	cont "VOLTORB!"

	para "…"

	para "¿Vienes a por"
	line "un desafío de"
	cont "GIMNASIO?"

	para "¡Já! Lo siento,"
	line "chaval, ¡pero"
	cont "fuera de servicio"
	cont "desde que la"
	cont "LIGA se expandió"
	cont "a toda la nación!"

	para "Puede que ya no"
	line "tenga una MED."
	cont "TRUENO que darte,"
	cont "¡pero serías un"
	cont "buen entrenador"
	cont "para este PICHU"
	cont "que eclosioné!"

	para "¡No se me dan"
	line "bien los niños!"
	cont "¡Cuídalo bien!"
	done

SurgeExplainPichuMetronomeText:
	text "¡Ese PICHU conoce"
	line "un movimiento"
	cont "especial!"
	done


SurgePlayerReceivedPichuText:
	text "¡<PLAYER> recibió"
	line "un PICHU!"
	done

SurgePartyFullText:
	text "¡Deberás hacer"
	line "sitio en tu"
	cont "equipo primero!"
	done

SurgeFinalText:
	text "¡Buena suerte en"
	line "el GIMNASIO AÑIL!"

	para "¡La vas a"
	line "necesitar!"
	done

;----------------------------------------------------------------------------------------

Voltorb1:
	faceplayer
	opentext
	writetext VoltorbText
	cry VOLTORB
	pause 15
	closetext
	setevent EVENT_PP_VOLTORB1
	loadwildmon VOLTORB, 40
	startbattle
	disappear PP_VOLTORB1
	reloadmapafterbattle
	end

Voltorb2:
	faceplayer
	opentext
	writetext VoltorbText
	cry VOLTORB
	pause 15
	closetext
	setevent EVENT_PP_VOLTORB2
	loadwildmon VOLTORB, 40
	startbattle
	disappear PP_VOLTORB2
	reloadmapafterbattle
	end

Voltorb3:
	faceplayer
	opentext
	writetext VoltorbText
	cry VOLTORB
	pause 15
	closetext
	setevent EVENT_PP_VOLTORB3
	loadwildmon VOLTORB, 40
	startbattle
	disappear PP_VOLTORB3
	reloadmapafterbattle
	end

Voltorb4:
	faceplayer
	opentext
	writetext VoltorbText
	cry ELECTRODE
	pause 15
	closetext
	setevent EVENT_PP_VOLTORB4
	loadwildmon ELECTRODE, 43
	startbattle
	disappear PP_VOLTORB4
	reloadmapafterbattle
	end

Voltorb5:
	faceplayer
	opentext
	writetext VoltorbText
	cry VOLTORB
	pause 15
	closetext
	setevent EVENT_PP_VOLTORB5
	loadwildmon VOLTORB, 40
	startbattle
	disappear PP_VOLTORB5
	reloadmapafterbattle
	end

Voltorb6:
	faceplayer
	opentext
	writetext VoltorbText
	cry VOLTORB
	pause 15
	closetext
	setevent EVENT_PP_VOLTORB6
	loadwildmon VOLTORB, 40
	startbattle
	disappear PP_VOLTORB6
	reloadmapafterbattle
	end

Voltorb7:
	faceplayer
	opentext
	writetext VoltorbText
	cry ELECTRODE
	pause 15
	closetext
	setevent EVENT_PP_VOLTORB7
	loadwildmon ELECTRODE, 43
	startbattle
	disappear PP_VOLTORB7
	reloadmapafterbattle
	end

Voltorb8:
	faceplayer
	opentext
	writetext VoltorbText
	cry VOLTORB
	pause 15
	closetext
	setevent EVENT_PP_VOLTORB8
	loadwildmon VOLTORB, 40
	startbattle
	disappear PP_VOLTORB8
	reloadmapafterbattle
	end

VoltorbText:
	text "Bzzzt!"
	done

PPItem1:
	itemball CARBOS

PPItem2:
	itemball HP_UP

PPItem3:
	itemball RARE_CANDY

PPItem4:
	itemball TM_THUNDERPUNCH


KantoPowerPlant_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  4, 35, KANTO_REGION, 36
	warp_event  0, 10, KANTO_REGION, 36
	warp_event  5, 35, KANTO_REGION, 36

	db 0 ; coord events

	db 0 ; bg events

	db 13 ; object events
	object_event  4,  8, SPRITE_SURGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SurgeScript, -1
	object_event  9, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Voltorb1, -1
	object_event 34, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Voltorb2, -1
	object_event 17, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Voltorb3, -1
	object_event 32,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Voltorb4, -1
	object_event 18, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Voltorb5, -1
	object_event 25, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Voltorb6, -1
	object_event 21, 19, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Voltorb7, -1
	object_event 36, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Voltorb8, -1
	object_event  7, 27, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PPItem1, EVENT_PP_ITEM1
	object_event 27, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PPItem2, EVENT_PP_ITEM2
	object_event 34,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PPItem3, EVENT_PP_ITEM3
	object_event 26,  32, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PPItem4, EVENT_PP_ITEM4
	