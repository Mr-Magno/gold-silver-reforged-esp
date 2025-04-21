	const_def 2 ; object constants
	const SAFFRON_GYM_LASS_GRASS
	const SAFFRON_GYM_LASS_FIRE
	const SAFFRON_GYM_LASS_WATER
	const SAFFRON_GYM_YOUNGSTER_GRASS
	const SAFFRON_GYM_YOUNGSTER_FIRE
	const SAFFRON_GYM_YOUNGSTER_WATER
	const SAFFRON_GYM_POKEFAN_M
	const SAFFROM_GYM_GYM_GUY


RyukyuFakeGym_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Trainers
	
	callback MAPCALLBACK_TILES, .RyukyuFakeGymTypeChange
	
.Trainers
	checkevent EVENT_GOT_CRUIZE_FROM_OAK
	iftrue .GrassGym
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .FireGym
	checkevent EVENT_GOT_FLAMBEAR_FROM_OAK
	iftrue .WaterGym
	return
	
.GrassGym
	moveobject SAFFRON_GYM_LASS_FIRE, -4, -4 
	moveobject SAFFRON_GYM_LASS_WATER, -4, -4 
	moveobject SAFFRON_GYM_YOUNGSTER_FIRE, -4, -4 
	moveobject SAFFRON_GYM_YOUNGSTER_WATER, -4, -4 
	return
	
.FireGym
	moveobject SAFFRON_GYM_LASS_GRASS, -4, -4 
	moveobject SAFFRON_GYM_LASS_WATER, -4, -4 
	moveobject SAFFRON_GYM_YOUNGSTER_GRASS, -4, -4 
	moveobject SAFFRON_GYM_YOUNGSTER_WATER, -4, -4 
	return
	
.WaterGym
	moveobject SAFFRON_GYM_LASS_GRASS, -4, -4 
	moveobject SAFFRON_GYM_LASS_FIRE, -4, -4 
	moveobject SAFFRON_GYM_YOUNGSTER_GRASS, -4, -4 
	moveobject SAFFRON_GYM_YOUNGSTER_FIRE, -4, -4 
	return
	
.RyukyuFakeGymTypeChange:
	checkevent EVENT_GOT_CRUIZE_FROM_OAK
	iftrue .GrassGymBlocks
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .FireGymBlocks
	jump .doneGym
.GrassGymBlocks:
	changeblock  3, 1, $3F ; grass
	changeblock  5, 1, $7D ; grass
	changeblock  3, 3, $3F ; grass
	changeblock  5, 3, $3F ; grass
	changeblock  3, 5, $3F ; grass
	changeblock  5, 5, $7D ; grass
	changeblock  3, 7, $3F ; grass
	changeblock  5, 7, $3F ; grass
	changeblock  3, 9, $3F ; grass
	changeblock  5, 9, $7D ; grass
	changeblock  3, 11, $3F ; grass
	changeblock  5, 11, $3F ; grass
	changeblock  3, 13, $3F ; grass
	changeblock  5, 13, $7D ; grass
	changeblock  3, 15, $3F ; grass
	changeblock  5, 15, $3F ; grass
	changeblock  3, 17, $3F ; grass
	changeblock  5, 17, $7D ; grass
	changeblock  13, 1, $7D ; grass
	changeblock  15, 1, $3F ; grass
	changeblock  13, 3, $3F ; grass
	changeblock  15, 3, $3F ; grass
	changeblock  13, 5, $7D ; grass
	changeblock  15, 5, $3F ; grass
	changeblock  13, 7, $3F ; grass
	changeblock  15, 7, $3F ; grass
	changeblock  13, 9, $7D ; grass
	changeblock  15, 9, $3F ; grass
	changeblock  13, 11, $3F ; grass
	changeblock  15, 11, $3F ; grass
	changeblock  13, 13, $7D ; grass
	changeblock  15, 13, $3F ; grass
	changeblock  13, 15, $3F ; grass
	changeblock  15, 15, $3F ; grass
	changeblock  13, 17, $7D ; grass
	changeblock  15, 17, $3F ; grass
	return
	
