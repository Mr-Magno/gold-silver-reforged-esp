	const_def 2 ; object constants
	const FUCHSIACITY_ROCKER
	const FUCHSIACITY_POKEFAN_M
	const FUCHSIACITY_TWIN
	const FUCHSIACITY_TEACHER
	const FUCHSIACITY_FRUIT_TREE
	const FUCHSIACITY_MONSTER1
	const FUCHSIACITY_MONSTER2
	const FUCHSIACITY_MONSTER3
	const FUCHSIACITY_BIRD
	const FUCHSIACITY_FAIRY
	const FUCHSIACITY_BLOCKROCKET1
	const FUCHSIACITY_OKERA
	const FUCHSIACITY_BLOCKROCKET3
	const FUCHSIACITY_IMPOSTER
	const FUCHSIACITY_HQBLOCKROCKET
	const FUCHSIACITY_NATIONALBLOCKROCKET

StandCity_MapScripts:
	db 2 ; scene scripts
	scene_script .SceneStandCityNothing ; SCENE_DEFAULT
	scene_script .SceneStandCityImposter ;

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	
.SceneStandCityNothing
	end

.SceneStandCityImposter
	end


.FlyPoint:
	setflag ENGINE_FLYPOINT_FUCHSIA
	return
	
ImposterIntro1:
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 5
	jump ImposterSceneScript
	end
	
ImposterIntro2:
	opentext
	writetext ImposterText1
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 5
	applymovement PLAYER, ImposterSceneMove1
	jump ImposterSceneScript
	end
	
ImposterSceneScript:	
	moveobject FUCHSIACITY_TEACHER, 27, 23
	moveobject FUCHSIACITY_TWIN, 29, 23
	moveobject FUCHSIACITY_ROCKER, 28, 24
	moveobject FUCHSIACITY_POKEFAN_M, 27, 25
	applymovement PLAYER, ImposterSceneMove2
	turnobject FUCHSIACITY_POKEFAN_M, RIGHT
	applymovement PLAYER, ImposterSceneMove2_5
	turnobject FUCHSIACITY_TEACHER, LEFT
	applymovement PLAYER, ImposterSceneMove2_7
	showemote EMOTE_SHOCK, FUCHSIACITY_TWIN, 25
	turnobject FUCHSIACITY_TEACHER, UP
	pause 3
	turnobject FUCHSIACITY_ROCKER, UP
	pause 3
	turnobject FUCHSIACITY_POKEFAN_M, UP
	pause 30
	moveobject FUCHSIACITY_IMPOSTER, 29, 19
	appear FUCHSIACITY_IMPOSTER
	applymovement FUCHSIACITY_IMPOSTER, ImposterWalksDown
	pause 10
	playmusic MUSIC_ROCKET_HIDEOUT
	opentext
	writetext ImposterText2
	waitbutton
	closetext
	pause 3
	showemote EMOTE_SHOCK, FUCHSIACITY_ROCKER, 5
	pause 3
	showemote EMOTE_SHOCK, FUCHSIACITY_TWIN, 5
	pause 3
	showemote EMOTE_SHOCK, FUCHSIACITY_TEACHER, 5
	pause 3
	showemote EMOTE_SHOCK, FUCHSIACITY_POKEFAN_M, 5
	pause 15
	opentext
	writetext ImposterText3
	waitbutton
	closetext
	pause 10
	applymovement FUCHSIACITY_IMPOSTER, ImposterWalksUp
	disappear FUCHSIACITY_IMPOSTER
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear FUCHSIACITY_TEACHER
	disappear FUCHSIACITY_TWIN
	disappear FUCHSIACITY_ROCKER
	disappear FUCHSIACITY_POKEFAN_M
	pause 15
	special FadeInQuickly
	appear FUCHSIACITY_OKERA
	playmusic MUSIC_CHERRYGROVE_CITY
	applymovement FUCHSIACITY_OKERA, OkenaWalksUP
	turnobject PLAYER, LEFT
	opentext
	writetext OkenaText
	waitbutton
	turnobject FUCHSIACITY_OKERA, DOWN
	writetext OkenaText2
	waitbutton
	closetext
	applymovement FUCHSIACITY_OKERA, OkenaWalksAway
	disappear FUCHSIACITY_OKERA
	setevent EVENT_ILEX_FOREST_APPRENTICE
	setscene SCENE_DEFAULT
	setevent EVENT_OKERA_AT_BASE
	setevent EVENT_IMPOSTER_FIGHTING_OKERA
	end


