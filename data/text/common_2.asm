UnknownText_0x1c0000::
	text "¿No quieres una"
	line "fotografía? Vuelve"
	cont "cuando quieras."
	done

UnknownText_0x1c0021::
	text "¿Un HUEVO? Mi ta-"
	line "lento vale más"
	cont "que eso…"
	done

UnknownText_0x1c0043::
	text "¡Hola a todos!"
	line "Soy el INSPECTOR"

	para "de los motes."
	line "Evalúo los nombres"
	cont "de los #MON."

	para "¿Quieres evaluar"
	line "el nombre de"
	cont "algún #MON?"
	done

UnknownText_0x1c00a0::
	text "¿Qué nombre de"
	line "#MON debería"
	cont "evaluar?"
	prompt

UnknownText_0x1c00cd::
	text_ram wStringBuffer1
	text "…"
	line "Es un nombre"
	cont "bastante bueno."

	para "Pero, ¿qué te"
	line "parece mejorarlo"
	cont "un poco?"

	para "¿Quieres que le dé"
	line "otro nombre?"
	done

UnknownText_0x1c0142::
	text "Muy bien."
	line "¿Cómo podríamos"
	cont "llamarlo?"
	prompt

UnknownText_0x1c0171::
	text "¡Ese nombre es"
	line "mejor que el"
	cont "anterior!"

	para "¡Bien hecho!"
	done

UnknownText_0x1c019e::
	text "Muy bien. Vuelve"
	line "cuando quieras."
	done

UnknownText_0x1c01be::
	text "¿@"
	text_ram wStringBuffer1
	text "?"
	line "¡Qué buen nombre!"
	cont "Es perfecto."

	para "Trata a"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "con mucho cariño."
	done

UnknownText_0x1c0208::
	text "¡Uauu…! Eso es"
	line "un HUEVO."
	done

UnknownText_0x1c0222::
	text "¡Se parece al"
	line "anterior, pero"

	para "este nombre es"
	line "mucho mejor!"

	para "¡Bien hecho!"
	done

UnknownText_0x1c0272::
	text "Muy bien. Ahora"
	line "este #MON se"
	cont "llama @"
	text_ram wStringBuffer1
	text "."
	prompt

Text_Gained::
	text "¡@"
	text_ram wStringBuffer1
	text " ganó@"
	text_end

Text_ABoostedStringBuffer2ExpPoints::
	text_start
	line "un total de"
	cont "@"
	text_decimal wStringBuffer2, 2, 5
	text " Puntos EXP.!"
	prompt

Text_StringBuffer2ExpPoints::
	text_start
	line "@"
	text_decimal wStringBuffer2, 2, 5
	text " Puntos EXP.!"
	prompt

Text_GoMon::
	text "¡Adelante,"
	line "@"
	text_ram wBattleMonNick
	text "!"
	done

Text_DoItMon::
	text "¡Hazlo,"
	line "@"
	text_ram wBattleMonNick
	text "!"
	done

Text_GoForItMon::
	text "¡Adelante,"
	line "@"
	text_ram wBattleMonNick
	text "!"
	done

Text_YourFoesWeakGetmMon::
	text "¡Tu enemigo está"
	line "débil! ¡A por él,"
	cont "@"
	text_ram wBattleMonNick
	text "!"
	done

Text_BattleMonNick01::
	text_ram wBattleMonNick
	text "!"
	done

Text_BattleMonNickComma::
	text "¡@"
	text_ram wBattleMonNick
	text ","
	done

Text_ThatsEnoughComeBack::
	text " bien"
	line "hecho! ¡Vuelve!"
	done

Text_OKComeBack::
	text " bien!"
	line "¡Vuelve!"
	done

Text_GoodComeBack::
	text " bien!"
	line "¡Vuelve!"
	done

Text_ComeBack::
	text_start
	line "vuelve!"
	done

UnknownText_0x1c0373::
	text "Elegida una MT."
	prompt

UnknownText_0x1c0384::
	text "Elegida una MO."
	prompt

UnknownText_0x1c0396::
	text "Ésta contiene"
	line "@"
	text_ram wStringBuffer2
	text "."

	para "¿Enseñas"
	line "@"
	text_ram wStringBuffer2
	text_start
	cont "a un #MON?"
	done

