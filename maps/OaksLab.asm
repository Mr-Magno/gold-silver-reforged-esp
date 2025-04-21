	const_def 2 ; object constants
	const OAKSLAB_OAK
	const OAKSLAB_OAKS_AIDE
	const OAKSLAB_POKE_BALL1
	const OAKSLAB_POKE_BALL2
	const OAKSLAB_POKE_BALL3
	const OAKSLAB_BLUE
	const OAKSLAB_SILVER

OaksLab_MapScripts:
	db 6 ; scene scripts
	scene_script .MeetOak ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_OAKSLAB_CANT_LEAVE
	scene_script .DummyScene2 ; SCENE_OAKSLAB_NOTHING
	scene_script .DummyScene3 ; SCENE_OAKSLAB_MEET_OFFICER
	scene_script .DummyScene4 ; SCENE_OAKSLAB_UNUSED
	scene_script .DummyScene5 ; SCENE_OAKSLAB_AIDE_GIVES_POTION

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MoveOakCallback

.MeetOak:
	priorityjump .WalkUpToOak
	end

.DummyScene1:
	end

.DummyScene2:
	end

.DummyScene3:
	end

.DummyScene4:
	end

.DummyScene5:
	end

.MoveOakCallback:
	checkscene
	iftrue .Skip ; not SCENE_DEFAULT
	moveobject OAKSLAB_OAK, 4, 2
.Skip:
	return
	

.WalkUpToOak:
	applymovement PLAYER, OaksLab_WalkUpToOakMovement
	showemote EMOTE_SHOCK, OAKSLAB_OAK, 15
	opentext
	writetext OakText_Intro
	waitbutton
	closetext
	showemote EMOTE_SHOCK, OAKSLAB_SILVER, 15
	opentext
	writetext Text_OakIsOld
	waitbutton
	closetext
	pause 15
	opentext
	writetext Text_OakSpeech
	waitbutton
	closetext
	showemote EMOTE_SHOCK, OAKSLAB_SILVER, 15
	opentext
	writetext Text_Interesting
	waitbutton
	closetext
	showemote EMOTE_SHOCK, OAKSLAB_BLUE, 15
	opentext
	writetext BlueText_Pokedex
	waitbutton
	closetext
	applymovement OAKSLAB_BLUE, BlueGivesDex1
	pause 10
	applymovement OAKSLAB_BLUE, BlueGivesDex2
	pause 5
	opentext
	writetext Lab_GetDexText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	pause 15
	waitbutton
	closetext
	applymovement OAKSLAB_BLUE, BlueGivesDex3
	opentext
	writetext Text_OakDream
	waitbutton
	closetext
	applymovement OAKSLAB_SILVER, MoveHeadLeft
	opentext
	writetext Text_RivalGenerous
	waitbutton
	closetext
	applymovement OAKSLAB_SILVER, MoveHeadUp
	setscene SCENE_OAKSLAB_CANT_LEAVE
	end

OaksLabSilverScript:
	jumptextfaceplayer Text_Best
	
OaksLabBlueScript:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .BlueAfterEliteFour
	faceplayer
	opentext
	writetext BlueText_Accepted
	waitbutton
	closetext
	end
	
.BlueAfterEliteFour
	faceplayer
	opentext
	writetext BlueText_Accepted2
	waitbutton
	closetext
	end

ProfOakScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SS_TICKET_FROM_OAK
	iftrue OakCheckMasterBall
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue OakGiveTicketScript
OakCheckMasterBall:
	checkevent EVENT_GOT_MASTER_BALL_FROM_OAK
	iftrue OakCheckEverstone
	checkflag ENGINE_RISINGBADGE
	iftrue OakGiveMasterBallScript
OakCheckEverstone:
	checkevent EVENT_TOLD_ELM_ABOUT_TOGEPI_OVER_THE_PHONE
	iffalse OakCheckTogepiEgg
	waitbutton
	closetext
	end

OakCheckTogepiEgg:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue OakAfterLeagueInPerson
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue OakAfterRadioTowerInPerson
	checkevent EVENT_RIVAL_BURNED_TOWER
	iftrue OakRocketsReturnedScript
	checkevent EVENT_GOT_ODD_EGG_FROM_OAKS_AIDE
	iftrue OakHearAboutLeagueHatchScript
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue OakOpportunityScript
	writetext OakText_LetYourMonBattleIt
	waitbutton
	closetext
	end

