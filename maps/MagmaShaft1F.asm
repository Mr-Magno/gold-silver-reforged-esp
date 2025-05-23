	const_def 2 ; object constants
	const MAGMARSHAFT1F_POKE_BALL
	const MAGMARSHAFT1F_ENTEI

MagmaShaft1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MagmaShaft1FTMRest:
	itemball TM_REST

MagmaShaft1FHiddenIceHeal:
	hiddenitem ICE_HEAL, EVENT_MAGMA_SHAFT_1F_HIDDEN_ICE_HEAL
	

EnteiEvent:
	faceplayer
	opentext
	writetext EnteiText
	cry ENTEI
	pause 15
	closetext
	setevent EVENT_FOUGHT_ENTEI
	writecode VAR_BATTLETYPE, BATTLETYPE_ROAMING
	loadwildmon ENTEI, 40
	startbattle
	disappear MAGMARSHAFT1F_ENTEI
	reloadmapafterbattle
	end
	
EnteiText:
	text "¡Teeei!"
	done

MagmaShaft1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  1, 17, SUNPOINT_CITY, 1
	warp_event  3,  5, MAGMA_SHAFT_B1F, 1
	warp_event 16, 17, MAGMA_SHAFT_B2F, 8
	warp_event 17, 17, MAGMA_SHAFT_B2F, 8

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5, 12, BGEVENT_ITEM, MagmaShaft1FHiddenIceHeal

	db 2 ; object events
	object_event  4,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MagmaShaft1FTMRest, EVENT_ICE_PATH_B2F_BLACKTHORN_SIDE_TM_REST
	object_event 16,  2, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EnteiEvent, EVENT_FOUGHT_ENTEI
