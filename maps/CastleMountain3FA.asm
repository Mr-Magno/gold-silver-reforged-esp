	const_def 2
	const CM3A_NUGGET1
	const CM3A_NUGGET2
	const CM3A_NUGGET3
	const CM3A_NUGGET4
	const CM3A_NUGGET5
	const CM3A_NUGGET6
	const CM3A_NUGGET7
	const CM3A_NUGGET8
	const CM3A_GRUNT1
	const CM3A_GRUNT2
	const CM3A_GRUNT3
	const CM3A_GRUNT4
	const CM3A_GRUNT5
	const CM3A_DESERTER

CastleMountain3FA_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CM3ANugget1:
	itemball NUGGET

TrainerGruntM37:
	trainer GRUNTM, GRUNTM_37, EVENT_BEAT_ROCKET_GRUNTM_37, GruntM37SeenText, GruntM37BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM37AfterBattleText
	waitbutton
	closetext
	end
	
GruntM37SeenText:
	text "¡Ocúpate de tus"
	line "asuntos y da"
	cont "media vuelta!"
	done
	
GruntM37BeatenText:
	text "Tengo muchas"
	line "cosas en"
	cont "la cabeza."
	done
	
GruntM37AfterBattleText:
	text "Mejor tener algo"
	line "que no ser un"
	cont "cabeza hueca."
	done

TrainerGruntM38:
	trainer GRUNTM, GRUNTM_38, EVENT_BEAT_ROCKET_GRUNTM_38, GruntM38SeenText, GruntM38BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM38AfterBattleText
	waitbutton
	closetext
	end
	
GruntM38SeenText:
	text "¡Soy el ROCKET"
	line "zurdo! ¡No te"
	cont "creas lo que"
	cont "dice el dies-"
	cont "tro sobre mí!"
	done
	
GruntM38BeatenText:
	text "Hay que tener"
	line "mano izquierda…"
	done
	
GruntM38AfterBattleText:
	text "No me digas que"
	line "eres el típico"
	cont "que confunde la"
	cont "izquierda con"
	cont "la derecha."
	
	para "¡Lo odio!"
	done

TrainerGruntM39:
	trainer GRUNTM, GRUNTM_39, EVENT_BEAT_ROCKET_GRUNTM_39, GruntM39SeenText, GruntM39BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM39AfterBattleText
	waitbutton
	closetext
	end
	
GruntM39SeenText:
	text "¡Soy el ROCKET"
	line "diestro! ¡Soy"
	cont "la mano derecha"
	cont "de esta unidad"
	cont "del TEAM ROCKET!"
	done
	
GruntM39BeatenText:
	text "¡Que no vea tu"
	line "mano derecha lo"
	cont "que hace tu"
	cont "mano izquierda!"
	done
	
GruntM39AfterBattleText:
	text "¡Soy mucho más"
	line "fuerte que ese"
	cont "ROCKET zurdo"
	cont "ese de ahí!"
	done

TrainerGruntF12:
	trainer GRUNTF, GRUNTF_12, EVENT_BEAT_ROCKET_GRUNTF_12, GruntF12SeenText, GruntF12BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF12AfterBattleText
	waitbutton
	closetext
	end
	
GruntF12SeenText:
	text "¡No hay nada"
	line "por aquí! ¡Vas"
	cont "en dirección"
	cont "contraria!"
	done
	
GruntF12BeatenText:
	text "Continúa, ¡pero"
	line "te aseguro que"
	cont "no encontrarás"
	cont "nada!"
	
	para "¡Especialmente"
	line "ningún gran alijo"
	cont "de tesoros ni"
	cont "nada parecido!"
	done
	
GruntF12AfterBattleText:
	text "Uuups…"
	done


TrainerGruntF13:
	trainer GRUNTF, GRUNTF_13, EVENT_BEAT_ROCKET_GRUNTF_13, GruntF13SeenText, GruntF13BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF13AfterBattleText
	waitbutton
	closetext
	end
	
GruntF13SeenText:
	text "¡De verdad que"
	line "no hay nada!"
	
	para "¡Te SUPLICO que"
	line "des media vuelta!"
	done
	
GruntF13BeatenText:
	text "¿Ya estás dando"
	line "media vuelta?"
	done
	
GruntF13AfterBattleText:
	text "¡He dicho que des"
	line "media vuelta!"
	done

DeserterScript:
	jumptextfaceplayer DeserterText
	
