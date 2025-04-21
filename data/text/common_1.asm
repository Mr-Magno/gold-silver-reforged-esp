_FruitBearingTreeText::
	text "Es un árbol"
	line "frutal."
	done

_HeyItsFruitText::
	text "¡Oye! ¡Mira qué"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_ObtainedFruitText::
	text "¡Obtuvo"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_FruitPackIsFullText::
	text "Pero OBJETOS"
	line "está lleno…"
	done

_NothingHereText::
	text "Aquí no hay"
	line "nada…"
	done

UnknownText_0x1bc06b::
	text "¿Qué BONGURI"
	line "debo usar?"
	done

UnknownText_0x1bc089::
	text "¿Cuántos"
	line "hago?"
	done

UnknownText_0x1bc0a2::
	text "¡@"
	text_ram wStringBuffer1
	text_start
	line "recuperó @"
	text_decimal wCurHPAnimDeltaHP, 2, 3
	text " PS!"
	done

UnknownText_0x1bc0bb::
	text_ram wStringBuffer1
	text_start
	line "curado del veneno."
	done

UnknownText_0x1bc0d2::
	text_ram wStringBuffer1
	text_start
	line "curado de"
	cont "parálisis."
	done

UnknownText_0x1bc0ea::
	text_ram wStringBuffer1
	text_start
	line "curado de"
	cont "quemaduras."
	done

UnknownText_0x1bc101::
	text_ram wStringBuffer1
	text_start
	line "fue descongelado."
	done

UnknownText_0x1bc115::
	text_ram wStringBuffer1
	text_start
	line "se despertó."
	done

UnknownText_0x1bc123::
	text_ram wStringBuffer1
	text_start
	line "recuperó la salud."
	done

UnknownText_0x1bc13a::
	text_ram wStringBuffer1
	text_start
	line "es revitalizado."
	done

UnknownText_0x1bc14f::
	text "¡@"
	text_ram wStringBuffer1
	text_start
	line "subió al nivel"
	cont "@"
	text_decimal wCurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79 ; plays SFX_DEX_FANFARE_50_79, identical to SFX_LEVEL_UP
	text_waitbutton
	text_end

UnknownText_0x1bc16e::
	text_ram wStringBuffer1
	text_start
	line "recuperó el"
	cont "conocimiento."
	done

UnknownText_0x1bc187::
	text "Introduce un no."
	line "de 4 dígitos."
	done

UnknownText_0x1bc1ac::
	text "Introduce el mismo"
	line "no. para confirm."
	done

UnknownText_0x1bc1cf::
	text "Ese no es el"
	line "mismo número."
	done

UnknownText_0x1bc1eb::
	text "CONTRASEÑA"
	line "guardada."

	para "Introduce este"
	line "número para abrir"
	cont "la CARD FOLDER."

	para ""
	done

UnknownText_0x1bc23e::
	text "¡0000 no vale!"

	para ""
	done

UnknownText_0x1bc251::
	text "Pon la CONTRAS."
	next "de CARD FOLDER."
	done

UnknownText_0x1bc272::
	text "¡CONTRASEÑA"
	line "incorrecta!"

	para ""
	done

UnknownText_0x1bc288::
	text "CARD FOLDER abie.@"
	text_end

UnknownText_0x1bc29c::
	text "<……><……><……><……><……><……>"
	line "<……><……><……><……><……><……>"

	para "¡Zzz…! ¿Qué…?"
	line "¡Me despertaste!"

	para "¿Te importaría"
	line "decirme la hora?"
	prompt

UnknownText_0x1bc2eb::
	text "¿Qué hora es?"
	done

UnknownText_0x1bc2fd::
	text "¿Son las @"
	text_end

UnknownText_0x1bc305::
	text "?"
	done

UnknownText_0x1bc308::
	text "¿Cuántos minutos?"
	done

UnknownText_0x1bc31b::
	text "¡Uauu! ¿@"
	text_end

UnknownText_0x1bc323::
	text "?"
	done

UnknownText_0x1bc326::
	text "!"
	line "¡Me he"
	cont "quedado dormido!"
	done

UnknownText_0x1bc336::
	text "!"
	line "¡Me he"
	cont "quedado dormido!"
	done

UnknownText_0x1bc34f::
	text "!"
	line "¡No me extraña que"
	cont "esté tan oscuro!"
	done

UnknownText_0x1bc369::
	text "¿Qué día es hoy?"
	done

UnknownText_0x1bc37a::
	text ","
	line "¿es correcto?"
	done

UnknownText_0x1bc384::
	text "No hay nada"
	line "conectado."
	done

UnknownText_0x1bc3a1::
	text "Revisa el adap-"
	line "tador móvil."
	done

