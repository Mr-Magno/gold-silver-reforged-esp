	const_def 2 ; object constants
	const NAGO_VILLAGE_TEACHER
	const NAGO_VILLAGE_FISHING_GURU

NagoVillage_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CERULEAN
	return

NagoVillagePokecenterSign:
	jumpstd pokecentersign
	
NagoVillageSign:
	jumptext NagoVillageSignText

NagoVillageHiddenBerserkGene:
	hiddenitem BERSERK_GENE, EVENT_FOUND_BERSERK_GENE_IN_NAGO_VILLAGE
	
NagoVillageTeacherScript:
	jumptextfaceplayer NagoVillageTeacherText
	
NagoVillageFishingGuruScript:
	jumptextfaceplayer NagoVillageFishingGuruText
	
NagoVillageFishingGuruText:
	text "¡Si algo tiene"
	line "este pueblo, es"
	cont "que es estupendo"
	cont "para pescar!"
	done
	
NagoVillageTeacherText:
	text "Tan pronto como"
	line "llegas a este"
	cont "pueblo, puedes"
	cont "pasarlo de largo."

	para "No tiene mucho que"
	line "ofrecer, pero"
	cont "espero que al"
	cont "menos te guste."
	done
	
NagoVillageSignText:
	text "VILLA NAGO"

	para "Un sosegado lugar"
	line "costero"
	done

NagoVillage_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  4, NAGO_POKECENTER_1F, 1
	warp_event 10, 15, NAGO_IMPOSTER_HOUSE, 1
	warp_event  5, 21, NAGO_CHARMANDER_HOUSE, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event  6,  4, BGEVENT_READ, NagoVillagePokecenterSign
	bg_event 16,  5, BGEVENT_ITEM, NagoVillageHiddenBerserkGene
	bg_event  7, 11, BGEVENT_READ, NagoVillageSign

	db 2 ; object events
	object_event  7,  9, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NagoVillageTeacherScript, -1
	object_event 17, 20, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NagoVillageFishingGuruScript, -1
