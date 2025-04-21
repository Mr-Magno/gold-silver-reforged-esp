	const_def 2 ; object constants
	const TEAMROCKETBASEB1F_POKE_BALL1
	const TEAMROCKETBASEB1F_POKE_BALL2
	const TEAMROCKETBASEB1F_POKE_BALL3
	const TEAMROCKETBASEB1F_GRUNT1
	const TEAMROCKETBASEB1F_GRUNT2
	const TEAMROCKETBASEB1F_GRUNT3
	const TEAMROCKETBASEB1F_GRUNT4
	const TEAMROCKETBASEB1F_GRUNT5
	const TEAMROCKETBASEB1F_IMPOSTER
	const TEAMROCKETBASEB1F_EXECUTIVE
	const TEAMROCKETBASEB1F_OKERA
	const TEAMROCKETBASEB1F_IMPOSTER2
	const TEAMROCKETBASEB1F_OKERA2

TeamRocketBaseB2FOffice_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TeamRocketBaseB2FOfficeHyperPotion:
	itemball HYPER_POTION

TeamRocketBaseB2FOfficeNugget:
	itemball NUGGET

TeamRocketBaseB2FOfficeGuardSpec:
	itemball GUARD_SPEC

TeamRocketBaseB2FOfficeHiddenRevive:
	hiddenitem REVIVE, EVENT_TEAM_ROCKET_BASE_B1F_HIDDEN_REVIVE
	
RocketBossRoomGrunt1:
	jumptextfaceplayer RocketBossRoomGrunt1Text

RocketBossRoomGrunt2:
	jumptextfaceplayer RocketBossRoomGrunt2Text

RocketBossRoomGrunt3:
	jumptextfaceplayer RocketBossRoomGrunt3Text

RocketBossRoomGrunt4:
	jumptextfaceplayer RocketBossRoomGrunt4Text

RocketBossRoomGrunt5:
	jumptextfaceplayer RocketBossRoomGrunt5Text
	
ImposterScript:
	jumptext ImposterFighting
	
OkeraScript:
	jumptext OkeraFighting
	
	
ImposterConfrontationScene:
	showemote EMOTE_SHOCK, TEAMROCKETBASEB1F_IMPOSTER, 15
	turnobject PLAYER, UP
	applymovement PLAYER, PlayerStepsBack
	applymovement TEAMROCKETBASEB1F_IMPOSTER, ImposterStepsToPlayer
	jump ConfrontationScript
	end
	
ImposterConfrontationScene2:
	showemote EMOTE_SHOCK, TEAMROCKETBASEB1F_IMPOSTER, 15
	applymovement TEAMROCKETBASEB1F_IMPOSTER, ImposterStepsToPlayer
	turnobject PLAYER, UP
	jump ConfrontationScript
	end
	
ExecutiveConfrontationScene:
	applymovement PLAYER, PlayerWalksToExecutive
	jump ExecutiveScript
	end
	
ExecutiveConfrontationScene2:
	applymovement PLAYER, PlayerWalksToExecutive2
	jump ExecutiveScript
	end
	
ExecutiveConfrontationScene3:
	applymovement PLAYER, PlayerWalksToExecutive3
	jump ExecutiveScript
	end
	
