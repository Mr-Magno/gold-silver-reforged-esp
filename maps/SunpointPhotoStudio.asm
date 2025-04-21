	const_def 2 ; object constants
	const SunpointPhotoStudio_FISHING_GURU

SunpointPhotoStudio_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
SunpointPhotoStudioFishingGuruScript:
	jumptextfaceplayer CianwoodFishGuruText

SunpointPhotoStudioFishingGuruScriptbackup:
	faceplayer
	opentext
	writetext SunpointPhotoStudioFishingGuruText_Question
	yesorno
	iffalse .Refused
	writetext SunpointPhotoStudioFishingGuruText_Yes
	waitbutton
	special PhotoStudio
	waitbutton
	closetext
	end

.Refused:
	writetext SunpointPhotoStudioFishingGuruText_No
	waitbutton
	closetext
	end

SunpointPhotoStudioFishingGuruText_Question:
	text "Tienes unos mag-"
	line "níficos #MON."

	para "¿Qué te parece"
	line "una foto como"
	cont "recuerdo?"
	done

SunpointPhotoStudioFishingGuruText_Yes:
	text "¡Genila!"
	line "¡Sonreíd!"
	done

SunpointPhotoStudioFishingGuruText_No:
	text "Oh, qué mal…"
	line "pensaba que"

	para "sería un bonito"
	line "recuerdo…"
	done

CianwoodFishGuruText:
	text "Hace un calor"
	line "terrible en el"
	cont "EJE MAGMA."
	para "Dicen que los"
	line "#MON fuego"
	cont "se sienten"
	cont "atraídos a él."
	done

SunpointPhotoStudio_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, SUNPOINT_CITY, 4
	warp_event  5,  7, SUNPOINT_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  1,  2, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SunpointPhotoStudioFishingGuruScript, -1
