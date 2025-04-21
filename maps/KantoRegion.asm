	const_def 2 ; object constants
	const KANTO_FISHER
	const KANTO_COOLTRAINER_M
	const KANTO_TEACHER
	const KANTO_POKEFAN_M
	const KANTO_LASS
	const KANTO_SUPER_NERD
	const KANTO_YOUNGSTER
	const KANTO_FISHER_2
	const KANTO_LASS_2
	const KANTO_ITEMBALL
	const KANTO_BIKER1
	const KANTO_BIKER2
	const KANTO_PSYCHIC
	const KANTO_FISHERTR

KantoRegion_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_KANTO
	return

KantoRegionTMDetect:
	itemball TM_ROCK_HEAD

KantoFisherScript:
	jumptextfaceplayer KantoFisherText

KantoSign:
	jumptext KantoSignText

KantoPokecenterSign:
	jumpstd pokecentersign

KantoGymSign:
	jumptext KantoGymSignText

PalletTownSign2:
	jumptext PalletTownSignText2

RedsHouseSign2:
	jumptext RedsHouseSignText2

BluesHouseSign2:
	jumptext BluesHouseSignText2

OaksLabSign2:
	jumptext OaksLabSign2Text

KantoDeptSign:
	jumptext KantoDeptSignText

KantoMansionSign:
	jumptext KantoMansionSignText

KantoBattleClubSign:
	jumptext KantoBattleClubSignText

PokemonTowerSign:
	jumptext PokemonTowerSignText

KantoCooltrainerMScript:
	jumptextfaceplayer KantoCooltrainerMText

KantoTeacherScript:
	jumptextfaceplayer KantoTeacherText

KantoPokefanMScript:
	jumptextfaceplayer KantoPokefanMText

KantoLassScript:
	jumptextfaceplayer KantoLassText

KantoSuperNerdScript:
	jumptextfaceplayer KantoSuperNerdText

KantoYoungsterScript:
	jumptextfaceplayer KantoYoungsterText

KantoFisher2Script:
	jumptextfaceplayer KantoFisher2Text
	
KantoLass2Script:
	jumptextfaceplayer KantoLass2Text

;----------------------------------------------------------

TrainerKBiker1:
	trainer BIKER, ZEKE, EVENT_BEAT_KR_TRAINER1, BikerZekeSeenText, BikerZekeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerZekeAfterBattleText
	waitbutton
	closetext
	end

TrainerKBiker2:
	trainer BIKER, CHARLES, EVENT_BEAT_KR_TRAINER2, BikerCharlesSeenText, BikerCharlesBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerCharlesAfterBattleText
	waitbutton
	closetext
	end

TrainerKPsychic:
	trainer PSYCHIC_T, PHIL, EVENT_BEAT_KR_TRAINER3, PsychicPhilSeenText, PsychicPhilBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicPhilAfterBattleText
	waitbutton
	closetext
	end

TrainerKFisher:
	trainer FISHER, ANDRE, EVENT_BEAT_KR_TRAINER4, FisherAndreSeenText, FisherAndreBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherAndreAfterBattleText
	waitbutton
	closetext
	end

;----------------------------------------------------------

BikerZekeSeenText:
	text "¡Este es el"
	line "famoso CAMINO"
	cont "BICIS!"

	para "¡Quita tus pies"
	line "del camino y"
	cont "súbete a algo!"
	done

BikerZekeBeatenText:
	text "¡Venga ya!"
	done

BikerZekeAfterBattleText:
	text "¡Es mejor"
	line "pasearse por"
	cont "KANTO en bici!"
	done

BikerCharlesSeenText:
	text "¡Deberías apren-"
	line "der a buscar"
	cont "tus combates"
	cont "sabiamente antes"
	cont "de meter el"
	cont "hocico en las"
	cont "cosas de los"
	cont "demás!"
	done

BikerCharlesBeatenText:
	text "¡Chicho listo!"
	done

BikerCharlesAfterBattleText:
	text "¿Mis combates?"

	para "Bueno, ahora"
	line "estoy luchando"
	cont "para conseguir"
	cont "que pongan una"
	cont "hilera de molinos"
	cont "de viento a lo"
	cont "largo de este"
	cont "camino."

	para "¡Pienso en"
	line "la energía"
	cont "renovable!"
	done

PsychicPhilSeenText:
	text "Mi antiguo mentor"
	line "predijo tu lle-"
	cont "gada y por eso"
	cont "he estado espe-"
	cont "rando aquí."
	done

PsychicPhilBeatenText:
	text "¡Como el destino"
	line "predijo!"
	done

