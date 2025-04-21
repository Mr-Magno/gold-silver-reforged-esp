	const_def 2 ; object constants
	const BLUEFORESTGYM_PRYCE
	const BLUEFORESTGYM_BUENA1
	const BLUEFORESTGYM_ROCKER1
	const BLUEFORESTGYM_BUENA2
	const BLUEFORESTGYM_ROCKER2
	const BLUEFORESTGYM_ROCKER3
	const BLUEFORESTGYM_GYM_GUY

BlueForestGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlueForestGymPryceScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_PRYCE
	iftrue Rematchscriptpryce
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue Postrematchscriptpryce
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .FightDone
	writetext PryceText_Intro
	waitbutton
	closetext
	winlosstext PryceText_Impressed, 0
	loadtrainer PRYCE, PRYCE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PRYCE
	opentext
	writetext Text_ReceivedGlacierBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_GLACIERBADGE
	checkcode VAR_BADGES
	scall BlueForestGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM16_ICY_WIND
	iftrue PryceScript_Defeat
	setevent EVENT_BEAT_SKIER_ROXANNE
	setevent EVENT_BEAT_SKIER_CLARISSA
	setevent EVENT_BEAT_BOARDER_RONALD
	setevent EVENT_BEAT_BOARDER_BRAD
	setevent EVENT_BEAT_BOARDER_DOUGLAS
	setevent EVENT_ROUTE_112_WORKERS_AT_STAND_GATE
	setevent EVENT_STAND_CITY_ZOO_MONS_GONE
	writetext PryceText_GlacierBadgeSpeech
	buttonsound
	verbosegiveitem TM_ICY_WIND
	iffalse BlueForestGym_NoRoomForIcyWind
	setevent EVENT_GOT_TM16_ICY_WIND
	writetext PryceText_IcyWindSpeech
	waitbutton
	closetext
	end

PryceScript_Defeat:
	writetext PryceText_CherishYourPokemon
	waitbutton
BlueForestGym_NoRoomForIcyWind:
	closetext
	end

Rematchscriptpryce:
	opentext
	writetext PryceRematchText
	waitbutton
	closetext
	winlosstext PryceRematchWinText, 0
	loadtrainer PRYCE, PRYCE2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_PRYCE
	opentext
	writetext PryceAfterRematchText
	waitbutton
	closetext
	end

Postrematchscriptpryce:
	opentext
	writetext PryceAfterRematchText
	waitbutton
	closetext
	end

PryceRematchText:
	text "Así que ya has"
	line "vuelto de la LIGA."
	
	para "No debes asumir"
	line "que estás por"
	para "encima de los"
	line "gélidos vientos de"
	para "las montañas por"
	line "haber escalado"
	cont "hasta la cima."
	
	para "¡Permíteme mos-"
	line "trarte el arsenal"
	cont "de todo cuanto he"
	cont "aprendido!"
	done

PryceRematchWinText:
	text "Quizás hay algo"
	line "que es propio de"
	cont "la juventud…"
	done

PryceAfterRematchText:
	text "Me impresiona"
	line "tu valor."

	para "Con tu gran"
	line "voluntad, sé que"
	para "puedes superar"
	line "todos los"
	cont "obstáculos."
	done

BlueForestGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerSkierRoxanne:
	trainer SKIER, ROXANNE, EVENT_BEAT_SKIER_ROXANNE, SkierRoxanneSeenText, SkierRoxanneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierRoxanneAfterBattleText
	waitbutton
	closetext
	end

TrainerSkierClarissa:
	trainer SKIER, CLARISSA, EVENT_BEAT_SKIER_CLARISSA, SkierClarissaSeenText, SkierClarissaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierClarissaAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderRonald:
	trainer BOARDER, RONALD, EVENT_BEAT_BOARDER_RONALD, BoarderRonaldSeenText, BoarderRonaldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderRonaldAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderBrad:
	trainer BOARDER, BRAD, EVENT_BEAT_BOARDER_BRAD, BoarderBradSeenText, BoarderBradBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderBradAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderDouglas:
	trainer BOARDER, DOUGLAS, EVENT_BEAT_BOARDER_DOUGLAS, BoarderDouglasSeenText, BoarderDouglasBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderDouglasAfterBattleText
	waitbutton
	closetext
	end

BlueForestGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_PRYCE_IN_GYM
	iftrue .PryceNotAround
	checkevent EVENT_BEAT_PRYCE
	iftrue .BlueForestGymGuyWinScript
	writetext BlueForestGymGuyText
	waitbutton
	closetext
	end
	
.PryceNotAround:
	writetext BlueForestGymGuyNotAroundText
	waitbutton
	closetext
	end

.BlueForestGymGuyWinScript:
	writetext BlueForestGymGuyWinText
	waitbutton
	closetext
	end

BlueForestGymStatue:
	checkflag ENGINE_GLACIERBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext PRYCE, PRYCE1, MEM_BUFFER_1
	jumpstd gymstatue2

BlueForestGymGuyNotAroundText:
	text "¡Eh, chico!"

	para "¡FREDO es un"
	line "combatiente frío"
	cont "como el hielo!"
	
	para "Ahora mismo está"
	line "entrenando"
	para "severamente en el"
	line "PASAJE ABISAL."
	
	para "Se trata de una"
	line "cueva no muy"
	cont "lejos de aquí."
	
	para "Si quieres comba-"
	line "tir, a lo mejor"
	cont "te conviene ir a"
	cont "buscarlo."
	done

