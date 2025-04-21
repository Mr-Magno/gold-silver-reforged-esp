	const_def 2 ; object constants
	const ROUTE39_BEAUTY
	const ROUTE39_POKEFAN_M
	const ROUTE39_POKEFAN_F1
	const ROUTE39_PSYCHIC_NORMAN
	const ROUTE39_FRUIT_TREE
	const ROUTE39_POKEFAN_F2
	const ROUTE39_STANDING_YOUNGSTER
	const ROUTE39_BUENA2

Route109_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
TrainerSailorHarry:
	trainer SAILOR, HARRY, EVENT_BEAT_SAILOR_HARRY, SailorHarrySeenText, SailorHarryBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext SailorHarryAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyChad1:
	trainer SCHOOLBOY, CHAD, EVENT_BEAT_SCHOOLBOY_CHAD, SchoolboyChad1SeenText, SchoolboyChad1BeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext SchoolboyChad1AfterBattleText
	waitbutton
	closetext
	end


TrainerPokefanmDerek:
	trainer POKEFANM, DEREK, EVENT_BEAT_POKEFANM_DEREK, PokefanmDerekSeenText, PokefanmDerekBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext PokefanMDerekText_NotBragging
	waitbutton
	closetext
	end

TrainerPokefanfRuth:
	trainer POKEFANF, RUTH, EVENT_BEAT_POKEFANF_RUTH, PokefanfRuthSeenText, PokefanfRuthBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanfRuthAfterBattleText
	waitbutton
	closetext
	end


TrainerBeautyValerie:
	trainer BEAUTY, VALERIE, EVENT_BEAT_BEAUTY_VALERIE, BeautyValerieSeenText, BeautyValerieBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BeautyValerieAfterBattleText
	waitbutton
	closetext
	end


TrainerPsychicNorman:
	trainer PSYCHIC_T, NORMAN, EVENT_BEAT_PSYCHIC_NORMAN, PsychicNormanSeenText, PsychicNormanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicNormanAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfJaime:
	faceplayer
	opentext
	checktime NITE
	iffalse .NotNight
	checkevent EVENT_BEAT_POKEFANF_JAIME
	iftrue .Beaten
	writetext PokefanfJaimeSeenText
	waitbutton
	closetext
	winlosstext PokefanfJaimeBeatenText, 0
	loadtrainer POKEFANF, JAIME
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_POKEFANF_JAIME
	closetext
	end

.Beaten:
	writetext PokefanfJaimeAfterBattleText
	waitbutton
	closetext
	end

.NotNight:
	writetext PokefanfJaimeHopeItGetsDarkText
	waitbutton
	closetext
	end

MoomooFarmSign:
	jumptext MoomooFarmSignText

Route109TrainerTips:
	jumptext Route109TrainerTipsText

Route109FruitTree:
	fruittree FRUITTREE_ROUTE_109

Route109HiddenNugget:
	hiddenitem NUGGET, EVENT_ROUTE_39_HIDDEN_NUGGET

Route109ChixText:
	text "CHIX: ¡Muuu!"
	done

PokefanmDerekSeenText:
	text "¡Es buen momento"
	line "para alardear de"
	cont "mi PIKACHU!"
	done

PokefanmDerekBeatenText:
	text "No tuve tiempo de"
	line "presumir de mi"
	cont "PIKACHU…"
	done

PokefanMDerekText_NotBragging:
	text "¡No te estoy"
	line "escuchando!"

	para "¡Los #FANS"
	line "tenemos por norma"
	para "no escuchar a la"
	line "gente presumida!"
	done

PokefanfRuthSeenText:
	text "¡Qué #MON más"
	line "encantadores!"

	para "Enseñemos nuestros"
	line "#MON al mismo"
	cont "tiempo."
	done

PokefanfRuthBeatenText:
	text "No me importa"
	line "perder."
	done

PokefanfRuthAfterBattleText:
	text "¿Sabes algo sobre"
	line "los #MON bebés?"

	para "¡Son todos tan"
	line "adorables!"
	done

PokefanMDerekPikachuIsItText:
	text "¡PIKACHU es lo"
	line "más! ¿No crees?"
	done

