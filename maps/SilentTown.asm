	const_def 2 ; object constants
	const SilentTown_TEACHER
	const SilentTown_FISHER
	const SilentTown_SILVER
	const SilentTown_BLUE
	const SilentTown_PACKAGE

SilentTown_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_TILES, .ClearRocks

.ClearRocks:
	checkevent EVENT_ROUTE_115_ROCKS_DEMOLISHED
	iftrue .NewBarkRocksDone
	changeblock  19, 15, $25 ; rock
	return

	
.NewBarkRocksDone
	return

.DummyScene0:
	end

.DummyScene1:
	end
	
.FlyPoint:
	setflag ENGINE_FLYPOINT_SILENT
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	return
	
MomHasBeenRenamed:
	text "¡Ahora tu madre se"
	line "llama <MOM>!"
	done
	
NameMomAgainText:
	text "¡Hola!"

	para "Este mensaje sólo"
	line "aparece en"
	para "archivos de"
	line "guardado antiguos"
	para "en los que MAMÁ"
	line "tiene un nombre"
	para "incorrecto en el"
	line "TELÉFONO."

	para "Comprueba si el"
	line "nombre de MAMÁ"
	para "aparece correcta-"
	line "mente en el"
	cont "TELÉFONO."

	para "Suele ser un error"
	line "común que tenga el"
	para "nombre del jugador"
	line "en lugar de MAMÁ."

	para "Ahora, puedes"
	line "renombrarla para"
	para "arreglar el error"
	line "o si tan sólo"
	para "quieres ponerle"
	line "otro nombre."

	para "Esto sólo puede"
	line "hacerse una vez."

	para "¿Quieres renombrar"
	line "a tu MAMÁ?"
	done
	
NameMomAgainText2:
	text "Habla de nuevo con"
	line "este cartel para"
	cont "nombrar a tu MAMÁ."
	done


SilentTownPokecenterSign:
	jumpstd pokecentersign
	
SilentTown_RivalGreets:
	applymovement SilentTown_SILVER, RivalMeetsPlayer
	turnobject PLAYER, RIGHT
	special FadeOutMusic
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext SilentTownRivalText1
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SilentTown_SILVER, 15
	opentext
	writetext SilentTownRivalText2
	waitbutton
	special NameMom
	closetext
	setevent EVENT_NAMED_MOM_CHECK_FOR_SAVES
	showemote EMOTE_SHOCK, SilentTown_SILVER, 15
	opentext
	writetext SilentTownRivalText3
	closetext
	applymovement SilentTown_SILVER, RivalGoesToLab
	disappear SilentTown_SILVER
	setscene SCENE_TEACHER_STOPS
	special FadeOutMusic
	pause 15
	special RestartMapMusic
	setevent EVENT_RIVAL_SILENT_TOWN
	setevent EVENT_BLUE_OAKS_LAB_ENTRANCE
	setevent EVENT_DAISY_OAKS_LAB_ENTRANCE
	setevent EVENT_VIOLET_GYM_FALKNER
	setmapscene RADIO_TOWER_6F, SCENE_RADIOTOWER6F_NOTHING; this makes it so the giovanni scene plays, was missed for a while
	end

BlueStopsYouScene1:
	playmusic MUSIC_SHOW_ME_AROUND
	opentext
	writetext Text_WaitPlayer
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, RIGHT
	appear SilentTown_BLUE
	applymovement SilentTown_BLUE, BlueStopsPlayer1
	opentext
	writetext Text_ItsDangerousToGoAlone
	waitbutton
	closetext
	setevent EVENT_RIVAL_OAKS_LAB_ENTRANCE
	setmapscene OAKS_LAB_ENTRANCE, SCENE_HEAD_TO_THE_BACK
	setmapscene OAKS_LAB, SCENE_DEFAULT
	clearevent EVENT_BLUE_OAKS_LAB_ENTRANCE
	follow SilentTown_BLUE, PLAYER
	applymovement SilentTown_BLUE, BlueTakesPlayerToLab1
	stopfollow
	playsound SFX_ENTER_DOOR
	disappear SilentTown_BLUE
	applymovement PLAYER, PlayerEntersLab
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	warpfacing UP, OAKS_LAB_ENTRANCE, 4, 15
	end