UnknownText_0x1c03c2::
	text_ram wStringBuffer2
	text_start
	line "no es compatible"
	cont "con @"
	text_ram wStringBuffer1
	text "."

	para "No puede aprender"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c03fa::
	text "No tienes sitio"
	line "para más"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c0421::
	text "¡Recibiste"
	line "@"
	text_ram wStringBuffer1
	text "!"
	prompt

UnknownText_0x1c0436::
	text "La conexión ha"
	line "sido cancelada."
	prompt

UnknownText_0x1c0454::
	text "Error de"
	line "comunicación."
	prompt

UnknownText_0x1c046a::
	text "Debes recoger el"
	line "REGALO en el"
	cont "CENTRO #MON."
	prompt

UnknownText_0x1c048e::
	text "Tu amigo/a no está"
	line "preparado/a."
	prompt

UnknownText_0x1c04a7::
	text "Lo siento. Sólo"
	line "5 REGALOS al día."
	prompt

UnknownText_0x1c04c6::
	text "Lo siento. Sólo un"
	line "REGALO al día por"
	cont "persona."
	prompt

UnknownText_0x1c04e9::
	text_ram wMysteryGiftPartnerName
	text_start
	line "envió"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c04fa::
	text_ram wMysteryGiftPartnerName
	text_start
	line "envió"

	para "@"
	text_ram wStringBuffer1
	text_start
	line "a casa de"
	cont "@"
	text_ram wMysteryGiftPlayerName
	text "."
	prompt

UnknownText_0x1c051a::
	text "Recibiste"
	line "@"
	text_ram wc850
	text "'s CARD."
	prompt

UnknownText_0x1c0531::
	text_ram wc850
	text "'s CARD was"
	line "listed as no.@"
	text_decimal wDeciramBuffer, 1, 2
	text "."
	prompt

UnknownText_0x1c0555::
	text "The CARD was not"
	line "registered."
	prompt

UnknownText_0x1c0573::
	text "The link has been"
	line "cancelled."
	prompt

UnknownText_0x1c0591::
	text "Communication"
	line "error."
	prompt

_BadgeRequiredText::
	text "Necesitas una"
	line "nueva MEDALLA."
	prompt

UnknownText_0x1c05c8::
	text "Aquí no puedes"
	line "usar eso."
	prompt

UnknownText_0x1c05dd::
	text "¡@"
	text_ram wStringBuffer2
	text_start
	line "usó CORTE!"
	prompt

UnknownText_0x1c05ec::
	text "Aquí no hay nada"
	line "que CORTAR."
	prompt

UnknownText_0x1c0609::
	text "¡Un DESTELLO"
	line "ilumina la zona!@"
	text_waitbutton
	text_end

	text_end ; unused

_UsedSurfText::
	text "¡@"
	text_ram wStringBuffer2
	text_start
	line "usó SURF!"
	done

_CantSurfText::
	text "Aquí no puedes"
	line "hacer SURF."
	prompt

_AlreadySurfingText::
	text "Ya estás"
	line "haciendo SURF."
	prompt

_AskSurfText::
	text "El agua está en"
	line "calma. ¿Quieres"
	cont "hacer SURF?"
	done

UnknownText_0x1c068e::
	text "¡@"
	text_ram wStringBuffer2
	text_start
	line "usó CASCADA!"
	done

UnknownText_0x1c06a3::
	text "¡Uauu! Es una"
	line "enorme cascada."
	done

UnknownText_0x1c06bf::
	text "¿Quieres usar"
	line "CASCADA?"
	done

UnknownText_0x1c06de::
	text "¡@"
	text_ram wStringBuffer2
	text_start
	line "usó EXCAVAR!"
	done

UnknownText_0x1c06ed::
	text "<PLAYER>"
	line "usó CUERDA HUIDA."
	done

UnknownText_0x1c0705::
	text "Aquí no puedes"
	line "usar eso."
	done

UnknownText_0x1c071a::
	text "Vuelta al último"
	line "CENTRO #MON."
	done

