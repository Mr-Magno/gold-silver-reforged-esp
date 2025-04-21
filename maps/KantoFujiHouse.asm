	const_def 2
	const MRFUJISHOUSE_SUPER_NERD
	const MRFUJISHOUSE_LASS
	const MRFUJISHOUSE_PSYDUCK
	const MRFUJISHOUSE_NIDORINO
	const MRFUJISHOUSE_PIDGEY
	const MRFUJI_HIMSELF

KantoFujiHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks


MrFujisHouseSuperNerdScript:
	jumptextfaceplayer MrFujisHouseSuperNerdText

MrFujisHouseLassScript:
	jumptextfaceplayer MrFujisHouseLassText

MrFujisPsyduck:
	opentext
	writetext MrFujisPsyduckText
	cry PSYDUCK
	waitbutton
	closetext
	end

MrFujisNidorino:
	opentext
	writetext MrFujisNidorinoText
	cry NIDORINO
	waitbutton
	closetext
	end

MrFujisPidgey:
	opentext
	writetext MrFujisPidgeyText
	cry PIDGEY
	waitbutton
	closetext
	end


MrFujisHouseSuperNerdText:
	text "Esta es la"
	line "casa del SR.FUJI."

	para "¡Es muy majo!"

	para "¡Cuida a #MON"
	line "abandonados y"
	cont "huérfanos!"
	done

MrFujisHouseLassText:
	text "Hay gente insen-"
	line "sible que deja de"
	cont "cuidar a sus"
	cont "#MON."

	para "El abuelo acoge"
	line "a los #MON"

	para "sin hogar y los"
	line "cuida."
	done

MrFujisPsyduckText:
	text "PSYDUCK: ¿Duck?"
	done

MrFujisNidorinoText:
	text "NIDORINO: ¡Nido!"
	done

MrFujisPidgeyText:
	text "PIDGEY: ¡Pidgi!"
	done

MrFuji:
	checkevent EVENT_GOT_CLEANSE_TAG
	iftrue MrFujiFinal
	checkevent EVENT_BEAT_TOWER_GENGAR
	iftrue MrFujiAfter
	jumptextfaceplayer MrFujiEventText
	
MrFujiAfter:
	faceplayer
	opentext
	writetext MrFujiAfterText
	waitbutton
	verbosegiveitem CLEANSE_TAG
	iffalse .NoRoom
	setevent EVENT_GOT_CLEANSE_TAG
	writetext FujiCleanseTagText
	waitbutton
.NoRoom:
	closetext
	end
	
MrFujiFinal:
	jumptextfaceplayer FujiFinalText
	
MrFujiEventText:
	text "SR.FUJI:"
	line "Bienvenido."

	para "Mmm… Parece que"
	line "cuidas a tus"
	cont "#MON con"
	cont "mucho amor y"
	cont "cariño."
	
	para "Los entrenadores"
	line "#MON más fuer-"
	cont "tes son aquellos"
	cont "que tienen un"
	cont "buen corazón."
	
	para "Tengo que pedirte"
	line "un favor…"
	
	para "Ocurre algo"
	line "dentro de la"
	cont "TORRE #MON."
	
	para "Puedo confiar en"
	line "ti para que los"
	cont "investigues."
	
	para "Vuelve a verme"
	line "cuando se"
	cont "resuelva."
	done
	
MrFujiAfterText:
	text "¡Ah! Así que la"
	line "el origen de la"
	cont "inquietud era un"
	cont "malvado GENGAR."
	
	para "Puede que no lo"
	line "parezca, pero es"
	cont "un alivio oírlo."
	
	para "La última vez"
	line "que la TORRE"
	cont "#MON se vio"
	cont "involucrada en"
	cont "algo, resultó ser"
	cont "un ataque del"
	cont "TEAM ROCKET."
	
	para "El daño que"
	line "causaron fue"
	cont "irreparable…"
	
	para "Así que me alegra"
	line "saber que sólo"
	cont "fueron las tra-"
	cont "vesuras de un"
	cont "#MON FANTASMA"
	cont "y nada más."
	
	para "Como prometí, un"
	line "obsequio de"
	cont "agradecimiento."
	done

FujiCleanseTagText:
	text "Es un AMULETO."
	line "Mantendrá ale-"
	cont "jados a #MON"
	cont "salvajes cuando"
	cont "uno de los tuyos"
	cont "lo tenga equipado."
	done

FujiFinalText:
	text "SE.FUJI: Por"
	line "favor, sigue tra-"
	cont "tando a tus"
	cont "#MON con"
	cont "amabilidad."
	
	para "Siempre…"
	done

KantoFujiHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 4, 7, KANTO_REGION, 43
	warp_event 5, 7, KANTO_REGION, 43

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event  7,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MrFujisHouseSuperNerdScript, -1
	object_event  1,  4, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrFujisHouseLassScript, -1
	object_event  7,  4, SPRITE_RHYDON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrFujisPsyduck, -1
	object_event  5,  5, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MrFujisNidorino, -1
	object_event  1,  3, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MrFujisPidgey, -1
	object_event  4,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MrFuji, -1
	