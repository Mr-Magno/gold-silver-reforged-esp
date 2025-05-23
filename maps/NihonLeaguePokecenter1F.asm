	const_def 2 ; object constants
	const NIHON_LEAGUE_POKECENTER1F_NURSE
	const NIHON_LEAGUE_POKECENTER1F_CLERK
	const NIHON_LEAGUE_POKECENTER1F_COOLTRAINER_M


NihonLeaguePokecenter1F_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .PrepareElite4

.DummyScene:
	end

.PrepareElite4:
	setmapscene LORELEIS_ROOM, SCENE_DEFAULT
	setmapscene KOGAS_ROOM, SCENE_DEFAULT
	setmapscene AGATHAS_ROOM, SCENE_DEFAULT
	setmapscene GIOVANNIS_ROOM, SCENE_DEFAULT
	setmapscene LANCES_ROOM, SCENE_DEFAULT
	setmapscene HALL_OF_FAME, SCENE_DEFAULT
	clearevent EVENT_LORELEIS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_LORELEIS_ROOM_EXIT_OPEN
	clearevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_KOGAS_ROOM_EXIT_OPEN
	clearevent EVENT_AGATHAS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_AGATHAS_ROOM_EXIT_OPEN
	clearevent EVENT_GIOVANNIS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_GIOVANNIS_ROOM_EXIT_OPEN
	clearevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_LANCES_ROOM_EXIT_OPEN
	clearevent EVENT_BEAT_ELITE_4_LORELEI
	clearevent EVENT_BEAT_ELITE_4_KOGA
	clearevent EVENT_BEAT_ELITE_4_AGATHA
	clearevent EVENT_BEAT_ELITE_4_GIOVANNI
	clearevent EVENT_BEAT_CHAMPION_LANCE
	setevent EVENT_LANCES_ROOM_OAK_AND_MARY
	return


NihonLeaguePokecenter1FNurseScript:
	jumpstd pokecenternurse

NihonLeaguePokecenter1FClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_NIHON_LEAGUE
	closetext
	end

NihonLeaguePokecenter1FCooltrainerMScript:
	jumptextfaceplayer NihonLeaguePokecenter1FCooltrainerMText

NihonLeaguePokecenter1FCooltrainerMText:
	text "El ALTO MANDO te"
	line "pondrá a prueba"

	para "en la LIGA de"
	line "NIHON."

	para "Tienes que"
	line "derrotarlos a to-"

	para "todos. Si pierdes"
	line "vuelta a empezar."
	done


NihonLeaguePokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  5, 13, NIHON_LEAGUE, 1
	warp_event  6, 13, NIHON_LEAGUE, 2
	warp_event  0, 13, POKECENTER_2F, 1
	warp_event 14,  3, LORELEIS_ROOM, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3,  7, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NihonLeaguePokecenter1FNurseScript, -1
	object_event 11,  7, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NihonLeaguePokecenter1FClerkScript, -1
	object_event 11, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NihonLeaguePokecenter1FCooltrainerMScript, -1