UnknownText_0x1bc3bc::
	text "Revisa el adap-"
	line "tador CDMA."
	done

UnknownText_0x1bc3d1::
	text "Revisa el adap-"
	line "tador DOCOMO PHS."
	done

UnknownText_0x1bc3ec::
	text "Revisa el adap-"
	line "tador DDI PHS."
	done

UnknownText_0x1bc404::
	text "Check unlimited"
	line "battle mobile"
	cont "adapter."
	done

UnknownText_0x1bc42c::
	text "The password is:"
	line ""
	done

UnknownText_0x1bc43f::
	text "Is this OK?"
	done

UnknownText_0x1bc44c::
	text "Enter the"
	line "ID no."
	done

UnknownText_0x1bc45e::
	text "Enter the"
	line "amount."
	done

UnknownText_0x1bc471::
	text "There's nothing to"
	line "choose."
	prompt

UnknownText_0x1bc48c::
	text "Which side do you"
	line "want to put it on?"
	done

UnknownText_0x1bc4b2::
	text "Which side do you"
	line "want to put away?"
	done

UnknownText_0x1bc4d7::
	text "Put away the"
	line "@"
	text_ram wStringBuffer3
	text "."
	prompt

UnknownText_0x1bc4ec::
	text "There's nothing to"
	line "put away."
	prompt

UnknownText_0x1bc509::
	text "Set up the"
	line "@"
	text_ram wStringBuffer3
	text "."
	prompt

UnknownText_0x1bc51c::
	text "Put away the"
	line "@"
	text_ram wStringBuffer3
	text_start

	para "and set up the"
	line "@"
	text_ram wStringBuffer4
	text "."
	prompt

UnknownText_0x1bc546::
	text "That's already set"
	line "up."
	prompt

UnknownText_0x1bc55d::
	text "MAPA del PUEBLO."
	done

UnknownText_0x1bc570::
	text "Un póster de un"
	line "simpático PIKACHU."
	done

UnknownText_0x1bc591::
	text "Un póster de un"
	line "gracioso CLEFAIRY."
	done

UnknownText_0x1bc5b3::
	text "Un póster de un"
	line "bonito JIGGLYPUFF."
	done

UnknownText_0x1bc5d7::
	text "¡Qué guay es este"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_ConsoleDecoText::
	text "¡<PLAYER> está"
	line "jugando a la"
	cont "@"
	text_ram wStringBuffer3
	text "!"
	para "…"
	para "¡Bien! ¡Hora de"
	line "ponerse en marcha!"
	done

UnknownText_0x1bc5ef::
	text "¡Un muñeco de"
	line "peluche muy mono!"
	done

UnknownText_0x1bc615::
	text "¡Hola, <PLAYER>!"
	line "¿Qué tal?"
	prompt

UnknownText_0x1bc62a::
	text "Vi algo muy útil"
	line "en la tienda y"
	prompt

UnknownText_0x1bc64e::
	text "lo compré con tu"
	line "dinero. ¡Perdona!"
	prompt

UnknownText_0x1bc673::
	text "Está en tu PC."
	line "¡Te gustará!"
	done

UnknownText_0x1bc693::
	text "Cuando salí de"
	line "compras, vi este"
	cont "adorable muñeco y"
	prompt

UnknownText_0x1bc6c7::
	text "ahora está en tu"
	line "cuarto. ¡Ya verás!"
	done

UnknownText_0x1bc6e9::
	text_ram wPlayerTrademonSpeciesName
	text_start
	line "fue enviado a"
	cont "@"
	text_ram wOTTrademonSenderName
	text "."
	done

UnknownText_0x1bc701::
	text_start
	done

UnknownText_0x1bc703::
	text_ram wOTTrademonSenderName
	text_start
	line "dice adiós a"
	done

UnknownText_0x1bc719::
	text_ram wOTTrademonSpeciesName
	text "."
	done

UnknownText_0x1bc71f::
	text "Cuida bien de"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

UnknownText_0x1bc739::
	text "Por @"
	text_ram wPlayerTrademonSpeciesName
	text_start
	line "de @"
	text_ram wPlayerTrademonSenderName
	text ","
	done

UnknownText_0x1bc74c::
	text_ram wOTTrademonSenderName
	text_start
	line "envía a"
	cont "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

UnknownText_0x1bc75e::
	text_ram wOTTrademonSenderName
	text_start
	line "cambiará a"
	cont "@"
	text_ram wOTTrademonSpeciesName
	text_end

	text_end ; unused

UnknownText_0x1bc774::
	text "por @"
	text_ram wPlayerTrademonSpeciesName
	text_start
	line "de @"
	text_ram wPlayerTrademonSenderName
	text "."
	done