StandCityRocker:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .RockerRocketsGone
	checkevent EVENT_ILEX_FOREST_APPRENTICE
	iftrue .RockerAfterImposter
	writetext StandCityRockerText
	waitbutton
	closetext
	end
	
.RockerRocketsGone
	writetext StandCityRockerAllGoodText
	waitbutton
	closetext
	end
	
.RockerAfterImposter
	writetext StandCityRockerImposterText
	waitbutton
	closetext
	end

StandCityPokefanM:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .PokefanRocketsGone
	checkevent EVENT_ILEX_FOREST_APPRENTICE
	iftrue .PokefanAfterImposter
	writetext StandCityPokefanMText
	waitbutton
	closetext
	end
	
.PokefanRocketsGone
	writetext StandCityPokefanAllGoodText
	waitbutton
	closetext
	end
	
.PokefanAfterImposter
	writetext StandCityPokefanImposterText
	waitbutton
	closetext
	end


StandCityTwin:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .TwinRocketsGone
	checkevent EVENT_ILEX_FOREST_APPRENTICE
	iftrue .TwinAfterImposter
	writetext StandCityTwinText
	waitbutton
	closetext
	end
	
.TwinRocketsGone
	writetext StandCityTwinAllGoodText
	waitbutton
	closetext
	end
	
.TwinAfterImposter
	writetext StandCityTwinImposterText
	waitbutton
	closetext
	end
	
StandCityTeacher:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .TeacherRocketsGone
	checkevent EVENT_ILEX_FOREST_APPRENTICE
	iftrue .TeacherAfterImposter
	writetext StandCityTeacherText
	waitbutton
	closetext
	end
	
.TeacherRocketsGone
	writetext StandCityTeacherAllGoodText
	waitbutton
	closetext
	end
	
.TeacherAfterImposter
	writetext StandCityTeacherImposterText
	waitbutton
	closetext
	end
	
StandCityBlockRocket1:
	faceplayer
	opentext
	checkevent EVENT_STAND_CITY_ROCKETS_DEPARTED
	iftrue .BlockRocket1AfterBase
	checkevent EVENT_ILEX_FOREST_APPRENTICE
	iftrue .BlockRocket1AfterImposter
	writetext BlockRocket1BeforeText
	waitbutton
	closetext
	end
	
.BlockRocket1AfterBase
	writetext BlockRocket1AfterBaseText
	waitbutton
	closetext
	end

.BlockRocket1AfterImposter
	writetext BlockRocket1AfterText
	waitbutton
	closetext
	end
	
StandCityBlockRocket3:
	faceplayer
	opentext
	checkevent EVENT_STAND_CITY_ROCKETS_DEPARTED
	iftrue .BlockRocket3AfterBase
	checkevent EVENT_ILEX_FOREST_APPRENTICE
	iftrue .BlockRocket3AfterImposter
	writetext BlockRocket3BeforeText
	waitbutton
	closetext
	end
	
.BlockRocket3AfterBase
	writetext BlockRocket3AfterBaseText
	waitbutton
	closetext
	end

	
.BlockRocket3AfterImposter
	writetext BlockRocket3AfterText
	waitbutton
	closetext
	end	

StandCitySign:
	jumptext StandCitySignText

FuchsiaGymSign:
	jumptext FuchsiaGymSignText

SafariZoneOfficeSign:
	jumptext SafariZoneOfficeSignText

WardensHomeSign:
	jumptext WardensHomeSignText

SafariZoneClosedSign:
	jumptext SafariZoneClosedSignText

SafariZoneClefairySign:
	jumptext SafariZoneClefairySignText
	
SafariZoneAmpharosSign:
	jumptext SafariZoneAmpharosSignText
	
SafariZoneSkarmorySign:
	jumptext SafariZoneSkarmorySignText
	
SafariZoneGolduckSign:
	jumptext SafariZoneGolduckSignText

NoLitteringSign:
	jumptext NoLitteringSignText

StandCityPokecenterSign:
;	setevent EVENT_STAND_CITY_ZOO_MONS_GONE
;	clearevent EVENT_ILEX_FOREST_APPRENTICE
;	clearevent EVENT_ILEX_FOREST_LASS
	jumpstd pokecentersign

StandCityMartSign:
	jumpstd martsign

StandCityFruitTree:
	fruittree FRUITTREE_STAND_CITY
	
StandCityHQBlockRocket:
	jumptextfaceplayer StandCityHQBlockRocketText
	
