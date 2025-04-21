	const_def 2
	const CM_3FB_ROCKETEXEC
	const CM3B_ITEMBALL1
	const CM3B_ITEMBALL2
	const CM3B_GRUNT1
	const CM3B_GRUNT2
	const CM3B_GRUNT3
	const CM3B_GRUNT4
	const CM3B_GRUNT5

CastleMountain3FB_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .KeepLeftHole
	
.DummyScene:
	end
	
.KeepLeftHole:
	checkevent EVENT_ACTIVATED_LEFT_CM_TRAPDOOR
	iffalse .DoneA
	changeblock $8, $4, $6C
.DoneA:
	jump .KeepRightHole

.KeepRightHole:
	checkevent EVENT_ACTIVATED_RIGHT_CM_TRAPDOOR
	iffalse .DoneB
	changeblock $A, $4, $6B
.DoneB:
	jump .KeepTopHole
	
.KeepTopHole
	checkevent EVENT_ACTIVATED_TOP_CM_TRAPDOOR
	iffalse .DoneC
	changeblock $8, $2, $6D
.DoneC
	return


Exec1Left:
	checkevent EVENT_BEAT_CM_ROCKET_EXECUTIVE
	iftrue .end1
	showemote EMOTE_SHOCK, CM_3FB_ROCKETEXEC, 10
	pause 10
	turnobject CM_3FB_ROCKETEXEC, DOWN
	opentext
	
	writetext Exec1BeforeText
	waitbutton
	closetext
	winlosstext Exec1BeatenText, 0
	loadtrainer EXECUTIVEF, EXECUTIVEF_1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CM_ROCKET_EXECUTIVE
	opentext
	writetext IllSendUToTheDungeonText
	waitbutton
	closetext
	turnobject CM_3FB_ROCKETEXEC, LEFT
	pause 10
	setevent EVENT_ACTIVATED_LEFT_CM_TRAPDOOR
	setevent EVENT_UNBLOCK_STAIRS_ROOM
	playsound SFX_WALL_OPEN
	changeblock $8, $4, $6C
	reloadmappart
	showemote EMOTE_SHOCK, PLAYER, 10
	pause 5
	warpcheck
.end1:
	end

Exec1Right:
	checkevent EVENT_BEAT_CM_ROCKET_EXECUTIVE
	iftrue .end2
	showemote EMOTE_SHOCK, CM_3FB_ROCKETEXEC, 10
	pause 10
	turnobject CM_3FB_ROCKETEXEC, DOWN
	opentext
	
	writetext Exec1BeforeText
	waitbutton
	closetext
	winlosstext Exec1BeatenText, 0
	loadtrainer EXECUTIVEF, EXECUTIVEF_1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CM_ROCKET_EXECUTIVE
	opentext
	writetext IllSendUToTheDungeonText
	waitbutton
	closetext
	turnobject CM_3FB_ROCKETEXEC, LEFT
	pause 10
	setevent EVENT_ACTIVATED_RIGHT_CM_TRAPDOOR
	setevent EVENT_UNBLOCK_STAIRS_ROOM
	playsound SFX_WALL_OPEN
	changeblock $A, $4, $6B
	reloadmappart
	showemote EMOTE_SHOCK, PLAYER, 10
	pause 5
	warpcheck
.end2:
	end


Exec1BeforeText:
	text "Así que has"
	line "logrado llegar"
	cont "hasta mí, ¿eh?"
	
	para "¡Sólo porque has"
	line "logrado superar a"
	cont "mis suberdinados,"
	cont "no creas que vas"
	cont "a durar ni un"
	cont "segundo comba-"
	cont "tiendo conmigo!"
	
	para "¡Te voy a ense-"
	line "ñar por qué soy"
	cont "la mejor EJECU-"
	cont "TIVA de GIOVANNI!"
	done

Exec1BeatenText:
	text "¡Imposible!"
	line "¡Improbable!"
	
	para "¡Ningún crío"
	line "debería tener"
	cont "tal poder!"
	done

IllSendUToTheDungeonText:
	text "¡Já! ¡No pienses"
	line "que me has"
	cont "ganado todavía!"
	
	para "¡Esta torre tiene"
	line "una bomba!"
	
	para "Ahora, ¡baja a"
	line "la mazmorra!"
	cont "¡Jojojojo!"
	done


CastleArianaScript:
	faceplayer
	opentext
	writetext HowDidUGetBackText
	waitbutton
	closetext
	pause 10
	turnobject CM_3FB_ROCKETEXEC, LEFT
	opentext
	writetext BackToTheDungeonUGoText
	waitbutton
	closetext
	playsound SFX_WALL_OPEN
	changeblock $8, $2, $6D
	reloadmappart
	showemote EMOTE_SHOCK, CM_3FB_ROCKETEXEC, 10
	playsound SFX_WARP_FROM
	disappear CM_3FB_ROCKETEXEC
	opentext
	writetext AhhhhText
	pause 15
	closetext
	setevent EVENT_ACTIVATED_TOP_CM_TRAPDOOR
	clearevent EVENT_CASTLE_B1F_SPRITES_NOT_SHOWN
	end
	

HowDidUGetBackText:
	text "¿¡Qu-Qué!?"
	line "¿¡Cómo has esca-"
	cont "pado con vida de"
	cont "la mazmora!?"
	done
	
BackToTheDungeonUGoText:
	text "¡No importa!"
	
	para "¡Esta sala está"
	line "llena de trampas!"
	
	para "¡Te enviaré de"
	line "vuelta abajo!"
	done

AhhhhText:
	text "¡AHHHHHHHH!"
	done

CM3BItemball1:
	itemball SNAKESKIN
	
CM3BItemball2:
	itemball RARE_CANDY

