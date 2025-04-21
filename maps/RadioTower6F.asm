	const_def 2 ; object constants
	const RADIOTOWER6F_TEACHER
	const RADIOTOWER6F_GENTLEMAN
	const RADIOTOWER6F_CLEFABLE
	const RADIOTOWER6F_CLEFABLE_SCARED
	const RADIOTOWER6F_GIOVANNI
	const RADIOTOWER6F_EXECUTIVE

RadioTower6F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
RadioTower6fClefable:	
	faceplayer
	opentext
	writetext RadioTower6FClefableText
	cry CLEFABLE
	waitbutton
	closetext
	end
	
RadioTower6fClefableTakeover:
	faceplayer
	opentext
	writetext RadioTower6FClefableText
	cry CLEFABLE
	waitbutton
	closetext
	end

RadioTower6fGentleman:
	faceplayer
	opentext
	writetext RadioTower6fGentlemanText
	waitbutton
	closetext
	end
	

RadioTower6fTeacher:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover6fTeacher
	writetext RadioTower6fTeacherText
	waitbutton
	closetext
	end
.MidRocketTakeover6fTeacher
	writetext RadioTower6fTeacherTextTakeover
	waitbutton
	closetext
	end
	
RadioTower6FDirectorsOfficeSign:
	jumptext RadioTower6FDirectorsOfficeSignText
	
RadioTower6fGiovanni:
	end
	

TrainerExecutive6F:
	trainer EXECUTIVEM, EXECUTIVEM_3, EVENT_BEAT_ROCKET_EXECUTIVEM_3, Executive6FSeenText, Executive6FBeatenText, 0, .Script

.Script:
	opentext
	writetext Executive6FAfterBattleText
	waitbutton
	closetext
	end
	
GiovanniEncounter:
	special FadeOutMusic
	applymovement PLAYER, TwoStepsToGiovanni
	pause 15
	opentext
	writetext GiovanniGreeting
	waitbutton
	closetext
	applymovement RADIOTOWER6F_GIOVANNI, GiovanniToPlayer
	opentext
	writetext GiovanniSpeech
	waitbutton
	closetext
	winlosstext GiovanniWinText, GiovanniLossText
	loadtrainer BOSS, GIOVANNI1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	turnobject RADIOTOWER6F_GIOVANNI, DOWN
	opentext
	writetext GiovanniAfterText
	waitbutton
	closetext
	applymovement RADIOTOWER6F_GIOVANNI, GiovanniLeaving
	turnobject PLAYER, UP
	opentext
	writetext GiovanniExitingText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear RADIOTOWER6F_GIOVANNI
	disappear RADIOTOWER6F_EXECUTIVE
	pause 15
	special FadeInQuickly
	pause 30
	setevent EVENT_CLEARED_RADIO_TOWER
	clearflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	setevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_GOLDENROD_CITY_CIVILIANS
	clearevent EVENT_RADIO_TOWER_CIVILIANS_AFTER
	setevent EVENT_TEAM_ROCKET_DISBANDED
	clearevent EVENT_STAND_CITY_ZOO_MONS_GONE
	special PlayMapMusic
	moveobject RADIOTOWER6F_GENTLEMAN, 3, 2
	appear RADIOTOWER6F_GENTLEMAN
	applymovement RADIOTOWER6F_GENTLEMAN, DirectorWalks
	showemote EMOTE_SHOCK, RADIOTOWER6F_GENTLEMAN, 15
	applymovement RADIOTOWER6F_GENTLEMAN, DirectorWalks2
	applymovement PLAYER, PlayerWalksToDirector
	opentext
	writetext DirectorThanksText
	buttonsound
	verbosegiveitem HM_ROCK_SMASH
	setevent EVENT_GOT_TM08_ROCK_SMASH
	writetext DirectorThanksText2
	waitbutton
	closetext
	setscene SCENE_RADIOTOWER6F_NOTHING; this scene is also set when you meet silver right at the beginning, then re set as part of the jump to radiotowerrockets
	setmapscene WESTPORT_CITY, SCENE_GOLDENROD_CITY_RIVAL
	end
	
TwoStepsToGiovanni:
	step DOWN
	step DOWN
	step DOWN
	turn_head RIGHT
	step_end
	
GiovanniToPlayer:
	step UP
	step LEFT
	step LEFT
	step DOWN
	turn_head LEFT
	step_end
	
GiovanniLeaving:
	step UP
	step LEFT
	step UP
	turn_head DOWN
	step_end
	
DirectorWalks:
	step DOWN
	step DOWN
	step_end
	
DirectorWalks2:
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	turn_head LEFT
	step_end
	
PlayerWalksToDirector:
	step RIGHT
	step_end
	
DirectorThanksText:
	text "¡Cielos!"
	
	para "¿A dónde han ido"
	line "esos impresenta-"
	cont "bles del TEAM"
	cont "ROCKET?"
	
	para "Me dejaron"
	line "atrapado en el"
	cont "sótano…"
	
	para "pero de repente"
	line "esos matones se"
	cont "fueron."

	para "¡Dejaron a mi"
	line "pobre CLEFABLE"
	cont "a solas!"
	
	para "¡Debo darte algo"
	line "para mostrarte"
	cont "mi gratitud!"
	
	para "¡Acepta ésto,"
	line "por favor!"
	done
	
