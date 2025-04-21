	const_def 2 ; object constants
	const ALLOYOLDCAPTAINSHOUSE_CAPTAIN

AlloyOldCaptainsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AlloyOldCaptainsHouseCaptainScript:
IF DEF(_GOLD)
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .AfterEverythingBirdFight
	faceplayer
	opentext
	writetext AlloyOldCaptainsHouseCaptainIntroText
	buttonsound
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoEvilLeft
	writetext AlloyOldCaptainsHouseCaptainEvilText
	waitbutton
	closetext
	end
	
ELIF DEF(_SILVER)
	checkevent EVENT_FOUGHT_LUGIA
	iftrue .AfterEverythingBirdFight
	faceplayer
	opentext
	writetext AlloyOldCaptainsHouseCaptainIntroText
	buttonsound
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoEvilLeft
	writetext AlloyOldCaptainsHouseCaptainEvilText
	waitbutton
	closetext
	end
ENDC
	
.NoEvilLeft
	checkevent EVENT_GOT_HM07_WATERFALL
	iffalse .NoWaterfall
	writetext AlloyOldCaptainsHouseCaptainText2
	yesorno
	iffalse AlloyOldCaptainNoStory
IF DEF(_GOLD)
	writetext AlloyOldCaptainHoOhStoryText
	waitbutton
	closetext
	special FadeOutMusic
	pause 20
	cry HO_OH
	playsound SFX_FLY
	showemote EMOTE_SHOCK, ALLOYOLDCAPTAINSHOUSE_CAPTAIN, 20
	pause 15
	opentext
	writetext HoOhAppearsText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .CaptainWalkAroundPlayerGold
	applymovement ALLOYOLDCAPTAINSHOUSE_CAPTAIN, CaptainWalksOutMovement
	playsound SFX_EXIT_BUILDING
	disappear ALLOYOLDCAPTAINSHOUSE_CAPTAIN
	setevent EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	setevent EVENT_HO_OH_STAIRS_APPEAR
	clearevent EVENT_BRASS_TOWER_ELDER_SAGE_GONE
	setmapscene PAGOTA_CITY, SCENE_KURTS_HOUSE_LOCKED
	setmapscene BRASS_TOWER_5F, SCENE_HO_OH_EVENT
	pause 15
	special RestartMapMusic
	end
	
.CaptainWalkAroundPlayerGold
	applymovement ALLOYOLDCAPTAINSHOUSE_CAPTAIN, CaptainWalksAroundPlayerMovement
	playsound SFX_EXIT_BUILDING
	disappear ALLOYOLDCAPTAINSHOUSE_CAPTAIN
	setevent EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	setevent EVENT_HO_OH_STAIRS_APPEAR
	clearevent EVENT_BRASS_TOWER_ELDER_SAGE_GONE
	setmapscene PAGOTA_CITY, SCENE_KURTS_HOUSE_LOCKED
	setmapscene BRASS_TOWER_5F, SCENE_HO_OH_EVENT
	pause 15
	special RestartMapMusic
	end
	
ELIF DEF(_SILVER)
	writetext AlloyOldCaptainLugiaStoryText
	waitbutton
	closetext
	special FadeOutMusic
	pause 20
	cry LUGIA
	playsound SFX_BUBBLEBEAM
	showemote EMOTE_SHOCK, ALLOYOLDCAPTAINSHOUSE_CAPTAIN, 20
	pause 15
	opentext
	writetext LugiaAppearsText
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .CaptainWalkAroundPlayerSilver
	applymovement ALLOYOLDCAPTAINSHOUSE_CAPTAIN, CaptainWalksOutMovement
	playsound SFX_EXIT_BUILDING
	disappear ALLOYOLDCAPTAINSHOUSE_CAPTAIN
	setevent EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	setevent EVENT_LUGIA_CAVE_OPEN
	clearevent EVENT_WHIRL_ISLANDS_SAGE_GONE
	setmapscene PAGOTA_CITY, SCENE_KURTS_HOUSE_LOCKED
	setmapscene WHIRL_ISLAND_B3F, SCENE_LUGIA_EVENT
	pause 15
	special RestartMapMusic
	end

	