UnknownText_0x1c073b::
	text "Aquí no puedes"
	line "usar eso."

	para ""
	done

UnknownText_0x1c0751::
	text "Ya hay un #MON"
	line "usando FUERZA."
	prompt

UnknownText_0x1c0774::
	text "¡@"
	text_ram wStringBuffer2
	text_start
	line "usó FUERZA!"
	done

UnknownText_0x1c0788::
	text_ram wStringBuffer1
	text_start
	line "puede mover"
	cont "cosas pesadas."
	prompt

UnknownText_0x1c07a0::
	text "Un #MON podría"
	line "moverla."

	para "¿Quieres usar"
	line "FUERZA?"
	done

UnknownText_0x1c07d8::
	text "¡Ahora pueden"
	line "moverse cosas"
	cont "pesadas!"
	done

UnknownText_0x1c07f4::
	text "Un #MON podría"
	line "moverla."
	done

UnknownText_0x1c0816::
	text "¡@"
	text_ram wStringBuffer2
	text_start
	line "usó TORBELLINO!"
	prompt

UnknownText_0x1c082b::
	text "¡Un horrible"
	line "torbellino!"

	para "Un #MON"
	line "podría cruzarlo."
	done

UnknownText_0x1c0864::
	text "Hay un torbellino"
	line "en el camino."

	para "¿Quieres usar"
	line "TORBELLINO?"
	done

UnknownText_0x1c0897::
	text "¡@"
	text_ram wStringBuffer2
	text_start
	line "usó GOLPE CABEZA!"
	prompt

UnknownText_0x1c08ac::
	text "No. Nada…"
	done

UnknownText_0x1c08bc::
	text "En este árbol"
	line "podría haber un"
	cont "#MON."

	para "¿Quieres usar"
	line "GOLPE CABEZA?"
	done

UnknownText_0x1c08f0::
	text "¡@"
	text_ram wStringBuffer2
	text_start
	line "usó GOLPE ROCA!"
	prompt

UnknownText_0x1c0906::
	text "Un #MON"
	line "podría romperla."
	done

UnknownText_0x1c0924::
	text "Esta roca se puede"
	line "romper."

	para "¿Quieres usar el"
	line "GOLPE ROCA?"
	done

UnknownText_0x1c0958::
	text "¡Oh!"
	line "¡Han picado!"
	prompt

UnknownText_0x1c0965::
	text "¡No pican!"
	prompt

UnknownText_0x1c0979::
	text "Parece que aquí no"
	line "hay nada."
	prompt

UnknownText_0x1c099a::
	text "¡Aquí no puedes"
	line "bajarte!"
	done

UnknownText_0x1c09b2::
	text "<PLAYER>"
	line "se montó en la"
	cont "@"
	text_ram wStringBuffer2
	text "."
	done

UnknownText_0x1c09c7::
	text "<PLAYER>"
	line "se bajó de la"
	cont "@"
	text_ram wStringBuffer2
	text "."
	done

_CantGetOffBoardText::
	text "¡Aquí no puedes"
	line "bajarte!"
	done

_GotOnBoardText::
	text "<PLAYER>"
	line "se montó en el"
	cont "@"
	text_ram wStringBuffer2
	text "."
	done

_GotOffBoardText::
	text "<PLAYER>"
	line "se bajó del"
	cont "@"
	text_ram wStringBuffer2
	text "."
	done

UnknownText_0x1c09dd::
	text "¡Este árbol se"
	line "puede CORTAR!"

	para "¿Utilizas CORTE?"
	done

UnknownText_0x1c0a05::
	text "¡Este árbol se"
	line "puede CORTAR!"
	done

UnknownText_0x1c0a1c::
	text "¡<PLAYER> encontró"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

UnknownText_0x1c0a2c::
	text "¡Pero <PLAYER> no"
	line "puede llevar más"
	cont "objetos!"
	done

UnknownText_0x1c0a4e::
	text "¡A <PLAYER> no le"
	line "quedan #MON!"

	para "¡<PLAYER> perdió"
	line "el conocimiento!"
	done

UnknownText_0x1c0a77::
	text "El BUSCAOBJETOS"
	line "indica que hay un"
	cont "objeto cerca."
	prompt

