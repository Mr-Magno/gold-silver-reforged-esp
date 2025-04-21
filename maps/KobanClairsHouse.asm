	const_def 2 ; object constants
	const KOBANCLAIRHOUSE_1_CLAIR

KobanClairsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

KobanClairsHouseClairScript:
	faceplayer
	checkevent EVENT_GOT_DRATINI
	iftrue .AfterDratiniGift
	checkitem DRAGON_ORB
	iffalse .NoOrbYet
	opentext
	writetext ClairTakeThisDratiniText
	waitbutton
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullClair
	writetext ClairPlayerReceivedDratiniText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke DRATINI, 15
	special GiveDratini
	setevent EVENT_GOT_DRATINI
	takeitem DRAGON_ORB
	writetext ClairSymbolicDragonText
	waitbutton
	closetext
	end

.AfterDratiniGift
	checkevent EVENT_BATTLE_AVAILABLE_CLAIR
	iftrue rematchscriptClair
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue postrematchscriptClair
	opentext
	writetext DragonsAreGreatText
	waitbutton
	closetext
	end

.NoOrbYet
	opentext
	writetext GoGetTheOrbText
	waitbutton
	closetext
	end

.PartyFullClair:
	writetext DragonShrinePartyFullTextClair
	waitbutton
	closetext
	end

rematchscriptClair:
	opentext
	writetext ClairRematchText
	waitbutton
	closetext
	winlosstext ClairRematchWinText, 0
	loadtrainer CLAIR, CLAIR1
	startbattle
	reloadmapafterbattle
	clearevent EVENT_BATTLE_AVAILABLE_CLAIR
	opentext
	writetext ClairAfterRematchText
	waitbutton
	closetext
	end

postrematchscriptClair:
	opentext
	writetext ClairAfterRematchText
	waitbutton
	closetext
	end

ClairRematchText:
	text "Así que has"
	line "conocido a mi"
	cont "primo, Lance."

	para "¡Y has ganado"
	line "la LIGA"
	cont "#MON!"

	para "Tanto LANCE como"
	line "yo descendemos de"
	cont "entrenadores del"
	cont "tipo DRAGÓN."

	para "¡Concédeme el"
	line "honor de mostrarte"
	cont "mis habilidades!"
	done

ClairRematchWinText:
	text "¿He perdido?"

	para "Buen, la verdad"
	line "es que no puedo"
	cont "decir que esté"
	cont "muy sorprendida."

	para "¡Llevas el título"
	line "de CAMPEÓN con"
	cont "honor!!"
	done

ClairAfterRematchText:
	text "Si no fuera por"
	line "mis obligaciones"
	cont "aquí, en ISLA"
	cont "KOBAN, sería"
	cont "una LÍDER de"
	cont "GIMNASIO."

	para "Quizás me lo"
	line "piense si la"
	cont "LIGA alguna vez"
	cont "construyera un"
	cont "GIMNASIO aquí."

	para "La próxima vez"
	line "que veas a LANCE,"
	cont "¡gánale por mí!"
	done

ClairPlayerReceivedDratiniText:
	text "¡<PLAYER> recibió"
	line "a DRATINI!"
	done

ClairSymbolicDragonText:
	text "Los #MON dragón"
	line "son difíciles de"
	cont "criar, pero su"
	cont "majestuosidad y su"
	cont "fuerza los hace"
	cont "dignos."

	para "Confío en que"
	line "criarás este"
	cont "DRATINI como se"
	cont "merece."
	done

DragonShrinePartyFullTextClair:
	text "¡No tienes sitio"
	line "en tu equipo!"
	done

ClairTakeThisDratiniText:
	text "¡Ah, la"
	line "DRAGOESFERA!"

	para "¡Veo que has"
	line "comprendido el"
	cont "poder de los"
	cont "#MON dragón!"

	para "¡Me gustaría"
	line "recompensarte con"
	cont "un #MON espe-"
	cont "cial que merece"
	cont "ser criado por un"
	cont "entrenador digno!"
	done

GoGetTheOrbText:
	text "Recupera la"
	line "DRAGOESFERA de un"
	cont "entrenador en la"
	cont "cueva, y tráemela."
	done

DragonsAreGreatText:
	text "Ser un entrenador"
	line "del tipo dragón"
	cont "requiere más"
	cont "dedicación que"
	cont "otros tipos."

	para "Es un estilo de"
	line "vida."
	done

KobanClairsHouseClairText:
	text "Ey, ¿cómo va?"
	done

KobanClairsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KOBAN_ISLAND, 1
	warp_event  5,  7, KOBAN_ISLAND, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  7, 4, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KobanClairsHouseClairScript, EVENT_CLAIRS_HOUSE_HIDE_CLAIR
