	const_def 2 ; object constants
	const HONDO_ROCKETBASE_KEY_GRUNT
	const LAVRADIOTOWER1F_OFFICER
	const LAVRADIOTOWER1F_SUPER_NERD1
	const LAVRADIOTOWER1F_GENTLEMAN
	const LAVRADIOTOWER1F_SUPER_NERD2
	const HONDO_ROCKETBASE_POKEBALL

SanskritRocketHouse_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Key
	
.Key
	checkevent EVENT_HONDO_ROCKET_RUNS_AWAY
	iftrue .keydropped
	disappear HONDO_ROCKETBASE_POKEBALL
	return
	
.keydropped
	checkevent EVENT_HONDO_ROCKET_SHIP_KEY
	iftrue .keyobtained
	appear HONDO_ROCKETBASE_POKEBALL
	return
	
.keyobtained
	disappear HONDO_ROCKETBASE_POKEBALL
	return

SanskritRocketHouseReceptionistScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .GiveKey
	writetext SanskritRocketHouseReceptionistText
	waitbutton
	closetext
	end

.GiveKey:
	writetext SanskritRocketHouseReceptionistTextKeyTime
	waitbutton
	closetext
	winlosstext RocketKey_WinText, RocketKey_LossText
	loadtrainer GRUNTM, GRUNTM_23
	startbattle
	reloadmapafterbattle
	jump .returnfrombattlerocketkey
	
	
.returnfrombattlerocketkey
	opentext
	writetext RocketKey_AfterText
	waitbutton
	closetext
	setevent EVENT_HONDO_ROCKET_RUNS_AWAY
	appear HONDO_ROCKETBASE_POKEBALL
	applymovement HONDO_ROCKETBASE_KEY_GRUNT, Runforyourlife
	disappear HONDO_ROCKETBASE_KEY_GRUNT
	end
	
Runforyourlife:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end
	
HondoBaseKey:
	itemball BASEMENT_KEY

SanskritRocketHouseOfficerScript:
	faceplayer
	opentext
	writetext SanskritRocketHouseOfficerText
	cry MURKROW
	waitbutton
	closetext
	end

SanskritRocketHouseSuperNerd1Script:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .SN1KeyScript
	writetext SanskritRocketHouseSuperNerd1Text
	waitbutton
	closetext
	end

.SN1KeyScript:
	writetext SanskritRocketHouseSuperNerd1TextKey
	waitbutton
	closetext
	end

SanskritRocketHouseGentlemanScript:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .GMKeyScript
	writetext SanskritRocketHouseGentlemanText
	waitbutton
	closetext
	end

.GMKeyScript:
	writetext SanskritRocketHouseGentlemanTextKey
	waitbutton
	closetext
	end


SanskritRocketHouseSuperNerd2Script:
	faceplayer
	opentext
	checkevent EVENT_ROCKET_KEY_DIALOGUE
	iftrue .SN2KeyScript
	writetext SanskritRocketHouseSuperNerd2Text
	waitbutton
	closetext
	end

.SN2KeyScript:
	writetext SanskritRocketHouseSuperNerd2TextKey
	waitbutton
	closetext
	end


SanskritRocketHouseDirectory:
	jumptext SanskritRocketHouseDirectoryText

SanskritRocketHousePokeFluteSign:
	jumptext SanskritRocketHousePokeFluteSignText

SanskritRocketHouseReferenceLibrary:
; unreferenced
	jumptext SanskritRocketHouseReferenceLibraryText

SanskritRocketHouseReceptionistText:
	text "¡Já!"

	para "¡Los suministros"
	line "no están tardando"
	para "en llegar al"
	line "MUELLE CALORINA!"

	para "¡Ya tenemos casi"
	line "todo lo que"
	para "necesitamos para"
	line "la siguiente fase"
	cont "de nuestro plan!"

	para "¡La banda de"
	line "CIUDAD ENHIESTA va"
	para "a quedar encantada"
	line "con nuestro"
	cont "trabajo!"
	done

SanskritRocketHouseOfficerText:
	text "MURKROW: ¡Kroow!"
	done