UnknownText_0x1c0aa9::
	text "El BUSCAOBJETOS"
	line "no responde."
	prompt

UnknownText_0x1c0acc::
	text "¡@"
	text_ram wStringBuffer3
	text_start
	line "debilitado!"
	prompt

UnknownText_0x1c0ada::
	text "¡A <PLAYER> no le"
	line "quedan #MON!"

	para "¡<PLAYER> perdió"
	line "el conocimiento!"
	prompt

UnknownText_0x1c0b03::
	text "¡@"
	text_ram wStringBuffer3
	text_start
	line "usó DULCE AROMA!"
	done

UnknownText_0x1c0b1a::
	text "Parece que aquí no"
	line "hay nada…"
	done

UnknownText_0x1c0b3b::
	text "<PLAYER> lo regó."

	para "Pero no pasó nada…"
	done

UnknownText_0x1c0b65::
	text "¡Todos los #MON"
	line "de <PLAYER> fueron"
	cont "curados!"
	done

Text_AnEGGCantHoldAnItem::
	text "Un HUEVO no puede"
	line "llevar un objeto."
	prompt

UnknownText_0x1c0b9a::
	text "No hay objetos."
	done

UnknownText_0x1c0ba5::
	text "¿Cuántos quieres"
	line "tirar?"
	done

UnknownText_0x1c0bbb::
	text "¿Tirar @"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text_start
	line "unidad/es de"
	cont "@"
	text_ram wStringBuffer2
	text "?"
	done

UnknownText_0x1c0bd8::
	text "Tiró"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c0bee::
	text "OAK: ¡<PLAYER>!"
	line "¡Éste no es el"
	cont "momento de usarlo!"
	prompt

Text_YouDontHaveAMon::
	text "¡No tienes"
	line "ningún #MON!"
	prompt

UnknownText_0x1c0c2e::
	text_ram wStringBuffer2
	text_start
	line "asig. a SELECT."
	prompt

UnknownText_0x1c0c45::
	text "Ese objeto no se"
	line "puede asignar."
	prompt

UnknownText_0x1c0c63::
	text "¿Adónde quieres"
	line "moverlo?"
	done

UnknownText_0x1c0c83::
	text_start
	done

Text_YouCantUseItInABattle::
	text "No puedes usarlo"
	line "en un combate."
	prompt

Text_AreYouABoyOrAreYouAGirl::
	text "¿Eres un chico?"
	line "¿O eres una chica?"
	done

UnknownText_0x1c0cc6::
	text "¡@"
	text_ram wStringBuffer2
	text " de"
	line "<USER>@"
	text_end

	text_end ; unused

UnknownText_0x1c0cd0::
	text_pause
	text "<SCROLL>subió mucho!"
	prompt

UnknownText_0x1c0ce0::
	text_start
	cont "subió!"
	prompt

UnknownText_0x1c0ceb::
	text "¡@"
	text_ram wStringBuffer2
	text " de"
	line "<TARGET>@"
	text_end

	text_end ; unused

UnknownText_0x1c0cf5::
	text_pause
	text "<SCROLL>bajó mucho!"
	prompt

UnknownText_0x1c0d06::
	text_start
	cont "bajó!"
	prompt

UnknownText_0x1c0d0e::
	text "<USER>@"
	text_end

UnknownText_0x1c0d12::
	text_start
	line "hizo un remolino."
	prompt

UnknownText_0x1c0d26::
	text_start
	line "tomó luz solar."
	prompt

UnknownText_0x1c0d3a::
	text_start
	line "bajó su cabeza."
	prompt

UnknownText_0x1c0d4e::
	text_start
	line "está brillando."
	prompt

UnknownText_0x1c0d5c::
	text_start
	line "voló muy alto."
	prompt

UnknownText_0x1c0d6c::
	text_start
	line "excavó un agujero."
	prompt

_ActorNameText::
	text "¡<USER>@"
	text_end

_UsedMove1Text::
	text_start
	line "usó @"
	text_end

_UsedMove2Text::
	text_start
	line "usó @"
	text_end