LabTryToLeaveScript:
	turnobject OAKSLAB_OAK, DOWN
	opentext
	writetext LabWhereGoingText
	waitbutton
	closetext
	applymovement PLAYER, OaksLab_CantLeaveMovement
	end
	
OakHearAboutLeagueHatchScript:
	writetext OakHearAboutLeagueHatchText
	waitbutton
	closetext
	end
	
OakRocketsReturnedScript:
	writetext OakRocketsReturnedText
	waitbutton
	closetext
	end
	
OakAfterRadioTowerInPerson:
	writetext OakYoureBasicallyAHeroText
	waitbutton
	closetext
	end
	
OakAfterLeagueInPerson:
	writetext OakAfterLeagueInPersonText
	waitbutton
	closetext
	end

FlambearPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOakPokeBallScript
	turnobject OAKSLAB_OAK, DOWN
	refreshscreen
	pokepic FLAMBEAR
	cry FLAMBEAR
	waitbutton
	closepokepic
	opentext
	writetext TakeFlambearText
	yesorno
	iffalse DidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL1
	setevent EVENT_GOT_FLAMBEAR_FROM_OAK
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem FLAMBEAR, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke FLAMBEAR, 5, BERRY
	closetext
	applymovement OAKSLAB_SILVER, SilverGetCruiseMovement
	opentext
	writetext Text_SilverTakeThisOne
	waitbutton
	closetext
	disappear OAKSLAB_POKE_BALL2
	opentext
	writetext Text_SilverGetCruise
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	setevent EVENT_CRUIZE_POKEBALL_IN_OAKS_LAB
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	jump OakDirectionsScript

CruisePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOakPokeBallScript
	turnobject OAKSLAB_OAK, DOWN
	refreshscreen
	pokepic CRUIZE
	cry CRUIZE
	waitbutton
	closepokepic
	opentext
	writetext TakeCruiseText
	yesorno
	iffalse DidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL2
	setevent EVENT_GOT_CRUIZE_FROM_OAK
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem CRUIZE, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CRUIZE, 5, BERRY
	closetext
	applymovement OAKSLAB_SILVER, SilverGetCHIKORITAMovement
	opentext
	writetext Text_SilverTakeThisOne
	waitbutton
	closetext
	disappear OAKSLAB_POKE_BALL3
	opentext
	writetext Text_SilverGetCHIKORITA
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	setevent EVENT_CHIKORITA_POKEBALL_IN_OAKS_LAB
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	jump OakDirectionsScript

CHIKORITAPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue LookAtOakPokeBallScript
	turnobject OAKSLAB_OAK, DOWN
	refreshscreen
	pokepic CHIKORITA
	cry CHIKORITA
	waitbutton
	closepokepic
	opentext
	writetext TakeCHIKORITAText
	yesorno
	iffalse DidntChooseStarterScript
	disappear OAKSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_OAK
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem CHIKORITA, MEM_BUFFER_0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CHIKORITA, 5, BERRY
	closetext
	applymovement OAKSLAB_SILVER, SilverGetFlambearMovement
	opentext
	writetext Text_SilverTakeThisOne
	waitbutton
	closetext
	disappear OAKSLAB_POKE_BALL1
	opentext
	writetext Text_SilverGetFlambear
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	setevent EVENT_FLAMBEAR_POKEBALL_IN_OAKS_LAB
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	jump OakDirectionsScript

DidntChooseStarterScript:
	writetext DidntChooseStarterText
	waitbutton
	closetext
	end

OakDirectionsScript:
	applymovement OAKSLAB_OAK, OakToTable
	turnobject PLAYER, UP
	opentext
	writetext OakDirectionsText1
	waitbutton
	closetext
	addcellnum PHONE_ELM
	opentext
	writetext GotOaksNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	closetext
	opentext
	writetext OakDirectionsText3
	waitbutton
	closetext
	applymovement OAKSLAB_OAK, OakBackFromTable
	setevent EVENT_GOT_A_POKEMON_FROM_OAK
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	setscene SCENE_OAKSLAB_AIDE_GIVES_POTION
	setmapscene SILENT_TOWN, SCENE_NEW_BARK_NOTHING
	setmapscene OAKS_LAB_ENTRANCE, SCENE_OAK_ENTRANCE_BATTLE
	setevent EVENT_SILVER_IN_OAKS_LAB
	clearevent EVENT_DAISY_OAKS_LAB_ENTRANCE
	setevent EVENT_BIRDON_AIDE_HIDDEN
	end