PryceText_Intro:
	text "Me alegra volver a"
	line "verte."

	para "Los #MON"
	line "tienen muchas"
	para "experiencias a lo"
	line "largo de sus"
	para "vidas, al igual"
	line "que nosotros."

	para "Yo también he"
	line "visto y sufrido"
	cont "mucho durante mi"
	cont "vida."
	
	para "Es por ello por"
	line "lo que la fami-"
	cont "lia es importante."
	
	para "Asegúrate de"
	line "dedicar tiempo a"
	cont "aquello que"
	cont "aprecias."

	
	para "Sin embargo, un"
	line "buen combate"
	para "sigue siendo una"
	line "experiencia impor-"
	cont "tante."
	
	para "Permíteme"
	line "enseñarte de lo"
	cont "que hablo…"
	done

PryceText_Impressed:
	text "¡Ah! Me impresiona"
	line "tu valor."

	para "Con tu gran"
	line "voluntad, sé que"
	para "superarás todos"
	line "los obstáculos."

	para "¡Te mereces esta"
	line "MEDALLA!"
	done

Text_ReceivedGlacierBadge:
	text "<PLAYER> recibió la"
	line "MEDALLA GLACIAR."
	done

PryceText_GlacierBadgeSpeech:
	text "Esta MEDALLA sube"
	line "las habilidades"
	cont "ESPECIALES de los"
	cont "#MON."

	para "Y tus #MON"
	line "usarán TORBELLINO"
	para "para pasar los"
	line "torbellinos."

	para "¡Además, te voy a"
	line "hacer un regalo!"
	done

PryceText_IcyWindSpeech:
	text "Esta MT contiene"
	line "VIENTO HIELO."

	para "Causa daño y baja"
	line "la velocidad."

	para "Demuestra la dure-"
	line "za del invierno."
	done

PryceText_CherishYourPokemon:
	text "La primavera llega"
	line "cuando se derrite"
	para "el hielo y la"
	line "nieve."

	para "Tú y tus #MON"
	line "pasaréis juntos"
	cont "muchos años."

	para "¡Pasadlo bien!"
	done

BoarderBradSeenText:
	text "Este GIMNASIO"
	line "tiene un suelo"
	para "resbaladizo. ¿A"
	line "que es divertido?"

	para "¡Pero oye, aquí no"
	line "estamos jugando!"
	done

BoarderBradBeatenText:
	text "¿Ves lo serios"
	line "que somos?"
	done


BoarderBradAfterBattleText:
	text "Este GIMNASIO es"
	line "genial. ¡Me"
	para "encanta patinar"
	line "con mis #MON!"
	done

BoarderDouglasSeenText:
	text "Conozco el secreto"
	line "de FREDO."
	done

BoarderDouglasBeatenText:
	text "Te contaré el"
	line "secreto de FREDO."
	done

BoarderDouglasAfterBattleText:
	text "El secreto del"
	line "poder de FREDO…"

	para "Entrena en condi-"
	line "ciones extremas en"
	cont "el PASAJE ABISAL."
	done

SkierRoxanneSeenText:
	text "Para vencer a"
	line "FREDO, el LÍDER"
	para "del GIMNASIO,"
	line "piensa antes de"
	cont "patinar."
	done

SkierRoxanneBeatenText:
	text "¡No perderé ante"
	line "ti esquiando!"
	done

SkierRoxanneAfterBattleText:
	text "Si no patinas con"
	line "precisión, no"
	para "lograrás nada en"
	line "este GIMNASIO."
	done


BlueForestGymGuyText:
	text "FREDO es veterano."
	line "Lleva entrenando"

	para "#MON desde hace"
	line "50 años."

	para "Dicen que es bueno"
	line "congelando a sus"
	para "rivales con los"
	line "ataques de hielo."

	para "¡Eso quiere decir"
	line "que deberías"
	para "derretirle con tu"
	line "ardiente ambición!"
	done

BlueForestGymGuyWinText:
	text "¡FREDO es bueno,"
	line "pero tú eres aún"
	cont "mejor!"

	para "¡Ha sido un gran"
	line "combate que acortó"
	para "distancias entre"
	line "generaciones!"
	done
	
SkierClarissaSeenText:
	text "¡Mira qué bien lo"
	line "hago!"
	done

SkierClarissaBeatenText:
	text "¡No! ¡He perdido!"
	done

SkierClarissaAfterBattleText:
	text "No debería haber"
	line "presumido sobre mi"
	cont "forma de esquiar."
	done
	
BoarderRonaldSeenText:
	text "¡Congelaré a"
	line "tus #MON, así"
	cont "no podrás hacer"
	cont "nada!"
	done

BoarderRonaldBeatenText:
	text "¡Maldición! No"
	line "pude hacer nada."
	done

BoarderRonaldAfterBattleText:
	text "Creo que hay un"
	line "movimiento que"

	para "un #MON puede"
	line "usar mientras"
	cont "está congelado."
	done

BlueForestGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, BLUE_FOREST, 1
	warp_event  5, 17, BLUE_FOREST, 11

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, BlueForestGymStatue
	bg_event  6, 15, BGEVENT_READ, BlueForestGymStatue

	db 7 ; object events
	object_event  3,  2, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BlueForestGymPryceScript, EVENT_PRYCE_IN_GYM
	object_event  9,  9, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierRoxanne, EVENT_PRYCE_IN_GYM
	object_event  9,  2, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderRonald, EVENT_PRYCE_IN_GYM
	object_event  0, 17, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierClarissa, EVENT_PRYCE_IN_GYM
	object_event  5,  7, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderBrad, EVENT_PRYCE_IN_GYM
	object_event  0,  2, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderDouglas, EVENT_PRYCE_IN_GYM
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlueForestGymGuyScript, -1
