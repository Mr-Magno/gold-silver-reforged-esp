	const_def 2 ; object constants
	const ROUTE8_FRUIT_TREE
	const ROUTE8_YOUNGSTER
	const ROUTE8_SCHOOLBOY
	const ROUTE8_LASS
	const ROUTE8_GRAMPS
	const ROUTE8_FISHER
	const ROUTE8_POKEFANM
	const ROUTE8_TWIN

Route120_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE8_NOTHING
	scene_script SceneFoundGirlScript ; SCENE_ROUTE8_GIRL
	
	db 0 ; callbacks
	
.DummyScene0:
	end

SceneFoundGirlScript:
	checkevent EVENT_LITTLE_GIRL_AT_BOULDER_MINES_ENTRANCE
	iftrue .SceneRoute120Nothing
	applymovement PLAYER, WalkDown
	turnobject PLAYER, LEFT
	playsound SFX_ENTER_DOOR
	moveobject ROUTE8_TWIN, 9, 5
	appear ROUTE8_TWIN
	showemote EMOTE_SHOCK, ROUTE8_GRAMPS, 15
	applymovement ROUTE8_TWIN, WalkDownGirl
	turnobject ROUTE8_TWIN, LEFT
	applymovement ROUTE8_GRAMPS, WalkUpGramps
	turnobject ROUTE8_GRAMPS, RIGHT
	opentext
	writetext GrampsRelievedText
	waitbutton
	closetext
	opentext
	writetext GirlText
	waitbutton
	closetext
	applymovement ROUTE8_GRAMPS, WalkDownGramps
	turnobject ROUTE8_GRAMPS, RIGHT
	opentext
	writetext GrampsAnnoyedText
	waitbutton
	closetext
	setevent EVENT_TEKNOS_GRAMPA_LOOKING_FOR_LITTLE_GIRL
	setevent EVENT_TEKNOS_GRAMPA_LITTLE_GIRL_SAVED
	setevent EVENT_WHITNEY_IN_BOULDER_MINES
	setevent EVENT_LITTLE_GIRL_AT_BOULDER_MINES_ENTRANCE
	clearevent EVENT_ECRUTEAK_SCARED_LASS
	setmapscene TEKNOS_CITY, SCENE_ECRUTEAK_ROCKET_TAKEOVER
	special FadeOutPalettes
	wait 10
	warpfacing UP, TEKNOS_GRAMPS_ITEMFINDER_HOUSE, 4, 7
	end
	
.SceneRoute120Nothing:
	end
	
TrainerYoungsterJoey:
	trainer YOUNGSTER, JOEY, EVENT_BEAT_YOUNGSTER_JOEY, YoungsterJoey1SeenText, YoungsterJoey1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterJoey1AfterText
	waitbutton
	closetext
	end

TrainerSchoolboyDudley:
	trainer SCHOOLBOY, DUDLEY, EVENT_BEAT_SCHOOLBOY_DUDLEY, SchoolboyDudleySeenText, SchoolboyDudleyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyDudleyAfterBattleText
	waitbutton
	closetext
	end

TrainerLassConnie:
	trainer LASS, CONNIE, EVENT_BEAT_LASS_CONNIE, LassConnie1SeenText, LassConnie1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassConnie1AfterBattleText
	waitbutton
	closetext
	end
	
Route120GrampsScript:
	faceplayer
	opentext
	writetext Route120GrampsText
	waitbutton
	closetext
	end
	
TrainerFisherTully:
	trainer FISHER, TULLY, EVENT_BEAT_FISHER_TULLY, FisherTullySeenText, FisherTullyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherTullyAfterBattleText
	waitbutton
	closetext
	end
	
TrainerHikerParry:
	trainer HIKER, PARRY, EVENT_BEAT_HIKER_PARRY, HikerParry3SeenText, HikerParry3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerParryAfterBattleText
	waitbutton
	closetext
	end

Route120UndergroundPathSign:
	jumptext Route120UndergroundPathSignText

Route120FruitTree:
	fruittree FRUITTREE_ROUTE_120
	
Route120ParlyzHeal:
	itemball PARLYZ_HEAL
	
Route120GrampsText:
	text "¡Ah, bien!"
	line "¡Ya estás aquí!"

	para "Ayúdame, por"
	line "favor."

	para "¡Mi nieta podría"
	line "estar atrapada ahí"
	cont "dentro!"
	done
	