.FireGymBlocks:
	changeblock  3, 1, $3B ; fire
	changeblock  5, 1, $59 ; fire
	changeblock  3, 3, $3B ; fire
	changeblock  5, 3, $3B ; fire
	changeblock  3, 5, $3B ; fire
	changeblock  5, 5, $59 ; fire
	changeblock  3, 7, $3B ; fire
	changeblock  5, 7, $3B ; fire
	changeblock  3, 9, $3B ; fire
	changeblock  5, 9, $59 ; fire
	changeblock  3, 11, $3B ; fire
	changeblock  5, 11, $3B ; fire
	changeblock  3, 13, $3B ; fire
	changeblock  5, 13, $59 ; fire
	changeblock  3, 15, $3B ; fire
	changeblock  5, 15, $3B ; fire
	changeblock  3, 17, $3B ; fire
	changeblock  5, 17, $59 ; fire
	changeblock  13, 1, $59 ; fire
	changeblock  15, 1, $3B ; fire
	changeblock  13, 3, $3B ; fire
	changeblock  15, 3, $3B ; fire
	changeblock  13, 5, $59 ; fire
	changeblock  15, 5, $3B ; fire
	changeblock  13, 7, $3B ; fire
	changeblock  15, 7, $3B ; fire
	changeblock  13, 9, $59 ; fire
	changeblock  15, 9, $3B ; fire
	changeblock  13, 11, $3B ; fire
	changeblock  15, 11, $3B ; fire
	changeblock  13, 13, $59 ; fire
	changeblock  15, 13, $3B ; fire
	changeblock  13, 15, $3B ; fire
	changeblock  15, 15, $3B ; fire
	changeblock  13, 17, $59 ; fire
	changeblock  15, 17, $3B ; fire
	return
	
.doneGym
	return
	

	
RyukyuFakeGymPokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_EXPLODING_TRAP_19
	iftrue .AfterBattle
	writetext TrevorBeforeText
	waitbutton
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .TrevorFire
	checkevent EVENT_GOT_CRUIZE_FROM_OAK
	iftrue .TrevorGrass
	checkevent EVENT_GOT_FLAMBEAR_FROM_OAK
	iftrue .TrevorWater
	
.TrevorFire	
	writetext TrevorFireText
	waitbutton
	closetext
	winlosstext TrevorWinTextFake, TrevorLossTextFake
	loadtrainer POKEFANM, TREVOR2
	startbattle
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_19
	jump .AfterBattle
	end
	
.TrevorGrass	
	writetext TrevorGrassText
	waitbutton
	closetext
	winlosstext TrevorWinTextFake, TrevorLossTextFake
	loadtrainer POKEFANM, TREVOR1
	startbattle
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_19
	jump .AfterBattle
	end
	
.TrevorWater
	writetext TrevorWaterText
	waitbutton
	closetext
	winlosstext TrevorWinTextFake, TrevorLossTextFake
	loadtrainer POKEFANM, TREVOR3
	startbattle
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_19
.AfterBattle
	checkevent EVENT_EXPLODING_TRAP_20
	iftrue .AlreadyGotEgg2Water
	opentext ; was missing lmao
	writetext HaveStarter2Egg
	waitbutton
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .FireEgg
	checkevent EVENT_GOT_CRUIZE_FROM_OAK
	iftrue .GrassEgg
	checkevent EVENT_GOT_FLAMBEAR_FROM_OAK
	iftrue .WaterEgg

.GrassEgg
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullStarter2
	giveegg CHIKORITA, 5
	jump .Egg2

.FireEgg
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullStarter2
	giveegg FLAMBEAR, 5
	jump .Egg2
	
.WaterEgg
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullStarter2
	giveegg CRUIZE, 5
.Egg2
	stringtotext .eggname2, MEM_BUFFER_1
	scall .GetStarter2Egg
	setevent EVENT_EXPLODING_TRAP_20
