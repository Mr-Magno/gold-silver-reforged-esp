_OakText6::
	text "¿Cómo has dicho"
	line "que te llamas?"
	prompt

_OakText7::
	text "¡<PLAYER>!"

	para "¡Tu propia"
	line "leyenda #MON"
	cont "está a punto de"
	cont "comenzar!"

	para "¡Te espera un"
	line "mundo de sueños"
	
	para "y aventuras con"
	line "los #MON!"
	cont "¡Adelante!"
	done

UnknownText_0x1c40e6::
	text "La hora del reloj"
	line "podría estar mal."

	para "Por favor, vuelve"
	line "a ponerlo en hora."
	prompt

UnknownText_0x1c411c::
	text "Cambia la hora con"
	line "el Panel Control."

	para "Confirmar: Botón A"
	line "Cancelar:  Botón B"
	done

UnknownText_0x1c415b::
	text "¿Estás de acuerdo?"
	done

UnknownText_0x1c4168::
	text "Reloj puesto en"
	line "hora otra vez."
	done

UnknownText_0x1c4183::
	text "Ha pasado mucho"
	line "tiempo. Por favor,"
	cont "vuelve a probar."
	prompt

UnknownText_0x1c41b1::
	text "Si cambias ese"
	line "#MON, no"
	cont "podrás luchar."
	prompt

UnknownText_0x1c41e6::
	text "¡El @"
	text_ram wStringBuffer1
	text_start
	line "de tu amigo/a no"
	cont "parece estar bien!"
	prompt

UnknownText_0x1c4212::
	text "¿Cambiar"
	line "@"
	text_ram wd004
	text_start
	cont "por @"
	text_ram wStringBuffer1
	text "?"
	done

UnknownText_0x1c422a::
	text "To enter a mobile"
	line "battle, you must"

	para "pick a team of"
	line "three #MON."

	para "Is that OK?"
	done

UnknownText_0x1c4275::
	text "Need more info on"
	line "mobile battles?"
	done

UnknownText_0x1c4298::
	text "For a mobile"
	line "battle, choose"
	cont "three #MON."

	para "The maximum daily"
	line "play time is ten"

	para "minutes for each"
	line "linked player."

	para "If a battle isn't"
	line "finished within"

	para "the time limit,"
	line "the player with"

	para "the fewest fainted"
	line "#MON wins."

	para "If tied, the team"
	line "that lost the"

	para "least amount of HP"
	line "wins."
	done

UnknownText_0x1c439c::
	text "Today's remaining"
	line "time is @"
	text_decimal wStringBuffer2, 1, 2
	text " min."

	para "Would you like to"
	line "battle?"
	done

UnknownText_0x1c43dc::
	text "There are only @"
	text_decimal wStringBuffer2, 1, 2
	text_start
	line "min. left today."

	para "Want a quick"
	line "battle?"
	done

UnknownText_0x1c4419::
	text "There is only"
	line "1 min. left today!"

	para "Want to rush"
	line "through a battle?"
	done

UnknownText_0x1c445a::
	text "There is less than"
	line "1 min. left today!"

	para "Please try again"
	line "tomorrow."
	done

UnknownText_0x1c449c::
	text "Try again using"
	line "the same settings?"
	done

UnknownText_0x1c44c0::
	text "There is less than"
	line "1 min. left today!"
	done

UnknownText_0x1c44e7::
	text "No time left for"
	line "linking today."
	done

UnknownText_0x1c4508::
	text "Pick three #MON"
	line "for battle."
	done

UnknownText_0x1c4525::
	text "Today's remaining"
	line "time is @"
	text_decimal wStringBuffer2, 1, 2
	text " min."
	done

UnknownText_0x1c454b::
	text "Would you like to"
	line "save the game?"
	done

UnknownText_0x1c4590::
	text "<PLAYER> guardó"
	line "el juego."
	done

UnknownText_0x1c45a3::
	text "Ya existe un"
	line "archivo guardado."
	cont "¿Sobrescribirlo?"
	done

UnknownText_0x1c45d9::
	text "Hay otro archivo"
	line "guardado."
	cont "¿Sobrescribirlo?"
	done

UnknownText_0x1c460d::
	text "¡El archivo"
	line "guardado está"
	cont "corrupto!"
	prompt

UnknownText_0x1c462a::
	text "Cuando cambies una"
	line "CAJA de #MON,"

	para "los datos se"
	line "guardarán. ¿Vale?"
	done

