	const_def 2 ; object constants
	const BATTLECLUB_BOUNCER

KantoBattleClub1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
EntranceCheckClub:
	checkevent EVENT_GOT_BATTLE_CLUB_PASS
	iffalse .GivePass
	checkitem PASS
	iffalse .NoPass
	checkflag ENGINE_MT_MOON_SQUARE_CLEFAIRY
	iftrue .AlreadyApproved
	turnobject PLAYER, LEFT
	turnobject BATTLECLUB_BOUNCER, RIGHT
	jump BouncerScript2
	end
	
.AlreadyApproved
	end
	
.NoPass
	turnobject PLAYER, LEFT
	turnobject BATTLECLUB_BOUNCER, RIGHT
	opentext
	writetext NoPassText
	waitbutton
	closetext
	applymovement PLAYER, NoEntryAllowed
	end
	
.GivePass
	turnobject PLAYER, LEFT
	turnobject BATTLECLUB_BOUNCER, RIGHT
	jump GivePassFullScript
	
GivePassFullScript:
	faceplayer
	opentext
	writetext PassGiveText
	waitbutton
	verbosegiveitem PASS
	closetext
	setevent EVENT_GOT_BATTLE_CLUB_PASS
	checkcode VAR_FACING
	ifequal LEFT, .FullSceneTime
	end
	
.FullSceneTime
	jump EntranceCheckClub
	end

BouncerScript:
	checkevent EVENT_GOT_BATTLE_CLUB_PASS
	iffalse .GivePass2
	checkitem PASS
	iffalse .NoPass2
	checkflag ENGINE_MT_MOON_SQUARE_CLEFAIRY
	iftrue .AlreadyApproved2
	faceplayer
	jump BouncerScript2
	end
	
.GivePass2
	jump GivePassFullScript
	
.NoPass2
	faceplayer
	opentext
	writetext NoPassText
	waitbutton
	closetext
	end
	
.AlreadyApproved2
	faceplayer
	opentext
	writetext AlreadyApprovedText
	waitbutton
	closetext
	end
	
BouncerScript2:
	opentext
	writetext BouncerChecksYou
	waitbutton
	closetext
	setflag ENGINE_MT_MOON_SQUARE_CLEFAIRY
	checkcode VAR_WEEKDAY
	ifequal MONDAY, .MondayBC
	ifequal TUESDAY, .TuesdayBC
	ifequal WEDNESDAY, .WednesdayBC
	ifequal THURSDAY, .ThursdayBC
	ifequal FRIDAY, .FridayBC
	ifequal SATURDAY, .SaturdayBC
.SundayBC
	clearevent EVENT_BATTLE_CLUB_SUNDAY
	setevent EVENT_BATTLE_CLUB_MONDAY
	setevent EVENT_BATTLE_CLUB_TUESDAY
	setevent EVENT_BATTLE_CLUB_WEDNESDAY
	setevent EVENT_BATTLE_CLUB_THURSDAY
	setevent EVENT_BATTLE_CLUB_FRIDAY
	setevent EVENT_BATTLE_CLUB_SATURDAY
	end
	
.MondayBC
	setevent EVENT_BATTLE_CLUB_SUNDAY
	clearevent EVENT_BATTLE_CLUB_MONDAY
	setevent EVENT_BATTLE_CLUB_TUESDAY
	setevent EVENT_BATTLE_CLUB_WEDNESDAY
	setevent EVENT_BATTLE_CLUB_THURSDAY
	setevent EVENT_BATTLE_CLUB_FRIDAY
	setevent EVENT_BATTLE_CLUB_SATURDAY
	end
	
.TuesdayBC
	setevent EVENT_BATTLE_CLUB_SUNDAY
	setevent EVENT_BATTLE_CLUB_MONDAY
	clearevent EVENT_BATTLE_CLUB_TUESDAY
	setevent EVENT_BATTLE_CLUB_WEDNESDAY
	setevent EVENT_BATTLE_CLUB_THURSDAY
	setevent EVENT_BATTLE_CLUB_FRIDAY
	setevent EVENT_BATTLE_CLUB_SATURDAY
	end
	
.WednesdayBC
	setevent EVENT_BATTLE_CLUB_SUNDAY
	setevent EVENT_BATTLE_CLUB_MONDAY
	setevent EVENT_BATTLE_CLUB_TUESDAY
	clearevent EVENT_BATTLE_CLUB_WEDNESDAY
	setevent EVENT_BATTLE_CLUB_THURSDAY
	setevent EVENT_BATTLE_CLUB_FRIDAY
	setevent EVENT_BATTLE_CLUB_SATURDAY
	end
	
.ThursdayBC
	setevent EVENT_BATTLE_CLUB_SUNDAY
	setevent EVENT_BATTLE_CLUB_MONDAY
	setevent EVENT_BATTLE_CLUB_TUESDAY
	setevent EVENT_BATTLE_CLUB_WEDNESDAY
	clearevent EVENT_BATTLE_CLUB_THURSDAY
	setevent EVENT_BATTLE_CLUB_FRIDAY
	setevent EVENT_BATTLE_CLUB_SATURDAY
	end
	
.FridayBC
	setevent EVENT_BATTLE_CLUB_SUNDAY
	setevent EVENT_BATTLE_CLUB_MONDAY
	setevent EVENT_BATTLE_CLUB_TUESDAY
	setevent EVENT_BATTLE_CLUB_WEDNESDAY
	setevent EVENT_BATTLE_CLUB_THURSDAY
	clearevent EVENT_BATTLE_CLUB_FRIDAY
	setevent EVENT_BATTLE_CLUB_SATURDAY
	end
	
.SaturdayBC
	setevent EVENT_BATTLE_CLUB_SUNDAY
	setevent EVENT_BATTLE_CLUB_MONDAY
	setevent EVENT_BATTLE_CLUB_TUESDAY
	setevent EVENT_BATTLE_CLUB_WEDNESDAY
	setevent EVENT_BATTLE_CLUB_THURSDAY
	setevent EVENT_BATTLE_CLUB_FRIDAY
	clearevent EVENT_BATTLE_CLUB_SATURDAY
	end
	
NoEntryAllowed:
	step DOWN
	step_end
	
NoPassText:
	text "Lo siento, pero"
	line "nadie puede pasar"
	cont "sin un PASE"
	cont "BATALLA."
	done

PassGiveText:
	text "¡Hola y bienvenido"
	line "al CLUB BATALLA de"
	cont "KANTO!"

	para "¡Este es un"
	line "establecimiento"
	cont "para entrenadores"
	cont "de alto nivel!"

	para "¡Y a juzgar por la"
	line "cantidad de"
	cont "MEDALLAS que"
	cont "tienes, debes ser"
	cont "uno de ellos!"

	para "Aquí solo pueden"
	line "participar"
	cont "miembros."

	para "¡Así que te"
	line "ofreceré una"
	cont "membresía!"
	done

AlreadyApprovedText:
	text "¡Pasa y disfruta!"
	done
	
BouncerChecksYou:
	text "¡Ah, un PASE"
	line "BATALLA!"
	cont "¡Bienvenido!"
	done

KantoBattleClub1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  4,  7, KANTO_REGION, 24
	warp_event  5,  7, KANTO_REGION, 24
	warp_event  5,  0, KANTO_BATTLE_CLUB_B1F, 1

	db 1 ; coord events
	coord_event  5,  1, SCENE_DEFAULT, EntranceCheckClub

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  1, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BouncerScript, -1
