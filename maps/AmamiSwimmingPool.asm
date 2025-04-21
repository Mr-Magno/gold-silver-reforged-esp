	const_def 2 ; object constants
	const AMAMI_GYM_SQUIRTLE_GIRL
	const AMAMI_GYM_SWIMMER_GUY
	const AMAMI_GYM_SWIMMER_GIRL
	const AMAMI_GYM_GRANNY
	const AMAMI_GYM_BUG_CATCHER
	const AMAMI_GYM_LASS

AmamiSwimmingPool_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AmamiSwimmingPoolSwimmerSquirtle:
	faceplayer
	opentext
	checkevent EVENT_AMAMI_SWIMMING_POOL_GOT_SQUIRTLE
	iftrue .AlreadyGotSquirtle
	writetext ILoveSquirtleText
	yesorno
	iffalse .DontTakeSquirtle
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFullSquirtle
	writetext ReceiveSquirtleText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke SQUIRTLE, 5
	writetext GiveSquirtleText
	waitbutton
	closetext
	setevent EVENT_AMAMI_SWIMMING_POOL_GOT_SQUIRTLE
	end
	
.AlreadyGotSquirtle
	writetext AlreadyGotSquirtleText
	waitbutton
	closetext
	end
	
.DontTakeSquirtle
	writetext NoSquirtleText
	waitbutton
	closetext
	end
	
.PartyFullSquirtle
	writetext PartyFullSquirtleText
	waitbutton
	closetext
	end
	
AmamiSwimmingPoolSwimmerGuyScript:
	jumptextfaceplayer AmamiSwimmingPoolSwimmerGuyText
	
AmamiSwimmingPoolSwimmerGirlScript:
	jumptextfaceplayer AmamiSwimmingPoolSwimmerGirlText
	
AmamiSwimmingPoolGrannyScript:
	jumptextfaceplayer AmamiSwimmingPoolGrannyText
	
AmamiSwimmingPoolBugCatcherScript:
	jumptextfaceplayer AmamiSwimmingPoolBugCatcherText

AmamiSwimmingPoolLassScript:
	jumptextfaceplayer AmamiSwimmingPoolLassText
	
AmamiSwimmingPoolLassText:
	text "Un ambiente más"
	line "controlado, como"
	para "una piscina"
	line "cubierta, puede"
	para "ser un lugar mejor"
	line "para entrenar"
	para "#MON débiles"
	line "que en mar"
	cont "abierto."
	done
	
AmamiSwimmingPoolBugCatcherText:
	text "¡Quiero ir a"
	line "nadar!"
	done
	
AmamiSwimmingPoolGrannyText:
	text "Ya no nado tan"
	line "bien como antes."

	para "Pero a mis #MON"
	line "les encanta el"
	para "agua, así que los"
	line "traigo aquí a"
	cont "menudo."
	done
	
AmamiSwimmingPoolSwimmerGirlText:
	text "¡A los #MON de"
	line "agua les encanta"
	cont "nadar!"

	para "Tiene sentido,"
	line "¿no?"
	done
	
AmamiSwimmingPoolSwimmerGuyText:
	text "¡Nadar es un buen"
	line "ejercicio tanto"
	cont "para personas como"
	cont "#MON!"
	done
	
ReceiveSquirtleText:
	text "<PLAYER> recibió a"
	line "SQUIRTLE."
	done
	
AlreadyGotSquirtleText:
	text "¡Vengo a nadar"
	line "aquí con mi"
	cont "SQUIRTLE casi a"
	cont "diario!"
	done
	
PartyFullSquirtleText:
	text "¡Ya llevas muchos"
	line "#MON en tu"
	cont "equipo!"
	done
	
NoSquirtleText:
	text "¿Seguro?"

	para "¡Es un gran"
	line "#MON!"
	done
	
	
ILoveSquirtleText:
	text "¡Los SQUIRTLE son"
	line "fantásticos"
	cont "nadadores!"

	para "¿Has nadado alguna"
	line "vez con uno?"

	para "¡Tienes que"
	line "intentarlo!"

	para "Entrenarlos"
	line "también es una"
	cont "gran experiencia."

	para "Tengo uno joven"
	line "que necesita que"
	cont "alguien lo cuide."

	para "¡Deberías entrenar"
	line "a este SQUIRTLE!"

	para "¿Te gustaría"
	line "llevártelo?"
	done
	
GiveSquirtleText:
	text "¡Ayúdalo a crecer"
	line "sano y fuerte!"
	done
	
AmamiSwimmingPool_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6, 17, AMAMI_TOWN, 4
	warp_event  7, 17, AMAMI_TOWN, 5

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event  5,  6, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AmamiSwimmingPoolSwimmerSquirtle, -1
	object_event  9,  9, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AmamiSwimmingPoolSwimmerGuyScript, -1
	object_event 11, 10, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AmamiSwimmingPoolSwimmerGirlScript, -1
	object_event  7, 13, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AmamiSwimmingPoolGrannyScript, -1
	object_event  3, 14, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AmamiSwimmingPoolBugCatcherScript, -1
	object_event 18,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AmamiSwimmingPoolLassScript, -1