OakOpportunityScript:
	writetext OakOpportunityText
	waitbutton
	closetext
	end

LookAtOakPokeBallScript:
	opentext
	writetext OakPokeBallText
	waitbutton
	closetext
	end

OakGiveMasterBallScript:
	writetext OakGiveMasterBallText1
	buttonsound
	verbosegiveitem MASTER_BALL
	iffalse .notdone
	setevent EVENT_GOT_MASTER_BALL_FROM_OAK
	writetext OakGiveMasterBallText2
	waitbutton
.notdone
	closetext
	end

OakGiveTicketScript:
	writetext OakGiveTicketText
	buttonsound
	verbosegiveitem S_S_TICKET
	setevent EVENT_GOT_SS_TICKET_FROM_OAK
	writetext OakGiveTicketText
	waitbutton
	closetext
	end

OaksAideScript:
	faceplayer
	opentext
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	end

OaksLabTrashcan:
	jumptext OaksLabTrashcanText

OaksLabBookshelf:
	jumpstd difficultbookshelf
	
OakBackFromTable:
	step LEFT
	step LEFT
	step DOWN
	step_end

MoveHeadLeft:
	turn_head LEFT
	step_end
	
MoveHeadUp:
	turn_head UP
	step_end
	
OakToTable:
	step UP
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end
	
SilverGetCruiseMovement:
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end
	
SilverGetFlambearMovement:
	step RIGHT
	step UP
	step UP
	step_end
	
SilverGetCHIKORITAMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

OaksLab_WalkUpToOakMovement:
	step UP
	step UP
	step_end

OaksLab_CantLeaveMovement:
	step UP
	step_end

BlueGivesDex1:
	step RIGHT
	step RIGHT
	step DOWN
	step_end
	
BlueGivesDex2:
	step LEFT
	turn_head DOWN
	step_end
	
BlueGivesDex3:
	step UP
	step LEFT
	turn_head DOWN
	step_end
	
BlueText_Accepted2:
	text "¿Cómo va todo"
	line "ahora que has"
	cont "ganado la LIGA?"
	para "Espero que bien."

	para "¿Has visto"
	line "últimamente a"
	cont "<RIVAL>?"
	para "Sé que está en"
	line "alguna parte,"
	para "entrenando con"
	line "sus #MON."

	para "Creo que ha"
	line "aprendido cómo"
	para "trabajar en equipo"
	line "con ellos."
	done
	
Text_SilverTakeThisOne:
	text "¡Este #MON"
	line "parece fuerte!"
	
	para "Me quedaré con"
	line "este."
	done
	
Text_SilverGetCruise:
	text "¡<RIVAL> recibió"
	line "a CRUIZE!"
	done
	
Text_SilverGetFlambear:
	text "¡<RIVAL> recibió"
	line "a FLAMBEAR!"
	done
	
Text_SilverGetCHIKORITA:
	text "¡<RIVAL> recibió"
	line "a CHIKORITA!"
	done
		
Text_Best:
	text "¡Mi #MON va a"
	line "ser el mejor!"
	done

Lab_GetDexText:
	text "¡<PLAYER> recibió"
	line "una #DEX!"
	done
	
OakText_Intro:
	text "OAK: ¡<PLAY_G>!"
	line "¡Ahí estás!"

	done
	
Text_OakIsOld:
	text "<RIVAL>: No me"
	line "puedo creer que"
	para "este vejestorio"
	line "sea el PROF. OAK…"
	done
	
