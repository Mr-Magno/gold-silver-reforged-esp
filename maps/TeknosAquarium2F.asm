	const_def 2 ; object constants
	const AQUA2F_ROCKET1
	const AQUA2F_ROCKET3
	const AQUA2F_POKEFAN_M
	const AQUA2F_POKEFAN_F
	const AQUA2F_WHITNEY

TeknosAquarium2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


TrainerGruntM1:
	trainer GRUNTM, GRUNTM_1, EVENT_BEAT_ROCKET_GRUNTM_1, GruntM1SeenText, GruntM1BeatenText, 0, .Script

.Script:
	clearevent WHITNEY_DEFEATS_ROCKETS
	opentext
	writetext TrainerGruntM1WhenTalkText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear AQUA2F_ROCKET1
	disappear AQUA2F_ROCKET3
	pause 15
	special FadeInQuickly
	clearflag ENGINE_ROCKETS_IN_MAHOGANY
	pause 8
	special PlayMapMusic
	setevent EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	setevent EVENT_WHITNEY_IN_BOULDER_MINES
	setevent EVENT_WHITNEY_BACK_IN_GYM
	setevent WHITNEY_FIGHTING_ROCKETS
	appear AQUA2F_WHITNEY
	applymovement AQUA2F_WHITNEY, WhitneyToPlayerAfterRocket
	turnobject AQUA2F_WHITNEY, UP
	turnobject PLAYER, DOWN
	opentext
	writetext WhitneyWayToGoText
	waitbutton
	closetext
	applymovement AQUA2F_WHITNEY, WhitneyAwayfromPlayerAfterRocket
	disappear AQUA2F_WHITNEY
	setevent WHITNEY_DEFEATS_ROCKETS
	end
	
	
WhitneyToPlayerAfterRocket:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end
	
WhitneyAwayfromPlayerAfterRocket:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

TrainerGruntM3:
	trainer GRUNTM, GRUNTM_3, EVENT_BEAT_ROCKET_GRUNTM_3, GruntM3SeenText, GruntM3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM3AfterBattleText
	waitbutton
	closetext
	end

AquaPokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	iftrue .PokefanMNoRockets
	writetext AquaPokefanMRocketsText
	waitbutton
	closetext
	end

.PokefanMNoRockets:
	writetext AquaPokefanMNoRocketsText
	waitbutton
	closetext
	end
	
AquaPokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	iftrue .PokefanFNoRockets
	writetext AquaPokefanFRocketsText
	waitbutton
	closetext
	end

.PokefanFNoRockets:
	writetext AquaPokefanFNoRocketsText
	waitbutton
	closetext
	end
	
Aqua2FExhibit1Script:
	jumptext Aqua2FExhibit1Text

Aqua2FExhibit2Script:
	jumptext Aqua2FExhibit2Text
	
Aqua2FExhibit3Script:
	jumptext Aqua2FExhibit3Text
	
Aqua2FExhibit1Text:
	text "Los GUPGOLD son"
	line "de los #MON"
	para "acuáticos más"
	line "pequeños."
	done

WhitneyWayToGoText:
	text "¡Estupendo,"
	line "<PLAY_G>!"
	
	para "¡Les has enseñado"
	line "quién manda!"
	
	para "El TEAM ROCKET no"
	line "volverá a hacer"
	cont "daño a estos"
	cont "#MON acuáticos."
	
	para "Oye…"
	
	para "¡Eres muy fuerte!"

	para "¿Por qué no te"
	line "pasas más tarde"
	cont "por mi GIMNASIO?"
	
	para "¡Me encantaría"
	line "combatir contigo!"
	
	para "Hablando de eso,"
	line "¡será mejor que"
	cont "vuelva!"
	
	para "¡Nos vemos!"
	done
	

Aqua2FExhibit2Text:
	text "NUEVA EXHIBICIÓN"
	line "PRÓXIMAMENTE"
	done
	
Aqua2FExhibit3Text:
	text "Los TURBAN"
	line "pueden sobrevivir"
	para "en tierra firme y"
	line "bajo el agua."

	para "Tienen una simbio-"
	line "sis única con la"
	cont "familia de los"
	cont "SLOWPOKE."
	done

GruntM1SeenText:
	text "¿Qué quieres?"

	para "¡Si nos molestas,"
	line "no esperes"
	cont "misericordia!"
	done

GruntM1BeatenText:
	text "Lo hiciste bien"
	line "hoy, pero… ¡espera"
	cont "a la próxima vez!"
	done

TrainerGruntM1WhenTalkText:
	text "¡Maldita sea!"
	para "¡No puedo creer"
	line "que nuestros pla-"
	cont "nes los haya"
	cont "frustrado un"
	cont "niño!"

	para "Vergonzoso…"

	para "Pero no importa."
	
	para "Tenemos muchas"
	line "otras formas de"
	cont "conseguir dinero."

	para "¡Aún no has visto"
	line "lo peor!"
	done
	

GruntM3SeenText:
	text "¡Ya veréis qué"
	line "horribles somos!"
	done

GruntM3BeatenText:
	text "¡Demasiado fuerte!"
	line "Te vigilaremos…"
	done

GruntM3AfterBattleText:
	text "Eres muy fuerte."

	para "Lo que hagamos"
	line "aquí no es la"
	para "parte más"
	line "importante de"
	cont "nuestro plan."

	para "Eres simplemente"
	line "una distracción."
	done
	
AquaPokefanMRocketsText:
	text "Asumo que estos"
	line "canallas no"
	cont "trabajan aquí."
	done
	
AquaPokefanMNoRocketsText:
	text "¿Esos tipos eran"
	line "del TEAM ROCKET?"
	para "Creía que se"
	line "habían disuelto el"
	cont "año pasado."
	done
	
AquaPokefanFRocketsText:
	text "Demasiado para lo"
	line "que iba a ser un"
	cont "día tranquilo."
	done
	
AquaPokefanFNoRocketsText:
	text "Nunca me gustaron"
	line "tanto los peces de"
	cont "todas formas."
	done

TeknosAquarium2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  0,  7, TEKNOS_AQUARIUM_1F, 3

	db 0 ; coord events

	db 3 ; bg events
	bg_event  3,  3, BGEVENT_READ, Aqua2FExhibit1Script
	bg_event  7,  3, BGEVENT_READ, Aqua2FExhibit2Script
	bg_event 11,  3, BGEVENT_READ, Aqua2FExhibit3Script

	db 5 ; object events
	object_event 15,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, TrainerGruntM1, EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	object_event  5,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerGruntM3, EVENT_AQUARIUM_ROCKET_TAKEOVER_ACTIVE
	object_event  7,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AquaPokefanMScript, -1
	object_event 10,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AquaPokefanFScript, -1
	object_event  9,  5, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WhitneyAquariumScript, WHITNEY_DEFEATS_ROCKETS
