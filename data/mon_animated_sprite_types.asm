MonAnimatedSpriteTypes: ; 0x13429
; Each mon has an animated sprite tilemap type.
; $03 is bulbasaur's
; $00 is squirtle's
; All other mon's use $06
	db $03  ; BULBASAUR
	db $FF  ; IVYSAUR
	db $FF  ; VENUSAUR
	db $06  ; CHARMANDER
	db $FF  ; CHARMELEON
	db $FF  ; CHARIZARD
	db $00  ; SQUIRTLE
	db $FF  ; WARTORTLE
	db $FF  ; BLASTOISE
	db $06  ; CATERPIE
	db $FF  ; METAPOD
	db $FF  ; BUTTERFREE
	db $06  ; WEEDLE
	db $FF  ; KAKUNA
	db $FF  ; BEEDRILL
	db $06  ; PIDGEY
	db $FF  ; PIDGEOTTO
	db $FF  ; PIDGEOT
	db $06  ; RATTATA
	db $FF  ; RATICATE
	db $06  ; SPEAROW
	db $FF  ; FEAROW
	db $06  ; EKANS
	db $FF  ; ARBOK
	db $06  ; PIKACHU
	db $FF  ; RAICHU
	db $06  ; SANDSHREW
	db $FF  ; SANDSLASH
	db $06  ; NIDORAN_F
	db $FF  ; NIDORINA
	db $FF  ; NIDOQUEEN
	db $06  ; NIDORAN_M
	db $FF  ; NIDORINO
	db $FF  ; NIDOKING
	db $06  ; CLEFAIRY
	db $FF  ; CLEFABLE
	db $06  ; VULPIX
	db $FF  ; NINETALES
	db $06  ; JIGGLYPUFF
	db $FF  ; WIGGLYTUFF
	db $06  ; ZUBAT
	db $FF  ; GOLBAT
	db $06  ; ODDISH
	db $FF  ; GLOOM
	db $FF  ; VILEPLUME
	db $06  ; PARAS
	db $FF  ; PARASECT
	db $06  ; VENONAT
	db $FF  ; VENOMOTH
	db $06  ; DIGLETT
	db $FF  ; DUGTRIO
	db $06  ; MEOWTH
	db $FF  ; PERSIAN
	db $06  ; PSYDUCK
	db $FF  ; GOLDUCK
	db $06  ; MANKEY
	db $FF  ; PRIMEAPE
	db $06  ; GROWLITHE
	db $FF  ; ARCANINE
	db $06  ; POLIWAG
	db $FF  ; POLIWHIRL
	db $FF  ; POLIWRATH
	db $06  ; ABRA
	db $FF  ; KADABRA
	db $FF  ; ALAKAZAM
	db $06  ; MACHOP
	db $FF  ; MACHOKE
	db $FF  ; MACHAMP
	db $06  ; BELLSPROUT
	db $FF  ; WEEPINBELL
	db $FF  ; VICTREEBEL
	db $06  ; TENTACOOL
	db $FF  ; TENTACRUEL
	db $06  ; GEODUDE
	db $FF  ; GRAVELER
	db $FF  ; GOLEM
	db $06  ; PONYTA
	db $FF  ; RAPIDASH
	db $06  ; SLOWPOKE
	db $FF  ; SLOWBRO
	db $06  ; MAGNEMITE
	db $FF  ; MAGNETON
	db $06  ; FARFETCH_D
	db $06  ; DODUO
	db $FF  ; DODRIO
	db $06  ; SEEL
	db $FF  ; DEWGONG
	db $06  ; GRIMER
	db $FF  ; MUK
	db $06  ; SHELLDER
	db $FF  ; CLOYSTER
	db $06  ; GASTLY
	db $FF  ; HAUNTER
	db $FF  ; GENGAR
	db $06  ; ONIX
	db $06  ; DROWZEE
	db $FF  ; HYPNO
	db $06  ; KRABBY
	db $FF  ; KINGLER
	db $06  ; VOLTORB
	db $FF  ; ELECTRODE
	db $06  ; EXEGGCUTE
	db $FF  ; EXEGGUTOR
	db $06  ; CUBONE
	db $FF  ; MAROWAK
	db $06  ; HITMONLEE
	db $06  ; HITMONCHAN
	db $06  ; LICKITUNG
	db $06  ; KOFFING
	db $FF  ; WEEZING
	db $06  ; RHYHORN
	db $FF  ; RHYDON
	db $06  ; CHANSEY
	db $06  ; TANGELA
	db $06  ; KANGASKHAN
	db $06  ; HORSEA
	db $06  ; SEADRA
	db $06  ; GOLDEEN
	db $FF  ; SEAKING
	db $06  ; STARYU
	db $FF  ; STARMIE
	db $06  ; MR_MIME
	db $06  ; SCYTHER
	db $06  ; JYNX
	db $06  ; ELECTABUZZ
	db $06  ; MAGMAR
	db $06  ; PINSIR
	db $06  ; TAUROS
	db $06  ; MAGIKARP
	db $FF  ; GYARADOS
	db $06  ; LAPRAS
	db $06  ; DITTO
	db $06  ; EEVEE
	db $FF  ; VAPOREON
	db $FF  ; JOLTEON
	db $FF  ; FLAREON
	db $06  ; PORYGON
	db $09  ; OMANYTE
	db $FF  ; OMASTAR
	db $06  ; KABUTO
	db $FF  ; KABUTOPS
	db $06  ; AERODACTYL
	db $06  ; SNORLAX
	db $06  ; ARTICUNO
	db $06  ; ZAPDOS
	db $06  ; MOLTRES
	db $06  ; DRATINI
	db $FF  ; DRAGONAIR
	db $FF  ; DRAGONITE
	db $06  ; MEWTWO
	db $06  ; MEW
	db $06  ; CHIKORITA
	db $ff  ; BAYLEEF
	db $ff  ; MEGANIUM
	db $06  ; CYNDAQUIL
	db $ff  ; QUILAVA
	db $ff  ; TYPHLOSION
	db $06  ; TOTODILE
	db $ff  ; CROCONAW
	db $ff  ; FERALIGATR
	db $06  ; SENTRET
	db $ff  ; FURRET
	db $06  ; HOOTHOOT
	db $ff  ; NOCTOWL
	db $06  ; LEDYBA
	db $ff  ; LEDIAN
	db $06  ; SPINARAK
	db $ff  ; ARIADOS
	db $ff  ; CROBAT
	db $06  ; CHINCHOU
	db $ff  ; LANTURN
	db $ff  ; PICHU
	db $ff  ; CLEFFA
	db $ff  ; IGGLYBUFF
	db $06  ; TOGEPI
	db $ff  ; TOGETIC
	db $06  ; NATU
	db $ff  ; XATU
	db $06  ; MAREEP
	db $ff  ; FLAAFFY
	db $ff  ; AMPHAROS
	db $ff  ; BELLOSSOM
	db $06  ; MARILL
	db $ff  ; AZUMARILL
	db $06  ; SUDOWOODO
	db $ff  ; POLITOED
	db $06  ; HOPPIP
	db $ff  ; SKIPLOOM
	db $ff  ; JUMPLUFF
	db $06  ; AIPOM
	db $06  ; SUNKERN
	db $ff  ; SUNFLORA
	db $06  ; YANMA
	db $06  ; WOOPER
	db $ff  ; QUAGSIRE
	db $ff  ; ESPEON
	db $ff  ; UMBREON
	db $06  ; MURKROW
	db $ff  ; SLOWKING
	db $06  ; MISDREAVUS
	db $06  ; UNOWN
	db $06  ; WOBBUFFET
	db $06  ; GIRAFARIG
	db $06  ; PINECO
	db $ff  ; FORRETRESS
	db $06  ; DUNSPARCE
	db $06  ; GLIGAR
	db $ff  ; STEELIX
	db $06  ; SNUBBULL
	db $ff  ; GRANBULL
	db $06  ; QWILFISH
	db $ff  ; SCIZOR
	db $06  ; SHUCKLE
	db $06  ; HERACROSS
	db $06  ; SNEASEL
	db $06  ; TEDDIURSA
	db $ff  ; URSARING
	db $06  ; SLUGMA
	db $ff  ; MAGCARGO
	db $06  ; SWINUB
	db $ff  ; PILOSWINE
	db $06  ; CORSOLA
	db $06  ; REMORAID
	db $ff  ; OCTILLERY
	db $06  ; DELIBIRD
	db $06  ; MANTINE
	db $06  ; SKARMORY
	db $06  ; HOUNDOUR
	db $ff  ; HOUNDOOM
	db $ff  ; KINGDRA
	db $06  ; PHANPY
	db $ff  ; DONPHAN
	db $ff  ; PORYGON2
	db $06  ; STANTLER
	db $06  ; SMEARGLE
	db $06  ; TYROGUE
	db $ff  ; HITMONTOP
	db $ff  ; SMOOCHUM
	db $ff  ; ELEKID
	db $ff  ; MAGBY
	db $06  ; MILTANK
	db $ff  ; BLISSEY
	db $06  ; RAIKOU
	db $06  ; ENTEI
	db $06  ; SUICUNE
	db $06  ; LARVITAR
	db $ff  ; PUPITAR
	db $ff  ; TYRANITAR
	db $06  ; LUGIA
	db $06  ; HO_OH
	db $06  ; CELEBI
	db $06  ; TREECKO
	db $ff  ; GROVYLE
	db $ff  ; SCEPTILE
	db $06  ; TORCHIC
	db $ff  ; COMBUSKEN
	db $ff  ; BLAZIKEN
	db $06  ; MUDKIP
	db $ff  ; MARSHTOMP
	db $ff  ; SWAMPERT
	db $06  ; POOCHYENA
	db $ff  ; MIGHTYENA
	db $06  ; ZIGZAGOON
	db $ff  ; LINOONE
	db $06  ; WURMPLE
	db $ff  ; SILCOON
	db $ff  ; BEAUTIFLY
	db $ff  ; CASCOON
	db $ff  ; DUSTOX
	db $06  ; LOTAD
	db $ff  ; LOMBRE
	db $ff  ; LUDICOLO
	db $06  ; SEEDOT
	db $ff  ; NUZLEAF
	db $ff  ; SHIFTRY
	db $06  ; TAILLOW
	db $ff  ; SWELLOW
	db $06  ; WINGULL
	db $ff  ; PELIPPER
	db $06  ; RALTS
	db $ff  ; KIRLIA
	db $ff  ; GARDEVOIR
	db $06  ; SURSKIT
	db $ff  ; MASQUERAIN
	db $06  ; SHROOMISH
	db $ff  ; BRELOOM
	db $06  ; SLAKOTH
	db $ff  ; VIGOROTH
	db $ff  ; SLAKING
	db $06  ; NINCADA
	db $ff  ; NINJASK
	db $ff  ; SHEDINJA
	db $06  ; WHISMUR
	db $ff  ; LOUDRED
	db $ff  ; EXPLOUD
	db $06  ; MAKUHITA
	db $ff  ; HARIYAMA
	db $ff  ; AZURILL
	db $06  ; NOSEPASS
	db $06  ; SKITTY
	db $ff  ; DELCATTY
	db $06  ; SABLEYE
	db $06  ; MAWILE
	db $06  ; ARON
	db $ff  ; LAIRON
	db $ff  ; AGGRON
	db $06  ; MEDITITE
	db $ff  ; MEDICHAM
	db $06  ; ELECTRIKE
	db $ff  ; MANECTRIC
	db $06  ; PLUSLE
	db $06  ; MINUN
	db $06  ; VOLBEAT
	db $06  ; ILLUMISE
	db $06  ; ROSELIA
	db $06  ; GULPIN
	db $ff  ; SWALOT
	db $06  ; CARVANHA
	db $ff  ; SHARPEDO
	db $06  ; WAILMER
	db $ff  ; WAILORD
	db $06  ; NUMEL
	db $ff  ; CAMERUPT
	db $06  ; TORKOAL
	db $06  ; SPOINK
	db $ff  ; GRUMPIG
	db $06  ; SPINDA
	db $06  ; TRAPINCH
	db $ff  ; VIBRAVA
	db $ff  ; FLYGON
	db $06  ; CACNEA
	db $ff  ; CACTURNE
	db $06  ; SWABLU
	db $ff  ; ALTARIA
	db $06  ; ZANGOOSE
	db $06  ; SEVIPER
	db $06  ; LUNATONE
	db $06  ; SOLROCK
	db $06  ; BARBOACH
	db $ff  ; WHISCASH
	db $06  ; CORPHISH
	db $ff  ; CRAWDAUNT
	db $06  ; BALTOY
	db $ff  ; CLAYDOL
	db $06  ; LILEEP
	db $ff  ; CRADILY
	db $06  ; ANORITH
	db $ff  ; ARMALDO
	db $06  ; FEEBAS
	db $ff  ; MILOTIC
	db $06  ; CASTFORM
	db $06  ; KECLEON
	db $06  ; SHUPPET
	db $ff  ; BANETTE
	db $06  ; DUSKULL
	db $ff  ; DUSCLOPS
	db $06  ; TROPIUS
	db $06  ; CHIMECHO
	db $06  ; ABSOL
	db $06  ; WYNAUT
	db $06  ; SNORUNT
	db $ff  ; GLALIE
	db $06  ; SPHEAL
	db $ff  ; SEALEO
	db $ff  ; WALREIN
	db $06  ; CLAMPERL
	db $ff  ; HUNTAIL
	db $ff  ; GOREBYSS
	db $06  ; RELICANTH
	db $06  ; LUVDISC
	db $06  ; BAGON
	db $ff  ; SHELGON
	db $ff  ; SALAMENCE
	db $06  ; BELDUM
	db $ff  ; METANG
	db $ff  ; METAGROSS
	db $06  ; REGIROCK
	db $06  ; REGICE
	db $06  ; REGISTEEL
	db $06  ; LATIAS
	db $06  ; LATIOS
	db $06  ; KYOGRE
	db $06  ; GROUDON
	db $06  ; RAYQUAZA
	db $06  ; JIRACHI
	db $06  ; DEOXYS