UnknownText_0x1bc787::
	text_ram wPlayerTrademonSenderName
	text_start
	line "cambiará a"
	cont "@"
	text_ram wPlayerTrademonSpeciesName
	text_end

	text_end ; unused

UnknownText_0x1bc79d::
	text "por @"
	text_ram wOTTrademonSenderName
	text_start
	line "de @"
	text_ram wOTTrademonSpeciesName
	text "."
	done

UnknownText_0x1bc7b0::
	text_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text " trade…"
	done

UnknownText_0x1bc7c3::
	text "Cuida bien de"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

UnknownText_0x1bc7dd::
	text_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text " trade…"
	done

UnknownText_0x1bc7f0::
	text "Cuida bien de"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

UnknownText_0x1bc80a::
	text_ram wOTTrademonSpeciesName
	text_start
	line "volvió!"
	done

; Oak's Pokémon Talk

_OPT_IntroText1::
	text_start
	line "ROSA: ¡LA HORA"
	done

_OPT_IntroText2::
	text_start
	line "de KEN!"
	done

_OPT_IntroText3::
	text_start
	line "¡Conmigo, ROSA!"
	done

_OPT_SwarmText1::
	text_start
	line "¡Notición!"
	done

_OPT_SwarmText2::
	text_start
	line "¡Un grupo de"
	done

_OPT_SwarmText3::
	text_start
	line "@"
	text_from_ram wMonOrItemNameBuffer
	text " ha"
	db "@@"

_OPT_SwarmText4::
	text_start
	line "sido visto en"
	done

_OPT_SwarmText5::
	text_start
	line "@"
	text_from_ram wStringBuffer1
	text "!"
	done

_OPT_SwarmText6::
	text_start
	line "Entrenadores"
	done

_OPT_SwarmText7::
	text_start
	line "que quieran"
	done

_OPT_SwarmText8::
	text_start
	line "un @"
	text_from_ram wMonOrItemNameBuffer
	text ","
	db "@@"

_OPT_SwarmText9::
	text_start
	line "dirigios a"
	done

_OPT_SwarmText10::
	text_start
	line "¡Empecemos con"
	done

_OPT_SwarmText11::
	text_start
	line "el espectáculo!"
	done

_OPT_OakText1::
	text_start
	line "KEN: @"
	text_ram wMonOrItemNameBuffer
	text_end

	text_end ; unused

_OPT_OakText2::
	text_start
	line "puede aparecer en"
	done

_OPT_OakText3::
	text_start
	line "@"
	text_ram wStringBuffer1
	text "."
	done

_OPT_MaryText1::
	text_start
	line "ROSA: @"
	text_ram wStringBuffer1
	text_end

OPT_SweetAdorably::
	text_start
	line "dulce y adorable…"
	done

OPT_WigglySlickly::
	text_start
	line "hábil y ágil…"
	done

OPT_AptlyNamed::
	text_start
	line "ejemplar y"
	done

OPT_UndeniablyKindOf::
	text_start
	line "muy especial…"
	done

OPT_Unbearably::
	text_start
	line "alucinante…"
	done

OPT_WowImpressively::
	text_start
	line "impresionante…"
	done

OPT_AlmostPoisonously::
	text_start
	line "es demasiado…"
	done

OPT_Sensually::
	text_start
	line "irresistible…"
	done

OPT_Mischievously::
	text_start
	line "travieso…"
	done

OPT_Topically::
	text_start
	line "siempre de moda…"
	done

OPT_Addictively::
	text_start
	line "carismático…"
	done

OPT_LooksInWater::
	text_start
	line "de lo más acuático"
	done

OPT_EvolutionMustBe::
	text_start
	line "evoluciona rápido…"
	done

OPT_Provocatively::
	text_start
	line "sorprendente…"
	done

OPT_FlippedOut::
	text_start
	line "un pelín chiflado"
	done

OPT_HeartMeltingly::
	text_start
	line "enternecedor…"
	done

OPT_Cute::
	text_start
	line "precioso…"
	done

OPT_Weird::
	text_start
	line "fuera de lo común"
	done

OPT_Pleasant::
	text_start
	line "agradable…"
	done

OPT_BoldSortOf::
	text_start
	line "valiente…"
	done

OPT_Frightening::
	text_start
	line "asusta un poco…"
	done

OPT_SuaveDebonair::
	text_start
	line "gallardo y cortés"
	done

OPT_Powerful::
	text_start
	line "fuerte…"
	done

OPT_Exciting::
	text_start
	line "apasionante…"
	done

OPT_Groovy::
	text_start
	line "¡maravilloso!"
	done

OPT_Inspiring::
	text_start
	line "todo un ejemplo…"
	done

OPT_Friendly::
	text_start
	line "amigable…"
	done