Text_OakSpeech:
	text "OAK: ¡Ja, ja!"
	
	para "De hecho, ¡no"
	line "soy tan viejo!"
	
	para "Os he llamado"
	line "porque tengo una"
	cont "tarea importante"
	cont "para los dos…"

	para "Desde que era"
	line "un jovenzuelo, he"
	cont "soñado con tener"
	cont "una guía completa"
	cont "de cada especie"
	cont "de #MON."
	
	para "Sin embargo…"
	para "¡Se descubren más"
	line "y más cada día!"
	
	para "Y la edad me"
	line "pisa los talones…"
	
	para "Me gustaría que"
	line "ambos os en-"
	cont "cargarais de mi"
	cont "investigación."
	done

Text_Interesting:
	text "<RIVAL>: ¡Vaya!"

	para "¿¡Quieres que"
	line "encontremos y"
	cont "capturemos un"
	cont "puñado de #MON"
	cont "para ti!?"
	
	para "¿Tantos como"
	line "queramos?"
	done
	
BlueText_Pokedex:
	text "AZUL: ¡Eso es!"
	
	para "Aunque no será"
	line "nada fácil."
	
	para "Una vez intenté"
	line "completar la"
	cont "#DEX…"
	
	para "Pero me pasé"
	line "de arrogante…"
	
	para "Me centré tanto"
	line "en ser el mejor"
	cont "entrenador, que"
	cont "perdí de vista"
	cont "mi objetivo."
	
	para "Ahora ayudo al"
	line "abuelo con sus"
	cont "investigaciones."
	
	para "¡Aquí tenéis"
	line "vuestras #DEX!"

	para "¡Guarda"
	line "automáticamente"
	para "datos de los"
	line "#MON que hayáis"
	cont "visto o capturado!"
	done
	
Text_OakDream:
	text "OAK: Ahora todo"
	line "lo que necesitáis"
	cont "es un #MON"
	cont "para que os"
	cont "acompañe en"
	cont "vuestro viaje."
	
	para "Sobre la mesa hay"
	line "tres # BALLS."

	para "¡Elegid cada"
	line "uno al que será"
	cont "vuestro compañero"
	cont "#MON!"
	done
	
Text_RivalGenerous:
	text "<RIVAL>: Puedes"
	line "escoger primero,"
	cont "<PLAY_G>…"
	
	para "Necesito tiempo"
	line "para decidirme."
	done

BlueText_Accepted:
	text "¡Gracias, <PLAY_G>!"

	para "Aprecio que estés"
	line "ayudando a mi"
	cont "abuelo."
	done

OakText_ChooseAPokemon:
	text "Quiero que os"
	line "encarguéis de"

	para "cuidar a uno de"
	line "estos #MON"
	cont "que hay en"
	cont "#BALLS."

	para "Serás el primer"
	line "compañero de ese"
	cont "#MON, <PLAY_G>!"

	para "¡Adelante!"
	done

OakText_LetYourMonBattleIt:
	text "Si aparece un"
	line "#MON salvaje,"
	para "¡dejad que vuestro"
	line "#MON luche!"
	done

LabWhereGoingText:
	text "OAK: ¡Espera!"
	line "¿Dónde vas?"
	done

TakeFlambearText:
	text "OAK: ¿Quieres a"
	line "FLAMBEAR, el"
	cont "#MON de fuego?"
	done

TakeCruiseText:
	text "OAK: ¿Quieres a"
	line "CRUIZE, el"
	cont "#MON de agua?"
	done

TakeCHIKORITAText:
	text "OAK: ¿Quieres a"
	line "CHIKORITA, el"
	cont "#MON de planta?"
	done

DidntChooseStarterText:
	text "OAK: Piénsalo"
	line "con cuidado."

	para "Tu compañero es"
	line "importante."
	done

ChoseStarterText:
	text "OAK: ¡Yo también"
	line "creo que es un"
	cont "#MON genial!"
	done

ReceivedStarterText:
	text "¡<PLAYER> recibió"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

OakDirectionsText1:
	para "La RUTA 101 y las"
	line "COLINAS SILENTES"
	cont "son buenos sitios"
	cont "para empezar a"
	cont "capturar #MON."
	
	para "¡Estoy seguro que"
	line "lo harás genial!"

	para "Pero por si acaso,"
	line "aquí tienes mi"
	para "número de"
	line "teléfono."

	para "¡Llámame si"
	line "ocurre algo!"
	done

OakDirectionsText3:
	text "<PLAY_G>."
	para "<RIVAL>."
	para "I'm counting on"
	line "you both!"
	done