_UsedInsteadText::
	text "otro ataque,"
	cont "@"
	text_end

_MoveNameText::
	text_ram wStringBuffer2
	text_end

	text_end ; unused

_EndUsedMove1Text::
	text "!"
	done

_EndUsedMove2Text::
	text "!"
	done

_EndUsedMove3Text::
	text "!"
	done

_EndUsedMove4Text::
	text "!"
	done

_EndUsedMove5Text::
	text "!"
	done

UnknownText_0x1c0db0::
	text "¿Qué?"

	para "@"
	text_end

UnknownText_0x1c0db8::
	text_start
	done

UnknownText_0x1c0dba::
	text "¡@"
	text_ram wStringBuffer1
	text_start
	line "salió del"
	cont "HUEVO!@"
	sound_caught_mon
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c0dd8::
	text "¿Quieres darle"
	line "un mote a"
	cont "@"
	text_ram wStringBuffer1
	text "?"
	done

UnknownText_0x1c0df3::
	text "Es el @"
	text_ram wBreedMon2Nick
	text_start
	line "que dejé con la"

	para "ENCARGADA de la"
	line "GUARDERÍA."
	done

UnknownText_0x1c0e24::
	text "Es el @"
	text_ram wBreedMon1
	text_start
	line "que dejé con el"

	para "ENCARGADO de la"
	line "GUARDERÍA."
	done

UnknownText_0x1c0e54::
	text "Está rebosante"
	line "de energía."
	prompt

UnknownText_0x1c0e6f::
	text "No está interesado"
	line "en @"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c0e8d::
	text "Está interesado"
	line "en @"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c0eac::
	text "Es agradable con"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c0ec6::
	text "Muestra interés"
	line "por @"
	text_ram wStringBuffer1
	text "."
	prompt

_EmptyMailboxText::
	text "Aquí no hay"
	line "ninguna CARTA."
	prompt

ClearedMailPutAwayText::
	text "La CARTA fue"
	line "enviada."
	prompt

MailPackFullText::
	text "¡MOCHILA llena!"
	prompt

MailMessageLostText::
	text "Perderás el"
	line "mensaje de la"
	cont "CARTA. ¿Vale?"
	done

MailAlreadyHoldingItemText::
	text "Ya lleva un"
	line "objeto."
	prompt

MailEggText::
	text "Un HUEVO no puede"
	line "llevar CARTAS."
	prompt

MailMovedFromBoxText::
	text "La CARTA fue"
	line "sacada del BUZÓN."
	prompt

UnknownText_0x1c0fb3::
	text "Sí"
	prompt

UnknownText_0x1c0fb8::
	text "No"
	prompt

UnknownText_0x1c0fbc::
	text_decimal wcf64, 1, 3
	text " @"
	text_ram wStringBuffer1
	text_start
	line "Animation type @"
	text_ram wStringBuffer2
	text_end

	text_end ; unused

UnknownText_0x1c0fdd::
	text "#MON number?"
	done

Text_WasSentToBillsPC::
	text_ram wStringBuffer1
	text_start
	line "fue enviado al"
	cont "PC de BILL."
	prompt

UnknownText_0x1c1006::
	text "¡Necesitas #MON"
	line "a los que llamar!"
	prompt

UnknownText_0x1c1024::
	text "¿Qué quieres"
	line "hacer?"
	done

UnknownText_0x1c102b::
	text "Hay un #MON que"
	line "lleva una CARTA."

	para "Por favor, quita"
	line "la CARTA."
	prompt

UnknownText_0x1c1062::
	text "¡No tienes ni un"
	line "solo #MON!"
	prompt

UnknownText_0x1c1080::
	text "¡No puedes dejar"
	line "tu último #MON!"
	prompt

UnknownText_0x1c10a2::
	text "No puedes recoger"
	line "más #MON."
	prompt

UnknownText_0x1c10c0::
	text "¡@"
	text_ram wStringBuffer1
	text_start
	line "atrapado!"
	prompt

UnknownText_0x1c10cf::
	text "¿Cambiar #MON?"
	done

UnknownText_0x1c10dd::
	text "Ya tienes un"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