OPT_HotHotHot::
	text_start
	line "es lo más…"
	done

OPT_Stimulating::
	text_start
	line "estimulante…"
	done

OPT_Guarded::
	text_start
	line "prudente…"
	done

OPT_Lovely::
	text_start
	line "fascinante…"
	done

OPT_Speedy::
	text_start
	line "veloz…"
	done

_OPT_PokemonChannelText::
	text "#MON"
	done

_PokedexShowText::
	text_start
	line "@"
	text_ram wStringBuffer1
	text_end

	text_end ; unused

; Pokémon Music Channel / Pokémusic

_BenIntroText1::
	text_start
	line "NARDO: ¡CANAL DE"
	done

_BenIntroText2::
	text_start
	line "MÚSICA #MON!"
	done

_BenIntroText3::
	text_start
	line "¡Soy yo, DJ NARDO!"
	done

_FernIntroText1::
	text_start
	line "FLORO: #MÚSICA"
	done

_FernIntroText2::
	text_start
	line "¡Con el DJ FLORO!"
	done

_BenFernText1::
	text_start
	line "Hoy es @"
	text_today
	text ","
	done

_BenFernText2A::
	text_start
	line "disfrutemos con"
	done

_BenFernText2B::
	text_start
	line "relajémonos con"
	done

_BenFernText3A::
	text_start
	line "la Marcha #MON."
	done

_BenFernText3B::
	text_start
	line "la Nana #MON."
	done

; Lucky Channel

_LC_Text1::
	text_start
	line "SALVA: ¡Hola!"
	done

_LC_Text2::
	text_start
	line "¿Qué tal va eso?"
	done

_LC_Text3::
	text_start
	line "Ya estéis animados"
	done

_LC_Text4::
	text_start
	line "o desanimados,"
	done

_LC_Text5::
	text_start
	line "¡no os perdáis el"
	done

_LC_Text6::
	text_start
	line "N.° DE LA SUERTE!"
	done

_LC_Text7::
	text_start
	line "¡El número de esta"
	done

_LC_Text8::
	text_start
	line "semana es @"
	text_pause
	text_ram wStringBuffer1
	text "!"
	done

_LC_Text9::
	text_start
	line "¡Lo repetiré!"
	done

_LC_Text10::
	text_start
	line "¡Si coincide, ve"
	done

_LC_Text11::
	text_start
	line "a la TORRE RADIO!"
	done

_LC_DragText1::
	text_start
	line "Si me repito,"
	done

_LC_DragText2::
	text_start
	line "se hace pesado…"
	done

; Places and People

_PnP_Text1::
	text_start
	line "¡LUGARES Y GENTE!"
	done

_PnP_Text2::
	text_start
	line "¡Presentado por"
	done

_PnP_Text3::
	text_start
	line "mí, DJ LILA!"
	done

_PnP_Text4::
	text_start
	line "@"
	text_ram wStringBuffer2
	text " @"
	text_ram wStringBuffer1
	text_end

	text_end ; unused

_PnP_cute::
	text_start
	line "me encanta."
	done

_PnP_lazy::
	text_start
	line "no mola."
	done

_PnP_happy::
	text_start
	line "es alegre."
	done

_PnP_noisy::
	text_start
	line "transmite energía."
	done

_PnP_precocious::
	text_start
	line "es inigualable."
	done

_PnP_bold::
	text_start
	line "es inimitable."
	done

_PnP_picky::
	text_start
	line "es muy especial."
	done

_PnP_sortofok::
	text_start
	line "es interesante."
	done

_PnP_soso::
	text_start
	line "debería molar."
	done

_PnP_great::
	text_start
	line "es una maravilla."
	done

_PnP_mytype::
	text_start
	line "me gusta."
	done

_PnP_cool::
	text_start
	line "es genial, ¿no?"
	done

_PnP_inspiring::
	text_start
	line "te guía."
	done

_PnP_weird::
	text_start
	line "es poco común."
	done

_PnP_rightforme::
	text_start
	line "encaja conmigo."
	done

_PnP_odd::
	text_start
	line "es excepcional."
	done

_PnP_Text5::
	text_start
	line "@"
	text_ram wStringBuffer1
	text_end

	text_end ; unused

_RocketRadioText1::
	text_start
	line "¡Ejem…, somos"
	done

_RocketRadioText2::
	text_start
	line "el TEAM ROCKET!"
	done

_RocketRadioText3::
	text_start
	line "¡Tras un largo año"
	done

_RocketRadioText4::
	text_start
	line "de preparativos,"
	done

_RocketRadioText5::
	text_start
	line "hemos resurgido"
	done

_RocketRadioText6::
	text_start
	line "de las cenizas!"
	done