DeserterText:
	text "¿Vienes buscando"
	line "pelea o algo?"
	
	para "Pues no la vas"
	line "a encontrar."
	
	para "Ya no cometo"
	line "crímenes, ¡estoy"
	cont "harto de llevar"
	cont "esta R roja!"
	
	para "¡Conseguí una"
	line "cama aquí y una"
	cont "isla entera donde"
	cont "nadie sabe mi"
	cont "nombre ni mi"
	cont "historial!"
	
	para "¡Así que déjame"
	line "en paz! Ahora"
	cont "vivo mejor."
	
	para "No hay ningún"
	line "gran tesoro en"
	cont "esta torre, proba-"
	cont "blemente se lo"
	cont "llevaron de aquí."
	done

CM3FABed:
	opentext
	writetext CM3FABedText1
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	special FadeInQuickly
	opentext
	writetext CM3FABedText2
	waitbutton
	closetext
	end

CM3FABedText1:
	text "¡Una cama!"
	line "A dormir…"
	done

CM3FABedText2:
	text "Ah, ¡fresco"
	line "como una rosa!"
	done

CastleMountain3FA_MapEvents:
	db 0, 0 ; filler

	db 19 ; warp events
	warp_event 11, 56, CASTLE_MOUNTAIN_2F, 4
	warp_event 11, 69, CASTLE_MOUNTAIN_3FA, 3
	
	warp_event 11, 49, CASTLE_MOUNTAIN_3FA, 2
	warp_event 11, 36, CASTLE_MOUNTAIN_3FA, 5
	
	warp_event 11, 16, CASTLE_MOUNTAIN_3FA, 4
	warp_event 11, 29, CASTLE_MOUNTAIN_3FA, 7
	
	warp_event 11,  9, CASTLE_MOUNTAIN_3FA, 6
	
	;drop holes
	warp_event  2,  7, CASTLE_MOUNTAIN_3FA, 10  ;8
	warp_event  3,  7, CASTLE_MOUNTAIN_3FA, 11 ;9
	warp_event  2, 22, CASTLE_MOUNTAIN_3FA, 0 ;10
	warp_event  3, 22, CASTLE_MOUNTAIN_3FA, 0  ; 11
	warp_event  2, 23, CASTLE_MOUNTAIN_3FA, 14 ; 12
	warp_event  3, 23, CASTLE_MOUNTAIN_3FA, 15 ; 13
	warp_event  2, 44, CASTLE_MOUNTAIN_3FA, 0 ; 14
	warp_event  3, 44, CASTLE_MOUNTAIN_3FA, 0 ; 15
	warp_event  2, 45, CASTLE_MOUNTAIN_3FA, 18 ; 16
	warp_event  3, 45, CASTLE_MOUNTAIN_3FA, 19 ; 17
	warp_event  4, 57, CASTLE_MOUNTAIN_3FA, 0 ; 18
	warp_event  5, 57, CASTLE_MOUNTAIN_3FA, 0  ; 19

	db 0 ; coord events

	db 2 ; bg events
	bg_event 17,  4, BGEVENT_READ, CM3FABed
	bg_event 17,  5, BGEVENT_READ, CM3FABed

	db 14 ; object events
	object_event 10,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CM3ANugget1, EVENT_CM3A_NUGGET1
	object_event 10,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CM3ANugget1, EVENT_CM3A_NUGGET2
	object_event 11,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CM3ANugget1, EVENT_CM3A_NUGGET3
	object_event 10,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CM3ANugget1, EVENT_CM3A_NUGGET4
	object_event  9,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CM3ANugget1, EVENT_CM3A_NUGGET5
	object_event  9,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CM3ANugget1, EVENT_CM3A_NUGGET6
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CM3ANugget1, EVENT_CM3A_NUGGET7
	object_event  9,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CM3ANugget1, EVENT_CM3A_NUGGET8
	object_event 14, 63, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerGruntM37, EVENT_CASTLE_MTN_EVENTS_COMPLETE
	object_event  5, 41, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerGruntM38, EVENT_CASTLE_MTN_EVENTS_COMPLETE
	object_event 16, 41, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerGruntM39, EVENT_CASTLE_MTN_EVENTS_COMPLETE
	object_event  9, 24, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerGruntF12, EVENT_CASTLE_MTN_EVENTS_COMPLETE
	object_event 12, 20, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerGruntF13, EVENT_CASTLE_MTN_EVENTS_COMPLETE
	object_event 16,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, DeserterScript, EVENT_DESERTER_ROCKET_GRUNT