PsychicPhilAfterBattleText:
	text "Mi mentor se fue"
	line "a entrenar a"
	cont "algún lugar, así"
	cont "que me he dedi-"
	cont "cado a mantener"
	cont "los poderes"
	cont "PSÍQUICOS en"
	cont "KANTO."
	done

FisherAndreSeenText:
	text "¿Qué le pasa a"
	line "este lugar?"

	para "¡No tengo nada"
	line "de suerte!"
	done

FisherAndreBeatenText:
	text "¡Bah, nada de"
	line "suerte!"
	done

FisherAndreAfterBattleText:
	text "He oído que los"
	line "peces pueden"
	cont "llegar a actuar"
	cont "de forma extraña"
	cont "cuando se acerca"
	cont "una erupción"
	cont "volcánica."

	para "Debería evitar"
	line "ir a ISLA CANELA"
	cont "durante un"
	cont "tiempo, j…jeje."
	done

;----------------------------------------------------------
KantoLass2Text:
	text "¡Los CIENTÍFICOS"
	line "de este labora-"
	cont "torio son"
	cont "asombrosos!"

	para "¡Han revivido mi"
	line "fósil y ahora es"
	cont "un #MON!"
	done

KantoFisher2Text:
	text "¡Chico, me encanta"
	line "pescar!"

	para "¡Y esta zona es"
	line "estupenda para"
	cont "hacerlo!"
	done

KantoYoungsterText:
	text "Un día, quiero"
	line "poder ganar en"
	cont "este GIMNASIO."

	para "Aunque no creo que"
	line "lo consiga."

	para "Muy pocos logran"
	line "ser tan buenos"
	cont "como el LÍDER de"
	cont "GIMNASIO."
	done

KantoSuperNerdText:
	text "El dueño de este"
	line "CASINO adquirió"
	para "hace poco la"
	line "propiedad del"
	para "nuevo que abrieron"
	line "en la PASARELA."
	done

KantoLassText:
	text "¿Conoces SILPH"
	line "S.A.?"

	para "Si no la conoces,"
	line "deberías."

	para "¡Seguramente las"
	line "# BALLS en las"
	para "que están tus"
	line "#MON las"
	cont "hicieron ellos!"
	done

KantoPokefanMText:
	text "Nunca he sido un"
	line "gran entrenador."

	para "Sí, entreno"
	line "#MON y combato"
	cont "con ellos."

	para "Pero es más bien"
	line "un pasatiempo."

	para "El tipo del CLUB"
	line "BATALLA de KANTO"
	cont "no me dejó pasar…"
	done

KantoFisherText:
	text "¡La tecnología es"
	line "increíble!"

	para "¡Ahora puedes"
	line "intercambiar"
	para "#MON a través"
	line "del tiempo!"
	done

KantoSignText:
	text "BIENVENIDO a la"
	line "REGIÓN de KANTO-"
	para "El centro de"
	line "prosperidad urba-"
	cont "na de NIHON."
	done

KantoGymSignText:
	text "LÍDER de GIMNASIO"
	line "de la MESETA"
	cont "AÑIL: ROJO"

	para "El experimentado"
	line "entrenador"
	cont "veterano."
	done

PalletTownSignText2:
	text "PUEBLO PALETA"

	para "Un tranquilo lugar"
	line "de paz y pureza"
	done

RedsHouseSignText2:
	text "CASA DE ROJO"
	done

BluesHouseSignText2:
	text "CASA DE AZUL"
	done

OaksLabSign2Text:
	text "LABORATORIO DE"
	line "INVESTIGACIÓN"
	cont "#MON del PROF."
	cont "OAK"

	para "AVISO: El PROF."
	line "OAK se encuentra"
	para "investigando en"
	line "PUEBLO SILENTE."
	done

KantoDeptSignText:
	text "CENTRO COMERCIAL"
	line "DE KANTO"

	para "¡Una gran gama de"
	line "artículos #MON!"
	done

KantoMansionSignText:
	text "EDIFICIO KANTO"
	done

KantoBattleClubSignText:
	text "CLUB BATALLA DE"
	line "KANTO"

	para "Un club de grandes"
	line "entrenadores. Solo"
	cont "para miembros."
	done

PokemonTowerSignText:
	text "TORRE #MON"

	para "Un monumento a los"
	line "#MON que han"
	cont "partido."
	done

FossilLabSign:
	jumptext FossilLabSignText

FossilLabSignText:
	text "LABORATORIO de"
	line "INVESTIGACIÓN"
	cont "de ISLA CANELA"
	done

SeafoamSign:
	jumptext SeafoamSignText

SeafoamSignText:
	text "ISLAS ESPUMA"
	done

