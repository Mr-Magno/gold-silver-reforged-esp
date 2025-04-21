	const_def 2 ; object constants
	const VICTORYROADGATE_OFFICER
	const VICTORYROADGATE_COOLTRAINERM
	const VICTORYROADGATE_COOLTRAINERF

VictoryRoadGate_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

VictoryRoadGateBadgeCheckScene:
	turnobject PLAYER, LEFT
	jump VictoryRoadGateBadgeCheckScript

VictoryRoadGateOfficerScript:
	faceplayer
VictoryRoadGateBadgeCheckScript:
	opentext
	writetext VictoryRoadGateOfficerText
	buttonsound
	checkevent EVENT_GOT_A_POKEMON_FROM_OAK
	iffalse .NoPokemonEvenYet
	checkcode VAR_BADGES
	ifgreater NUM_JOHTO_BADGES - 1, .AllEightBadges
	writetext VictoryRoadGateNotEnoughBadgesText
	waitbutton
	closetext
	applymovement PLAYER, VictoryRoadGateStepDownMovement
	end

.NoPokemonEvenYet
	writetext VictoryRoadGateNotEvenATrainer
	waitbutton
	closetext
	applymovement PLAYER, VictoryRoadGateStepDownMovement
	end

.AllEightBadges:
	writetext VictoryRoadGateEightBadgesText
	waitbutton
	closetext
	setscene SCENE_FINISHED
	end

VictoryRoadGateStepDownMovement:
	step DOWN
	step_end
	
VictoryRoadGateCooltrainerMScript:
	jumptextfaceplayer VictoryRoadGateCooltrainerMText
	
VictoryRoadGateCooltrainerFScript:
	jumptextfaceplayer VictoryRoadGateCooltrainerFText
	
VictoryRoadGateCooltrainerMText:
	text "¡No me lo puedo"
	line "creer!"
	para "¡Estoy a punto"
	line "de llegar a la"
	cont "LIGA #MON!"
	para "¡He estado espe-"
	line "rando esto toda"
	cont "mi vida!"
	done
	
VictoryRoadGateCooltrainerFText:
	text "SENDA CORONA puede"
	line "ser un camino de"
	para "rosas, pero el"
	line "verdadero desafío"
	para "es llegar a la"
	line "cima del MT. FUJI"
	cont "desde CIUDAD"
	cont "CORONA."
	done
	
VictoryRoadGateNotEvenATrainer:
	text "No pareces siquie-"
	line "ra un entrenador"
	cont "#MON."

	para "Lo siento, chico,"
	line "pero solo puedo"
	para "dejar pasar a"
	line "entrenadores"
	cont "cualificados."
	done

VictoryRoadGateOfficerText:
	text "Sólo pueden pasar"
	line "los entrenadores"
	cont "que demuestren su"
	cont "valía."
	done

VictoryRoadGateNotEnoughBadgesText:
	text "No tienes ocho"
	line "MEDALLAS."

	para "Lo siento, pero"
	line "solo los entrena-"
	para "dores que tengan"
	line "ocho MEDALLAS"
	para "pueden entrar a"
	line "CIUDAD CORONA y"
	cont "escalar el MT."
	cont "FUJI."
	done

VictoryRoadGateEightBadgesText:
	text "¡Oh! ¡Las ocho"
	line "MEDALLAS!"

	para "Has demostrado tu"
	line "valía."

	para "¡Por favor, pasa!"
	done

VictoryRoadGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  9, 17, SILENT_TOWN, 7
	warp_event 10, 17, SILENT_TOWN, 7
	warp_event  9,  0, CROWN_PASS, 1
	warp_event 10,  0, CROWN_PASS, 1

	db 1 ; coord events
	coord_event 10, 11, SCENE_DEFAULT, VictoryRoadGateBadgeCheckScene

	db 0 ; bg events

	db 3 ; object events
	object_event  8, 11, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadGateOfficerScript, -1
	object_event 12,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadGateCooltrainerMScript, -1
	object_event  7,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadGateCooltrainerFScript, -1