_RocketRadioText7::
	text_start
	line "#MON! @"
	text_pause
	text "¿Podéis"
	done

_RocketRadioText8::
	text_start
	line "escuchar?@"
	text_pause
	text " "
	done

_RocketRadioText9::
	text_start
	line "@"
	text_pause
	text "¡Estaréis bajo"
	done

_RocketRadioText10::
	text_start
	line "@"
	text_pause
	text "nuestro control!"
	done

_BuenaRadioText1::
	text_start
	line "BUENA: ¡Soy BUENA!"
	done

_BuenaRadioText2::
	text_start
	line "¡La cont. de hoy!"
	done

_BuenaRadioText3::
	text_start
	line "Mmmm… ¡Es"
	done

_BuenaRadioText4::
	text_start
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

_BuenaRadioText5::
	text_start
	line "¡No la olvides!"
	done

_BuenaRadioText6::
	text_start
	line "Estoy en la RADIO"
	done

_BuenaRadioText7::
	text_start
	line "de PONIENTE."
	done

_BuenaRadioMidnightText1::
	text_start
	line "BUENA: Oh…"
	done

_BuenaRadioMidnightText2::
	text_start
	line "¡Es medianoche!"
	done

_BuenaRadioMidnightText3::
	text_start
	line "¡Hora de cerrar!"
	done

_BuenaRadioMidnightText4::
	text_start
	line "¡Gracias por"
	done

_BuenaRadioMidnightText5::
	text_start
	line "escucharnos! ¡No"
	done

_BuenaRadioMidnightText6::
	text_start
	line "os quedéis hasta"
	done

_BuenaRadioMidnightText7::
	text_start
	line "tarde! ¡Saludos"
	done

_BuenaRadioMidnightText8::
	text_start
	line "de DJ BUENA!"
	done

_BuenaRadioMidnightText9::
	text "¡Chao, me voy!"
	done

_BuenaRadioMidnightText10::
	text "…"
	done

_BuenaOffTheAirText::
	text_start
	line ""
	done

Text_EnemyWithdrew::
	text "<ENEMY>"
	line "retiró a"
	cont "@"
	text_ram wEnemyMonNick
	text "."
	prompt

Text_EnemyUsedOn::
	text "<ENEMY>"
	line "utilizó"

	para "@"
	text_ram wMonOrItemNameBuffer
	text_start
	line "con"
	cont "@"
	text_ram wEnemyMonNick
	text "."
	prompt

Text_ThatCantBeUsedRightNow::
	text "No puedes usarlo"
	line "en este momento."
	prompt

Text_ThatItemCantBePutInThePack::
	text "No se puede meter"
	line "en la MOCHILA."
	done

Text_TheItemWasPutInThePack::
	text_ram wStringBuffer1
	text_start
	line "fue metido en la"
	cont "MOCHILA."
	done

Text_RemainingTime::
	text "Tiempo restante"
	done

Text_YourMonsHPWasHealed::
	text "Recuperados los"
	line "PS de tu #MON."
	prompt

Text_Warping::
	text "Saltando…"
	done

UnknownText_0x1bd05e::
	text "¿Qué número"
	line "quieres cambiar?"
	done

UnknownText_0x1bd07f::
	text "¿Vas a jugar con"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

UnknownText_0x1bd09a::
	text "Necesitas dos"
	line "#MON para"
	cont "poder criarlos."
	prompt

Text_BreedingIsNotPossible::
	text "No es posible"
	line "criar."
	prompt

UnknownText_0x1bd0d8::
	text "La compatibilidad"
	line "es @"
	text_decimal wBreedingCompatibility, 1, 3
	text "."
	cont "¿Quieres criarlos?"
	done

UnknownText_0x1bd109::
	text "No hay HUEVO."
	line ""
	prompt

UnknownText_0x1bd11c::
	text "¡Se va a abrir!"
	prompt

UnknownText_0x1bd131::
	text "¿Evento de prueba"
	line "@"
	text_decimal wStringBuffer2, 1, 2
	text "?"
	done

UnknownText_0x1bd145::
	text "Start!"
	done

UnknownText_0x1bd14d::
	text "End!"
	done

UnknownText_0x1bd153::
	text "For a boy!"
	done

UnknownText_0x1bd15f::
	text "For a girl!"
	done

UnknownText_0x1bd16c::
	text "This doesn't"
	line "concern a boy!"
	done

UnknownText_0x1bd188::
	text "The BOX is full!"
	done

UnknownText_0x1bd19a::
	text "A new CARD arrived"
	line "from @"
	text_ram wStringBuffer2
	text "."
	done

UnknownText_0x1bd1ba::
	text "Put this CARD in"
	line "the CARD FOLDER?"
	done