ContestJudging_FirstPlaceText::
	text "El ganador de este"
	line "Concurso de"

	para "Captura de Bichos"
	line "es@"
	text_pause
	text "…"

	para "¡@"
	text_ram wBugContestWinnerName
	text ","
	line "que atrapó un"
	cont "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

ContestJudging_FirstPlaceScoreText::
	text_start

	para "¡La puntuación"
	line "ganadora fue de"
	cont "@"
	text_decimal wBugContestFirstPlaceScore, 2, 3
	text " puntos!"
	prompt

ContestJudging_SecondPlaceText::
	text "¡El segundo lugar"
	line "fue para"

	para "@"
	text_ram wBugContestWinnerName
	text ","
	line "que atrapó un"
	cont "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

ContestJudging_SecondPlaceScoreText::
	text_start

	para "¡La puntuación"
	line "fue de"
	cont "@"
	text_decimal wBugContestSecondPlaceScore, 2, 3
	text " puntos!"
	prompt

ContestJudging_ThirdPlaceText::
	text "¡El tercer lugar"
	line "fue para"

	para "@"
	text_ram wBugContestWinnerName
	text ","
	line "que atrapó un"
	cont "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

ContestJudging_ThirdPlaceScoreText::
	text_start

	para "¡La puntuación"
	line "fue de"
	cont "@"
	text_decimal wBugContestThirdPlaceScore, 2, 3
	text " puntos!"
	prompt

UnknownText_0x1c1203::
	text "Déjame que mida a"
	line "ese MAGIKARP."

	para "¡Mmmmm…! Mide"
	line "@"
	text_ram wStringBuffer1
	text " cm."
	prompt

UnknownText_0x1c123a::
	text "RÉCORD ACTUAL"

	para "@"
	text_ram wStringBuffer1
	text " cm,"
	line "fue atrapado por"
	cont "@"
	text_ram wMagikarpRecordHoldersName
	text_linkwaitbutton
	text_end

	text_end ; unused

UnknownText_0x1c1261::
	text "¡Enhorabuena!"

	para "Coincide con el"
	line "número ID de"

	para "@"
	text_ram wStringBuffer1
	text_start
	line "de tu equipo."
	prompt

UnknownText_0x1c12ae::
	text "¡Enhorabuena!"

	para "Coincide con el"
	line "número ID de"

	para "@"
	text_ram wStringBuffer1
	text_start
	line "de tu CAJA del PC."
	prompt

UnknownText_0x1c12fc::
	text "¿Le das un mote al"
	line "@"
	text_ram wStringBuffer1
	text " que"
	cont "has recibido?"
	done

UnknownText_0x1c1328::
	text "¡Bzzzzt! ¡Debes"
	line "tener un #MON"
	cont "para usar esto!"
	prompt

UnknownText_0x1c1353::
	text "<PLAYER> encendió"
	line "el PC."
	prompt

UnknownText_0x1c1368::
	text "¿Qué quieres"
	line "hacer?"
	done

_PlayersPCHowManyWithdrawText::
	text "¿Cuántos quieres"
	line "sacar?"
	done

_PlayersPCWithdrewItemsText::
	text "Sacaste @"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text_start
	line "unidad/es de"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

_PlayersPCNoRoomWithdrawText::
	text "No hay sitio para"
	line "más objetos."
	prompt

UnknownText_0x1c13df::
	text "¡No tienes"
	line "objetos!"
	prompt

_PlayersPCHowManyDepositText::
	text "¿Cuántos quieres"
	line "dejar?"
	done

_PlayersPCDepositItemsText::
	text "Dejaste @"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text_start
	line "unidad/es de"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

_PlayersPCNoRoomDepositText::
	text "No hay sitio donde"
	line "guardar objetos."
	prompt

UnknownText_0x1c144d::
	text "<PLAYER> encendió"
	line "el PC."
	prompt

UnknownText_0x1c1462::
	text "¿Acceder a qué PC?"
	done

UnknownText_0x1c1474::
	text "Accedes al PC de"
	line "BILL."

	para "Accedes al Sistema"
	line "de Almacenamiento"
	cont "de los #MON."
	prompt