ConfrontationScript:
	opentext
	writetext ImposterConfront
	waitbutton
	closetext
	winlosstext Imposter2WinText, Imposter2LossText
	loadtrainer IMPOSTER, IMPOSTER2
	startbattle
	reloadmapafterbattle	
	opentext
	writetext ImposterConfront2
	waitbutton
	closetext
	setevent EVENT_IMPOSTER_FIGHTING_OKERA_2
	clearevent EVENT_IMPOSTER_FIGHTING_OKERA
	moveobject TEAMROCKETBASEB1F_OKERA, 9, 9
	appear TEAMROCKETBASEB1F_OKERA
	applymovement TEAMROCKETBASEB1F_OKERA, OkeraRuns
	turnobject TEAMROCKETBASEB1F_IMPOSTER, RIGHT
	playsound SFX_TACKLE
	applymovement TEAMROCKETBASEB1F_IMPOSTER, OkeraBumpsIntoImposter	
	opentext
	writetext OkeraWatchIt
	waitbutton
	closetext
	showemote EMOTE_SHOCK, TEAMROCKETBASEB1F_OKERA, 15
	opentext
	writetext OkeraConfront
	waitbutton
	closetext
	turnobject TEAMROCKETBASEB1F_OKERA, DOWN
	opentext
	writetext OkeraConfront2
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB1F_OKERA, OkeratoImposter
	appear TEAMROCKETBASEB1F_OKERA2
	disappear TEAMROCKETBASEB1F_OKERA
	appear TEAMROCKETBASEB1F_IMPOSTER2
	disappear TEAMROCKETBASEB1F_IMPOSTER
	setscene SCENE_EXECUTIVE
	end
	
ExecutiveScript:
	pause 10
	opentext
	writetext TheExecutiveGreeting
	waitbutton
	closetext
	winlosstext ExecutiveWinText, ExecutiveLossText
	loadtrainer EXECUTIVEM, EXECUTIVEM_2
	startbattle
	reloadmapafterbattle
	opentext
	writetext ExecutiveSceneAfterBattleText
	waitbutton
	closetext
	applymovement TEAMROCKETBASEB1F_EXECUTIVE, ExecutiveLeavesOffice
	turnobject PLAYER, DOWN
	disappear TEAMROCKETBASEB1F_EXECUTIVE
	disappear TEAMROCKETBASEB1F_OKERA2
	disappear TEAMROCKETBASEB1F_IMPOSTER2
	pause 15
	turnobject PLAYER, UP
	pause 15
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, NoticeComputer
	turnobject PLAYER, UP
	opentext
	writetext ComputerIsOn
	waitbutton
	closetext
	setevent EVENT_IMPOSTER_FIGHTING_OKERA
	clearevent EVENT_OKERA_AT_BASE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	setscene SCENE_TEAMROCKETBASEB1F_NOTHING
	end
	
TeamRocketBaseB2FOfficePassword:
	opentext
	writetext BadSecurityPractices
	waitbutton
	closetext
	setevent EVENT_ROUTE_30_BATTLE
	end
	
PlayerStepsUpToImposter:
	step UP
	step_end
	
NoticeComputer:
	step RIGHT
	step RIGHT
	step_end
	
ImposterStepsToPlayer:
	step DOWN
	step_end
	
PlayerStepsBack:
	fix_facing
	step DOWN
	remove_fixed_facing
	step_end
	
OkeraRuns:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step LEFT
	step_end
	
OkeraBumpsIntoImposter:
	fix_facing
	fast_jump_step LEFT
	remove_fixed_facing
	step_end
	
OkeratoImposter:
	step LEFT
	step LEFT
	step_end
	
PlayerWalksToExecutive:
	step UP
	step UP
	step UP
	step RIGHT
	step UP
	step_end

PlayerWalksToExecutive2:
	step UP
	step UP
	step UP
	step UP
	step_end
	
PlayerWalksToExecutive3:
	step UP
	step UP
	step UP
	step LEFT
	step UP
	step_end

ExecutiveLeavesOffice:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end
	
ComputerIsOn:
	text "Parece que"
	line "todavía hay"
	cont "algo en la"
	cont "pantalla…"
	done
	
RocketBossRoomGrunt1Text:
	text "Estos son los úl-"
	line "timos preparativos"
	para "antes de que"
	line "nuestra máquina"
	cont "esté totalmente"
	cont "lista."

	para "¡Estoy seguro de"
	line "que ya no hay nada"
	para "que pueda interpo-"
	line "nerse en nuestro"
	cont "plan!"
	done
	
