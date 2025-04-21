	const_def 2
	const RIC_HO_OH
	const RIC_LUGIA
	const RIC_BLUE

RainbowIslandCave_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 0 ; callbacks

.DummyScene:
	end


BlueScriptRIC:
	faceplayer
	checkevent EVENT_RAINBOW_ISLE_CAVE_BLUE_TOLD_LEGEND
	iftrue .secondpart
	opentext
	writetext BlueTellsLegendText
	waitbutton
	closetext
	setevent EVENT_RAINBOW_ISLE_CAVE_BLUE_TOLD_LEGEND
.secondpart
	opentext
	writetext BlueTellsYouToGoThereText
	waitbutton
	closetext
	end

StandingOnStartTile:
	checkevent EVENT_RAINBOW_ISLE_RESTORED
	iftrue .end
	checkevent EVENT_RAINBOW_ISLE_CAVE_BLUE_TOLD_LEGEND
	iffalse .end
	turnobject RIC_BLUE, LEFT
	writebyte HO_OH
	special FindPartyMonThatSpecies
	iffalse .notinparty
	writebyte LUGIA
	special FindPartyMonThatSpecies
	iffalse .notinparty
	
	opentext ; at this point it's confirmed you've got both and the event is a go
	writetext BlueHaveThemBothText
	waitbutton
	closetext
	playmusic MUSIC_NONE
	special FadeOutPalettes
	appear RIC_HO_OH
	appear RIC_LUGIA
	playsound SFX_BALL_POOF
	pause 10
	cry HO_OH
	pause 10
	playsound SFX_BALL_POOF
	pause 10
	cry LUGIA
	special LoadMapPalettes
	special FadeInPalettes
	pause 20
	playmusic MUSIC_GS_OPENING_2
	turnobject PLAYER, UP
	turnobject RIC_BLUE, UP
	follow RIC_HO_OH, RIC_LUGIA
	applymovement RIC_HO_OH, LegendsDanceStep1
	playsound SFX_RAIN_DANCE
	pause 20
	applymovement RIC_HO_OH, LegendsDanceStep2
	playsound SFX_EMBER
	pause 20
	applymovement RIC_HO_OH, LegendsDanceStep3
	playsound SFX_RAIN_DANCE
	pause 20
	applymovement RIC_HO_OH, LegendsDanceStep4
	playsound SFX_EMBER
	pause 20
	special FadeOutPalettes
	special LoadMapPalettes
	special FadeInPalettes
	applymovement RIC_HO_OH, LegendsDanceStep5
	stopfollow
	applymovement RIC_LUGIA, LegendsDanceStep6
	follow RIC_HO_OH, RIC_LUGIA
	applymovement RIC_HO_OH, LegendsDanceStep7
	special FadeOutPalettes
	special LoadMapPalettes
	special FadeInPalettes
	playsound SFX_SHINE
	stopfollow
	pause 25
	special FadeOutPalettes
	disappear RIC_HO_OH
	disappear RIC_LUGIA
	pause 10
	playsound SFX_BALL_POOF
	pause 10
	playsound SFX_BALL_POOF
	special LoadMapPalettes
	special FadeInPalettes
	
	setevent EVENT_RAINBOW_ISLE_CAVE_OBJECTS_HIDDEN
	setevent EVENT_RAINBOW_ISLE_RESTORED
	clearevent EVENT_RAINBOW_ISLE_BLUE_BATTLE_HIDDEN
	
	turnobject RIC_BLUE, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext BlueAfterEventText
	waitbutton
	closetext
	special FadeOutPalettes
	pause 16
	warpsound
	disappear RIC_BLUE
	setevent EVENT_RAINBOW_ISLE_CAVE_BLUE_HIDDEN
	special LoadMapPalettes
	special FadeInPalettes
.end
	end

.notinparty
	opentext
	writetext BlueDontHaveMonsText
	waitbutton
	closetext
	turnobject RIC_BLUE, UP
	end


LegendsDanceStep1:
	step DOWN
	jump_step DOWN
	step_end

LegendsDanceStep2:
	jump_step RIGHT
	step_end

LegendsDanceStep3:
	step UP
	jump_step UP
	step_end

LegendsDanceStep4:
	jump_step LEFT
	step_end

LegendsDanceStep5:
	step DOWN
	jump_step DOWN
	step_end

LegendsDanceStep6:
	step DOWN
	step_end

LegendsDanceStep7:
	step RIGHT
	step_end


BlueAfterEventText:
	text "¡Rápido! ¡Afura!"
	
	para "¡Encuéntrame en"
	line "el punto más"
	cont "al norte!"
	done

BlueDontHaveMonsText:
	text "Si consigues a"
	line "los dos #MON"
	cont "legendarios,"
	cont "¡quédate ahí!"
	done

BlueHaveThemBothText:
	text "¿¡De verdad has"
	line "atrapado a"
	cont "HO-OH y LUGIA!?"
	
	para "¡Increíble!"
	
	para "¡Muy bien! "
	line "¡Sácalos y"
	cont "comencemos!"
	done

BlueTellsLegendText:
	text "Genial, ¡lo"
	line "has logrado!"
	
	para "Esto es lo que"
	line "he descubierto…"
	
	para "¡Esta isla era"
	line "el hogar de una"
	cont "tribu que reali-"
	cont "zaba un ritual"
	cont "para invocar a"
	cont "dos #MON"
	cont "LEGENDARIOS!"
	
	para "¡Se dice que los"
	line "arcoiris que"
	cont "cubren la isla"
	cont "fueron hechos"
	cont "cuando las"
	cont "lluvias de"
	cont "LUGIA llenaron"
	cont "y cielo y luego"
	cont "HO-OH las hizo"
	cont "desaparecer con"
	cont "FUEGOSAGRADO!"
	
	para "¡Lo que no se"
	line "sabe a ciencia"
	cont "cierta es cómo"
	cont "realizar ese"
	cont "ritual!"
	done
	
BlueTellsYouToGoThereText:
	text "Puede que sea un"
	line "favor un poco"
	cont "grande, pero si"
	cont "atrapas a"
	cont "HO-OH y LUGIA,"
	cont "¡puede que"
	cont "restauremos la"
	cont "isla!"
	
	para "Si los atrapas,"
	line "¡sitúate al otro"
	cont "lado de la"
	cont "cascada!"
	done



RainbowIslandCave_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  8, 17, RAINBOW_ISLAND, 1

	db 1 ; coord events
	coord_event  6,  6, SCENE_DEFAULT, StandingOnStartTile

	db 0 ; bg events

	db 3 ; object events
	object_event  7,  2, SPRITE_HO_OH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0,ObjectEvent, EVENT_RAINBOW_ISLE_CAVE_OBJECTS_HIDDEN
	object_event  7,  2, SPRITE_LUGIA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RAINBOW_ISLE_CAVE_OBJECTS_HIDDEN
	object_event  9,  6, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlueScriptRIC, EVENT_RAINBOW_ISLE_CAVE_BLUE_HIDDEN
	