UnknownText_0x1c14a4::
	text "Accedes a tu PC."

	para "Accedes al Sistema"
	line "de Almacenamiento"
	cont "de Objetos."
	prompt

UnknownText_0x1c14d2::
	text "Accedes al PC del"
	line "PROF. OAK."

	para "Accedes al Sistema"
	line "de Evaluación de"
	cont "la #DEX."
	prompt

UnknownText_0x1c1505::
	text "Conexión cerrada."
	done

_OakPCText1::
	text "¿Quieres evaluar"
	line "tu #DEX?"
	done

_OakPCText2::
	text "Nivel actual de"
	line "la #DEX:"
	prompt

_OakPCText3::
	text "Viste: @"
	text_ram wStringBuffer3
	text " #MON"
	line "Tuyos: @"
	text_ram wStringBuffer4
	text " #MON"

	para "Evaluación del"
	line "PROF. OAK:"
	done

_OakRating01::
	text "¡Busca #MON en"
	line "zonas de hierba!"
	done

_OakRating02::
	text "Bien. Ya veo que"
	line "sabes cómo usar"
	cont "las # BALL."
	done

_OakRating03::
	text "Lo estás haciendo"
	line "bien, pero tienes"

	para "un largo camino"
	line "por recorrer."
	done

_OakRating04::
	text "Debes completar la"
	line "#DEX. Atrapa"

	para "diferentes tipos"
	line "de #MON."
	done

_OakRating05::
	text "Ya veo que te"
	line "estás esforzando."

	para "Tu #DEX empieza"
	line "a llenarse."
	done

_OakRating06::
	text "Para evolucionar,"
	line "algunos #MON"

	para "crecen y otros"
	line "usan las PIEDRAS."
	done

_OakRating07::
	text "¿Tienes una CAÑA?"
	line "Puedes atrapar"

	para "algunos #MON"
	line "pescando."
	done

_OakRating08::
	text "¡Excelente!"
	line "¡Parece que te"

	para "gusta coleccionar"
	line "cosas!"
	done

_OakRating09::
	text "Algunos #MON"
	line "sólo aparecen a"

	para "ciertas horas del"
	line "día."
	done

_OakRating10::
	text "Tu #DEX se"
	line "está llenando."
	cont "¡Sigue así!"
	done

_OakRating11::
	text "¡Impresionante!"
	line "No sólo atrapas"

	para "#MON, también"
	line "evolucionan."
	done

_OakRating12::
	text "¿Conoces a CÉSAR?"
	line "Sus # BALL"

	para "personalizadas son"
	line "de gran ayuda."
	done

_OakRating13::
	text "¡Uauu! Tienes más"
	line "#MON que en"

	para "la #DEX"
	line "anterior."
	done

_OakRating14::
	text "¿Estás cambiando"
	line "tus #MON?"

	para "¡Es duro hacerlo"
	line "en solitario!"
	done

_OakRating15::
	text "¡Uau! ¡Tienes 200!"
	line "¡Tu #DEX es"
	cont "estupenda!"
	done

_OakRating16::
	text "¡Tienes tantos"
	line "#MON! ¡Me"

	para "has ayudado mucho"
	line "en mis estudios!"
	done

_OakRating17::
	text "¡Genial! ¡Podrías"
	line "convertirte en un"

	para "profesor #MON"
	line "ahora mismo!"
	done

_OakRating18::
	text "¡Tu #DEX es"
	line "increíble!"

	para "¡Eres muy"
	line "profesional!"
	done

_OakRating19::
	text "¡Uau! ¡Una #DEX"
	line "perfecta! ¡Mi"

	para "sueño cumplido!"
	line "¡Enhorabuena!"
	done

_OakPCText4::
	text "Cerrado enlace al"
	line "PC del PROF. OAK."
	done

UnknownText_0x1c19cd::
	text "¡Clasificación de"
	line "entrenadores 3!"

	para "¡El archivo GUARD."
	line "que has enviado"
	cont "podría mejorar"
	cont "la clasificación!"

	para ""
	done

UnknownText_0x1c1a22::
	text "No hay inform."
	line "de clasificación."

	para "Conéctate para"
	line "obtenerla."

	para ""
	done

