	const_def 2 ; object constants
	const BRASSTOWER5F_SAGE1
	const BRASSTOWER5F_KURT
	const BRASSTOWER5F_CAPTAIN

BrassTower5F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .AddStairs

.AddStairs:
IF DEF(_GOLD)
	checkevent EVENT_HO_OH_STAIRS_APPEAR
	iffalse .DoneStairs
	changeblock   0,  5, $3C ; ladder
	
ELIF DEF(_SILVER)
	checkevent EVENT_REPAIRED_SHIP_FUEL_LINE
	iffalse .DoneStairs
	changeblock   0,  5, $3C ; ladder
ENDC

.DoneStairs:
	return

BrassTower5FSageScript:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .AfterHoOh
	checkevent EVENT_HO_OH_STAIRS_APPEAR
	iftrue .DuringHoOh
	setevent EVENT_GOT_5F_SAGE_BLESSING
	faceplayer
	opentext
	writetext Text_5FSage
	waitbutton
	closetext
	end
	
.AfterHoOh
	faceplayer
	opentext
	writetext Text_5FSageAfterHoOh
	waitbutton
	closetext
	end
	
.DuringHoOh
	faceplayer
	opentext
	writetext Text_5FSageDuringHoOh
	waitbutton
	closetext
	end
	
KurtScript:
	jumptext KurtKnewIt
	
CaptainScript:
	jumptext CaptainCantBelieve
	
HoOhEventSceneUp:
	applymovement PLAYER, PlayerWalksToHoOhGroup1
	jump HoOhEventMainScene
	end
	
HoOhEventSceneLeft:
	applymovement PLAYER, PlayerWalksToHoOhGroup2
	jump HoOhEventMainScene
	end
	
HoOhEventMainScene:
	showemote EMOTE_SHOCK, BRASSTOWER5F_KURT, 15
	opentext
	writetext KurtKnewIt
	waitbutton
	closetext
	showemote EMOTE_SHOCK, BRASSTOWER5F_CAPTAIN, 15
	opentext
	writetext CaptainCantBelieve
	waitbutton
	closetext
	applymovement BRASSTOWER5F_SAGE1, SageOneStepDown
	opentext
	writetext SageTellsYouToSeeBird
	waitbutton
	closetext
	setscene SCENE_DEFAULT
	end
	
SageOneStepDown:
	step DOWN
	step_end
	
PlayerWalksToHoOhGroup2:
	step LEFT
	step LEFT
	turn_head UP
	step_end
	
PlayerWalksToHoOhGroup1:
	step LEFT
	step LEFT
	step DOWN
	step LEFT
	turn_head UP
	step_end
	
KurtKnewIt:
	text "CÉSAR: Supe que"
	line "tenía razón"
	para "cuando presentí"
	line "algo sobre ti."
	done
	
CaptainCantBelieve:
	text "¡No me lo puedo"
	line "creer!"
	para "¡El regreso del"
	line "ave!"
	para "¡Está ocurriendo!"
	done
	
SageTellsYouToSeeBird:
	text "<PLAY_G>."
	para "HO-OH se posa"
	line "sobre nuestras"
	cont "cabezas."
	para "El ave ha"
	line "regresado, como"
	para "predijo la"
	line "leyenda."
	para "Presiento que"
	line "te quiere conocer"
	cont "a ti."
	para "Las acciones que"
	line "has llevado a"
	para "cabo le han de-"
	line "mostrado que vale"
	para "vale la pena"
	line "acercarse a ti."
	para "Continúa y ve"
	line "a la azotea."
	done
	
Text_5FSageDuringHoOh:
	text "El ave te espera."
	done

Text_5FSageAfterHoOh:
	text "Semejante encuen-"
	line "tro con el ave es"
	cont "un acontecimiento"
	cont "legendario."
	done
	
Text_5FSage:
	text "Bienvenido a la"
	line "cima de la"
	cont "TORRE LATÓN."
	
	para "Este es un lugar"
	line "sagrado que solo"
	cont "deben visitarlo"
	cont "quienes estén"
	cont "dispuestos a"
	cont "mostrar el debido"
	cont "respeto."
	
	para "Entiendo que"
	line "PEGASO te ha pe-"
	cont "dido que subas"
	cont "todos sus pisos."
	
	para "Espero que puedas"
	line "avanzar con el"
	cont "conocimiento y la"
	cont "comprensión de"
	cont "cómo tratar"
	cont "adecuadamente a"
	cont "los #MON."
	
	para "Puedes regresar"
	line "con PEGASO."
	
	para "Tienes mi"
	line "bendición."
	done

SproutTower5FSign:
	jumptext SproutTower5FSignText

	
SproutTower5FSignText:
	text "Es una estatua"
	line "de un ABRA."
	para "Los ABRA se"
	line "asustan y huyen"
	para "rápidamente cuando"
	line "se los encuentra"
	cont "en estado salvaje."
	para "Asegurate de"
	line "honrar y respetar"
	para "a cualquier"
	line "#MON en su"
	cont "hábitat natural."
	done
	
SproutTower5FIncense:
	jumptext SproutTower5FIncenseText

SproutTower5FIncenseText:
	text "¿Qué es esto?"
	para "Oh, ¡es un"
	line "incienso!"
	done

BrassTower5F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5,  5, BRASS_TOWER_4F, 2
	warp_event  0,  5, BRASS_TOWER_ROOF, 1

	db 2 ; coord events
	coord_event  5,  4, SCENE_HO_OH_EVENT, HoOhEventSceneUp
	coord_event  4,  5, SCENE_HO_OH_EVENT, HoOhEventSceneLeft

	db 2 ; bg events
	bg_event 4, 1, BGEVENT_READ, SproutTower5FSign
	bg_event 3, 0, BGEVENT_READ, SproutTower5FIncense


	db 3 ; object events
	object_event  2,  3, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BrassTower5FSageScript, -1
	object_event  1,  3, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KurtScript, EVENT_BRASS_TOWER_ELDER_SAGE_GONE
	object_event  3,  3, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CaptainScript, EVENT_BRASS_TOWER_ELDER_SAGE_GONE
