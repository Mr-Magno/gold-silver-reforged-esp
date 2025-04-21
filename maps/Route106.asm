	const_def 2 ; object constants
	;const ROUTE31_FISHER
	const ROUTE31_YOUNGSTER
	const ROUTE31_BUG_CATCHER
	const ROUTE31_COOLTRAINER_M
	const ROUTE31_FRUIT_TREE
	const ROUTE31_POKE_BALL1
	const ROUTE31_POKE_BALL2
	const ROUTE31_GRAMPS
	const ROUTE34_DAY_CARE_MON_1
	const ROUTE34_DAY_CARE_MON_2
	const ROUTE31_POKEFAN_M
	const ROUTE31_BUG_CATCHER_2

Route106_MapScripts:
	db 0 ; scene scripts


	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .EggCheckCallback

.EggCheckCallback:
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .PutDayCareManOutside
	clearevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	setevent EVENT_DAY_CARE_MAN_ON_ROUTE_106
	jump .CheckMon1

.PutDayCareManOutside:
	setevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	clearevent EVENT_DAY_CARE_MAN_ON_ROUTE_106
	jump .CheckMon1

.CheckMon1:
	checkflag ENGINE_DAY_CARE_MAN_HAS_MON
	iffalse .HideMon1
	clearevent EVENT_DAY_CARE_MON_1
	jump .CheckMon2

.HideMon1:
	setevent EVENT_DAY_CARE_MON_1
	jump .CheckMon2

.CheckMon2:
	checkflag ENGINE_DAY_CARE_LADY_HAS_MON
	iffalse .HideMon2
	clearevent EVENT_DAY_CARE_MON_2
	return

.HideMon2:
	setevent EVENT_DAY_CARE_MON_2
	return

DayCareManScript_Outside:
	faceplayer
	opentext
	special DayCareManOutside
	waitbutton
	closetext
	ifequal TRUE, .end_fail
	clearflag ENGINE_DAY_CARE_MAN_HAS_EGG
	checkcode VAR_FACING
	ifequal RIGHT, .walk_around_player
	applymovement ROUTE31_GRAMPS, Route34MovementData_DayCareManWalksBackInside
	playsound SFX_ENTER_DOOR
	disappear ROUTE31_GRAMPS
.end_fail
	end

.walk_around_player
	applymovement ROUTE31_GRAMPS, Route34MovementData_DayCareManWalksBackInside_WalkAroundPlayer
	playsound SFX_ENTER_DOOR
	disappear ROUTE31_GRAMPS
	end

DayCareMon1Script:
	opentext
	special DayCareMon1
	closetext
	end

DayCareMon2Script:
	opentext
	special DayCareMon2
	closetext
	end


TrainerBugCatcherWade1:
	trainer BUG_CATCHER, WADE, EVENT_BEAT_BUG_CATCHER_WADE, BugCatcherWade1SeenText, BugCatcherWade1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherWade1AfterText
	waitbutton
	closetext
	end

TrainerHikerAnthony:
	trainer HIKER, ANTHONY, EVENT_BEAT_HIKER_ANTHONY, HikerAnthony2SeenText, HikerAnthony2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerAnthony2AfterText
	waitbutton
	closetext
	end
	
TrainerFledglingPaulson:
	trainer FLEDGLING, PAULSON, EVENT_BEAT_FLEDGLING_PAULSON, FledglingPaulsonSeenText, FledglingPaulsonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FledglingPaulsonAfterText
	waitbutton
	closetext
	end


Route106YoungsterScript:
	jumptextfaceplayer Route106YoungsterText

Route106Sign:
	jumptext Route106SignText

DarkCaveSign:
	jumptext DarkCaveSignText

IlexSign:
	jumptext IlexSignText
	
Route106PokecenterSign:
	jumpstd pokecentersign

Route106CooltrainerMScript:
	jumptextfaceplayer Route106CooltrainerMText

Route106FruitTree:
	fruittree FRUITTREE_ROUTE_106

Route106FullHeal:
	itemball FULL_HEAL

Route106UltraBall:
	itemball ULTRA_BALL
	
Route34MovementData_DayCareManWalksBackInside:
	slow_step LEFT
	slow_step LEFT
	slow_step UP
	step_end

Route34MovementData_DayCareManWalksBackInside_WalkAroundPlayer:
	slow_step DOWN
	slow_step LEFT
	slow_step LEFT
	slow_step UP
	slow_step UP
	step_end