SanskritRocketHouseSuperNerd1Text:
	text "¡Los CASINOS"
	line "siempre son"
	cont "fuentes fiables"
	cont "de ingresos!"

	para "¡Recuérdalo!"
	done
	
SanskritRocketHouseSuperNerd1TextKey:
	text "¿Yo? ¿Una llave?"
	para "Qué va, no tengo"
	line "ninguna."

	para "¿Para qué querrías"
	line "una?"
	para "¡No te metas en el"
	line "camino del TEAM"
	cont "ROCKET, niño!"
	done

SanskritRocketHouseGentlemanText:
	text "Un niño ha estado"
	line "estorbando"
	cont "nuestros planes."

	para "Primero en el"
	line "ACUARIO, luego en"
	cont "el POZO SLOWPOKE…"
	para "¡Pero da igual!"

	para "¡Solo fueron"
	line "pequeños"
	cont "contratiempos!"

	para "¡JÁ!"
	done

SanskritRocketHouseGentlemanTextKey:
	text "¿Qué llave? No"
	line "tengo ninguna"
	cont "llave."

	para "¡Oye!"

	para "¡Espero que no"
	line "seas el niño que"
	para "ha estado frus-"
	line "trando nuestros"
	cont "planes!"

	para "¡Lárgate o sabrás"
	line "lo que es bueno!"
	done


SanskritRocketHouseSuperNerd2Text:
	text "¡No queda mucho"
	line "para demostrar al"
	para "mundo de lo que es"
	line "realmente capaz el"
	cont "TEAM ROCKET!"
	done

SanskritRocketHouseSuperNerd2TextKey:
	text "Qué va, no tengo"
	line "ninguna llave."

	para "El CAPITÁN no"
	line "confía en mí para"
	cont "esas cosas."
	done

SanskritRocketHouseSuperNerd2Text_GotExpnCard:
	text "¡Hola!"

	para "¡Soy el súper"
	line "DIRECTOR MUSICAL!"

	para "Todas las maravi-"
	line "llosas melodías"
	para "que escuchas son"
	line "cosa mía."

	para "No te cortes."
	line "¡Siente la música!"
	done

SanskritRocketHouseDirectoryText:
	text "¡Todos los #MON"
	line "existen para la"
	cont "gloria del TEAM"
	cont "ROCKET!"
	done

SanskritRocketHousePokeFluteSignText:
	text "Está en bucle…"
	done

SanskritRocketHouseReferenceLibraryText:
	text "¡Uau! Un estante"
	line "lleno de CD y"
	cont "vídeos de #MON."

	para "Debe de ser una"
	line "biblioteca."
	done
	
SanskritRocketHouseReceptionistTextKeyTime:
	text "¿La LLAVE del"
	line "BARCO?"
	para "A lo mejor la"
	line "tengo. ¿Para qué"
	cont "la quieres?"
	done

RocketKey_WinText:
	text "¡¿Qué?!"
	done
	
RocketKey_LossText:
	text "¡Já!"
	done
	
RocketKey_AfterText:
	text "¡Oh, no, el"
	line "CAPITÁN me va a"
	cont "matar!"
	done
	
RocketKey_Afterwards:
	text "¡Largo de aquí!"
	done

SanskritRocketHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 16,  7, SANSKRIT_TOWN, 5
	warp_event 17,  7, SANSKRIT_TOWN, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event 16,  2, BGEVENT_READ, SanskritRocketHouseDirectory
	bg_event  6,  1, BGEVENT_READ, SanskritRocketHousePokeFluteSign

	db 6 ; object events
	object_event  9,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseReceptionistScript, EVENT_HONDO_ROCKET_RUNS_AWAY
	object_event 17,  4, SPRITE_BIRD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseOfficerScript, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event 11,  2, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseSuperNerd1Script, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event 19,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseGentlemanScript, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event 15,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SanskritRocketHouseSuperNerd2Script,EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	object_event  9, 4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, HondoBaseKey, EVENT_HONDO_ROCKET_SHIP_KEY