RocketBossRoomGrunt2Text:
	text "El OAK IMPOSTOR"
	line "hizo un gran tra-"
	para "bajo convenciendo"
	line "a la gente de"
	para "CIUDAD ENHIESTA de"
	line "que no se preocu-"
	cont "pasen por lo que"
	cont "hiciésemos aquí."
	done
	
RocketBossRoomGrunt3Text:
	text "El EJECUTIVO es la"
	line "única persona que"
	para "conoce la contra-"
	line "seña para apagar"
	para "la antena de"
	line "control mental."

	para "Aunque es muy"
	line "olvidadizo…"
	done
	
RocketBossRoomGrunt4Text:
	text "¡El mundo no sabe"
	line "lo que le espera"
	para "cuando nuestra"
	line "máquina esté"
	para "cargada al máximo"
	line "y hagamos que"
	para "todos los #MON"
	line "trabajen para"
	cont "nosotros!"
	done
	
RocketBossRoomGrunt5Text:
	text "¡Según mis"
	line "cálculos, la señal"
	para "de control mental"
	line "debería estar a"
	para "pleno rendimiento"
	line "la semana que"
	cont "viene!"
	done
	
BadSecurityPractices:
	text "¿Qué es esto?"
	
	para "¡Es la contraseña"
	line "de la consola!"
	
	para "…"
	
	para "¡<PLAY_G> memorizó"
	line "la contraseña!"
	done
	
ExecutiveSceneAfterBattleText:
	text "¡Argh!"

	para "Me habrás ganado"
	line "en un combate,"
	cont "pero poco importa."

	para "¡A nuestra máquina"
	line "le falta cada vez"
	para "menos para que se"
	line "cargue al máximo!"

	para "Tus #MON me"
	line "habrán derrotado"
	para "ahora, ¡pero no"
	line "importará cuando"
	cont "estén bajo mi"
	cont "control!"

	para "Ahora, si me"
	line "disculpas, ¡tengo"
	para "asuntos importan-"
	line "tes que atender!"
	done
	
ExecutiveWinText:
	text "¡No me lo puedo"
	line "creer!"
	done
	
ExecutiveLossText:
	text "¡JÁ!"
	done
	
Imposter2WinText:
	text "¿¡Q-Qué!?"
	line "¿¡C-Cómo!?"
	done
	
Imposter2LossText:
	text "¡JÁ!"
	done
	
TheExecutiveGreeting:
	text "¿Entiendes en el"
	line "lío que te has"
	cont "metido?"
	
	para "…"
	
	para "Me recuerdas,"
	line "¿verdad?"
	
	para "Fui el CAPITÁN del"
	line "barco de"
	cont "cargamento."
	
	para "Pero por encima de"
	line "todo, soy el prin-"
	cont "cipal EJECUTIVO"
	cont "del TEAM ROCKET."
	
	para "Solo estoy por"
	line "detrás de nuestro"
	cont "líder, GIOVANNI."
	
	para "Así que has"
	line "averiguado lo que"
	cont "estamos haciendo…"
	
	para "¡Hemos fabricado"
	line "un dispositivo que"
	para "emite una potente"
	line "onda que puede"
	para "usarse para"
	line "controlar la mente"
	cont "de los #MON!"
	
	para "¡Muy pronto, todos"
	line "los #MON obede-"
	cont "cerán las órdenes"
	cont "del TEAM ROCKET!"

	para "¡Les daremos mejor"
	line "uso del que nadie"
	cont "podría darles!"
	
	para "¡Me niego a dejar"
	line "que te sigas"
	cont "interponiendo en"
	cont "nuestro camino!"
	done
	
	
ImposterConfront:
	text "¡Pequeña rata!"

	para "Sabía que eras"
	line "fuerte, ¿pero"
	
	para "tanto como para"
	line "derrotar a nues-"
	cont "tros guardas?"
	
	para "¡Inaceptable!"
	
	para "¡Acabaré con tu"
	line "cruzada aquí"
	cont "y ahora!"
	
	para "¡No me pienso"
	line "contener!"
	done
	