UnknownText_0x1c465f::
	text "Cuando muevas un"
	line "#MON, los datos"

	para "se guardarán."
	line "¿Estás de acuerdo?"
	done

UnknownText_0x1c4693::
	text "Se excedió el área"
	line "de guardar de la"
	cont "ventana."
	done

UnknownText_0x1c46b7::
	text "No hay ventanas"
	line "emergentes."
	done

UnknownText_0x1c46dc::
	text "¡Evento corrupto!"
	prompt

_ObjectEventText::
	text "Evento de objeto."
	done

UnknownText_0x1c46fc::
	text "Evento BG"
	done

UnknownText_0x1c4706::
	text "Coordenadas evento"
	done

UnknownText_0x1c4719::
	text "<PLAYER> recibió"
	line "@"
	text_ram wStringBuffer4
	text "."
	done

UnknownText_0x1c472c::
	text "<PLAYER> puso"
	line "@"
	text_ram wStringBuffer1
	text " en"
	cont "@"
	text_ram wStringBuffer3
	text "."
	prompt

UnknownText_0x1c474b::
	text_ram wStringBuffer3
	text_start
	line "está lleno…"
	prompt

UnknownText_0x1c475f::
	text "I see all."
	line "I know all…"

	para "Certainly, I know"
	line "of your #MON!"
	done

UnknownText_0x1c4797::
	text "Whaaaat? I can't"
	line "tell a thing!"

	para "How could I not"
	line "know of this?"
	done

UnknownText_0x1c47d4::
	text "Hm… I see you met"
	line "@"
	text_ram wSeerNickname
	text " here:"
	cont "@"
	text_ram wSeerCaughtLocation
	text "!"
	prompt

UnknownText_0x1c47fa::
	text "The time was"
	line "@"
	text_ram wSeerTimeOfDay
	text "!"

	para "Its level was @"
	text_ram wSeerCaughtLevelString
	text "!"

	para "Am I good or what?"
	prompt

UnknownText_0x1c4837::
	text "Hm… @"
	text_ram wSeerNickname
	text_start
	line "came from @"
	text_ram wSeerOTName
	text_start
	cont "in a trade?"

	para "@"
	text_ram wSeerCaughtLocation
	text_start
	line "was where @"
	text_ram wSeerOTName
	text_start
	cont "met @"
	text_ram wSeerNickname
	text "!"
	prompt

UnknownText_0x1c487f::
	text "What!? Incredible!"

	para "I don't understand"
	line "how, but it is"

	para "incredible!"
	line "You are special."

	para "I can't tell where"
	line "you met it, but it"
	cont "was at level @"
	text_ram wSeerCaughtLevelString
	text "."

	para "Am I good or what?"
	prompt

UnknownText_0x1c491d::
	text "Hey!"

	para "That's an EGG!"

	para "You can't say that"
	line "you've met it yet…"
	done

UnknownText_0x1c4955::
	text "Fufufu! I saw that"
	line "you'd do nothing!"
	done

UnknownText_0x1c497a::
	text "Incidentally…"

	para "It would be wise"
	line "to raise your"

	para "#MON with a"
	line "little more care."
	done

UnknownText_0x1c49c6::
	text "Incidentally…"

	para "It seems to have"
	line "grown a little."

	para "@"
	text_ram wSeerNickname
	text " seems"
	line "to be becoming"
	cont "more confident."
	done

UnknownText_0x1c4a21::
	text "Incidentally…"

	para "@"
	text_ram wSeerNickname
	text " has"
	line "grown. It's gained"
	cont "much strength."
	done

UnknownText_0x1c4a5b::
	text "Incidentally…"

	para "It certainly has"
	line "grown mighty!"

	para "This @"
	text_ram wSeerNickname
	text_start
	line "must have come"

	para "through numerous"
	line "#MON battles."

	para "It looks brimming"
	line "with confidence."
	done

UnknownText_0x1c4ae5::
	text "Incidentally…"

	para "I'm impressed by"
	line "your dedication."

	para "It's been a long"
	line "time since I've"

	para "seen a #MON as"
	line "mighty as this"
	cont "@"
	text_ram wSeerNickname
	text "."

	para "I'm sure that"
	line "seeing @"
	text_ram wSeerNickname
	text_start

	para "in battle would"
	line "excite anyone."
	done

