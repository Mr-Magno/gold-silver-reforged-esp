	const_def 2 ; object constants
	const PLAYERSHOUSE1F_MOM1
	const PLAYERSHOUSE1F_MOM2
	const PLAYERSHOUSE1F_MOM3
	const PLAYERSHOUSE1F_MOM4

PlayersHouse1F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .SetKenAndDecorForOldSaves

.SetKenAndDecorForOldSaves
	setmapscene PLAYERS_HOUSE_2F, SCENE_PLAYERS_HOUSE_2F_NOTHING
	setevent EVENT_DECO_N64
	setevent EVENT_DECO_CARPET_1
	setevent EVENT_DECO_BED_1
	setevent EVENT_DECO_POSTER_1
	setevent EVENT_TALKED_TO_KEN_AT_BEGINNING
	setevent EVENT_READ_OAKS_EMAIL
	return

.DummyScene0:
	end

.DummyScene1:
	end

MeetMomLeftScript:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1

MeetMomRightScript:
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .OnRight
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsTowardPlayerMovement
	jump MeetMomScript

.OnRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksToPlayerMovement
MeetMomScript:
	opentext
	writetext OaksLookingForYouText
	buttonsound
	stringtotext GearName, MEM_BUFFER_1
	scall PlayersHouse1FReceiveItemStd
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	addcellnum PHONE_MOM
	setscene SCENE_FINISHED
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	clearevent EVENT_PLAYERS_HOUSE_MOM_2
	writetext MomGivesPokegearText
	buttonsound
	special SetDayOfWeek
.SetDayOfWeek:
	writetext IsItDSTText
	yesorno
	iffalse .WrongDay
	special InitialSetDSTFlag
	yesorno
	iffalse .SetDayOfWeek
	jump .DayOfWeekDone

.WrongDay:
	special InitialClearDSTFlag
	yesorno
	iffalse .SetDayOfWeek
.DayOfWeekDone:
	writetext ComeHomeForDSTText
	yesorno
	iffalse .ExplainPhone
	jump .KnowPhone

.KnowPhone:
	writetext KnowTheInstructionsText
	buttonsound
	jump .FinishPhone

.ExplainPhone:
	writetext DontKnowTheInstructionsText
	buttonsound
	writetext InstructionsNextText
	buttonsound
	jump .FinishPhone

.FinishPhone:
	writetext RivalNameText
	waitbutton
	closetext
	special NameRival
	opentext
	writetext FinalMomText
	waitbutton
	closetext
	setevent EVENT_BLUE_SILENT_TOWN
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .FromRight
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iffalse .FromLeft
	jump .Finish

.FromRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsBackMovement
	jump .Finish

.FromLeft:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksBackMovement
	jump .Finish

.Finish:
	special RestartMapMusic
	turnobject PLAYERSHOUSE1F_MOM1, LEFT
	setevent EVENT_TALKED_TO_MOM_AT_BEGINNING
	end

MeetMomTalkedScript:
	playmusic MUSIC_MOM
	jump MeetMomScript

GearName:
	db "#GEAR@"

PlayersHouse1FReceiveItemStd:
	jumpstd receiveitem
	end

MomScript:
	faceplayer
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	checkscene
	iffalse MeetMomTalkedScript ; SCENE_DEFAULT
	opentext
	checkevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	iftrue .FirstTimeBanking
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iftrue .BankOfMom
	writetext HurryUpOakIsWaitingText
	waitbutton
	closetext
	end

.GotAPokemon:
	writetext SoWhatWasProfOaksErrandText
	waitbutton
	closetext
	end

.FirstTimeBanking:
	writetext ImBehindYouText
	waitbutton
	closetext
	end

.GaveMysteryEgg:
	setevent EVENT_FIRST_TIME_BANKING_WITH_MOM
.BankOfMom:
	setevent EVENT_TALKED_TO_MOM_AFTER_GETTING_POKEDEX
	special BankOfMom
	waitbutton
	closetext
	end


TVScript:
	jumptext TVText

StoveScript:
	jumptext StoveText

SinkScript:
	jumptext SinkText

FridgeScript:
	jumptext FridgeText