UnknownText_0x1bd1dd::
	text_ram wStringBuffer2
	text "'s CARD was"
	line "listed as no.@"
	text_decimal wStringBuffer1, 1, 2
	text "."
	prompt

UnknownText_0x1bd201::
	text "Starting link."
	done

UnknownText_0x1bd211::
	text "Link terminated."
	done

UnknownText_0x1bd223::
	text "Closing link."
	done

UnknownText_0x1bd232::
	text "Clear the time"
	line "limit?"
	done

UnknownText_0x1bd249::
	text "The time limit was"
	line "cleared."
	done

UnknownText_0x1bd266::
	text "Pick which packet"
	line "as an error?"
	done

UnknownText_0x1bd286::
	text "Trading @"
	text_ram wStringBuffer2
	text_start
	line "for @"
	text_ram wStringBuffer1
	text "…"
	done

UnknownText_0x1bd2a0::
	text "¡Conseguida la"
	line "MEDALLA VOLTORB!"
	done

UnknownText_0x1bd2bc::
	text "¿Qué piso?"
	done

UnknownText_0x1bd2ca::
	text "PRESENTADOR:¡BIIP!"

	para "¡Fin del concurso!"
	done

UnknownText_0x1bd2e7::
	text "PRESENTADOR: ¡Se"
	line "acabó el concurso!"
	done

UnknownText_0x1bd308::
	text "Agotado el efecto"
	line "del REPELENTE."
	done

UnknownText_0x1bd321::
	text "<PLAYER>"
	line "encontró"
	cont "@"
	text_ram wStringBuffer3
	text "."
	done

UnknownText_0x1bd331::
	text "Pero a <PLAYER>"
	line "no le queda sitio."
	done

UnknownText_0x1bd34b::
	text "Acabo de ver un"
	line "@"
	text_ram wStringBuffer1
	text " raro en"
	cont "@"
	text_ram wStringBuffer2
	text "."

	para "Te llamaré si veo"
	line "más #MON raros,"
	cont "¿vale?"
	prompt

UnknownText_0x1bd39e::
	text "GUARDANDO… NO"
	line "APAGAR LA CONSOLA."
	done

UnknownText_0x1bd3be::
	text "¡@"
	text_ram wPlayerName
	text_start
	line "recibió"
	cont "@"
	text_ram wStringBuffer1
	text "!@"
	sound_item
	text_waitbutton
	text_end

UnknownText_0x1bd3d7::
	text "No tienes fichas."
	prompt

UnknownText_0x1bd3eb::
	text "No tienes ningún"
	line "MONEDERO."
	prompt

UnknownText_0x1bd407::
	text "¡Bien, conecta el"
	line "cable Game Link!"
	prompt

UnknownText_0x1bd429::
	text "<PLAYER>"
	line "cambió a"

	para "@"
	text_ram wStringBuffer2
	text_start
	line "por"
	cont "@"
	text_ram wMonOrItemNameBuffer
	text ".@"
	text_end

UnknownText_0x1bd445::
	sound_dex_fanfare_80_109
	text_pause
	text_end

	text_end ; unused

UnknownText_0x1bd449::
	text "Colecciono"
	line "#MON."

	para "¿Tienes un"
	line "@"
	text_ram wStringBuffer1
	text "?"

	para "¿Quieres cambiarlo"
	line "por mi"
	cont "@"
	text_ram wStringBuffer2
	text "?"
	done

UnknownText_0x1bd48c::
	text "¿No quieres"
	line "cambiarlo? ¡Bah!"
	done

UnknownText_0x1bd4aa::
	text "¿Qué? Ése no es"
	line "@"
	text_ram wStringBuffer1
	text "."
	cont "¡Qué chasco…!"
	done

UnknownText_0x1bd4d2::
	text "¡Sí! ¡Conseguí un"
	line "@"
	text_ram wStringBuffer1
	text "!"
	cont "¡Gracias!"
	done

UnknownText_0x1bd4f4::
	text "Hola, ¿cómo está"
	line "mi @"
	text_ram wStringBuffer2
	text "?"
	done

UnknownText_0x1bd512::
	text "Estoy buscando a"
	line "este #MON."

	para "Si tuvieras un"
	line "@"
	text_ram wStringBuffer1
	text ","

	para "¿lo cambiarías por"
	line "mi @"
	text_ram wStringBuffer2
	text "?"
	done

UnknownText_0x1bd565::
	text "¿Tú tampoco"
	line "tienes uno?"

	para "¡Pues vaya! ¡Qué"
	line "decepción…!"
	done

UnknownText_0x1bd5a1::
	text "You don't have"
	line "@"
	text_ram wStringBuffer1
	text "? That's"
	cont "too bad, then."
	done