UnknownText_0x1c4b92::
	text "¡Enhorabuena!"
	line "¡Tu @"
	text_ram wStringBuffer2
	text_end

	text_end ; unused

UnknownText_0x1c4baf::
	text_start

	para "evolucionó en"
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

UnknownText_0x1c4bc5::
	text "¡@"
	text_ram wStringBuffer2
	text_start
	line "no evolucionó!"
	prompt

UnknownText_0x1c4be3::
	text "¡@"
	text_ram wStringBuffer2
	text " está"
	line "evolucionando!"
	done

UnknownText_0x1c4bfd::
	text "¿Cuántas unidades?"
	done

UnknownText_0x1c4c08::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " unidad/es"
	line "de @"
	text_ram wStringBuffer2
	text_start
	cont "serán @"
	text_decimal hMoneyTemp, 3, 6
	text "¥."
	done

UnknownText_0x1c4c28::
	text "Hola, joven."

	para "Vendo hierbas"
	line "medicinales."

	para "Son buenas, pero"
	line "un poco amargas."

	para "Quizá tus #MON"
	line "no las quieran."

	para "¡Je, je, je…!"
	done

UnknownText_0x1c4ca3::
	text "¿Cuántas unidades?"
	done

UnknownText_0x1c4cae::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " unidad/es"
	line "de @"
	text_ram wStringBuffer2
	text_start
	cont "serán @"
	text_decimal hMoneyTemp, 3, 6
	text "¥."
	done

UnknownText_0x1c4cce::
	text "Gracias, joven."
	line "¡Je, je, je…!"
	done

UnknownText_0x1c4cea::
	text "¡Oh! Tu MOCHILA"
	line "está llena, joven."
	done

UnknownText_0x1c4d08::
	text "¡Je, je…! No"
	line "tienes ese dinero."
	done

UnknownText_0x1c4d2a::
	text "Vuelve otra vez."
	line "¡Je, je, je…!"
	done

UnknownText_0x1c4d47::
	text "¡Oye! ¿Quieres ver"
	line "unas gangas?"

	para "Vendo objetos que"
	line "nadie posee, pero"

	para "sólo un objeto de"
	line "cada tipo."
	done

UnknownText_0x1c4db0::
	text_ram wStringBuffer2
	text_start
	line "cuesta @"
	text_decimal hMoneyTemp, 3, 6
	text "¥."
	cont "¿Lo quieres?"
	done

UnknownText_0x1c4dcd::
	text "Gracias."
	done

UnknownText_0x1c4dd6::
	text "¡Oh! Tu MOCHILA"
	line "está a tope."
	done

UnknownText_0x1c4df7::
	text "Eso ya lo has"
	line "comprado. No me"
	cont "quedan más."
	done

UnknownText_0x1c4e28::
	text "¡Oh! No tienes"
	line "suficiente dinero."
	done

UnknownText_0x1c4e46::
	text "Vuelve en otra"
	line "ocasión."
	done

UnknownText_0x1c4e5f::
	text "¿Qué quieres?"
	line "¿Alguna medicina?"
	done

UnknownText_0x1c4e7e::
	text "¿Cuántas unidades?"
	done

UnknownText_0x1c4e89::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " unidad/es"
	line "de @"
	text_ram wStringBuffer2
	text_start
	cont "serán @"
	text_decimal hMoneyTemp, 3, 6
	text "¥."
	done

UnknownText_0x1c4eab::
	text "¡Muchas gracias!"
	done

UnknownText_0x1c4eb9::
	text "No te queda sitio."
	done

UnknownText_0x1c4ed8::
	text "¿Eh? No tienes"
	line "bastante dinero."
	done

UnknownText_0x1c4ef6::
	text "De acuerdo."
	line "Hasta luego."
	done

UnknownText_0x1c4f12::
	text "No tienes nada"
	line "para vender."
	prompt

UnknownText_0x1c4f33::
	text "¿Cuántas unidades?"
	done

UnknownText_0x1c4f3e::
	text "Puedo pagarte"
	line "@"
	text_decimal hMoneyTemp, 3, 6
	text "¥."

	para "¿Te parece bien?"
	done

UnknownText_0x1c4f62::
	text "¡Hola!"
	line "¿Qué deseas?"
	done

UnknownText_0x1c4f80::
	text "Aquí tienes."
	line "¡Gracias!"
	done