MomTurnsTowardPlayerMovement:
	turn_head RIGHT
	step_end

MomWalksToPlayerMovement:
	slow_step RIGHT
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_end

MomTurnsBackMovement:
	turn_head LEFT
	step_end

MomWalksBackMovement:
	slow_step DOWN
	slow_step DOWN
	slow_step LEFT
	slow_step LEFT
	step_end

FinalMomText:
	text "Eso es,"
	line "¡se llama"
	cont "<RIVAL>!"
	
	para "Debería estar aún"
	line "por aquí cerca."

	para "Seguro que te"
	line "lo acabas"
	cont "encontrando."
	done

OaksLookingForYouText:
	text "¡Ah, <PLAYER>…!"
	line "Tu #MON GEAR"

	para "ha vuelto de"
	line "su reparación."

	para "¡Aquí tienes!"
	done

MomGivesPokegearText:
	text "El #MON GEAR o"
	line "sólo #GEAR es"
	cont "básico para ser un"
	cont "buen entrenador."

	para "Oh, no está con-"
	line "figurado el día."

	para "¡No debes olvidar"
	line "configurarlo!"
	done

IsItDSTText:
	text "¿Es horario de"
	line "verano?"
	done

ComeHomeForDSTText:
	text "Vuelve a casa"
	line "para ajustar tu"
	para "reloj al horario"
	line "de verano."

	para "Por cierto…"
	
	line "¿Sabes cómo usar"
	cont "el TELÉFONO?"
	done

KnowTheInstructionsText:
	text "Oh, ya veo."
	done

DontKnowTheInstructionsText:
	text "Te leeré las"
	line "instrucciones."

	para "Enciende el"
	line "#GEAR y elige"
	cont "el TELÉFONO."
	done

InstructionsNextText:
	text "Los números están"
	line "en la memoria."

	para "Elige el nombre"
	line "que quieras."

	para "¿No te parece"
	line "estupendo?"
	done
	
RivalNameText:
	text "Por cierto, tu"
	line "amigo ha venido"
	cont "buscándote."
		
	para "Aunque no me"
	line "acuerdo de su"
	cont "nombre…"
	done

HurryUpOakIsWaitingText:
	text "El PROF.OAK me"
	line "dijo que quería"
	cont "hablar contigo."
	para "Deberías ir a"
	line "verlo cuando"
	cont "puedas."
	done

SoWhatWasProfOaksErrandText:
	text "¿Qué quería el"
	line "PROF. OAK?"

	para "…"

	para "Parece muy"
	line "difícil."

	para "Deberías estar"
	line "orgulloso de que"
	cont "la gente confíe"
	cont "en ti."
	done

ImBehindYouText:
	text "¡Adelante,"
	line "<PLAYER>!"

	para "¡Estoy contigo"
	line "hasta el final!"
	done


StoveText:
	text "¡La especialidad"
	cont "de MAMÁ!"

	para "¡La HAMBURGUESA"
	line "VOLCÁN-CANELA!"
	done

SinkText:
	text "El fregadero está"
	line "impecable."
	done

FridgeText:
	text "A ver qué hay…"

	para "AGUA FRESCA y"
	line "una LIMONADA!"
	done

TVText:
	text "Es una serie."
	line "TV: ¡PRIMAPE"
	cont "está furioso y"
	cont "persigue a ASH."
	done

PlayersHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6,  7, SILENT_TOWN, 2
	warp_event  7,  7, SILENT_TOWN, 2
	warp_event  9,  0, PLAYERS_HOUSE_2F, 1

	db 2 ; coord events
	coord_event  4,  7, SCENE_DEFAULT, MeetMomLeftScript
	coord_event  9,  1, SCENE_DEFAULT, MeetMomRightScript

	db 4 ; bg events
	bg_event  0,  1, BGEVENT_READ, StoveScript
	bg_event  1,  1, BGEVENT_READ, SinkScript
	bg_event  2,  1, BGEVENT_READ, FridgeScript
	bg_event  4,  1, BGEVENT_READ, TVScript

	db 5 ; object events
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_1
	object_event  2,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  0,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