.AlreadyGotEgg2Water
	writetext TakeGoodCareOfStarter2
	waitbutton
	closetext
	end
	
.PartyFullStarter2
	writetext NoRoomForStarter2
	waitbutton
	closetext
	end
	
.GetStarter2Egg:
	jumpstd receivetogepiegg
	end
	
.eggname2
	db "EGG@"
	
TrainerLassLindaGrass:
	trainer LASS, LINDA1, EVENT_BEAT_LASS_LINDA, LindaSeenText, LindaWinText, 0, .Script	

.Script:
	endifjustbattled
	opentext
	writetext LindaAfterBattleText
	waitbutton
	closetext
	end
	
TrainerLassLindaFire:
	trainer LASS, LINDA2, EVENT_BEAT_LASS_LINDA, LindaSeenText, LindaWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LindaAfterBattleText
	waitbutton
	closetext
	end
	
TrainerLassLindaWater:
	trainer LASS, LINDA3, EVENT_BEAT_LASS_LINDA, LindaSeenText, LindaWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LindaAfterBattleText
	waitbutton
	closetext
	end

	
TrainerYoungsterJasonGrass:
	trainer YOUNGSTER, JASON1, EVENT_BEAT_YOUNGSTER_JASON, JasonSeenText, JasonWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JasonAfterBattleText
	waitbutton
	closetext
	end
	
TrainerYoungsterJasonFire:
	trainer YOUNGSTER, JASON2, EVENT_BEAT_YOUNGSTER_JASON, JasonSeenText, JasonWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JasonAfterBattleText
	waitbutton
	closetext
	end
	
TrainerYoungsterJasonWater:
	trainer YOUNGSTER, JASON3, EVENT_BEAT_YOUNGSTER_JASON, JasonSeenText, JasonWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JasonAfterBattleText
	waitbutton
	closetext
	end

	
RyukyuFakeGymGuyScript:
	faceplayer
	opentext
	writetext GymGuyText
	waitbutton
	checkevent EVENT_EXPLODING_TRAP_19
	iftrue .GymGuyFakeGymAfter
	checkevent EVENT_GOT_CHIKORITA_FROM_OAK
	iftrue .GymGuyFire
	checkevent EVENT_GOT_CRUIZE_FROM_OAK
	iftrue .GymGuyGrass
	writetext GymGuyWaterText
	waitbutton
	closetext
	end
.GymGuyFire
	writetext GymGuyFireText
	waitbutton
	closetext
	end
.GymGuyGrass
	writetext GymGuyGrassText
	waitbutton
	closetext
	end
.GymGuyFakeGymAfter
	writetext GymGuyFakeGymAfterText
	waitbutton
	closetext
	end

GymGuyFakeGymAfterText:
	text "Desafiar un"
	line "GIMNASIO siempre"
	para "resulta divertido,"
	line "consigas una"
	cont "MEDALLA o no."
	done
	
GymGuyText:
	text "¿Qué es esto?"

	para "¿Un GIMNASIO"
	line "#MON?"

	para "Bueno, no del"
	line "todo."

	para "TRISTÁN siempre"
	line "quiso ser LÍDER de"
	cont "GIMNASIO."

	para "Aunque serlo de"
	line "manera oficial es"
	cont "un proceso largo y"
	cont "tedioso."

	para "¡Pero aquí"
	line "estamos, haciendo"
	para "lo que nos toca"
	line "hasta que pueda"
	cont "serlo de verdad!"
	done
	
GymGuyGrassText:
	text "Ah, sí. Él usa"
	line "#MON de tipo"
	cont "planta."

	para "Seguro que ya"
	line "sabes qué necesi-"
	cont "tas para ganar."
	done
	
GymGuyFireText:
	text "Ah, sí. Él usa"
	line "#MON de tipo"
	cont "fuego."

	para "Seguro que ya"
	line "sabes qué necesi-"
	cont "tas para ganar."
	done
	