UnknownText_0x1c4f9a::
	text "No tienes"
	line "suficiente dinero."
	done

UnknownText_0x1c4fb7::
	text "No puedes llevar"
	line "más objetos."
	done

UnknownText_0x1c4fd7::
	text "Lo siento, no"
	line "puedo comprártelo."
	done

UnknownText_0x1c4ff9::
	text "¡Vuelve cuando"
	line "quieras!"
	done

UnknownText_0x1c500d::
	text "¿Puedo ayudarte"
	line "en algo más?"
	done

UnknownText_0x1c502e::
	text "Recibiste @"
	text_decimal hMoneyTemp, 3, 6
	text " ¥"
	line "por @"
	text_ram wStringBuffer2
	text "."
	done

UnknownText_0x1c5049::
	text "¿Cuántas"
	line "fichas?"
	done

UnknownText_0x1c505e::
	text "¡Adelante!"
	done

UnknownText_0x1c5066::
	text "No tienes"
	line "bastantes fichas."
	prompt

UnknownText_0x1c5079::
	text "¡Vaya…! No me"
	line "quedan fichas…"
	done

UnknownText_0x1c5092::
	text "¿Vuelves a"
	line "jugar?"
	done

UnknownText_0x1c509f::
	text "¡Línea! ¡Has"
	line "ganado @"
	text_ram wStringBuffer2
	text " fichas!"
	done

UnknownText_0x1c50bb::
	text "¡Fallaste!"
	done

_MobileStadiumEntryText::
	text "Data for use in"
	line "the MOBILE STADIUM"

	para "of the N64 #MON"
	line "STADIUM 2 can be"
	cont "read here."

	para "Read the data?"
	done

_MobileStadiumSuccessText::
	text "Data transfer is"
	line "complete."

	para "We hope you enjoy"
	line "MOBILE STADIUM"

	para "battles in the N64"
	line "#MON STADIUM 2."

	para ""
	done

UnknownText_0x1c5182::
	text "Clock time unknown"
	done

UnknownText_0x1c5196::
	text "Delete the saved"
	line "LOG-IN PASSWORD?"
	done

UnknownText_0x1c51b9::
	text "Deleted the LOG-IN"
	line "PASSWORD."
	done

UnknownText_0x1c51d7::
	text "Pick three #MON"
	line "for battle."
	prompt

UnknownText_0x1c51f4::
	text_ram wMobileParticipant1Nickname
	text ","
	line "@"
	text_ram wMobileParticipant2Nickname
	text " and"
	cont "@"
	text_ram wMobileParticipant3Nickname
	text "."

	para "Use these three?"
	done

UnknownText_0x1c521c::
	text "Only three #MON"
	line "may enter."
	prompt

UnknownText_0x1c5238::
	text "The CARD FOLDER"
	line "stores your and"

	para "your friends'"
	line "CARDS."

	para "A CARD contains"
	line "information like"

	para "the person's name,"
	line "phone number and"
	cont "profile."

	para ""
	done

UnknownText_0x1c52bc::
	text "This is your CARD."

	para "Once you've"
	line "entered your phone"

	para "number, you can"
	line "trade CARDS with"
	cont "your friends."

	para ""
	done

UnknownText_0x1c531e::
	text "If you have your"
	line "friend's CARD, you"

	para "can use it to make"
	line "a call from a"

	para "mobile phone on"
	line "the 2nd floor of a"
	cont "#MON CENTER."

	para ""
	done

UnknownText_0x1c5394::
	text "To safely store"
	line "your collection of"

	para "CARDS, you must"
	line "set a PASSCODE for"
	cont "your CARD FOLDER."

	para ""
	done

UnknownText_0x1c53ee::
	text "If the CARD FOLDER"
	line "is deleted, all"

	para "its CARDS and the"
	line "PASSCODE will also"
	cont "be deleted."

	para "Beware--a deleted"
	line "CARD FOLDER can't"
	cont "be restored."

	para "Want to delete"
	line "your CARD FOLDER?"
	done

UnknownText_0x1c5494::
	text "Are you sure you"
	line "want to delete it?"
	done

UnknownText_0x1c54b9::
	text "The CARD FOLDER"
	line "has been deleted."

	para ""
	done

UnknownText_0x1c54dd::
	text "There is an older"
	line "CARD FOLDER from a"
	cont "previous journey."

	para "Do you want to"
	line "open it?"
	done

