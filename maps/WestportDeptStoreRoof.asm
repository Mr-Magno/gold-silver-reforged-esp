	const_def 2 ; object constants
	const GOLDENRODDEPTSTOREROOF_CLERK
	const GOLDENRODDEPTSTOREROOF_POKEFAN_F
	const GOLDENRODDEPTSTOREROOF_FISHER
	const GOLDENRODDEPTSTOREROOF_TWIN
	const GOLDENRODDEPTSTOREROOF_SUPER_NERD
	const GOLDENRODDEPTSTOREROOF_POKEFAN_M
	const GOLDENRODDEPTSTOREROOF_TEACHER
	const GOLDENRODDEPTSTOREROOF_BUG_CATCHER

WestportDeptStoreRoof_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .CheckSaleChangeBlock
	callback MAPCALLBACK_OBJECTS, .CheckSaleChangeClerk

.CheckSaleChangeBlock:
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftrue .SaleIsOn
	return

.SaleIsOn:
	changeblock 0, 2, $3f ; cardboard boxes
	changeblock 0, 4, $0f ; vendor booth
	return

.CheckSaleChangeClerk:
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftrue .ChangeClerk
	setevent EVENT_GOLDENROD_SALE_OFF
	clearevent EVENT_GOLDENROD_SALE_ON
	return

.ChangeClerk:
	clearevent EVENT_GOLDENROD_SALE_OFF
	setevent EVENT_GOLDENROD_SALE_ON
	return

WestportDeptStoreRoofClerkScript:
	opentext
	pokemart MARTTYPE_ROOFTOP, 0
	closetext
	end

WestportDeptStoreRoofPokefanFScript:
	jumptextfaceplayer WestportDeptStoreRoofPokefanFText

WestportDeptStoreRoofFisherScript:
	faceplayer
	opentext
	writetext WestportDeptStoreRoofFisherText
	waitbutton
	closetext
	turnobject GOLDENRODDEPTSTOREROOF_FISHER, UP
	end

WestportDeptStoreRoofTwinScript:
	jumptextfaceplayer WestportDeptStoreRoofTwinText

WestportDeptStoreRoofSuperNerdScript:
	opentext
	writetext WestportDeptStoreRoofSuperNerdOhWowText
	waitbutton
	closetext
	turnobject GOLDENRODDEPTSTOREROOF_SUPER_NERD, UP
	opentext
	writetext WestportDeptStoreRoofSuperNerdQuitBotheringMeText
	waitbutton
	closetext
	turnobject GOLDENRODDEPTSTOREROOF_SUPER_NERD, RIGHT
	end

WestportDeptStoreRoofPokefanMScript:
	jumptextfaceplayer WestportDeptStoreRoofPokefanMText

WestportDeptStoreRoofTeacherScript:
	jumptextfaceplayer WestportDeptStoreRoofTeacherText

WestportDeptStoreRoofBugCatcherScript:
	jumptextfaceplayer WestportDeptStoreRoofBugCatcherText

Binoculars1:
	jumptext Binoculars1Text

Binoculars2:
	jumptext Binoculars2Text

Binoculars3:
	jumptext Binoculars3Text

PokeDollVendingMachine:
	jumptext PokeDollVendingMachineText

WestportDeptStoreRoofPokefanFText:
	text "Estoy cansado."

	para "A veces vengo"
	line "aquí para des-"
	cont "cansar un rato."
	done

WestportDeptStoreRoofFisherText:
	text "¿Disculpa? ¿Quién"
	line "dice que un adul-"
	cont "to no puede"
	para "coleccionar"
	line "muñecos?"
	done

WestportDeptStoreRoofTwinText:
	text "A menudo hay"
	line "buenas gangas"
	cont "aquí."
	done

WestportDeptStoreRoofSuperNerdOhWowText:
	text "¡Oh, vaya!"
	done

WestportDeptStoreRoofSuperNerdQuitBotheringMeText:
	text "¿Dejarás de"
	line "molestarme?"
	done

WestportDeptStoreRoofPokefanMText:
	text "Hay una cosa que"
	line "quier, pero no"

	para "tengo el efec-"
	line "tivo necesario…"

	para "Puede que venda"
	line "las BAYAS que"
	cont "he cogido…"
	done

WestportDeptStoreRoofTeacherText:
	text "¡Todo es muy"
	line "barato!"

	para "¡He comprado tanto"
	line "que no tengo más"
	cont "espacio en la"
	cont "mochila!"
	done

WestportDeptStoreRoofBugCatcherText:
	text "Mis #MON"
	line "siempre acaban"

	para "paralizados o"
	line "envenenados…"

	para "Así que compro"
	line "muchos CURA TOTAL."

	para "¿Quedará más?"
	done

Binoculars1Text:
	text "Estos prismáticos"
	line "me dejan ver muy"

	para "lejos. Quizás"
	line "vea mi casa."

	para "¿Es la del"
	line "tejado verde?"
	done

Binoculars2Text:
	text "¡Eh! ¡Hay unos"
	line "entrenadores"
	cont "combatiendo!"

	para "¡Hace que me"
	line "apetezca comba-"
	cont "tir ahora!"
	done

Binoculars3Text:
	text "Un PESCADOR tien"
	line "muchos MAGIKARP…"

	para "¡Están SALPICANDO"
	line "todos a la vez!"
	done

PokeDollVendingMachineText:
	text "¿Una expendedora"
	line "de muñecos"
	cont "#MON?"

	para "Inserta una"
	line "moneda, gira la"
	cont "palanca…"

	para "Pero está casi"
	line "vacía…"
	done

WestportDeptStoreRoof_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 13,  1, WESTPORT_DEPT_STORE_6F, 3

	db 0 ; coord events

	db 4 ; bg events
	bg_event 15,  3, BGEVENT_RIGHT, Binoculars1
	bg_event 15,  5, BGEVENT_RIGHT, Binoculars2
	bg_event 15,  6, BGEVENT_RIGHT, Binoculars3
	bg_event  3,  0, BGEVENT_UP, PokeDollVendingMachine

	db 8 ; object events
	object_event  1,  4, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStoreRoofClerkScript, EVENT_GOLDENROD_SALE_OFF
	object_event 10,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WestportDeptStoreRoofPokefanFScript, -1
	object_event  2,  1, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, WestportDeptStoreRoofFisherScript, -1
	object_event  3,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestportDeptStoreRoofTwinScript, EVENT_GOLDENROD_SALE_ON
	object_event 14,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestportDeptStoreRoofSuperNerdScript, EVENT_GOLDENROD_SALE_ON
	object_event  7,  0, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WestportDeptStoreRoofPokefanMScript, EVENT_GOLDENROD_SALE_OFF
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WestportDeptStoreRoofTeacherScript, EVENT_GOLDENROD_SALE_OFF
	object_event  1,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WestportDeptStoreRoofBugCatcherScript, EVENT_GOLDENROD_SALE_OFF
