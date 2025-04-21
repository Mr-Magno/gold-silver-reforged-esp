	const_def 2 ; object constants
	const STANDGYM_OKERA
	const STANDGYM_GYMGUY2
	const STANDGYM_COOLTRAINER

StandGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
StandGymOkeraScript:
	faceplayer
	checkevent EVENT_REMATCH_AVAILABLE_OKERA
	iftrue rematchscriptOkera
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue postrematchscriptOkera
	
	opentext
	checkevent EVENT_BEAT_OKERA
	iftrue .FightDone
	writetext OkeraIntroText1
	waitbutton
	closetext
	winlosstext OkeraLossText, 0
	loadtrainer OKERA, OKERA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OKERA
	opentext
	writetext GetStormBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_STORMBADGE
	setmapscene STAND_CITY, SCENE_FUCHSIA_CITY_IMPOSTER
	checkcode VAR_BADGES
.FightDone:
	checkevent EVENT_GOT_TM46_THIEF
	iftrue .AlreadyGotTM
	writetext OkeraExplainBadgeText
	buttonsound
	verbosegiveitem TM_THIEF
	iffalse .BagFull
	setevent EVENT_GOT_TM46_THIEF
	writetext OkeraExplainTMText
	waitbutton
	closetext
	end

.AlreadyGotTM:
	writetext OkeraAfterText
	waitbutton
.BagFull:
	closetext
	end

rematchscriptOkera:
	opentext
	writetext OkeraRematchText
	waitbutton
	closetext
	winlosstext OkeraRematchWinText, 0
	loadtrainer OKERA, OKERA2
	startbattle
	reloadmapafterbattle
	clearevent EVENT_REMATCH_AVAILABLE_OKERA
	opentext
	writetext OkeraAfterRematchText
	waitbutton
	closetext
	end

postrematchscriptOkera:
	opentext
	writetext OkeraAfterRematchText
	waitbutton
	closetext
	end

OkeraRematchText:
	text "¿Qué quieres?"
	
	para "¿No eres ahora el"
	line "CAMPEÓN?"
	para "¿Quieres una"
	line "segunda MEDALLA o"
	cont "qué?"
	para "¡No creas que me"
	line "echaré para atrás"
	cont "contra un desafío"
	cont "como este!"
	done

OkeraRematchWinText:
	text "Bah…"
	done

OkeraAfterRematchText:
	text "No esperaba poder"
	line "ganar, pero nunca"
	cont "me echo atrás en"
	cont "un combate."

	para "Incluso si todo"
	line "está en mi contra."

	para "Tú eres igual,"
	line "¿no?"
	done

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets


StandGymStatue:
	checkflag ENGINE_STORMBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	trainertotext OKERA, OKERA1, MEM_BUFFER_1
	jumpstd gymstatue2
	

StandGymGuyScript2:
	faceplayer
	checkevent EVENT_BEAT_OKERA
	iftrue .StandGymGuyWinScript2
	opentext
	writetext StandGymGuyText2
	waitbutton
	closetext
	end

.StandGymGuyWinScript2:
	opentext
	writetext StandGymGuyWinText2
	waitbutton
	closetext
	end
	

TrainerCooltrainermAaron:
	trainer COOLTRAINERM, AARON, EVENT_BEAT_COOLTRAINERM_AARON, CooltrainermAaronSeenText, CooltrainermAaronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermAaronAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfKelly:
	trainer COOLTRAINERF, KELLY, EVENT_BEAT_COOLTRAINERF_KELLY, CooltrainerfKellySeenText, CooltrainerfKellyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfKellyAfterBattleText
	waitbutton
	closetext
	end
	
TrainerCooltrainerfIrene:
	trainer COOLTRAINERF, IRENE, EVENT_BEAT_COOLTRAINERF_IRENE, CooltrainerfIreneSeenText, CooltrainerfIreneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfIreneAfterText
	waitbutton
	closetext
	end
	
TrainerCooltrainerfJulia:
	trainer COOLTRAINERF, JULIA, EVENT_BEAT_COOLTRAINERF_JULIA, CooltrainerfJuliaSeenText, CooltrainerfJuliaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfJuliaAfterText
	waitbutton
	closetext
	end
	
TrainerCooltrainermBen:
	trainer COOLTRAINERM, BEN, EVENT_BEAT_COOLTRAINERM_BEN, CooltrainermBenSeenText, CooltrainermBenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermBenAfterBattleText
	waitbutton
	closetext
	end
	
TrainerCooltrainermRob:
	trainer COOLTRAINERM, ROB, EVENT_BEAT_COOLTRAINERM_ROB, CooltrainermRobSeenText, CooltrainermRobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermRobAfterBattleText
	waitbutton
	closetext
	end
	
LightSwitch:
	opentext
	writetext ItsASwitch
	yesorno
	iffalse .no
	closetext
	special FadeOutPalettes
	special FadeInPalettes
	special FadeOutPalettes
	special FadeInPalettes
	end
.no
	closetext
	end


CooltrainerfKellySeenText:
	text "¿Qué ves cuando"
	line "abres los ojos en"
	cont "la oscuridad?"
	done

CooltrainerfKellyBeatenText:
	text "Vale. He perdido."
	done

CooltrainerfKellyAfterBattleText:
	text "¿Dónde está"
	line "el LÍDER del"
	cont "GIMNASIO?"
	para "Vive en las"
	line "sombras, más allá"
	cont "de lo que puedas"
	cont "ver."
	done

CooltrainermAaronSeenText:
	text "¿Te da miedo la"
	line "oscuridad?"
	done

