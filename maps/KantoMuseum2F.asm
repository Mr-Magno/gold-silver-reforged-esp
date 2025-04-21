	const_def 2 ; object constants
	const MUSEUM_NPC_6
	const MUSEUM_NPC_7
	const MUSEUM_NPC_8
	const MUSEUM_NPC_9
	const MUSEUM_NPC_10

KantoMuseum2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MuseumYoungster:
	jumptextfaceplayer MuseumYoungsterText
	
MuseumYoungsterText:
	text "Si la PIEDRA"
	line "LUNAR viene del"
	cont "MT.MOON, ¿quiere"
	cont "decir que hay un"
	cont "MT.SOLAR lleno"
	cont "de PIEDRAs SOLAR?"
	done
	
MuseumUpstairGramps:
	jumptextfaceplayer MuseumUpstairGrampsText
	
MuseumUpstairGrampsText:
	text "Nunca des tu vida"
	line "por sentada."
	
	para "¡Algún día podrían"
	line "desenterrar tus"
	cont "TUS huesos y"
	cont "ponerte en un"
	cont "museo!"
	done

MuseumUpstairScientist:
	jumptextfaceplayer MuseumUpstairScientistText
	
MuseumUpstairScientistText:
	text "¡Bienvenido a"
	line "nuestra exposición"
	cont "sobre el espacio."
	done
	
MuseumKid:
	jumptextfaceplayer MuseumKidText
	
MuseumKidText:
	text "¡Va, hermana"
	line "mayor! Si papá"
	cont "te atrapó un"
	cont "PIKACHU, 'yo"
	cont "al menos podría"
	cont "tener un PICHU!"
	done


MuseumLass:
	jumptextfaceplayer MuseumLassText
	
MuseumLassText:
	text "Los críos crecen"
	line "tan rápido…"
	done

Columbia:
	jumptext _Museum2FText6

_Museum2FText6:
	text "NAVE ESPACIAL"
	line "COLUMBIA"
	done

MoonStones:
	jumptext _Museum2FText7

_Museum2FText7:
	text "Meteorito caído"
	line "en el MT. MOON."
	cont "(¿PIEDRA LUNAR?)"
	done

KantoMuseum2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  7, KANTO_MUSEUM_1F, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event 11,  2, BGEVENT_READ, Columbia
	bg_event 2,  5, BGEVENT_READ, MoonStones

	db 5 ; object events
	object_event  $1, $7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MuseumYoungster, -1
	object_event  $0, $5, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MuseumUpstairGramps, -1
	object_event  $7, $5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MuseumUpstairScientist, -1
	object_event  $b, $5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MuseumKid, -1
	object_event  $c, $5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MuseumLass, -1