StandCityNationalBlockRocket:
	faceplayer
	opentext
	checkevent EVENT_STAND_CITY_ROCKETS_DEPARTED
	iftrue .NatioanlBlockRocketAfterBase
	writetext StandCityNationalBlockRocketText
	waitbutton
	closetext
	end

.NatioanlBlockRocketAfterBase
	writetext StandCityNationalBlockRocketAfterBaseText
	waitbutton
	closetext
	end

ImposterSceneMove1:
	step LEFT
	step_end
	
ImposterSceneMove2:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end
	
ImposterSceneMove2_5:
	step UP
	step UP
	step_end
	
ImposterSceneMove2_7:
	step UP
	step UP
	step UP
	step UP
	step_end
	
ImposterWalksDown:
	step DOWN
	step DOWN
	step_end
	
ImposterWalksUp:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step_end
	
OkenaWalksUP:
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	step_end


OkenaWalksAway:
	big_step DOWN
	big_step DOWN
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end
	
StandCityNationalBlockRocketAfterBaseText:
	text "Siempre me siento"
	line "fuera de lugar…"
	para "Nadie me dice lo"
	line "que está pasando"
	cont "aquí…"
	done
	
BlockRocket4AfterBaseText:
	text "¿Se ha ido todo el"
	line "mundo?"
	para "Tú no habrás"
	line "tenido nada que"
	cont "ver, ¿no?"
	done

BlockRocket3AfterBaseText:
	text "Dicen que han"
	line "acabado con nues-"
	cont "tra banda en"
	cont "CIUDAD PONIENTE."

	para "¿Pero eso qué"
	line "significa?"
	para "¿Qué ha pasado con"
	line "nuestra base?"
	done
	
BlockRocket2AfterBaseText:
	text "¿Es verdad?"
	para "He oído que la"
	line "base está vacía."

	para "¿Entonces por qué"
	line "seguimos aquí?"
	done
	
BlockRocket1AfterBaseText:
	text "¿La base está"
	line "vacía?"
	para "¿Dónde han ido"
	line "todos?"
	done
	
StandCityHQBlockRocketText:
	text "A ninguno nos"
	line "gusta proteger la"
	cont "entrada de este"
	cont "edificio."

	para "Yo casi he acabado"
	line "ya mi turno."

	para "Espero que mi"
	line "relevo se presente"
	cont "esta vez…"
	done
	
StandCityNationalBlockRocketText:
	text "¡Nadie tiene por"
	line "qué entrar al"
	cont "PARQUE NACIONAL"
	cont "ahora!"

	para "No mientras los"
	line "#MON estén"
	cont "enfermos."

	para "¿Ves? Me importa"
	line "su salud."
	done
	
BlockRocket1BeforeText:
	text "¡Oh, sí!"
	para "¡No me puedo creer"
	line "lo bien que va"
	cont "nuestro plan!"
	done
	
BlockRocket1AfterText:
	text "¡Eh, niño!"

	para "¿No te parece que"
	line "el verdadero y"
	para "único PROF. OAK ha"
	line "dado un gran"
	cont "discurso?"
	done
	
BlockRocket3BeforeText:
	text "¡No hay nada al"
	line "sur de aquí!"

	para "¡Deberías quedarte"
	line "en el pueblo!"
	done
	
BlockRocket3AfterText:
	text "¡Esta gente adora"
	line "al PROF. OAK!"
	done
	
	
ImposterText1:
	text "¡Habitantes de"
	line "CIUDAD ENHIESTA!"
	done
	
ImposterText2:
	text "¡Soy yo, el mun-"
	line "dialmente conocido"
	cont "PROF. OAK!"

	para "¡Os traigo grandes"
	line "noticias!"

	para "¡Me he unido al"
	line "TEAM ROCKET para"
	cont "traeros esta nueva"
	cont "tecnología!"
	done
	
ImposterText3:
	text "¡Que no cunda el"
	line "pánico!"
	
	para "¡Estamos desarro-"
	line "llando una señal"
	cont "de radio que es"
	cont "capaz de leerle la"
	cont "mente a los"
	cont "#MON!"
	
	para "¡Y está siendo"
	line "desarrollada aquí,"
	cont "en CIUDAD"
	cont "ENHIESTA!"
	
	para "Son falsos los"
	line "rumores que dicen"
	cont"que los #MON"
	cont "se encuentran mal."

	para "¡Estarán bien!"
	
	para "Podéis creerme,"
	line "porque tal y como"
	cont "veis, soy el PROF."
	cont "OAK."

	para "¡Eso es todo!"
	done
	