UnknownText_0x1c552d::
	text "Delete the old"
	line "CARD FOLDER?"
	done

UnknownText_0x1c554a::
	text "Finish registering"
	line "CARDS?"
	done

UnknownText_0x1c5565::
	text "¿Eh? Perdona,"
	line "n.° equivocado."
	done

UnknownText_0x1c5580::
	text "¡Clic!"
	done

UnknownText_0x1c5588::
	text "<……>"
	done

UnknownText_0x1c558b::
	text "Ese número no es"
	line "de esta zona."
	done

UnknownText_0x1c55ac::
	text "¡No es necesario"
	line "llamar, está muy"
	cont "cerca!"
	done

UnknownText_0x1c55ca::
	text "¡Gracias!"
	done

UnknownText_0x1c55d6::
	text "  :"
	done

UnknownText_0x1c55db::
	text "Elige CONTINUAR"
	line "y cambia las"
	cont "opciones."
	prompt

UnknownText_0x1c560b::
	text "¡Contraseña"
	line "no válida!"
	prompt

UnknownText_0x1c561c::
	text "¿Cambias la hora?"
	done

UnknownText_0x1c562e::
	text "Introduce la"
	line "contraseña."
	done

UnknownText_0x1c564a::
	text "¿Borras todos los"
	line "datos guardados?"
	done

UnknownText_0x1c5660::
	text "¡@"
	text_ram wMonOrItemNameBuffer
	text_start
	line "ha aprendido"
	cont "@"
	text_ram wStringBuffer2
	text "!@"
	sound_dex_fanfare_50_79
	text_waitbutton
	text_end

UnknownText_0x1c5678::
	text "¿Qué movimiento"
	next "debería olvidar?"
	done

UnknownText_0x1c5699::
	text "¿Deja de aprender"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

UnknownText_0x1c56af::
	text_ram wMonOrItemNameBuffer
	text_start
	line "no aprendió"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c56c9::
	text_ram wMonOrItemNameBuffer
	text_start
	line "intenta aprender"
	cont "@"
	text_ram wStringBuffer2
	text "."

	para "Pero"
	line "@"
	text_ram wMonOrItemNameBuffer
	text_start

	para "no puede aprender"
	line "más de cuatro"
	cont "movimientos."

	para "¿Borras movimiento"
	line "anterior para"

	para "dejar sitio a"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

UnknownText_0x1c5740::
	text "1, 2 y…@"
	text_pause
	text_end

	text_end ; unused

UnknownText_0x1c574e::
	text " ¡Puf!@"
	text_pause
	text_start

	para "@"
	text_ram wMonOrItemNameBuffer
	text_start
	line "olvidó"
	cont "@"
	text_ram wStringBuffer1
	text "."

	para "Y…"
	prompt

UnknownText_0x1c5772::
	text "Los movimientos MO"
	line "no se pueden"
	cont "olvidar ahora."
	prompt

UnknownText_0x1c5793::
	text "¿Quieres apostar"
	line "tres?"
	done

UnknownText_0x1c57ab::
	text "Faltan fichas."
	prompt

UnknownText_0x1c57be::
	text "Elige una carta."
	done

UnknownText_0x1c57ce::
	text "Haz tu apuesta."
	done

UnknownText_0x1c57df::
	text "¿Vuelves a"
	line "jugar?"
	done

UnknownText_0x1c57f4::
	text "Has barajado el"
	line "mazo."
	prompt

UnknownText_0x1c5813::
	text "¡Sí!"
	done

UnknownText_0x1c581a::
	text "¡Fallaste…!"
	done

UnknownText_0x1c5821::
	text_today
	text_end

	text_end ; unused

UnknownText_0x1c5824::
	text "<……>"
	done

UnknownText_0x1c5827::
	text "Estás fuera de"
	line "cobertura."
	prompt

UnknownText_0x1c5847::
	text "¿A quién quieres"
	line "llamar?"
	done

UnknownText_0x1c5862::
	text "Pulsa un botón"
	line "para salir."
	done

UnknownText_0x1c587d::
	text "¿Borras este"
	line "n.° de teléfono?"
	done

UnknownText_0x1c589f::
	text "¿Qué premio"
	line "quieres?"
	done

UnknownText_0x1c58bc::
	text_ram wStringBuffer1
	text "?"
	line "¿Ese?"
	done