SafariZoneSign:
	jumptext SafariZoneSignText

SafariZoneSignText:
	text "ZONA SAFARI"
	para "¡Ahora de acceso"
	line "gratuito!"
	done

FujiHouseSign:
	jumptext FujiHouseSignText

FujiHouseSignText:
	text "CASA SR. FUJI"
	done

DocksSign:
	jumptext DocksSignText

DocksSignText:
	text "MUELLE CARMÍN"
	done

PowerPlantSign:
	jumptext PowerPlantSignText

PowerPlantSignText:
	text "PLANTA ENERGÍA"
	done

SilphCoSign:
	jumptext SilphCoSignText

SilphCoSignText:
	text "SILPH S.A."
	done

GameCornerSign:
	jumptext GameCornerSignText

GameCornerSignText:
	text "CASINO"
	para "Cambia tus fichas"
	line "en la puerta"
	cont "adyacente."
	done

TrainerHouseSign:
	jumptext TrainerHouseSignText

TrainerHouseSignText:
	text "CASA ENTRENADOR"

	para "El CLUB para los"
	line "mejores combates."
	done

VictoryRoadKSign:
	jumptext VictoryRoadKSignText

VictoryRoadKSignText:
	text "MESETA AÑIL"
	line "HACIA ADELANTE"
	para "La antigua"
	line "CALLE VICTORIA."
	done

PewterMuseumSign:
	jumptext PewterMuseumSignText

PewterMuseumSignText:
	text "MUSEO de la"
	line "CIENCIA de"
	cont "CIUDAD PLATEADA"
	done

PewterGardenSign:
	jumptext PewterGardenSignText

PewterGardenSignText:
	text "No pisar las"
	line "flores, por"
	cont "favor."
	para "SOCIEDAD JARDI"
	line "-NERA de PLATEADA"
	done

MtMoonSign:
	jumptext MtMoonSignText

MtMoonSignText:
	text "MT.MOON"
	para "Por favor,"
	line "¡visita nuestra"
	cont "tienda de regalos!"
	done

SeaCottageSign:
	jumptext SeaCottageSignText

SeaCottageSignText:
	text "CASA del MAR"
	para "¡Ahora abierta"
	line "para alquiler"
	cont "vacacional!"
	cont "Contacta con BILL"
	cont "para reservas y"
	cont "más información."
	done

DiglettsCaveSign:
	jumptext DiglettsCaveSignText

DiglettsCaveSignText:
	text "CUEVA DIGLETT"
	done

KantoCooltrainerMText:
	text "Están llevando a"
	line "cabo un concurso"
	cont "de tragones."
	para "Con tan solo"
	line "mirarlos, me"
	cont "siento lleno…"
	done

KantoTeacherText:
	text "El CENTRO COMER-"
	line "CIAL de AZULONA"
	cont "tiene la mejor"
	cont "selección."
	para "¡Si no lo en-"
	line "cuentras ahí,"
	cont "no lo encontra-"
	cont "rás en ninguna"
	cont "otra parte!"
	para "…Buff, sueno"
	line "como un"
	cont "trabajador."
	done