BlueStopsYouScene2:
	playmusic MUSIC_SHOW_ME_AROUND
	opentext
	writetext Text_WaitPlayer
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, RIGHT
	appear SilentTown_BLUE
	applymovement SilentTown_BLUE, BlueStopsPlayer2
	opentext
	writetext Text_ItsDangerousToGoAlone
	waitbutton
	closetext
	setevent EVENT_RIVAL_OAKS_LAB_ENTRANCE
	setmapscene OAKS_LAB_ENTRANCE, SCENE_HEAD_TO_THE_BACK
	setmapscene OAKS_LAB, SCENE_DEFAULT
	clearevent EVENT_BLUE_OAKS_LAB_ENTRANCE
	follow SilentTown_BLUE, PLAYER
	applymovement SilentTown_BLUE, BlueTakesPlayerToLab2
	stopfollow
	playsound SFX_ENTER_DOOR
	disappear SilentTown_BLUE
	applymovement PLAYER, PlayerEntersLab
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	warpfacing UP, OAKS_LAB_ENTRANCE, 4, 15
	end

SilentTownRivalScript:
	faceplayer
	opentext
	writetext Text_GearIsImpressive
	waitbutton
	closetext
	end
	
SilentTownBlueScript:
	opentext
	writetext Text_Study101
	waitbutton
	closetext
	end

SilentTownTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_MOM_AFTER_GETTING_POKEDEX
	iftrue .CallMom
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .MonIsAdorable
	writetext Text_GearIsImpressive
	waitbutton
	closetext
	end

.MonIsAdorable:
	writetext Text_YourMonIsAdorable
	waitbutton
	closetext
	end

.CallMom:
	writetext Text_CallMomOnGear
	waitbutton
	closetext
	end

SilentTownFisherScript:
	jumptextfaceplayer Text_OakDiscoveredNewMon

SilentTownSign:
	jumptext SilentTownSignText

SilentTownPlayersHouseSign:
	opentext
	checkevent EVENT_NAMED_MOM_CHECK_FOR_SAVES
	iffalse .NameMomAgain
	writetext SilentTownPlayersHouseSignText
	waitbutton
	closetext
	end
	
.NameMomAgain
	writetext NameMomAgainText
	yesorno
	iffalse .DontNameMomAgain
	special NameMom 
	closetext 
	setevent EVENT_NAMED_MOM_CHECK_FOR_SAVES
	opentext
	writetext MomHasBeenRenamed
	waitbutton
	closetext
	end
	
.DontNameMomAgain
	writetext NameMomAgainText2
	waitbutton
	closetext
	end

SilentTownOaksLabSign:
	jumptext SilentTownOaksLabSignText

SilentTownRivalsHouseSign:
	jumptext SilentTownRivalsHouseSignText
	
BlueTakesPlayerToLab1:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end
	
BlueTakesPlayerToLab2:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_end
	
BlueStopsPlayer1:
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

BlueStopsPlayer2:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

RivalMeetsPlayer:
	step UP
	step UP
	step UP
	step UP
	step UP
	step LEFT
	step_end
	
RivalGoesToLab:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
PlayerEntersLab:
	step UP
	step_end
	
	
TrophyPackageScript:
	opentext
	checkevent EVENT_GOLD_TROPHY_IN_PACKAGE
	iftrue .goldtrophy
	checkevent EVENT_SILVER_TROPHY_IN_PACKAGE
	iftrue .silvertrophy
.dummynotrophy
	closetext
	end
.goldtrophy
	writetext PackageIsHereText
	waitbutton
	verbosegiveitem GORGEOUS_BOX
	iffalse .dummynotrophy
	setevent EVENT_PACKAGE_TAKEN_NO_SHOW
	setevent EVENT_TAKEN_GOLD_TROPHY
	disappear SilentTown_PACKAGE
	jump .dummynotrophy
.silvertrophy
	writetext PackageIsHereText
	waitbutton
	verbosegiveitem NORMAL_BOX
	iffalse .dummynotrophy
	setevent EVENT_PACKAGE_TAKEN_NO_SHOW
	setevent EVENT_TAKEN_SILVER_TROPHY
	disappear SilentTown_PACKAGE
	jump .dummynotrophy
	
PackageIsHereText:
	text "Es un paquete a"
	line "nombre de…"
	
	para "¡<PLAYER>!"
	
	para "¿Qué habrá"
	line "dentro?"
	done
	
Text_Study101:
	text "Y si pasamos"
	line "unos días más"
	para "observando a los"
	line "#MON que viven"
	cont "en la RUTA 101…"
	
	para "…"
	para "Parece estar muy"
	line "ocupado…"
	done