UnknownText_0x1c58d1::
	text "¡Aquí tienes!"

	para ""
	done

UnknownText_0x1c58e0::
	text "Puntos"
	line "insuficientes."

	para ""
	done

UnknownText_0x1c58ff::
	text "No tienes sitio"
	line "para esto."

	para ""
	done

UnknownText_0x1c591a::
	text "¡Vuelve cuando"
	line "quieras!"
	done

UnknownText_0x1c5937::
	text "¡Disculpa!"

	para ""
	done

Text_ExcuseMeYoureNotReady::
	text "Disculpa. No"
	line "estás preparado."

	para ""
	done

UnknownText_0x1c5962::
	text "Vuelve cuando"
	line "estés preparado."
	done

UnknownText_0x1c5983::
	text "Necesitas mínimo"
	line "tres #MON."

	para ""
	done

UnknownText_0x1c59a3::
	text "Perdona, los"
	line "HUEVOs no valen."

	para ""
	done

Text_OnlyThreeMonMayBeEntered::
	text "Solo pueden"
	line "entrar tres"
	cont "#MON."

	para ""
	done

Text_TheMonMustAllBeDifferentKinds::
	text "Los @"
	text_ram wStringBuffer2
	text " #MON"
	line "deben ser"
	cont "todos diferentes."

	para ""
	done

Text_TheMonMustNotHoldTheSameItems::
	text "Los @"
	text_ram wStringBuffer2
	text " #MON"
	line "no pueden"
	cont "llevar objetos."

	para ""
	done

Text_YouCantTakeAnEgg::
	text "¡No puedes"
	line "llevar un HUEVO!"

	para ""
	done

UnknownText_0x1c5a5a::
	text "¡Esquivó la BALL!"

	para "¡Imposible atrapar"
	line "a este #MON!"
	prompt

UnknownText_0x1c5a90::
	text "¡Has perdido al"
	line "#MON!"
	prompt

UnknownText_0x1c5aa6::
	text "¡No! ¡El #MON"
	line "se ha escapado!"
	prompt

UnknownText_0x1c5ac3::
	text "¡Parecía que lo"
	line "habías atrapado!"
	prompt

UnknownText_0x1c5ae3::
	text "¡Vaya!"
	line "¡Te faltó poco!"
	prompt

UnknownText_0x1c5afa::
	text "¡Caray! ¡Casi"
	line "lo consigues!"
	prompt

UnknownText_0x1c5b17::
	text "¡Ya está!"
	line "¡@"
	text_ram wEnemyMonNick
	text_start
	cont "atrapado!@"
	sound_caught_mon
	text_end

	text_end ; unused

Text_Waitbutton_2::
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c5b38::
	text_ram wMonOrItemNameBuffer
	text_start
	line "fue enviado al PC"
	cont "de BILL."
	prompt

UnknownText_0x1c5b53::
	text "Registrados en la"
	line "#DEX los datos"

	para "de @"
	text_ram wEnemyMonNick
	text "."
	line "@"
	sound_slot_machine_start
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c5b7f::
	text "¿Quieres darle"
	line "un mote a"
	cont "@"
	text_ram wStringBuffer1
	text "?"
	done

UnknownText_0x1c5b9a::
	text_ram wStringBuffer2
	text " de"
	line "@"
	text_ram wStringBuffer1
	text " creció."
	prompt

UnknownText_0x1c5bac::
	text "Eso no se puede"
	line "usar con este"
	cont "#MON."
	prompt

Text_RepelUsedEarlierIsStillInEffect::
	text "Todavía funciona"
	line "el REPELENTE que"
	cont "usaste antes."
	prompt

UnknownText_0x1c5bf9::
	text "Escuchaste la"
	line "# FLAUTA."

	para "¡Es una canción"
	line "muy pegadiza!"
	prompt

UnknownText_0x1c5c28::
	text "Se han despertado"
	line "todos los #MON."
	prompt

UnknownText_0x1c5c44::
	text "<PLAYER> sintonizó"
	line "el canal FLAUTA"
	cont "#MON.@"
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c5c5e::
	text "Tienes"
	line "@"
	text_decimal wBlueCardBalance, 1, 2
	text " puntos."
	done

UnknownText_0x1c5c7b::
	text "Fichas:"
	line "@"
	text_decimal wCoins, 2, 4
	text_end

	text_end ; unused

Text_RaiseThePPOfWhichMove::
	text "¿A qué movimiento"
	line "quieres añadir PP?"
	done