LassConnie1SeenText:
	text "No sé por qué"
	line "salgo con CHEMA y"
	cont "JULIO."

	para "¡Seguro que tú"
	line "eres mejor que"
	cont "ellos!"
	done

LassConnie1BeatenText:
	text "¡Ay! ¡Mi #MON!"
	done

LassConnie1AfterBattleText:
	text "He perdido, pero"
	line "ha sido un mejor"
	para "combate que"
	line "cualquiera que"
	para "hubiera tenido"
	line "contra esos dos."
	done

	
SchoolboyDudleySeenText:
	text "¡Esta ruta es"
	line "donde se reúnen"
	para "mis amigos después"
	line "del cole!"
	done

SchoolboyDudleyBeatenText:
	text "¡Uau! Muy bien."
	done

SchoolboyDudleyAfterBattleText:
	text "Hice lo que pude."
	line "No me arrepiento."
	done
	
YoungsterJoey1SeenText:
	text "Me gusta jugar en"
	line "la MINA."

	para "¡Pero no se lo"
	line "digas a mis"
	cont "padres!"
	done

YoungsterJoey1BeatenText:
	text "¡Argh!"
	line "¡He perdido!"
	done

YoungsterJoey1AfterText:
	text "¿Debo tener más"
	line "#MON para poder"
	cont "luchar mejor?"

	para "¡No! ¡Continuaré"
	line "sólo con éste,"
	cont "pase lo que pase!"
	done

Route120UndergroundPathSignText:
	text "MINA PEÑASCO"
	
	para "¡Área para minar"
	line "peligrosa!"

	para "Por favor, no"
	line "entrar sin un"
	para "#MON como"
	line "protección."
	done
	
FisherTullySeenText:
	text "¡Déjame que te"
	line "demuestre el"
	cont "poder de mis"
	cont "#MON!"
	done

FisherTullyBeatenText:
	text "No me esperaba"
	line "esto."
	done

FisherTullyAfterBattleText:
	text "Quiero ser el"
	line "nuevo CAMPEÓN"

	para "utilizando mis"
	line "#MON"
	cont "favoritos."
	done
	
HikerParry3SeenText:
	text "¡Mis #MON son"
	line "muy poderosos!"
	done

HikerParry3BeatenText:
	text "¡Soy un poderoso"
	line "perdedor!"
	done

HikerParryAfterBattleText:
	text "No se me da muy"
	line "bien pensar."

	para "Por eso uso el"
	line "poder físico."
	done
	
GrampsRelievedText:
	text "¡Menos mal!"
	
	para "¡Estás a salvo!"

	para "¡Cuántas veces"
	line "tengo que decirte"
	cont "que…"
	
	para "que no te alejes"
	line "de donde no"
	cont "pueda verte!"
	done
	
GirlText:
	text "Oh, abuelito…"
	
	para "Estaba jugando"
	line "al escondite."
	
	para "¡Me lo he pasado"
	line "muy bien!"
	done
	
GrampsAnnoyedText:
	text "Esta muchacha…"
	
	para "Menos mal que"
	line "está bien…"
	
	para "Gracias, chico."
	
	para "Volvamos a casa"
	line "por ahora…"
	done

WalkDown:
	step DOWN
	step_end
	
WalkDownGirl:
	step DOWN
	step_end
	
WalkUpGramps:
	step UP
	step_end
	
WalkDownGramps:
	step DOWN
	step_end

Route120_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9,  5, BOULDER_MINES_1F, 1

	db 1 ; coord events
	coord_event  9,  6, SCENE_ROUTE8_GIRL_AND_GRAMPS, SceneFoundGirlScript

	db 1 ; bg events
	bg_event 10,  6, BGEVENT_READ, Route120UndergroundPathSign

	db 9 ; object events
	object_event 40,  6, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route120FruitTree, -1
	object_event 12, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterJoey, -1
	object_event 24,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyDudley, -1
	object_event 12,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassConnie, -1
	object_event  8,  7, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route120GrampsScript, EVENT_TEKNOS_GRAMPA_LOOKING_FOR_LITTLE_GIRL
	object_event 20, 13, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherTully, -1
	object_event 36, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerHikerParry, -1
	object_event  9,  0, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEKNOS_GRAMPA_LITTLE_GIRL_SAVED
	object_event 18,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route120ParlyzHeal, EVENT_ROUTE_8_PARLYZ_HEAL