GotOaksNumberText:
	text "<PLAYER> registró"
	line "el número de OAK."
	done

OakOpportunityText:
	text "¡Es una"
	line "oportunidad única!"
	done

OakPokeBallText:
	text "Contiene un"
	line "#MON atrapado"
	cont "por el PROF. OAK."
	done

OakHearAboutLeagueHatchText:
	text "He oído que"
	line "afrontarás el"
	para "desafío de la LIGA"
	line "#MON de NIHON."

	para "¡Estupendo!"
	line "¡Estoy seguro que"
	cont "lograrás grandes"
	cont "cosas!"
	done


OakGiveMasterBallText1:
	text "OAK: ¡<PLAY_G>!"
	line "¡Gracias a ti mi"

	para "investigación va"
	line "sobre ruedas!"

	para "Toma esto como"
	line "muestra de mi"
	cont "agradecimiento."
	done

OakGiveMasterBallText2:
	text "¡La MASTER BALL"
	line "es la mejor!"

	para "¡Es la BALL"
	line "definitiva!"

	para "Captura cualquier"
	line "#MON sin"
	cont "fallar."

	para "Se le entrega a"
	line "los grandes"
	para "investigadores"
	line "#MON."

	para "¡Creo que tú harás"
	line "un mejor uso de"
	cont "ella que yo,"
	cont "<PLAY_G>!"
	done

OakGiveTicketText:
	text "Si te diriges al"
	line "MUELLE de CIUDAD"
	para "PONIENTE, puedes"
	line "coger un barco"
	cont "a las ISLAS"
	cont "PONIENTES."
	
	para "Hay un montón de"
	line "#MON raros que"
	para "no se encuentran"
	line "en tierra firme."
	
	para "Deberías dirigirte"
	line "allí cuando tengas"
	cont "oportunidad."
	done

AideText_AlwaysBusy:
	text "¡Gracias por"
	line "tu ayuda!"
	done

OaksLabTrashcanText:
	text "El PROF. OAK tiró"
	line "aquí el envoltorio"
	cont "de su bocadillo…"
	done

OakRocketsReturnedText:
	text "Me temo que el"
	line "TEAM ROCKET trama"
	para "algo realmente"
	line "terrible…"
	done
	
OakYoureBasicallyAHeroText:
	text "¡Es increíble que"
	line "<RIVAL> y tú"
	para "hayáis vencido al"
	line "TEAM ROCKET!"

	para "¡Sois unos héroes"
	line "para los #MON!"

	para "¡Seguid así, e id"
	line "hacia el MT. FUJI!"
	done
	
OakAfterLeagueInPersonText:
	text "¡Enhorabuena por"
	line "superar la LIGA!"

	para "¡Es todo un logro!"

	para "Una vez más,"
	line "gracias por"
	para "ayudarme con mi"
	line "investigación."

	para "Si has llegado tan"
	line "lejos en tan poco"
	para "tiempo, ¡te espera"
	line "un gran futuro!"
	done

OaksLab_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, OAKS_LAB_ENTRANCE, 3
	warp_event  4,  7, OAKS_LAB_ENTRANCE, 3


	db 2 ; coord events
	coord_event  3,  7, SCENE_OAKSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  4,  7, SCENE_OAKSLAB_CANT_LEAVE, LabTryToLeaveScript

	db 7 ; bg events
	bg_event  0,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  1,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  2,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  3,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  0,  0, BGEVENT_READ, OaksLabBookshelf
	bg_event  1,  0, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  3, BGEVENT_READ, OaksLabTrashcan

	db 7 ; object events
	object_event  4,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfOakScript, -1
	object_event  6,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAideScript, EVENT_OAKS_AIDE_IN_LAB
	object_event  5,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FlambearPokeBallScript, EVENT_FLAMBEAR_POKEBALL_IN_OAKS_LAB
	object_event  6,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CruisePokeBallScript, EVENT_CRUIZE_POKEBALL_IN_OAKS_LAB
	object_event  7,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CHIKORITAPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_OAKS_LAB
	object_event  2,  3, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksLabBlueScript, EVENT_BLUE_IN_OAKS_LAB
	object_event  4,  5, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OaksLabSilverScript, EVENT_SILVER_IN_OAKS_LAB
