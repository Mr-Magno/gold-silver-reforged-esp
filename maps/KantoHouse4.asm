	const_def 2 ; object constants
	const KANTOHOUSE_4_FISHING_GURU

KantoHouse4_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
KantoHouse4FishingGuru:
	faceplayer
	opentext
	checkevent EVENT_KANTO_FISHING_GURU_ELIXIR_ON_STANDBY
	iftrue .GetReward
	checkevent EVENT_KANTO_FISHING_GURU_ASKED_FOR_MAGIKARP
	iftrue .AskedForMagikarp
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRocketHideout
	checkevent EVENT_KANTO_FISHING_GURU_EXPLAINED_WEIRD_MAGIKARP
	iftrue .ExplainedHistory
	writetext MagikarpLengthRaterText_LakeOfRageHistory
	waitbutton
	closetext
	setevent EVENT_KANTO_FISHING_GURU_EXPLAINED_WEIRD_MAGIKARP
	end

.ExplainedHistory:
	writetext MagikarpLengthRaterText_MenInBlack
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext MagikarpLengthRaterText_WorldsLargestMagikarp
	waitbutton
	closetext
	setevent EVENT_KANTO_FISHING_GURU_ASKED_FOR_MAGIKARP
	end

.AskedForMagikarp:
	writebyte MAGIKARP
	special FindPartyMonThatSpecies
	iffalse .ClearedRocketHideout
	writetext MagikarpLengthRaterText_YouHaveAMagikarp
	waitbutton
	special CheckMagikarpLength
	ifequal MAGIKARPLENGTH_NOT_MAGIKARP, .NotMagikarp
	ifequal MAGIKARPLENGTH_REFUSED, .Refused
	ifequal MAGIKARPLENGTH_TOO_SHORT, .TooShort
	jump .GetReward

.GetReward:
	writetext MagikarpLengthRaterText_Memento
	buttonsound
	verbosegiveitem ELIXER
	iffalse .NoRoom
	writetext MagikarpLengthRaterText_Bonus
	waitbutton
	closetext
	clearevent EVENT_KANTO_FISHING_GURU_ELIXIR_ON_STANDBY
	end

.NoRoom:
	closetext
	setevent EVENT_KANTO_FISHING_GURU_ELIXIR_ON_STANDBY
	end

.TooShort:
	writetext MagikarpLengthRaterText_TooShort
	waitbutton
	closetext
	end

.NotMagikarp:
	writetext MagikarpLengthRaterText_NotMagikarp
	waitbutton
	closetext
	end

.Refused:
	writetext MagikarpLengthRaterText_Refused
	waitbutton
	closetext
	end

MagikarpHouseBookshelf:
	jumpstd difficultbookshelf

MagikarpLengthRaterText_LakeOfRageHistory:
	text "UNUSED" ; wasting a lot of space on unused text tbh
	done

MagikarpLengthRaterText_MenInBlack:
	text "Vete de aquí,"
	line "niño."
	done

MagikarpLengthRaterText_WorldsLargestMagikarp:
	text "Desde que era"
	line "pequeño, he"
	cont "adorado a los"
	cont "MAGIKARP."

	para "Quizá se cumpla mi"
	line "sueño de ver al"

	para "MAGIKARP más"
	line "grande del mundo."

	para "¿Tienes una CAÑA?"
	line "Si tienes una,"
	cont "ayúdame por favor."
	done

MagikarpLengthRaterText_YouHaveAMagikarp:
	text "¡Ah, tienes un"
	line "MAGIKARP! A ver lo"
	cont "grande que es ese"
	cont "bebé."
	done

MagikarpLengthRaterText_Memento:
	text "¡Uau! ¡Éste es"
	line "impresionante!"

	para "¡Me quito el"
	line "sombrero ante ti!"

	para "¡Toma esto como"
	line "recuerdo!"
	done

MagikarpLengthRaterText_Bonus:
	text "Lo importante es"
	line "el récord. ¡Piensa"
	cont "en él como una"
	cont "bonificación!"
	done

MagikarpLengthRaterText_TooShort:
	text "¡Uau! ¡Éste es"
	line "impresionante!"

	para "Ojalá no tuviera"
	line "que decirlo, pero"
	cont "he visto uno más"
	cont "grande antes."
	done

MagikarpLengthRaterText_NotMagikarp:
	text "¿Qué? ¡Eso no es"
	line "un MAGIKARP!"
	done

MagikarpLengthRaterText_Refused:
	text "¿No tienes ninguno"
	line "bueno que"
	cont "enseñarme? Quizá"
	cont "la próxima vez."
	done


KantoHouse4_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, KANTO_REGION, 28
	warp_event  5,  7, KANTO_REGION, 28

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KantoHouse4FishingGuru, -1
