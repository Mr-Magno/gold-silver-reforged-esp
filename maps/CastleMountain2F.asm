	const_def 2
	const CM2F_ITEMBALL1
	const CM2F_ITEMBALL2
	const CM2F_GRUNT1
	const CM2F_GRUNT2
	const CM2F_GRUNT3
	const CM2F_GRUNT4

CastleMountain2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .UnblockStairs
	
.UnblockStairs:
	checkevent EVENT_UNBLOCK_STAIRS_ROOM
	iffalse .Done
	changeblock $E, $12, $70
.Done:
	return

CM2FItemball1:
	itemball ULTRA_BALL

CM2FItemball2:
	itemball STEEL_SHELL


TrainerGruntM35:
	trainer GRUNTM, GRUNTM_35, EVENT_BEAT_ROCKET_GRUNTM_35, GruntM35SeenText, GruntM35BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM35AfterBattleText
	waitbutton
	closetext
	end
	
GruntM35SeenText:
	text "Oscuro y lúgubre."
	line "¡No podría haber"
	cont "elegido un mejor"
	cont "escondite!"
	done
	
GruntM35BeatenText:
	text "¡Ahora estoy"
	line "todo cubierto"
	cont "de polvo!"
	
	para "¡Me encanta!"
	done
	
GruntM35AfterBattleText:
	text "La señora EJE-"
	line "CUTIVA siempre"
	cont "planeas las"
	cont "mejores misiones."
	
	para "…Aunque ésta"
	line "implique escon-"
	cont "dernos lo más"
	cont "lejos posible de"
	cont "las autoridades"
	cont "de NIHON."
	done


TrainerGruntM36:
	trainer GRUNTM, GRUNTM_36, EVENT_BEAT_ROCKET_GRUNTM_36, GruntM36SeenText, GruntM36BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM36AfterBattleText
	waitbutton
	closetext
	end
	
GruntM36SeenText:
	text "¡Somos una unidad"
	line "ROCKET de élite!"
	done
	
GruntM36BeatenText:
	text "¡De-debes ser"
	line "de la élite"
	cont "también!"
	done
	
GruntM36AfterBattleText:
	text "Esconderse en"
	line "este CASTILLO"
	cont "hace sentirme"
	cont "que deberíamos"
	cont "llamarnos de una"
	cont "mejor forma y no"
	cont "TEAM ROCKET."
	
	para "Algo como…"
	
	para "¡El GRAN TEAM"
	line "ROCKET!"
	done


TrainerGruntF10:
	trainer GRUNTF, GRUNTF_10, EVENT_BEAT_ROCKET_GRUNTF_10, GruntF10SeenText, GruntF10BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF10AfterBattleText
	waitbutton
	closetext
	end
	
GruntF10SeenText:
	text "¡La señora EJE-"
	line "CUTIVA para"
	cont "combatir contra"
	cont "un chaval como tú,"
	cont "así que me lo"
	cont "deja a mí!"
	done
	
GruntF10BeatenText:
	text "¡No eres ninguna"
	line "broma, chaval!"
	done
	
GruntF10AfterBattleText:
	text "En nuestra unidad"
	line "hay más chicas"
	cont "que en ninguna"
	cont "otra."
	
	para "¡Eso se debe a"
	line "que la señora"
	cont "EJECUTIVA coge"
	cont "a las chicas más"
	cont "duras del TEAM"
	cont "ROCKET para"
	cont "entrenarlas!"
	done

TrainerGruntF11:
	trainer GRUNTF, GRUNTF_11, EVENT_BEAT_ROCKET_GRUNTF_11, GruntF11SeenText, GruntF11BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF11AfterBattleText
	waitbutton
	closetext
	end
	
GruntF11SeenText:
	text "¡He oído que este"
	line "viejo CASTILLO"
	cont "está encantado!"
	cont "¡Como si creyera"
	cont "en algo tan"
	cont "estúpido!"
	done
	
GruntF11BeatenText:
	text "¡Maldiciones!"
	done
	
GruntF11AfterBattleText:
	text "Todos los del"
	line "pueblo temen"
	cont "venir aquí a"
	cont "causa de un"
	cont "DRAGÓN VERDE y"
	cont "un fantasma de"
	cont "una mujer triste."
	
	para "¡Pues genial!"
	line "¡Así nadie vendrá"
	cont "a molestarnos!"
	done

HiddenDebris1:
	hiddenitem BRICK_PIECE, EVENT_CM_HIDDENITEM1
	
HiddenDebris2:
	hiddenitem STAR_PIECE, EVENT_CM_HIDDENITEM2
	
HiddenDebris3:
	hiddenitem BRICK_PIECE, EVENT_CM_HIDDENITEM3
	
HiddenDebris4:
	hiddenitem BRICK_PIECE, EVENT_CM_HIDDENITEM4

CastleMountain2F_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event  5, 13, CASTLE_MOUNTAIN_1F_CAVE, 2
	warp_event 14, 19, CASTLE_MOUNTAIN_1F_STAIRS, 3
	warp_event 15, 19, CASTLE_MOUNTAIN_1F_STAIRS, 4
	warp_event  6,  1, CASTLE_MOUNTAIN_3FA, 1
	warp_event  7,  1, CASTLE_MOUNTAIN_3FA, 1
	warp_event 22,  1, CASTLE_MOUNTAIN_3FB, 1
	warp_event 23,  1, CASTLE_MOUNTAIN_3FB, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event 20, 14, BGEVENT_ITEM, HiddenDebris1
	bg_event 24,  9, BGEVENT_ITEM, HiddenDebris2
	bg_event 19,  2, BGEVENT_ITEM, HiddenDebris3
	bg_event 10,  9, BGEVENT_ITEM, HiddenDebris4

	db 6 ; object events
	object_event 14,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CM2FItemball1, EVENT_CM_2F_ITEMBALL1
	object_event 23, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CM2FItemball2, EVENT_CM_2F_ITEMBALL2
	object_event 19, 11, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerGruntM35, EVENT_CASTLE_MTN_EVENTS_COMPLETE
	object_event  6,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerGruntM36, EVENT_CASTLE_MTN_EVENTS_COMPLETE
	object_event 24,  3, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerGruntF10, EVENT_CASTLE_MTN_EVENTS_COMPLETE
	object_event 23,  6, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerGruntF11, EVENT_CASTLE_MTN_EVENTS_COMPLETE