GymGuyWaterText:
	text "Ah, sí. Él usa"
	line "#MON de tipo"
	cont "agua."

	para "Seguro que ya"
	line "sabes qué necesi-"
	cont "tas para ganar."
	done

TakeGoodCareOfStarter2:
	text "¡Cuida bien de ese"
	line "#MON!"

	para "¡Es uno de mis"
	line "favoritos!"
	done
	
HaveStarter2Egg:
	text "¡Vaya! ¡Menudo"
	line "combate!"

	para "Me siento como"
	line "todo un LÍDER de"
	para "GIMNASIO, incluso"
	line "aunque haya"
	cont "perdido."

	para "¡Como no puedo"
	line "darte una MEDALLA,"
	para "te daré un HUEVO"
	line "de un #MON"
	cont "raro de mi tipo"
	cont "favorito!"

	para "¡Esto es para ti!"
	done
	
NoRoomForStarter2:
	text "¡Espera!"
	line "¡Necesitas hacerle"
	cont "un hueco!"
	done


TrevorLossTextFake:
	text "¡Esto se me da"
	line "bien!"
	done
	
TrevorWinTextFake:
	text "¡Jaja! ¡Qué buena"
	line "experiencia!"
	done
	
TrevorBeforeText:
	text "¡Hola!"

	para "¡Bienvenido a mi"
	line "GIMNASIO!"

	para "Aunque no es uno"
	line "oficial…"

	para "¡Pero ya verás!"

	para "¡Un día seré LÍDER"
	line "de GIMNASIO!"
	
	para "Por ahora, solo"
	line "puedo actuar como"
	cont "tal."
	
	para "¡Y no hay nada que"
	line "me guste más que"
	cont "un buen combate!"
	done
	
TrevorGrassText:	
	text "¡Los #MON de"
	line "tipo planta son"
	cont "mis favoritos!"

	para "¡Sus hojas y sus"
	line "cepas acabarán"
	cont "contigo!"

	para "¿Estás listo?"
	done

TrevorFireText:	
	text "¡Los #MON de"
	line "tipo fuego son"
	cont "mis favoritos!"

	para "¡Sus hojas y sus"
	line "cepas acabarán"
	cont "contigo!"

	para "¿Estás listo?"
	done
	
TrevorWaterText:	
	text "¡Los #MON de"
	line "tipo agua son"
	cont "mis favoritos!"

	para "¡Sus hojas y sus"
	line "cepas acabarán"
	cont "contigo!"

	para "¿Estás listo?"
	done
	
JasonSeenText:
	text "¿Podrás con"
	line "este GIMNASIO?"
	done
	
JasonWinText:
	text "¡Me has"
	line "chamuscado!"
	done
	
JasonAfterBattleText:
	text "TRISTÁN siempre"
	line "quiso ser LÍDER de"
	cont "GIMNASIO."
	
	para "Espero que lo"
	line "sea algún día."
	done
	
LindaSeenText:
	text "¿A que es"
	line "divertido esto?"
	done
	
LindaWinText:
	text "¡Un GIMNASIO de"
	line "mentira es muy"
	cont "divertido!"
	done
	
LindaAfterBattleText:
	text "TRISTÁN es duro."
	line "¡Buena suerte!"
	done

	
RyukyuFakeGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 17, RYUKYU_CITY, 10
	warp_event  9, 17, RYUKYU_CITY, 10


	db 0 ; coord events

	db 0 ; bg events

	db 8 ; object events
	object_event  7, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassLindaGrass, 0
	object_event  7, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassLindaFire, 0
	object_event  7, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassLindaWater, 0
	object_event  7,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerYoungsterJasonGrass, 0
	object_event  7,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerYoungsterJasonFire, 0
	object_event  7,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerYoungsterJasonWater, 0
	object_event  9,  0, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RyukyuFakeGymPokefanMScript, -1
	object_event 10, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RyukyuFakeGymGuyScript, -1
