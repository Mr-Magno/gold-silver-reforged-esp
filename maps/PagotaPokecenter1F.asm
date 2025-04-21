	const_def 2 ; object constants
	const PAGOTA_POKECENTER_1F_NURSE
	const PAGOTA_POKECENTER_1F_GAMEBOY_KID
	const PAGOTA_POKECENTER_1F_GENTLEMAN
	const PAGOTA_POKECENTER_1F_YOUNGSTER
	const PAGOTA_POKECENTER_1F_SCIENTIST

PagotaPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VioletPokecenterNurse:
	jumpstd pokecenternurse

PagotaPokecenter1F_ElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_REFUSED_TO_TAKE_EGG_FROM_OAKS_AIDE
	iftrue .SecondTimeAsking
	writetext UnknownText_0x69555
.AskTakeEgg:
	yesorno
	iffalse .RefusedEgg
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	special GiveOddEgg
	stringtotext .eggname, MEM_BUFFER_1
	scall .AideGivesEgg
	setevent EVENT_GOT_ODD_EGG_FROM_OAKS_AIDE
	clearevent EVENT_OAKS_AIDE_IN_LAB
	writetext UnknownText_0x695c5
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .AideWalksAroundPlayer
	turnobject PLAYER, DOWN
	applymovement PAGOTA_POKECENTER_1F_SCIENTIST, MovementData_AideWalksStraightOutOfPokecenter
	playsound SFX_EXIT_BUILDING
	disappear PAGOTA_POKECENTER_1F_SCIENTIST
	waitsfx
	clearevent EVENT_MET_BILL
	end

.AideWalksAroundPlayer:
	applymovement PAGOTA_POKECENTER_1F_SCIENTIST, MovementData_AideWalksLeftToExitPokecenter
	turnobject PLAYER, DOWN
	applymovement PAGOTA_POKECENTER_1F_SCIENTIST, MovementData_AideFinishesLeavingPokecenter
	playsound SFX_EXIT_BUILDING
	disappear PAGOTA_POKECENTER_1F_SCIENTIST
	clearevent EVENT_MET_BILL
	waitsfx
	end

.eggname
	db "EGG@"

.AideGivesEgg:
	jumpstd receivetogepiegg
	end

.PartyFull:
	writetext UnknownText_0x69693
	waitbutton
	closetext
	end

.RefusedEgg:
	writetext UnknownText_0x696f2
	waitbutton
	closetext
	setevent EVENT_REFUSED_TO_TAKE_EGG_FROM_OAKS_AIDE
	end

.SecondTimeAsking:
	writetext UnknownText_0x69712
	jump .AskTakeEgg

PagotaPokecenter1FGameboyKidScript:
	jumptextfaceplayer PagotaPokecenter1FGameboyKidText

PagotaPokecenter1FGentlemanScript:
	jumptextfaceplayer PagotaPokecenter1FGentlemanText

PagotaPokecenter1FYoungsterScript:
	jumptextfaceplayer PagotaPokecenter1FYoungsterText

MovementData_AideWalksStraightOutOfPokecenter:
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step DOWN
	step_end

MovementData_AideWalksLeftToExitPokecenter:
	step LEFT
	step DOWN
	step_end

MovementData_AideFinishesLeavingPokecenter:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step DOWN
	step_end

UnknownText_0x69555:
	text "¡<PLAY_G>, cuánto"
	line "tiempo sin vernos."

	para "El PROF. OAK me ha"
	line "pedido que te"
	cont "encontrase."
	
	para "Tiene otro favor"
	line "que pedirte."
	
	para "¿Podrías quedarte"
	line "con este HUEVO"
	cont "#MON?"
	
	para "Saber un poco más" 
	line "sobre cómo se"
	para "relacionan los"
	line "bebés #MON con"
	para "otros #MON y"
	line "cómo puede influir"
	para "en su desarrollo"
	line "sería de ayuda"
	cont "para nuestra"
	cont "investigación."
	
	para "Así que, ¿podrías"
	line "encargarte del"
	cont "HUEVO?"
	done

UnknownText_0x695c5:
	text "Gracias,"
	line "<PLAY_G>."
	
	para "¡Estoy seguro de"
	line "que será una buena"
	para "incorporación para"
	line "tu equipo!"
	
	para "Por cierto, ¿has"
	line "oído que BILL está"
	cont "en la ciudad?"
	
	para "Por si no lo"
	line "sabías, ¡él creó"
	para "el Sistema de"
	line "Almacenamiento de"
	cont "los PC!"
	
	para "Deberías ir a"
	line "visitarlo si"
	cont "tienes la"
	cont "oportunidad."
	
	para "¡Bueno, me marcho!"
	line "¡Nos vemos!"
	done

UnknownText_0x69693:
	text "¡Oh, no! No puedes"
	line "llevar más"
	cont "#MON."

	para "Esperaré aquí a"
	line "que le hagas"
	cont "sitio al HUEVO."
	done

UnknownText_0x696f2:
	text "Pero…"
	line "El PROF. OAK"
	cont "preguntó por ti."
	done

UnknownText_0x69712:
	text "<PLAYER>, ¿tomas"
	line "el HUEVO?"
	done

UnknownText_0x6972d:
	text "He pensado que"
	line "sería genial co-"
	cont "nectarme y luchar"
	cont "con mis amigos que"
	cont "viven lejos."
	done

UnknownText_0x69791:
	text "Combatí con un"
	line "amigo de CALORINA"
	para "mediante un enlace"
	line "móvil."

	para "Si conectas un"
	line "ADAPTADOR DE MÓVIL"
	para "puedes enlazar con"
	line "un/a amigo/a"
	cont "lejano/a."
	done

PagotaPokecenter1FGameboyKidText:
	text "Un tal BILL creó"
	line "el Sistema de"
	cont "Almacenamiento"
	cont "de #MON."
	done

PagotaPokecenter1FGentlemanText:
	text "Fue hace un año"
	line "más o menos."

	para "El TEAM ROCKET"
	line "quería hacer daño"
	cont "a los #MON."

	para "Pero prevaleció la"
	line "justicia y un niño"
	cont "acabó con ellos."
	done

PagotaPokecenter1FYoungsterText:
	text "Los #MON son"
	line "listos y no"
	cont "obedecen a quien"
	cont "no respetan."

	para "Sin las MEDALLAS"
	line "necesarias, harán"
	cont "lo que ellos"
	cont "quieran."
	done

PagotaPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  7, PAGOTA_CITY, 5
	warp_event  6,  7, PAGOTA_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletPokecenterNurse, -1
	object_event  11,  4, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PagotaPokecenter1FGameboyKidScript, -1
	object_event  1,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PagotaPokecenter1FGentlemanScript, -1
	object_event  8,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PagotaPokecenter1FYoungsterScript, -1
	object_event  4,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PagotaPokecenter1F_ElmsAideScript, EVENT_OAKS_AIDE_IN_PAGOTA_POKEMON_CENTER