UnknownText_0x1bd5cc::
	text "¡Genial! ¡Gracias!"

	para "Por fin conseguí"
	line "un @"
	text_ram wStringBuffer1
	text "."
	done

UnknownText_0x1bd5f4::
	text "¡El @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "que me cambiaste"
	cont "está fenomenal!"
	done

UnknownText_0x1bd621::
	text_ram wMonOrItemNameBuffer
	text " es"
	line "genial, pero no lo"

	para "tengo. ¿Tienes un"
	line "@"
	text_ram wStringBuffer1
	text "?"
	
	para "Abrí este HUEVO"
	line "#MON que con-"
	cont "seguí en NIHON,"
	cont "¡pero ha"
	cont "crecido mucho!"
	cont "¡Me da miedo!"

	para "¿Mi cambias tu"
	line "CLEFAIRY por mi"
	cont "SKARMORY?"
	done

UnknownText_0x1bd673::
	text "¿No quieres"
	line "cambiarlo? ¡Vaya!"
	done

UnknownText_0x1bd696::
	text "Ése no es un"
	line "@"
	text_ram wStringBuffer1
	text "."

	para "Cámbiamelo si"
	line "consigues uno."
	done

UnknownText_0x1bd6cd::
	text "¡Uau! ¡Gracias!"
	line "¡Siempre quise un"
	cont "@"
	text_ram wMonOrItemNameBuffer
	text "!"
	done

UnknownText_0x1bd6f5::
	text "¿Cómo está el"
	line "@"
	text_ram wStringBuffer2
	text_start
	cont "que te cambié?"

	para "¡Tu @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "es tan mono!"
	done

UnknownText_0x1bd731::
	text "¿Eh? ¿Qué pasó?"
	done

UnknownText_0x1bd745::
	text "El intercambio"
	line "es tan raro…"

	para "Todavía tengo mu-"
	line "cho por aprender."
	done

UnknownText_0x1bd77f::
	text "¡Uau! Ese #MON"
	line "es estupendo."

	para "¿De dónde lo has"
	line "sacado?"

	para "…"

	para "Así que te marchas"
	line "de aventura…"

	para "Pues cuenta con"
	line "mi ayuda."

	para "Pero, ¿cómo podría"
	line "ayudarte?"

	para "¡Ya lo sé! Cuidaré"
	line "de tu dinero."

	para "En un viaje largo"
	line "necesitas dinero."

	para "¿Te guardo algo"
	line "de dinero?"
	done

UnknownText_0x1bd868::
	text "Vale, yo cuidaré"
	line "de tu dinero."

	para "<……><……><……>"
	prompt

UnknownText_0x1bd88e::
	text "Ten cuidado."

	para "Los #MON son"
	line "tus amigos. Debéis"
	cont "ser un equipo."

	para "¡Adelante!"
	done

UnknownText_0x1bd8da::
	text "¡Hola, hola!"
	line "Lo estás haciendo"
	cont "muy bien."

	para "He ordenado tu"
	line "habitación."

	para "¿Quieres saber"
	line "de tu dinero?"
	done

UnknownText_0x1bd942::
	text "¿Qué quieres"
	line "hacer?"
	done

UnknownText_0x1bd95b::
	text "¿Cuánto dinero"
	line "quieres ahorrar?"
	done

UnknownText_0x1bd97a::
	text "¿Cuánto dinero"
	line "quieres coger?"
	done

UnknownText_0x1bd999::
	text "¿Quieres ahorrar"
	line "algo de dinero?"
	done

UnknownText_0x1bd9ba::
	text "No has ahorrado"
	line "tanto dinero."
	prompt

UnknownText_0x1bd9d7::
	text "No puedes coger"
	line "tanto dinero."
	prompt

UnknownText_0x1bd9f1::
	text "No tienes tanto"
	line "dinero."
	prompt

UnknownText_0x1bda0b::
	text "No puedes guardar"
	line "tanto dinero."
	prompt

UnknownText_0x1bda25::
	text "Yo te lo guardaré."
	line "¡Confía en mí!"

	para "¡<PLAYER>,"
	line "sigue así!"
	done

UnknownText_0x1bda5b::
	text "¡Tu dinero está"
	line "seguro! ¡Adelante!"
	done

UnknownText_0x1bda7e::
	text "¡<PLAYER>,"
	line "no te rindas!"
	done

UnknownText_0x1bda90::
	text "Hazlo lo mejor"
	line "posible."
	done

UnknownText_0x1bdaa7::
	text_start
	done

UnknownText_0x1bdaa9::
	text "Soy el ENCARGADO"
	line "de la GUARDERÍA."

	para "¿Quieres que"
	line "cuide un #MON?"
	done