UnknownText_0x1c1a5b::
	text ", ¡sí!"
	done

UnknownText_0x1c1a65::
	text "Maldición…"
	done

UnknownText_0x1c1a6c::
	text "¿Salir del"
	line "Concurso?"
	done

UnknownText_0x1c1a90::
	text "¿Cuántas unidades"
	line "de @"
	text_ram wStringBuffer2
	text_start
	cont "quieres tirar?"
	done

UnknownText_0x1c1aad::
	text "¿Tirar @"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text_start
	line "unidad/es de"
	cont "@"
	text_ram wStringBuffer2
	text "?"
	done

UnknownText_0x1c1aca::
	text "Tiraste"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c1adf::
	text "¡Es demasiado"
	line "importante para"
	cont "tirarlo!"
	prompt

UnknownText_0x1c1b03::
	text "OAK: ¡<PLAYER>!"
	line "¡Éste no es el"
	cont "momento de usarlo!"
	done

UnknownText_0x1c1b2c::
	text "Quitaste"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "de @"
	text_ram wMonOrItemNameBuffer
	text_start

	para "y le diste"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c1b57::
	text_ram wMonOrItemNameBuffer
	text_start
	line "lleva ahora"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c1b6f::
	text "Primero quita"
	line "la CARTA."
	prompt

UnknownText_0x1c1b8e::
	text_ram wMonOrItemNameBuffer
	text_start
	line "no lleva nada."
	prompt

UnknownText_0x1c1baa::
	text "Caja de objetos"
	line "llena."
	prompt

UnknownText_0x1c1bc4::
	text "Quitaste"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "de @"
	text_ram wMonOrItemNameBuffer
	text "."
	prompt

UnknownText_0x1c1bdc::
	text_ram wMonOrItemNameBuffer
	text_start
	line "ya va equipado con"

	para "@"
	text_ram wStringBuffer1
	text "."
	line "¿Cambiar objetos?"
	done

UnknownText_0x1c1c09::
	text "Este objeto no"
	line "puede ser llevado."
	prompt

UnknownText_0x1c1c22::
	text "¿O prefieres"
	line "borrar el mensaje?"
	done

UnknownText_0x1c1c47::
	text "Quitada CARTA de"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c1c62::
	text "No hay bastante"
	line "espacio para"
	cont "quitar la CARTA."
	prompt

UnknownText_0x1c1c86::
	text "¿Enviar la"
	line "CARTA a tu PC?"
	done

UnknownText_0x1c1ca9::
	text "El BUZÓN de tu"
	line "PC está lleno."
	prompt

UnknownText_0x1c1cc4::
	text "La CARTA fue"
	line "enviada a tu PC."
	prompt

UnknownText_0x1c1ce3::
	text "¡PS insuficientes!"
	prompt

UnknownText_0x1c1cf3::
	text "Puedes asignar un"
	line "objeto de tu"

	para "MOCHILA al botón"
	line "SELECT."
	done

_OakText1::
	text "¡Hola! ¡Perdona"
	line "por la espera!"

	para "¡Bienvenido"
	line "al mundo de"
	cont "los #MON!"

	para "Me llamo OAK."

	para "Pero me llaman"
	line "PROFESOR #MON."
	prompt

_OakText2::
	text "Como sabrás,"
	line "este mundo está"
	
	para "habitado por unas"
	line "criaturas llamadas"
	cont "#MON.@"
	
	para "Pero lo que no"
	line "sabes es quién"
	cont "ha traducido esto."
	
	para "Magno (TV) Mercury"
	line "X: SuperCard-ESP"	
	text_end

_OakText3::
	text_waitbutton
	text_end

	text_end ; unused

_OakText4::
	text "Continuemos."
	line "Algunas personas"
	cont "ven a los #MON"
	
	para "como mascotas y"
	line "otras los usan"
	cont "para pelear."
	prompt

_OakText5::
	text "Pero todavía no"
	line "sabemos todo so-"
	cont "bre los #MON."

	para "Aún hay muchos"
	line "misterios que"
	cont "resolver."

	para "Por eso estudio"
	line "a los #MON."
	prompt