TrainerGruntM40:
	trainer GRUNTM, GRUNTM_40, EVENT_BEAT_ROCKET_GRUNTM_40, GruntM40SeenText, GruntM40BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM40AfterBattleText
	waitbutton
	closetext
	end
	
GruntM40SeenText:
	text "¡Soy un veterano"
	line "de la gran"
	cont "COMPAÑÍA SILPH!"
	done
	
GruntM40BeatenText:
	text "Esta joventud."
	done
	
GruntM40AfterBattleText:
	text "Me pregunto qué"
	line "habrá sido de los"
	cont "4 HERMANOS ROCKET."
	done


TrainerGruntM41:
	trainer GRUNTM, GRUNTM_41, EVENT_BEAT_ROCKET_GRUNTM_41, GruntM41SeenText, GruntM41BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM41AfterBattleText
	waitbutton
	closetext
	end
	
GruntM41SeenText:
	text "¡Soy"
	line "impredecible!"
	
	para "¡Nunca sabrás"
	line "los movimientos"
	cont "de mis #MON!"
	done
	
GruntM41BeatenText:
	text "¡Superado!"
	done
	
GruntM41AfterBattleText:
	text "¡SMEARGLE es"
	line "marvavilloso!"
	
	para "¡Puede aprender"
	line "cualquier movi-"
	cont "miento con poco"
	cont "esfuerzo!"
	done


TrainerGruntF14:
	trainer GRUNTF, GRUNTF_14, EVENT_BEAT_ROCKET_GRUNTF_14, GruntF14SeenText, GruntF14BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF14AfterBattleText
	waitbutton
	closetext
	end
	
GruntF14SeenText:
	text "¡Tu pequeña"
	line "gesta medieval"
	cont "termina aquí!!"
	done
	
GruntF14BeatenText:
	text "¡Machacado!"
	done
	
GruntF14AfterBattleText:
	text "Si realmente"
	line "existe el DRAGÓN"
	cont "VERDE, ¡el TEAM"
	cont "ROCKET lo atra-"
	cont "pará y venderá"
	cont "para su propio"
	cont "beneficio!"
	done

TrainerGruntF15:
	trainer GRUNTF, GRUNTF_15, EVENT_BEAT_ROCKET_GRUNTF_15, GruntF15SeenText, GruntF15BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF15AfterBattleText
	waitbutton
	closetext
	end
	
GruntF15SeenText:
	text "¡Te enseñaré las"
	line "garras ocultas"
	cont "de este visón!"
	done
	
GruntF15BeatenText:
	text "¡Desgastado como"
	line "un abrigo de piel!"
	done
	
GruntF15AfterBattleText:
	text "SNEASEL es mono"
	line "pero muy astuto,"
	cont "¡como yo!"
	done


TrainerGruntF16:
	trainer GRUNTF, GRUNTF_16, EVENT_BEAT_ROCKET_GRUNTF_16, GruntF16SeenText, GruntF16BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF16AfterBattleText
	waitbutton
	closetext
	end
	
GruntF16SeenText:
	text "¡El TEAM ROCKET"
	line "no le teme a nada!"
	done
	
GruntF16BeatenText:
	text "¡Agh!"
	done
	
GruntF16AfterBattleText:
	text "¡El TEAM ROCKET"
	line "está por encima"
	cont "de la ley!"
	
	para "¿Por qué crees"
	line "que GIOVANNI"
	cont "sigue siendo"
	cont "parte del ALTO"
	cont "MANDO?"
	
	para "¡Piensa un poco!"
	line "¡Todo nos"
	cont "pertenece!"
	done



CastleMountain3FB_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event 11, 56, CASTLE_MOUNTAIN_2F, 6
	warp_event 11, 69, CASTLE_MOUNTAIN_3FB, 3
	
	warp_event 11, 49, CASTLE_MOUNTAIN_3FB, 2
	warp_event 11, 36, CASTLE_MOUNTAIN_3FB, 5
	
	warp_event 11, 16, CASTLE_MOUNTAIN_3FB, 4
	warp_event 11, 29, CASTLE_MOUNTAIN_3FB, 7
	
	warp_event 11,  9, CASTLE_MOUNTAIN_3FB, 6
	
	warp_event 10,  4, CASTLE_MOUNTAIN_B1F, 2
	warp_event  9,  4, CASTLE_MOUNTAIN_B1F, 2
	warp_event  9,  3, CASTLE_MOUNTAIN_B1F, 3

	db 2 ; coord events
	coord_event  9,  4, SCENE_DEFAULT, Exec1Left
	coord_event 10,  4, SCENE_DEFAULT, Exec1Right

	db 0 ; bg events

	db 8 ; object events
	object_event  9,  3, SPRITE_ROCKET_EXECUTIVE_F, SPRITEMOVEDATA_STANDING_UP, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CastleArianaScript, EVENT_ACTIVATED_TOP_CM_TRAPDOOR
	object_event 17, 63, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CM3BItemball1, EVENT_CM3B_ITEMBALL1
	object_event  6, 48, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CM3BItemball2, EVENT_CM3B_ITEMBALL2
	object_event 13, 36, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerGruntM40, EVENT_CASTLE_MTN_EVENTS_COMPLETE
	object_event 10, 26, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerGruntM41, EVENT_CASTLE_MTN_EVENTS_COMPLETE
	object_event  9, 64, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerGruntF14, EVENT_CASTLE_MTN_EVENTS_COMPLETE
	object_event  5, 42, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerGruntF15, EVENT_CASTLE_MTN_EVENTS_COMPLETE
	object_event  9, 20, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerGruntF16, EVENT_CASTLE_MTN_EVENTS_COMPLETE