UnknownText_0x1bdad8::
	text "Soy el ENCARGADO"
	line "de la GUARDERÍA."

	para "¿Sabes algo sobre"
	line "los HUEVOS?"

	para "Mi mujer y yo"
	line "estábamos cuidando"
	cont "unos #MON."

	para "¡Y de pronto"
	line "vimos un HUEVO!"

	para "¿No te parece"
	line "increíble?"

	para "¿Quieres que te"
	line "cuide un #MON?"
	done

UnknownText_0x1bdb85::
	text "Soy la ENCARGADA"
	line "de la GUARDERÍA."

	para "¿Quieres que te"
	line "cuide un #MON?"
	done

UnknownText_0x1bdbbb::
	text "Soy la ENCARGADA"
	line "de la GUARDERÍA."

	para "¿Sabes algo sobre"
	line "los HUEVOS?"

	para "Mi marido y yo"
	line "estábamos cuidando"
	cont "unos #MON."

	para "¡Y de pronto"
	line "vimos un HUEVO!"

	para "¿No te parece"
	line "increíble?"

	para "¿Quieres que te"
	line "cuide un #MON?"
	done

UnknownText_0x1bdc79::
	text "¿Cuál quieres"
	line "que cuide?"
	prompt

UnknownText_0x1bdc97::
	text "¿Oh? Pero sólo"
	line "tienes un #MON."
	prompt

UnknownText_0x1bdcb8::
	text "Perdona, pero no"
	line "acepto HUEVOS."
	prompt

UnknownText_0x1bdcda::
	text "Quita la CARTA y"
	line "vuelve a verme."
	prompt

UnknownText_0x1bdcff::
	text "Si me lo das,"
	line "¿con quién vas a"
	cont "combatir?"
	prompt

UnknownText_0x1bdd30::
	text "Vale. Cuidaré de"
	line "tu @"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1bdd4b::
	text "Vuelve a por él"
	line "más tarde."
	done

UnknownText_0x1bdd64::
	text "¿Somos geniales o"
	line "no? ¿Quieres ver a"
	cont "tu @"
	text_ram wStringBuffer1
	text "?"
	done

UnknownText_0x1bdd96::
	text "Tu @"
	text_ram wStringBuffer1
	text_start
	line "ha crecido mucho."

	para "En cuanto a su ni-"
	line "vel, ha subido @"
	text_decimal wStringBuffer2 + 1, 1, 3
	text "."

	para "Recuperar a tu"
	line "#MON te"
	cont "costará @"
	text_decimal wStringBuffer2 + 2, 3, 4
	text "¥."
	done

UnknownText_0x1bde04::
	text "¡Perfecto! ¡Aquí"
	line "está tu #MON!"
	prompt

UnknownText_0x1bde1f::
	text "<PLAYER> recogió"
	line "a @"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1bde32::
	text "¿Ya de vuelta?"
	line "Tu @"
	text_ram wStringBuffer1
	text_start

	para "debería pasar más"
	line "tiempo aquí. Pero"

	para "recoger ahora a"
	line "tu #MON, te"
	cont "costará 100¥."
	done

UnknownText_0x1bdea2::
	text "¡No tienes sitio"
	line "para él!"
	prompt

UnknownText_0x1bdebc::
	text "No tienes bastante"
	line "dinero."
	prompt

UnknownText_0x1bded9::
	text "No hay problema."
	prompt

UnknownText_0x1bdee9::
	text "Vuelve cuando"
	line "quieras."
	done

UnknownText_0x1bdef6::
	text "Aún no…"
	done

UnknownText_0x1bdf00::
	text "¡Ah, eres tú!"

	para "Estábamos cuidando"
	line "de tus #MON y…"

	para "¡Menuda sorpresa"
	line "nos hemos llevado!"

	para "¡Tus #MON han"
	line "tenido un HUEVO!"

	para "No sabemos cómo ha"
	line "llegado ahí, pero"

	para "es de tus #MON."
	line "¿Lo quieres?"
	done

UnknownText_0x1bdfa5::
	text "¡<PLAYER> recibió"
	line "el HUEVO!"
	done

UnknownText_0x1bdfba::
	text "Cuídalo bien."
	done

UnknownText_0x1bdfd1::
	text "Cuidaré de él."
	line "¡Gracias!"
	done

UnknownText_0x1bdff2::
	text "No tienes sitio en"
	line "tu equipo. Vuelve"
	cont "en otro momento."
	done

UnknownText_0x1be024::
	text "¿Qué #MON"
	line "te gustaría"
	cont "fotografiar?"
	prompt

UnknownText_0x1be047::
	text "Muy bien. Espera"
	line "un poco."
	prompt

UnknownText_0x1be06a::
	text "¡Presto! Ya está."
	line "Aquí estaré."
	done