CooltrainermAaronBeatenText:
	text "¡Uauu…!"
	line "Buen combate."
	done

CooltrainermAaronAfterBattleText:
	text "El GIMNASIO no da"
	line "tanto miedo."

	para "Es solo que las"
	line "luces están"
	cont "apagadas."
	done

StandGymGuyText2:
	text "¡Hola, joven"
	line "promesa!"

	para "¡Esto está muy"
	line "oscuro!"

	para "VELASCO suele"
	line "estar de mal"
	para "humor, y le gusta"
	line "la oscuridad."

	para "Pero no dejes que"
	line "su edad y su"
	cont "temperamento te"
	cont "engañen."

	para "¡Es un entrenador"
	line "duro!"
	done
	
StandGymGuyWinText2:
	text "¡Sabía que no"
	line "tendrías miedo de"
	cont "la oscuridad!"
	done

OkeraIntroText1:
	text "Mmm…"
	
	para "¿Otro entrenador"
	line "con ganas de"
	cont "pasarlo mal?"

	para "¡Muy bien!"

	para "Sólo me hice LÍ-"
	line "DER de GIMNASIO"
	cont "porque mi viejo"
	cont "se jubiló."
	
	para "Los #MON"
	line "siniestros tienen"
	cont "una mala reputa-"
	cont "ción, ¿lo sabías?"
	

	para "¿Todavía quiere"
	line "combatir?"
	
	para "Entonces,"
	line "¡prepárate!"
	done


OkeraLossText:
	text "¡Bah!"
	para "He perdido."

	para "No eres un"
	line "cobarde."
	
	para "Toma la"
	line "MEDALLA OCASO."
	done

GetStormBadgeText:
	text "<PLAYER> recibió"
	line "la MEDALLA OCASO."
	done

OkeraExplainBadgeText:
	text "Con la MEDALLA"
	line "OCASO, te obedece-"
	cont "rán los #MON"
	cont "hasta el nivel 70."
	
	para "O algo así…"

	para "También, tus"
	line "#MON podrán"
	cont "usar GOLPE ROCA"
	cont "cuando no estén"
	cont "combatiendo."

	para "Me pillas de buen"
	line "humor, así que"
	cont "toma esto."
	done

OkeraExplainTMText:
	text "Se trata de"
	line "LADRÓN."

	para "Además de provocar"
	line "daño, puede robar"
	para "el objeto que"
	line "tenga equipado el"
	cont "oponente."
	done

OkeraAfterText:
	text "Ha sido un buen"
	line "combate."

	para "Tu desafío no me"
	line "ha hecho perder el"
	cont "tiempo."
	done
	
CooltrainerfIreneSeenText:
	text "¡Kiaaa! ¡Nos han"
	line "encontrado!"
	done

CooltrainerfIreneBeatenText:
	text "¡Ohhh!"
	line "¡Demasiado fuerte!"
	done

CooltrainerfIreneAfterText:
	text "La oscuridad puede"
	line "dar miedo."

	para "Pero también puede"
	line "dar seguridad."
	done
	
CooltrainerfJuliaSeenText:
	text "¿Crees en la mala"
	line "suerte?"
	done

CooltrainerfJuliaBeatenText:
	text "¡Yo desde luego"
	line "tengo mala suerte!"
	done

CooltrainerfJuliaAfterText:
	text "Esos interruptores"
	line "nunca han"
	cont "funcionado bien."
	done
	
CooltrainermBenSeenText:
	text "¡Necesitas domi-"
	line "nar la oscuridad"
	cont "para pasar por"
	cont "este GIMNASIO!"
	done

CooltrainermBenBeatenText:
	text "¡Demasiada luz!"
	done

CooltrainermBenAfterBattleText:
	text "Estaría bien si"
	line "las luces"
	cont "funcionaran…"
	done
	
CooltrainermRobSeenText:
	text "¿Sabías que la"	
	line "luz y la oscuri-"
	cont "dad son opuestos?"
	done

CooltrainermRobBeatenText:
	text "¡No veo…!"
	done

CooltrainermRobAfterBattleText:
	text "Y tú,"
	line "¿cuál prefieres?"
	done
	
ItsASwitch:
	text "Parece un"
	line "INTERRUPTOR…"
	
	para "Pone “DEFECTUOSO”."
	
	para "¿Lo pulsas?"
	line "todas formas?"
	done

StandGym_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 10, 23, STAND_CITY, 3
	warp_event 11, 23, STAND_CITY, 10
	warp_event  8, 13, STAND_GYM, 1

	db 0 ; coord events

	db 8 ; bg events
	bg_event  9, 21, BGEVENT_READ, StandGymStatue
	bg_event 12, 21, BGEVENT_READ, StandGymStatue
	bg_event 11, 18, BGEVENT_READ, LightSwitch
	bg_event  9,  0, BGEVENT_READ, LightSwitch
	bg_event 21,  2, BGEVENT_READ, LightSwitch
	bg_event 17,  8, BGEVENT_READ, LightSwitch
	bg_event  1, 12, BGEVENT_READ, LightSwitch
	bg_event 21, 12, BGEVENT_READ, LightSwitch

	db 8 ; object events
	object_event 10, 11, SPRITE_OKERA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, StandGymOkeraScript, EVENT_OKERA_AT_BASE
	object_event  8, 21, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, StandGymGuyScript2, -1
	object_event 20, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermAaron, -1
	object_event 23,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfKelly, -1
	object_event  5, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfIrene, -1
	object_event  7,  1, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfJulia, -1
	object_event 15,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermBen, -1
	object_event  3, 17, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermRob, -1