.CaptainWalkAroundPlayerSilver
	applymovement ALLOYOLDCAPTAINSHOUSE_CAPTAIN, CaptainWalksAroundPlayerMovement
	playsound SFX_EXIT_BUILDING
	disappear ALLOYOLDCAPTAINSHOUSE_CAPTAIN
	setevent EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
	setevent EVENT_LUGIA_CAVE_OPEN
	clearevent EVENT_WHIRL_ISLANDS_SAGE_GONE
	setmapscene PAGOTA_CITY, SCENE_KURTS_HOUSE_LOCKED
	setmapscene WHIRL_ISLAND_B3F, SCENE_LUGIA_EVENT
	pause 15
	special RestartMapMusic
	end
ENDC
	
.NoWaterfall
	writetext AlloyOldCaptainsHouseCaptainNoWaterfallText
	waitbutton
	closetext
	end
	
.AfterEverythingBirdFight
	faceplayer
	opentext
IF DEF(_GOLD)
	writetext SometimesYouLiveLongEnoughGold
	closetext
	end
	
ELIF DEF(_SILVER)
	writetext SometimesYouLiveLongEnoughSilver
	waitbutton
	closetext
	end
ENDC
	
AlloyOldCaptainNoStory:
	writetext AlloyOldCaptainsHouseCaptainAnotherTime
	waitbutton
	closetext
	end
	
CaptainWalksAroundPlayerMovement:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
CaptainWalksOutMovement:
	step DOWN
	step DOWN
	step LEFT
	step DOWN
	step DOWN
	step_end
	
SometimesYouLiveLongEnoughGold:
	text "A veces vives lo"
	line "suficiente para"
	para "ser testigo de"
	line "cosas que nunca"
	cont "esperarías ver."

	para "Tuve un encuentro"
	line "con el ave de la"
	cont "leyenda."

	para "Un suceso verdade-"
	line "ramente mágico."

	para "…"
	
	para "Deberías ir por"
	line "NIHON en busca de"
	cont "las bestias"
	cont "legendarias."

	para "Si HO-OH ha"
	line "vuelto, todo es"
	cont "posible."
	done

SometimesYouLiveLongEnoughSilver:
	text "A veces vives lo"
	line "suficiente para"
	para "ser testigo de"
	line "cosas que nunca"
	cont "esperarías ver."

	para "Tuve un encuentro"
	line "con el ave de la"
	cont "leyenda."

	para "Un suceso verdade-"
	line "ramente mágico."

	para "…"
	
	para "Deberías ir por"
	line "NIHON en busca de"
	cont "las bestias"
	cont "legendarias."

	para "Si LUGIA ha"
	line "vuelto, todo es"
	cont "posible."
	done

AlloyOldCaptainHoOhStoryText:
	text "Escucha"
	line "atentamente…"
	para "Antaño, NIHON era"
	line "protegida por una"
	para "noble ave, cuyas"
	line "alas estaban"
	cont "bañadas en los"
	cont "colores del"
	cont "arcoiris."
	
	para "La leyenda dice"
	line "que hizo su nido"
	cont "en lo que se"
	cont "conoce como la"
	cont "TORRE LATÓN."
	
	para "Sin embargo, la"
	line "creciente maldad"
	cont "dentro de la"
	cont "región hizo que"
	cont "el ave se"
	cont "inquietara."
	
	para "Sintiéndose"
	line "obligado, el ave"
	cont "se marchó…"
	
	para "Mientras, volaba,"
	line "de sus alas"
	cont "cayeron cenizas."
	
	para "De aquellas"
	line "cenizas surgieron"
	cont "tres bestias, que"
	cont "debían velar por"
	cont "el bienestar de"
	cont "NIHON en ausencia"
	cont "del ave."
	
	para "Las bestias se"
	line "dispersaron, y"
	cont "nadie ha vuelto a"
	cont "verlas."
	
	para "Pero la leyenda"
	line "dice que perma-"
	cont "necieron en NIHON,"
	cont "protegiéndola"
	cont "desde las sombras"
	
	para "y que un ser de"
	line "corazón puro"
	cont "traerá de vuelta"
	cont "al ave."
	
	para "Siento que ese"
	line "día podría"
	cont "llegar pronto…"
	done
	