OkenaText:
	text "Puf…"
	
	para "Qué molestia…"
	
	para "Primero esa tor-"
	line "menta y, ¿ahora"
	cont "vejestorio quiere"
	cont "hacer una señal"
	cont "en mi pueblo?"
	done
	
OkenaText2:
	text "¡No lo soporto!"
	line "¡Necesito paz"
	cont "y tranquilidad!"
	done

StandCityRockerText:
	text "Los #MON que"
	line "suelen estar en el"
	cont "ZOO no se sienten"
	cont "bien."

	para "Los guardias del"
	line "parque de CIUDAD"
	para "ENHIESTA los están"
	line "manteniendo en su"
	cont "CENTRO #MON."
	done
	
StandCityRockerAllGoodText:
	text "¿No era el verda-"
	line "dero PROF. OAK?"
	para "¡Qué locura!"

	para "Me alegra que los"
	line "#MON se estén"
	cont "sintiendo mejor."
	done
	
StandCityRockerImposterText:
	text "¿El TEAM ROCKET"
	line "tiene la culpa de"
	para "que los #MON se"
	line "sientan mal?"
	para "Pero el PROF. OAK"
	line "me dijo que"
	para "estarían bien y"
	line "que era parte de"
	para "una importante"
	line "investigación…"
	para "Y yo confío en él."
	done

StandCityPokefanMText:
	text "Me decepciona que"
	line "los #MON no"
	cont "estén fuera."

	para "Pero es más"
	line "importante que se"
	cont "pongan bien."
	done
	
StandCityPokefanImposterText:
	text "¿El PROF. OAK"
	line "tiene la culpa de"
	para "que los #MON se"
	line "sientan mal?"
	para "Debe tener un buen"
	line "motivo…"
	done
	
StandCityPokefanAllGoodText:
	text "¡Me alegra que los"
	line "#MON ya se"
	cont "sientan bien!"
	done

StandCityTwinText:
	text "El ZOO de CIUDAD"
	line "ENHIESTA está"
	cont "cerrado…"
	para "Es una lástima,"
	line "porque es la"
	para "atracción princi-"
	line "pal de la ciudad."

	para "Espero que los"
	line "#MON estén"
	cont "bien."
	done
	
StandCityTwinImposterText:
	text "¿Ha vuelto el TEAM"
	line "ROCKET?"
	para "¿Y con el PROF."
	line "OAK?"
	para "Algo no me cuadra…"
	done
	
StandCityTwinAllGoodText:
	text "¡Bien! ¡Han vuelto"
	line "a abrir el ZOO!"
	done

StandCityTeacherText:
	text "¿Qué hacen todos"
	line "esos miembros del"
	cont "TEAM ROCKET aquí?"
	para "¡Me da mala"
	line "espina!"
	done
	
StandCityTeacherImposterText:
	text "El PROF. OAK"
	line "estaba raro…"
	done

StandCityTeacherAllGoodText:
	text "Me alegra que todo"
	line "haya vuelto a la"
	cont "normalidad."
	done

StandCitySignText:
	text "CIUDAD ENHIESTA"

	para "Una utopía para"
	line "humanos y #MON"
	cont "por igual"
	done

FuchsiaGymSignText:
	text "LÍDER DEL GIMNASIO"
	line "#MON DE CIUDAD"
	cont "ENHIESTA: VELASCO"

	para "El chico que"
	line "brilla en la"
	cont "oscuridad"
	done

SafariZoneOfficeSignText:
	text "Hay un aviso"
	line "aquí…"

	para "La OFICINA de"
	line "la ZONA SAFARI"
	cont "permanecerá"
	cont "cerrada hasta"
	cont "próximo aviso."
	done

WardensHomeSignText:
	text "ZOO DE CIUDAD"
	line "ENHIESTA"
	para "CENTRO MÉDICO"
	done

SafariZoneClosedSignText:
	text "#MON:"
	line "KANGASKHAN"
	para "Tiene la costumbre"
	line "de dormir de pie"
	para "para no aplastar a"
	line "la cría que lleva"
	cont "acurrucada en la"
	cont "bolsa."
	done

SafariZoneClefairySignText:
	text "#MON:"
	line "CLEFAIRY"
	para "Aunque no es muy"
	line "común, se le puede"
	para "ver por la noche."
	line "Curiosamente,"
	para "ocurre en noches"
	line "de luna llena."
	done
	