Text_RestoreThePPOfWhichMove::
	text "¿Restaurar los PP"
	line "de qué movimiento?"
	done

Text_PPIsMaxedOut::
	text "Los PP de"
	line "@"
	text_ram wStringBuffer2
	text_start
	cont "están al máximo."
	prompt

Text_PPsIncreased::
	text "Los PP de"
	line "@"
	text_ram wStringBuffer2
	text_start
	cont "han aumentado."
	prompt

UnknownText_0x1c5cf1::
	text "PP restaurados."
	prompt

UnknownText_0x1c5d03::
	text "¡Había un trofeo"
	line "dentro!@"
	sound_dex_fanfare_50_79
	text_start

	para "@"
	text_ram wPlayerName
	text " envió"
	line "el trofeo a casa."
	prompt

UnknownText_0x1c5d3e::
	text "Parece amarga…"
	prompt

UnknownText_0x1c5d50::
	text "Eso no se puede"
	line "usar con un HUEVO."
	prompt

UnknownText_0x1c5d6e::
	text "OAK: ¡<PLAYER>!"
	line "¡Éste no es el"
	cont "momento de usarlo!"
	prompt

UnknownText_0x1c5d97::
	text "¡Eso pertenece"
	line "a alguien!"
	prompt

UnknownText_0x1c5db6::
	text "No tendrá"
	line "ningún efecto."
	prompt

UnknownText_0x1c5dd0::
	text "¡El entrenador"
	line "bloqueó la BALL!"
	prompt

UnknownText_0x1c5def::
	text "¡No robes #MON!"
	prompt

UnknownText_0x1c5e01::
	text "Aquí no se permite"
	line "ir en bici."
	prompt

UnknownText_0x1c5e1d::
	text "No puedes subir a"
	line "tu @"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c5e3a::
	text "La CAJA de #MON"
	line "está llena. Ahora"
	cont "no puedes usarla."
	prompt

UnknownText_0x1c5e68::
	text "<PLAYER> usó"
	line "@"
	text_ram wStringBuffer2
	text "."
	done

UnknownText_0x1c5e7b::
	text "<PLAYER> se montó@"
	text_low
	text "en la @"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c5e90::
	text "<PLAYER> se bajó de@"
	text_low
	text "la @"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c5ea8::
	text_ram wStringBuffer1
	text_start
	line "ya conoce"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c5eba::
	text "Ese #MON"
	line "sólo conoce un"
	cont "movimiento."
	done

UnknownText_0x1c5eda::
	text "¿Le haces olvidar"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

UnknownText_0x1c5ef5::
	text "¡Hecho! Tu #MON"
	line "olvidó el movi-"
	cont "miento."
	done

UnknownText_0x1c5f17::
	text "¡Los HUEVOS no"
	line "saben movimientos!"
	done

UnknownText_0x1c5f36::
	text "¿No? Vuelve"
	line "cuando quieras."
	done

UnknownText_0x1c5f50::
	text "¿Qué movimiento"
	line "debería olvidar?"
	prompt

UnknownText_0x1c5f74::
	text "Soy el QUITA-"
	line "MOVIMIENTOS. Hago"

	para "olvidar movimien-"
	line "tos a los #MON."

	para "¿Quieres que"
	line "olviden algún"
	cont "movimiento?"
	done

UnknownText_0x1c5fd1::
	text "¿Qué #MON?"
	prompt

Text_DSTIsThatOK::
	text " verano,"
	line "¿está bien?"
	done

UnknownText_0x1c5ff1::
	text ","
	line "¿está bien?"
	done

UnknownText_0x1c6000::
	text "¿Quieres cambiar"
	line "el reloj al"
	cont "horario de verano?"
	done

UnknownText_0x1c6030::
	text "He adelantado el"
	line "reloj una hora."
	prompt

UnknownText_0x1c6056::
	text "¿Terminó el"
	line "horario de verano?"
	done

UnknownText_0x1c6075::
	text "He atrasado el"
	line "reloj una hora."
	prompt

UnknownText_0x1c6095::
	text "¿Quieres cambiar"
	line "el reloj al"
	cont "horario de verano?"
	done

UnknownText_0x1c60d1::
	text "He perdido las"
	line "instrucciones del"

	para "#GEAR."
	line "Vuelve dentro de"
	cont "un rato."
	prompt