KantoRegion_MapEvents:
	db 0, 0 ; filler

	db 45 ; warp events
	warp_event 24, 21, KANTO_DEPT_STORE_1F, 1
	warp_event 29, 21, KANTO_CELADON_MANSION_1F, 1
	warp_event 30, 15, KANTO_CELADON_MANSION_1F, 3
	warp_event 38, 35, DIGLETTS_CAVE,1
	warp_event 29, 33, KANTO_POKECENTER_1F, 1
	warp_event 23, 27, KANTO_GAME_CORNER, 1
	warp_event 27, 27, KANTO_GAME_CORNER_PRIZE_ROOM, 1
	warp_event  6,  5, KANTO_GYM, 1
	warp_event 35, 13, KANTO_LEFTOVERS_HOUSE, 1
	warp_event  4, 24, ROUTE_115_KANTO_GATE, 3
	warp_event  4, 25, ROUTE_115_KANTO_GATE, 4
	warp_event 37, 29, SILPH_CO_1F, 1
	warp_event 20, 19, DIGLETTS_CAVE,3
	warp_event 25, 21, KANTO_DEPT_STORE_1F, 2
	warp_event 48, 29, ROCK_TUNNEL_1F,2
	warp_event  7,  5, KANTO_GYM, 2
	warp_event 46, 17, ROCK_TUNNEL_1F,1
	warp_event 14, 45, OAKS_KANTO_LAB, 1
	warp_event 15, 45, OAKS_KANTO_LAB, 2
	warp_event 15, 39, BLUES_HOUSE, 1
	warp_event  9, 39, REDS_HOUSE_1F,1
	warp_event 28,  7, MOUNT_MOON, 1
	warp_event 32,  7, MOUNT_MOON, 2
	warp_event 47, 53, KANTO_BATTLE_CLUB_1F, 1
	warp_event 37,  7, KANTO_HOUSE_1, 1
	warp_event 13, 11, KANTO_HOUSE_2, 1
	warp_event 17, 23, KANTO_HOUSE_3, 1
	warp_event 49,  5, KANTO_HOUSE_4, 1
	warp_event  8, 55, KANTO_FOSSIL_LAB, 1
	warp_event  6, 15, KANTO_VICTORY_ROAD,1
	warp_event 37, 17, KANTO_CAFE, 1
	warp_event  0,  0, KANTO_CAFE, 2 ; daycare house
	warp_event  6,  9, KANTO_VICTORY_ROAD,10
	warp_event  7,  9, KANTO_VICTORY_ROAD,10
	warp_event 35, 45, SAFARI_ZONE_FUCHSIA_GATE_BETA,3
	warp_event 47, 23, KANTO_POWER_PLANT,1
	warp_event 20, 55, SEAFOAM_ISLANDS_1F,1
	warp_event 26, 55, SEAFOAM_ISLANDS_1F,2
	warp_event 16,  7, KANTO_MUSEUM_1F, 1
	warp_event 21,  5, KANTO_MUSEUM_1F, 3
	warp_event 54, 31, POKEMON_TOWER_1F, 1
	warp_event 15, 29, TRAINER_HOUSE_1F,1
	warp_event 51, 33, KANTO_FUJI_HOUSE, 1
	warp_event 31, 35, KANTO_DOCK, 1
	warp_event 32, 35, KANTO_DOCK, 1

	db 0 ; coord events

	db 26 ; bg events
	bg_event 58, 36, BGEVENT_READ, KantoSign
	bg_event 30, 33, BGEVENT_READ, KantoPokecenterSign
	bg_event  8,  6, BGEVENT_READ, KantoGymSign
	bg_event  9, 43, BGEVENT_READ, PalletTownSign2
	bg_event 10, 40, BGEVENT_READ, RedsHouseSign2
	bg_event 16, 40, BGEVENT_READ, BluesHouseSign2
	bg_event 15, 47, BGEVENT_READ, OaksLabSign2
	bg_event 26, 21, BGEVENT_READ, KantoDeptSign
	bg_event 28, 22, BGEVENT_READ, KantoMansionSign
	bg_event 46, 54, BGEVENT_READ, KantoBattleClubSign
	bg_event 55, 32, BGEVENT_READ, PokemonTowerSign
	bg_event  7, 56, BGEVENT_READ, FossilLabSign
	bg_event 23, 55, BGEVENT_READ, SeafoamSign
	bg_event 33, 46, BGEVENT_READ, SafariZoneSign
	bg_event 29, 37, BGEVENT_READ, DocksSign
	bg_event 49, 24, BGEVENT_READ, PowerPlantSign
	bg_event 38, 30, BGEVENT_READ, SilphCoSign
	bg_event 24, 28, BGEVENT_READ, GameCornerSign
	bg_event 13, 29, BGEVENT_READ, TrainerHouseSign
	bg_event  7, 16, BGEVENT_READ, VictoryRoadKSign
	bg_event 15,  8, BGEVENT_READ, PewterMuseumSign
	bg_event 19,  9, BGEVENT_READ, PewterGardenSign
	bg_event 29,  8, BGEVENT_READ, MtMoonSign
	bg_event 47,  5, BGEVENT_READ, SeaCottageSign
	bg_event 19, 20, BGEVENT_READ, DiglettsCaveSign
	bg_event 53, 34, BGEVENT_READ, FujiHouseSign

	db 14 ; object events
	object_event  9, 46, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoFisherScript, -1
	object_event 38, 19, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoCooltrainerMScript, -1
	object_event 23, 23, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoTeacherScript, -1
	object_event 16, 13, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoPokefanMScript, -1
	object_event 34, 30, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoLassScript, -1
	object_event 22, 29, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoSuperNerdScript, -1
	object_event  5, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoYoungsterScript, -1
	object_event 37, 53, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoFisher2Script, -1
	object_event 10, 57, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoLass2Script, -1
	object_event 29, 42, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, KantoRegionTMDetect, EVENT_LAKE_OF_RAGE_TM_DETECT
	object_event 25, 39, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerKBiker1, -1
	object_event 24, 43, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerKBiker2, -1
	object_event 43, 35, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerKPsychic, -1
	object_event 22, 57, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerKFisher, -1
