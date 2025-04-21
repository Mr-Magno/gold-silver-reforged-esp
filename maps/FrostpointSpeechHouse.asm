	const_def 2 ; object constants
	const FROSTPOINTSPEECHHOUSE_GENTLEMAN

FrostpointSpeechHouse_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

FrostpointSpeechHouseGentleman:
	jumptextfaceplayer FrostpointSpeechHouseGentlemanText
	end
	
FrostpointSpeechHouseGentlemanText:
	text "En PUEBLO ESCARCHA"
	line "hace frío y además"
	cont "está lejos."

	para "No recibimos"
	line "muchos turistas."

	para "Pero quienes vivi-"
	line "mos aquí somos una"
	cont "comunidad unida."
	done


FrostpointSpeechHouseRadio:
	jumpstd radio2

FrostpointSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, FROSTPOINT_TOWN, 5
	warp_event  5,  7, FROSTPOINT_TOWN, 5

	db 0 ; coord events


	db 1 ; bg events
	bg_event  4,  1, BGEVENT_READ, FrostpointSpeechHouseRadio

	db 1 ; object events
	object_event  2,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FrostpointSpeechHouseGentleman, -1
