	const_def 2 ; object constants
	const WHIRLISLANDB3F_POKE_BALL
	const WHIRLISLANDB3F_SAGE
	const WHIRLISLANDB3F_KURT
	const WHIRLISLANDB3F_CAPTAIN

WhirlIslandB3F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .AddStairs

.AddStairs:
IF DEF(_GOLD)
	checkevent EVENT_REPAIRED_SHIP_FUEL_LINE
	iffalse .DoneCave
	changeblock   7, 25, $37 ; cave
	
ELIF DEF(_SILVER)
	checkevent EVENT_LUGIA_CAVE_OPEN
	iffalse .DoneCave
	changeblock   7, 25, $37 ; cave
ENDC
.DoneCave:
	return
	
	
LugiaEventSceneLeft:
	jump LugiaEventMainScene
	end
	
LugiaEventSceneRight:
	applymovement PLAYER, PlayerWalksToLugiaGroup
	jump LugiaEventMainScene
	end
	
LugiaEventMainScene:
	showemote EMOTE_SHOCK, WHIRLISLANDB3F_KURT, 15
	turnobject PLAYER, RIGHT
	opentext
	writetext KurtKnewItSilver
	waitbutton
	closetext
	showemote EMOTE_SHOCK,WHIRLISLANDB3F_CAPTAIN, 15
	turnobject PLAYER, LEFT
	opentext
	writetext CaptainCantBelieveSilver
	waitbutton
	closetext
	opentext
	writetext SageTellsYouToSeeBirdSilver
	waitbutton
	closetext
	setscene SCENE_DEFAULT
	end
	
	
SageScriptSilver:
	jumptext Text_5FSageDuringLugia
	
PlayerWalksToLugiaGroup:
	step LEFT
	step_end

KurtScriptSilver:
	jumptext KurtKnewItSilver
	
CaptainScriptSilver:
	jumptext CaptainCantBelieveSilver

KurtKnewItSilver:
	text "CÉSAR: Sabía que"
	line "estaba en lo"
	para "cierto sobre"
	line "ti."
	done
	
CaptainCantBelieveSilver:
	text "¡No me lo puedo"
	line "creer!"
	para "¡El regreso del"
	line "ave!"
	para "¡Está ocurriendo!"
	done
	
SageTellsYouToSeeBirdSilver:
	text "<PLAY_G>."
	para "LUGIA vive en"
	line "el interior de"
	cont "esta cueva."
	para "El ave ha regre-"
	line "sado, como pre-"
	cont "dijo la leyenda."
	para "Presiento que"
	line "quiere conocerte."
	para "Ha determinado"
	line "que las acciones"
	para "que has llevado a"
	line "cabo, muestran"
	para "que vale la pena"
	line "acercarse a ti."
	para "Entra a la"
	line "cueva."
	done
	
Text_5FSageDuringLugia:
	text "El ave aguarda."
	done
	
WhirlIslandsB3FEscapeRope:
	itemball ESCAPE_ROPE

WhirlIslandB3F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 11,  5, WHIRL_ISLAND_B2F, 3
	warp_event  7, 25, WHIRL_ISLAND_LUGIA_CHAMBER, 1

	db 2 ; coord events
	coord_event  7, 27, SCENE_LUGIA_EVENT, LugiaEventSceneLeft
	coord_event  8, 27, SCENE_LUGIA_EVENT, LugiaEventSceneRight

	db 0 ; bg events

	db 4 ; object events
	object_event 13, 31, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandsB3FEscapeRope, EVENT_WHIRL_ISLANDS_B3F_ESCAPE_ROPE
	object_event  6, 27, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SageScriptSilver, EVENT_WHIRL_ISLANDS_SAGE_GONE
	object_event  8, 26, SPRITE_KURT, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KurtScriptSilver, EVENT_WHIRL_ISLANDS_SAGE_GONE
	object_event  6, 26, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CaptainScriptSilver, EVENT_WHIRL_ISLANDS_SAGE_GONE
