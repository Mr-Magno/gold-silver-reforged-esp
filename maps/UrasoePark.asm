	const_def 2 ; object constants
	const ROUTE10SOUTH_POKEFAN_M1
	const ROUTE10SOUTH_POKEFAN_M2
	const ROUTE10SOUTH_SUPER_NERD
	const ROUTE10SOUTH_LASS
	const ROUTE10SOUTH_ITEMBALL

UrasoePark_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerHikerJim:
	trainer HIKER, JIM, EVENT_BEAT_HIKER_JIM, HikerJimSeenText, HikerJimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerJimAfterBattleText
	waitbutton
	closetext
	end

TrainerEngineerLandon:
	trainer ENGINEER, LANDON, EVENT_BEAT_ENGINEER_LANDON, EngineerLandonSeenText, EngineerLandonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext EngineerLandonAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmRobert:
	trainer POKEFANM, ROBERT, EVENT_BEAT_POKEFANM_ROBERT, PokefanmRobertSeenText, PokefanmRobertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmRobertAfterBattleText
	waitbutton
	closetext
	end
	
UrasoeParkLassScript:
	jumptextfaceplayer UrasoeParkLassText

Route10Sign:
	jumptext Route10SignText
	

UrasoeParkLeafstone:
	itemball LEAF_STONE

	
UrasoeParkLassText:
	text "Los #MON aquí"
	line "son muy fuertes."

	para "Este terreno se"
	line "reservó para que"
	para "CIUDAD RYUKYU no"
	line "pudiera expandirse"
	cont "en él."
	done

HikerJimSeenText:
	text "¡Jajaja!"
	done

HikerJimBeatenText:
	text "¡Aaaaaaachís!"
	done

HikerJimAfterBattleText:
	text "¡Toda esta hierba"
	line "me está haciendo"
	cont "estornudar!"
	
	para "¡ACHÚS!"
	done

PokefanmRobertSeenText:
	text "Te gustan los"
	line "#MON, ¿verdad?"

	para "¡A mí también!"
	done

PokefanmRobertBeatenText:
	text "Debo admitir mi"
	line "derrota."
	done

PokefanmRobertAfterBattleText:
	text "Mira lo que le has"
	line "hecho a mi"
	cont "#MON."

	para "No lo olvidaré…"
	done
	
EngineerLandonSeenText:
	text "¡Creo que tengo"
	line "un plan para ganar"
	cont "este combate!"
	done
	
EngineerLandonBeatenText:
	text "¡Necesito refinar"
	line "el plan!"
	done
	
EngineerLandonAfterBattleText:
	text "El plan para ganar"
	line "era tener #MON"
	cont "más fuertes."
	done

Route10SignText:
	text "PARQUE URASOE"

	para "Una reserva"
	line "natural para"
	cont "#MON"
	done

UrasoePark_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 22,  1, RYUKYU_URASOE_GATE, 3
	warp_event 23,  1, RYUKYU_URASOE_GATE, 4
	warp_event 18, 13, URASOE_PARK_URASOE_TRAIL_GATE, 1
	warp_event 19, 13, URASOE_PARK_URASOE_TRAIL_GATE, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event 20,  2, BGEVENT_READ, Route10Sign

	db 5 ; object events
	object_event 30,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerJim, -1
	object_event 16,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmRobert, -1
	object_event  4,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerEngineerLandon, -1
	object_event  3, 15, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, UrasoeParkLassScript, -1
	object_event 39,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UrasoeParkLeafstone, EVENT_PICKED_UP_GOLD_BERRY_FROM_HO_OH_ITEM_ROOM