FledglingPaulsonSeenText:
	text "Suelo combatir al"
	line "lado del CENTRO"
	cont "#MON."

	para "Así es más fácil"
	line "curar a mis"
	cont "#MON cuando"
	cont "pierdo."
	done

FledglingPaulsonBeatenText:
	text "¡Otra vez no!"
	done

FledglingPaulsonAfterText:
	text "Mis #MON se"
	line "están fortalecien-"
	cont "do, poco a poco."
	done
	


Route106CooltrainerMText:
	text "¿Has usado alguna"
	line "vez una GUARDERÍA"
	cont "#MON?"
	para "La agradable"
	line "pareja de ancianos"
	para "de esa casa criará"
	line "a tus #MON."
	done

BugCatcherWade1SeenText:
	text "He atrapado un"
	line "montón de #MON."
	cont "¡Luchemos!"
	done

BugCatcherWade1BeatenText:
	text "¡Auuuu…!"
	done

BugCatcherWade1AfterText:
	text "Puedes atrapar"
	line "#MON aunque"
	para "ya lleves seis"
	line "contigo."

	para "Si atrapas alguno"
	line "más, será enviado"
	cont "a la CAJA."
	done


Route106YoungsterText:
	text "He encontrado un"
	line "buen #MON en"
	cont "el BOSQUE JADE."

	para "Voy a criarlo"
	line "para enfrentarme"
	cont "a YASMINA."

	para "Es la LÍDER del"
	line "GIMNASIO de CIUDAD"
	cont "ALEAR."
	done

Route106SignText:
	text "RUTA 106"

	para "CIUDAD ALEAR -"
	line "PUEBLO BIRDON"
	done

DarkCaveSignText:
	text "GUARDERÍA #MON"
	
	para "¡Déjanos criar a"
	line "tus #MON!"
	done

IlexSignText:
	text "BOSQUE JADE"
	
	para "Entrada a la"
	line "derecha"
	done

HikerAnthony2SeenText:
	text "Crucé el bosque y"
	line "todavía me queda"
	cont "mucha energía."
	done

HikerAnthony2BeatenText:
	text "¡Guau! ¡Tienes más"
	line "fuerza que yo!"
	done

HikerAnthony2AfterText:
	text "Los MONTAÑEROS"
	line "somos felices"
	para "cuando tenemos"
	line "la libertad de"
	cont "explorar sin"
	cont "parar."
	done

HikerAnthonyParaText:
	text "Hola, ¿ya tienes"
	line "un EEVEE?"

	para "Yo también he"
	line "capturado uno."

	para "¡Son tan suaves!"
	done

Route106_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event  8,  5, ROUTE_105_ROUTE_106_GATE, 3
	warp_event  9,  5, ROUTE_105_ROUTE_106_GATE, 4
	warp_event 15, 12, JADE_FOREST, 1
	warp_event 15, 13, JADE_FOREST, 2
	warp_event 24,  8, JADE_FOREST, 3
	warp_event 24,  9, JADE_FOREST, 4
	warp_event 33,  5, DAY_CARE, 1
	warp_event 36,  5, DAY_CARE, 3
	warp_event  9, 10, ROUTE_106_POKECENTER_1F, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event 52,  8, BGEVENT_READ, Route106Sign
	bg_event 31,  5, BGEVENT_READ, DarkCaveSign
	bg_event 12, 12, BGEVENT_READ, IlexSign
	bg_event 10, 10, BGEVENT_READ, Route106PokecenterSign

	db 11 ; object events
	object_event  7, 13, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route106YoungsterScript, -1
	object_event 26,  8, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBugCatcherWade1, -1
	object_event 42, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route106CooltrainerMScript, -1
	object_event 30,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route106FruitTree, -1
	object_event 11,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route106FullHeal, EVENT_ROUTE_31_FULL_HEAL
	object_event 33, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route106UltraBall, EVENT_ROUTE_31_ULTRA_BALL
	object_event 38,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareManScript_Outside, EVENT_DAY_CARE_MAN_ON_ROUTE_106
	object_event 40,  7, SPRITE_DAY_CARE_MON_1, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareMon1Script, EVENT_DAY_CARE_MON_1
	object_event 42,  6, SPRITE_DAY_CARE_MON_2, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareMon2Script, EVENT_DAY_CARE_MON_2
	object_event 50,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerAnthony, -1
	object_event  5,  9, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerFledglingPaulson, -1