PsychicNormanSeenText:
	text "Déjame ver de qué"
	line "son capaces tus"
	cont "#MON."
	done

PsychicNormanBeatenText:
	text "¡Ooh! Tus #MON"
	line "tienen potencial."
	done

PsychicNormanAfterBattleText:
	text "¿Sabes que los"
	line "#MON tienen"
	para "distintas"
	line "habilidades?"

	para "Son como las"
	line "personas. Cada uno"
	para "tiene su propio"
	line "potencial."
	done

PokefanfJaimeHopeItGetsDarkText:
	text "Jujujuju… Espero"
	line "que oscurezca"
	cont "pronto."
	done

PokefanfJaimeSeenText:
	text "Llegas justo a"
	line "tiempo."

	para "Luchemos."
	done

PokefanfJaimeBeatenText:
	text "Oh, qué"
	line "decepcionante…"
	done

PokefanfJaimeAfterBattleText:
	text "Encontré mi PONYTA"
	line "aquí por la noche,"
	cont "en la RUTA 109."

	para "No estoy segura,"
	line "pero parece que"
	para "le gusta que me"
	line "entrene aquí."

	para "Cuando estamos por"
	line "esta zona, se"
	cont "vuelve más cari-"
	cont "ñoso."
	done


BeautyValerieSeenText:
	text "¡Hola! ¡Tienes"
	line "buen aspecto!"

	para "¿Me dejas ver a"
	line "tus #MON?"
	done

BeautyValerieBeatenText:
	text "Encantada de haber"
	line "visto a tus"
	cont "#MON."
	done

BeautyValerieAfterBattleText:
	text "Cuando veo #MON"
	line "me tranquilizo."
	done
	
SailorHarrySeenText:
	text "He estado en"
	line "alta mar, ¡así"

	para "que conozco bien"
	line "a los #MON!"
	done

SailorHarryBeatenText:
	text "¡Tu destreza"
	line "es increíble!"
	done

SailorHarryAfterBattleText:
	text "Todo tipo de"
	line "personas viven"

	para "felices con sus"
	line "#MON."
	done

SchoolboyChad1SeenText:
	text "Déjame probar una"
	line "cosa que he"
	cont "aprendido hoy."
	done

SchoolboyChad1BeatenText:
	text "Supongo que no"
	line "estudié mucho."
	done

SchoolboyChad1AfterBattleText:
	text "Tengo que hacer"
	line "tantos exámenes"

	para "que no tengo"
	line "tiempo para nada."

	para "Así que cuando"
	line "tengo un rato,"
	cont "veo la tele."
	done	

Route109SignText:
	text "RUTA 39"

	para "CIUDAD OLIVO -"
	line "CIUDAD IRIS"
	done

MoomooFarmSignText:
	text "CENTRO #MON"
	line "Cura a tus #MON"
	done

Route109TrainerTipsText:
	text "PISTAS ENTRENADOR"

	para "Usa GOLPE CABEZA"
	line "para hacer caer"
	cont "#MON de"
	cont "los árboles."

	para "Diferentes tipos"
	line "de #MON"
	cont "caerán."
	done

Route109_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 15, 13, AMPARE_CAVERN_1F, 1
	warp_event 13, 28, ROUTE_109_POKECENTER_1F, 1
	warp_event  8,  5, ROUTE_109_ROUTE_110_GATE, 1
	warp_event  9,  5, ROUTE_109_ROUTE_110_GATE, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event  4, 56, BGEVENT_READ, Route109TrainerTips
	bg_event 14, 28, BGEVENT_READ, MoomooFarmSign
	bg_event  4, 35, BGEVENT_ITEM, Route109HiddenNugget

	db 8 ; object events
	object_event 12, 56, SPRITE_BUENA, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyValerie, -1
	object_event 10, 46, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerPokefanmDerek, -1
	object_event  5, 22, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerPokefanfRuth, -1
	object_event  5, 31, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicNorman, -1
	object_event 10, 23, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route109FruitTree, -1
	object_event  5, 63, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, TrainerPokefanfJaime, -1
	object_event  6, 84, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyChad1, -1
	object_event  7,  7, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSailorHarry, -1