SafariZoneAmpharosSignText:
	text "#MON:"
	line "AMPHAROS"
	para "Al anochecer, la"
	line "luz intensa que se"
	para "desprende del ex-"
	line "tremo de la cola"
	para "puede apreciarse"
	line "desde muy lejos."
	done
	
SafariZoneSkarmorySignText:
	text "#MON:"
	line "SKARMORY"
	para "Tiene unas plumas"
	line "en las alas muy"
	para "afiladas. Dicen"
	line "que, antiguamente,"
	para "se utilizaban a"
	line "modo de espadas."
	done
	
SafariZoneGolduckSignText:
	text "#MON:"
	line "GOLDUCK"
	para "Nada con elegancia"
	line "por las tranquilas"
	para "aguas de ríos y"
	line "lagos, donde se"
	cont "siente como pez en"
	cont "el agua."
	done

NoLitteringSignText:
	text "ZOO DE CIUDAD"
	line "ENHIESTA"
	para "Oficina principal"
	done

StandCity_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event 35, 26, STAND_MART, 1
	warp_event 16, 21, STAND_ZOO_MAIN_OFFICE, 1
	warp_event 34, 31, STAND_GYM, 1
	warp_event 26, 29, STAND_SPEECH_HOUSE, 1
	warp_event 33, 20, STAND_POKECENTER_1F, 1
	warp_event 17, 31, STAND_ROCKET_HOUSE_1F, 1
	warp_event 30, 13, ROUTE_112_STAND_CITY_GATE, 3
	warp_event 31, 13, ROUTE_112_STAND_CITY_GATE, 4
	warp_event  6, 17, NATIONAL_PARK_STAND_GATE, 4
	warp_event 35, 31, STAND_GYM, 2
	warp_event 24, 17, STAND_ZOO_INFIRMARY, 1


	db 2 ; coord events
	coord_event  34, 32, SCENE_FUCHSIA_CITY_IMPOSTER, ImposterIntro1
	coord_event  35, 32, SCENE_FUCHSIA_CITY_IMPOSTER, ImposterIntro2

	db 11 ; bg events
	bg_event 36, 20, BGEVENT_READ, StandCitySign
	bg_event 32, 35, BGEVENT_READ, FuchsiaGymSign
	bg_event 24, 20, BGEVENT_READ, WardensHomeSign
	bg_event  8,  8, BGEVENT_READ, SafariZoneClosedSign
	bg_event 18, 21, BGEVENT_READ, NoLitteringSign
	bg_event 34, 20, BGEVENT_READ, StandCityPokecenterSign
	bg_event 36, 26, BGEVENT_READ, StandCityMartSign
	bg_event 14,  8, BGEVENT_READ, SafariZoneClefairySign
	bg_event 20, 10, BGEVENT_READ, SafariZoneAmpharosSign
	bg_event 16, 16, BGEVENT_READ, SafariZoneSkarmorySign
	bg_event 10, 20, BGEVENT_READ, SafariZoneGolduckSign

	db 16 ; object events
	object_event 28, 21, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, StandCityRocker, -1
	object_event 14, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, StandCityPokefanM, -1
	object_event 14, 17, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, StandCityTwin, -1
	object_event 28, 30, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, StandCityTeacher, -1
	object_event 26, 11, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StandCityFruitTree, -1
	object_event 20,  8, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_STAND_CITY_ZOO_MONS_GONE
	object_event  7, 21, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_STAND_CITY_ZOO_MONS_GONE
	object_event  7,  6, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_STAND_CITY_ZOO_MONS_GONE
	object_event 15, 14, SPRITE_BIRD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_STAND_CITY_ZOO_MONS_GONE
	object_event 12,  6, SPRITE_FAIRY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_STAND_CITY_ZOO_MONS_GONE
	object_event 30, 35, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, StandCityBlockRocket1, EVENT_CLEARED_RADIO_TOWER
	object_event 29, 28, SPRITE_OKERA, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GOT_A_POKEMON_FROM_OAK
	object_event 31, 35, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, StandCityBlockRocket3, EVENT_CLEARED_RADIO_TOWER
	object_event -5, -5, SPRITE_IMPOSTER_OAK, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, 0
	object_event 17, 32, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, StandCityHQBlockRocket, EVENT_BEAT_OKERA
	object_event  6, 18, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, StandCityNationalBlockRocket, EVENT_CLEARED_RADIO_TOWER