ImposterConfront2:
	text "¡No!"

	para "¡Me niego a"
	line "aceptarlo!"
	
	para "Puede que no ten-"
	line "gas la contraseña,"
	
	para "pero no quiero"
	line "arriesgarme."
	
	para "No molestarás al"
	line "EJECUTIVO."
	
	para "Me desharé de ti"
	line "sea como sea…"
	done
	
OkeraWatchIt:	
	text "VELASCO: ¡Ey!"
	line "¡Cuidado!"
	done
	
OkeraConfront:
	text "¡Tú!"

	para "¡Te he estado"
	line "buscando, abuelo!"
	
	para "Construir una"
	line "señal en mi pue-"
	
	para "blo, perturbar"
	line "mi pacífica y"
	cont "tranquila vida…"
	
	para "¡Tienes mucha"
	line "cara, vejestorio!"
	done
	
OkeraConfront2:
	text "¡Eh, chaval!"
	
	para "Me encargaré del"
	line "viejo."
	
	para "Tú sigue adelante."
	done
	
ImposterFighting:
	text "Uff…"
	
	para "Nuestros planes"
	line "seguirán adelante…"
	done
	
OkeraFighting:
	text "¿Te crees duro,"
	line "vejestorio?"
	done

TeamRocketBaseB2FOffice_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 24, 17, TEAM_ROCKET_BASE_B2F, 4
	warp_event 25, 17, TEAM_ROCKET_BASE_B2F, 5

	db 5 ; coord events
	coord_event  7, 12, SCENE_DEFAULT, ImposterConfrontationScene
	coord_event  7, 13, SCENE_DEFAULT, ImposterConfrontationScene2
	coord_event  3,  8, SCENE_EXECUTIVE, ExecutiveConfrontationScene
	coord_event  4,  8, SCENE_EXECUTIVE, ExecutiveConfrontationScene2
	coord_event  5,  8, SCENE_EXECUTIVE, ExecutiveConfrontationScene3


	db 3 ; bg events
	bg_event  9,  1, BGEVENT_ITEM, TeamRocketBaseB2FOfficeHiddenRevive
	bg_event  6,  1, BGEVENT_READ, TeamRocketBaseB2FOfficePassword
	bg_event  7,  1, BGEVENT_READ, TeamRocketBaseB2FOfficePassword


	db 13 ; object events
	object_event  9, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB2FOfficeHyperPotion, EVENT_TEAM_ROCKET_BASE_B1F_HYPER_POTION
	object_event 16,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB2FOfficeNugget, EVENT_TEAM_ROCKET_BASE_B1F_NUGGET
	object_event 24,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TeamRocketBaseB2FOfficeGuardSpec, EVENT_TEAM_ROCKET_BASE_B1F_GUARD_SPEC
	object_event 21,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt1, EVENT_STAND_CITY_ROCKETS_DEPARTED
	object_event 28,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt2, EVENT_STAND_CITY_ROCKETS_DEPARTED
	object_event 22, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt3, EVENT_STAND_CITY_ROCKETS_DEPARTED
	object_event 19,  7, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt4, EVENT_STAND_CITY_ROCKETS_DEPARTED
	object_event 25,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, RocketBossRoomGrunt5, EVENT_STAND_CITY_ROCKETS_DEPARTED
	object_event  7, 11, SPRITE_IMPOSTER_OAK, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 1, ImposterScript,  EVENT_IMPOSTER_FIGHTING_OKERA_2
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 1, ObjectEvent, EVENT_TEAM_ROCKET_BASE_B2F_ELECTRODE_1
	object_event -4, -4, SPRITE_OKERA, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OkeraScript, -1
	object_event  5, 12, SPRITE_IMPOSTER_OAK, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 1, ImposterScript, EVENT_IMPOSTER_FIGHTING_OKERA
	object_event  6, 12, SPRITE_OKERA, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OkeraScript, EVENT_IMPOSTER_FIGHTING_OKERA