DirectorThanksText2:
	text "Con este movimien-"
	line "to, tus #MON"
	para "podrán romper"
	line "rocas que bloquean"
	cont "algunos caminos."

	para "¡Seguro que le"
	line "darás más uso que"
	cont "yo!"

	para "¡No quiero salir"
	line "de esta oficina"
	cont "nunca más!"
	done
	
GiovanniWinText:
	text "¡No! ¡Otra vez no!"
	
	para "Mis planes…"
	
	para "Mis esfuerzos…"
	
	para "¡¿Todo ha sido en"
	line "vano?!"
	done
	
GiovanniLossText:
	text "Bah…"
	done
	
GiovanniGreeting:
	text "GIOVANNI: Ah…"

	para "Supongo que eres"
	line "uno de los dos"
	para "niños de los que"
	line "he oído hablar."
	
GiovanniSpeech:	
	para "Debes ser muy"
	line "valiente…"
	para "O muy necio."
	
	para "Soy el líder del"
	line "TEAM ROCKET."
	
	para "Me he esforzado"
	line "mucho por hacer"
	para "que mi organiza-"
	line "ción vuelva a su"
	cont "vieja gloria."
	
	para "Me recuerdas a"
	line "otro niño al que"
	cont "me enfrenté una"
	cont "vez."


	para "…"
	
	para "Lo detesto, no"
	line "sabes cuánto."

	para "Sé perfectamente"
	line "cuáles son tus"
	cont "erróneas"
	cont "intenciones."
	
	para "Quieres frustrar"
	line "mis planes."
	
	para "Pues no lo voy a"
	line "permitir."
	
	para "¡No esta vez!"
	
	para "Yo, GIOVANNI, el"
	line "poderoso LÍDER del"
	cont "TEAM ROCKET,"	
	para "¡acabaré contigo!"	
	done
	
GiovanniAfterText:
	text "¡N-No puede"
	line "estar ocurriendo!"
	
	para "No he fallado"
	line "una vez…"
	
	para "¡sino DOS!"
	
	para "Dos veces, he"
	line "intentado con-"	
	cont "quistar el mundo…"
	
	para "Dos veces, he"
	line "fallado…"	
	
	para "¡Y ambas frente"
	line "a un niño!"
	
	para "¿Cómo puedo mirar"
	line "a la cara a mi"
	cont "seguidores?"
	done
	
GiovanniExitingText:
	text "Muy bien…"
	
	para "Has sido mejor"
	line "que yo."
	
	para "Pero no es"
	line "el fin del"
	cont "TEAM ROCKET."
	
	para "Algún día"
	line "volveremos."	
	
	para "Y mis planes"
	line "cumplirán."
	
	para "Hasta que ese"
	line "día llegue…"
	
	para "¡Prepárate para"
	line "nuestro próximo"
	cont "encuentro!"	
	done
	
Executive6FSeenText:
	text "EJECUTIVO: ¡No!"

	para "¡No darás ni un"
	line "paso más!"
	
	para "¡Los mocosos como"
	line "tú no son dignos"
	cont "de reunirse con"
	cont "nuestro jefe!"
	
	para "¡Esto acaba aquí"
	line "y ahora!"
	done
	
Executive6FBeatenText:
	text "¡No!"
	
	para "¡GIOVANNI,"
	line "perdóneme!"
	done
	
Executive6FAfterBattleText:
	text "…"
	para "Ya no tengo más"
	line "ira que descargar"
	cont "contra ti."

	para "Si quieres"
	line "encontrarte con"
	cont "GIOVANNI, está"
	cont "justo delante."
	done
	
RadioTower6FDirectorsOfficeSignText:
	text "P5 OFICINA DEL"
	line "   DIRECTOR"
	done
	
RadioTower6FClefableText:
	text "CLEFABLE:"
	line "¡Clefa-ble!"
	done

RadioTower6fTeacherText:
	text "¡Esta es la"
	line "oficina del"
	para "DIRECTOR a cargo"
	line "de toda la"
	cont "realización!"
	done
	
RadioTower6fTeacherTextTakeover:
	text "¿Dónde ha ido el"
	line "DIRECTOR?"
	para "¡Espero que esté"
	line "bien!"
	done

RadioTower6fGentlemanText:
	text "¡Fundé la COMPAÑÍA"
	line "DE RADIO JOPM para"
	para "compartir mi amor"
	line "por los #MON!"

	para "Espero que tanto"
	line "la gente como los"
	para "#MON disfruten"
	line "de nuestros"
	cont "programas."
	done

RadioTower6F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  0, RADIO_TOWER_5F, 2

	db 1 ; coord events
	coord_event  3,  3, SCENE_DEFAULT, GiovanniEncounter

	db 1 ; bg events
	bg_event  3,  0, BGEVENT_READ, RadioTower6FDirectorsOfficeSign

	db 6 ; object events
	object_event  6,  2, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower6fTeacher, -1
	object_event  6,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower6fGentleman, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event  1,  6, SPRITE_FAIRY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower6fClefable, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event  0,  5, SPRITE_FAIRY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower6fClefableTakeover, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  6, SPRITE_GIOVANNI, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower6fGiovanni, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  2,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerExecutive6F, EVENT_RADIO_TOWER_ROCKET_TAKEOVER