AlloyOldCaptainLugiaStoryText:
	text "Escucha"
	line "atentamente…"
	para "Antaño, NIHON era"
	line "protegida por una"
	para "noble ave, cuyas"
	line "alas estaban"
	cont "bañadas en un"
	cont "precioso color"
	cont "plateado."
	
	para "La leyenda dice"
	line "que hizo su nido"
	cont "en lo que se"
	cont "conoce como la"
	cont "ISLA REMOLINO."
	
	para "Sin embargo, la"
	line "falta de respeto"
	cont "por el ambiente"
	cont "oceánico hizo"
	cont "que el ave se"
	cont "inquietara."
	
	para "Sintiéndose"
	line "obligada, el ave"
	cont "se marchó…"
	
	para "Mientras se"
	line "sumergía, su"
	cont "canto creó"
	cont "remolinos."
	
	para "Dichos remolinos"
	line "mantuvieron al"
	cont "oceáno limpio y"
	cont "seguro de las"
	cont "acciones del"
	cont "ser humano."
	
	para "A tres bestias"
	line "se les asignó"
	cont "la tarea de"
	cont "velar por el"
	cont "bienestar de"
	cont "NIHON en ausencia"
	cont "del ave."
	
	para "Las bestias se"
	line "dispersaron, y"
	cont "nadie ha vuelto a"
	cont "verlas."
	
	para "Pero la leyenda"
	line "dice que perma-"
	cont "necieron en NIHON,"
	cont "protegiéndola"
	cont "desde las sombras"
	
	para "y que un ser de"
	line "corazón puro"
	cont "traerá de vuelta"
	cont "al ave."
	
	para "Siento que ese"
	line "día podría"
	cont "llegar pronto…"
	done
	
HoOhAppearsText:
	text "¿¡Será posible!?"
	
	para "¡El ave!"
	
	para "Ven, niño. Debemos"
	line "apresurarnos a"
	cont "llegar a la"
	cont "TORRE LATÓN."
	
	para "¡La leyenda se"
	line "está cumpliendo!"
	done
	
LugiaAppearsText:
	text "¿¡Será posible!?"
	
	para "¡El ave!"
	
	para "Ven, niño. Debemos"
	line "apresurarnos a"
	cont "llegar a la"
	cont "ISLA REMOLINO."
	
	para "¡La leyenda se"
	line "está cumpliendo!"
	done
	
AlloyOldCaptainsHouseCaptainAnotherTime:
	text "Será en otra"
	line "ocasión."
	done

AlloyOldCaptainsHouseCaptainText2:
	text "¿Quieres escuchar"
	line "la historia del"
	cont "ave?"
	done
	
AlloyOldCaptainsHouseCaptainIntroText:
	text "Espero saber la"
	line "conclusión de esta"
	cont "leyenda algún día."
	done

AlloyOldCaptainsHouseCaptainEvilText:
	text "Siento una"
	line "presencia maligna"
	cont "acechando a NIHON."

	para "El ave no regresa-"
	line "rá hasta que haya"
	cont "desaparecido."
	done
	
AlloyOldCaptainsHouseCaptainNoWaterfallText:
	text "El momento podría"
	line "llegar cualquier"
	para "día, pero no creo"
	line "que seas el tipo"
	para "de entrenador ante"
	line "el que se presen-"
	cont "taría el ave."
	done

AlloyOldCaptainsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ALLOY_CITY, 9
	warp_event  5,  7, ALLOY_CITY, 9

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  6,  3, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AlloyOldCaptainsHouseCaptainScript, EVENT_ALLOY_CAPTAIN_AND_TOWER_SAGES_GONE