Text_GearIsImpressive:
	text "¡Uau! ¡Tu #GEAR"
	line "es impresionante!"

	para "¿Te lo ha dado tu"
	line "madre?"
	done

Text_WaitPlayer:
	text "¡Eh! ¡Espera!"
	line "¡Alto ahí!"
	done

Text_ItsDangerousToGoAlone:
	text "¿Qué crees que"
	line "estás haciendo?"
	
	para "¡En la hierba"
	line "alta viven"
	cont "#MON salvajes!"

	para "Necesitas tu"
	line "propio #MON"
	cont "como protección."
	
	para "¡Ah! ¿Acaso"
	line "eres…?"
	
	para "¡Ven conmigo un"
	line "segundo!"
	done

Text_YourMonIsAdorable:
	text "¡Oh, tu #MON es"
	line "adorable! ¡Ojalá"
	cont "tuviera yo uno!"
	done

Text_CallMomOnGear:
	text "Llama a tu madre"
	line "con el #GEAR"
	cont "y cuéntale cómo"
	cont "te va."
	done

Text_OakDiscoveredNewMon:
	text "¡Hola, <PLAYER>!"

	para "He oído que el"
	line "PROF.OAK ha"
	cont "descubierto nue-"
	cont "vos #MON."
	done

SilentTownRivalText1:
	text "<RIVAL>: ¡Eh,"
	line "<PLAYER>!"

	para "¡Tengo algo de lo"
	line "que presumir!"
	
	para "¡Recibí un correo"
	line "del PROF. OAK!"

	para "¡Sí, el mismísimo!"
	done

SilentTownRivalText2:
	text "¡¿Tú también"
	line "recibiste uno?!"
	cont "¡Venga ya!"
	
	para "Mmm… bueno…"
	line "pues… eh…"
	
	para "¿Cómo dices que"
	line "llamas a tu madre?"
	done
	
SilentTownRivalText3:
	text "¿<MOM>?"

	para "¡No me hagas reír!"

	para "¡Qué gracia,"
	line "pareces un niño"
	cont "pequeño!"
	
	para "¡En fin, me voy!"

	para "¡Te espero en el"
	line "LABORATORIO!"
	done

SilentTownSignText:
	text "PUEBLO SILENTE"
	
	para "Un remanso de paz"
	done

SilentTownPlayersHouseSignText:
	text "CASA DE <PLAYER>"
	done

SilentTownOaksLabSignText:
	text "LABORATORIO DE"
	line "INVESTIGACIÓN"
	cont "#MON DE OAK"
	done

SilentTownRivalsHouseSignText:
	text "CASA DE <RIVAL>"
	done

SilentTown_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 14, 19, OAKS_LAB_ENTRANCE, 1
	warp_event  5, 12, PLAYERS_HOUSE_1F, 1
	warp_event 13, 12, SILENT_POKECENTER_1F, 1
	warp_event  3, 20, SILENT_HOUSE, 1
	warp_event 15, 19, OAKS_LAB_ENTRANCE, 2
	warp_event  9, 18, AMAMI_POKECENTER_1F, 1
	warp_event  9,  5, VICTORY_ROAD_GATE, 1


	db 3 ; coord events
	coord_event  1, 16, SCENE_TEACHER_STOPS, BlueStopsYouScene1
	coord_event  1, 17, SCENE_TEACHER_STOPS, BlueStopsYouScene2
	coord_event  5, 13, SCENE_DEFAULT, SilentTown_RivalGreets

	db 5 ; bg events
	bg_event 16, 13, BGEVENT_READ, SilentTownSign
	bg_event  8, 12, BGEVENT_READ, SilentTownPlayersHouseSign
	bg_event 10, 19, BGEVENT_READ, SilentTownOaksLabSign
	bg_event  6, 20, BGEVENT_READ, SilentTownRivalsHouseSign
	bg_event 14, 12, BGEVENT_READ, SilentTownPokecenterSign

	db 5 ; object events
	object_event  9, 14, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilentTownTeacherScript, -1
	object_event 12, 21, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1,  0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SilentTownFisherScript, -1
	object_event  7, 18, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilentTownRivalScript, EVENT_RIVAL_SILENT_TOWN
	object_event  7, 17, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilentTownBlueScript, EVENT_BLUE_SILENT_TOWN
	object_event  4, 13, SPRITE_BELMITT, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrophyPackageScript, EVENT_PACKAGE_TAKEN_NO_SHOW
