; Team Rocket set card data (66 unique cards)

EkansLv15Card:
	db TYPE_PKMN_GRASS ; type
	gfx RocketEkansCardGfx ; gfx
	tx EkansName ; name
	db CIRCLE ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw EKANS_LV15
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx RocketBiteName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy GRASS, 2 ; energies
	tx RocketPoisonStingName ; name
	tx RocketFlipCoinPoisonDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw WeepinbellPoisonPowderEffectCommands ; effect commands
	db INFLICT_POISON ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_POISON_FANG ; animation

	db 1 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 23 ; Pokedex number
	db 0
	db 15 ; level
	db 6, 7 ; length
	dw 15 * 10 ; weight
	tx RocketPokemonDescription ; description
	db HAS_EVOLUTION ; AI info

DarkArbokCard:
	db TYPE_PKMN_GRASS ; type
	gfx DarkArbokCardGfx ; gfx
	tx DarkArbokName ; name
	db STAR ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DARK_ARBOK
	db 60 ; hp
	db STAGE1 ; stage
	tx EkansName ; pre-evo name

	; attack 1
	energy GRASS, 2 ; energies
	tx RocketStareName ; name
	tx RocketDarkArbokStareDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw RocketDarkArbokStareEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_LEER ; animation

	; attack 2
	energy GRASS, 2, COLORLESS, 1 ; energies
	tx RocketPoisonVaporName ; name
	tx RocketDarkArbokPoisonVaporDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw RocketDarkArbokPoisonVaporEffectCommands + $8000 ; effect commands
	db INFLICT_POISON ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_FOUL_GAS ; animation

	db 2 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 24 ; Pokedex number
	db 0
	db 25 ; level
	db 11, 6 ; length
	dw 143 * 10 ; weight
	tx RocketPokemonDescription ; description
	db 0 ; AI info

GrimerLv10Card:
	db TYPE_PKMN_GRASS ; type
	gfx RocketGrimerCardGfx ; gfx
	tx GrimerName ; name
	db CIRCLE ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw GRIMER_LV10
	db 40 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy GRASS, 1 ; energies
	tx RocketGasName ; name
	tx RocketSleepDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw ExeggcuteHypnosisEffectCommands ; effect commands
	db INFLICT_SLEEP ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_FOUL_GAS ; animation

	; attack 2
	energy GRASS, 2 ; energies
	tx RocketStickyGooName ; name
	tx RocketFlipCoinParalyzeDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw EkansWrapEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_GOO ; animation

	db 1 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 88 ; Pokedex number
	db 0
	db 10 ; level
	db 2, 11 ; length
	dw 66 * 10 ; weight
	tx RocketPokemonDescription ; description
	db HAS_EVOLUTION ; AI info

DarkMukCard:
	db TYPE_PKMN_GRASS ; type
	gfx DarkMukCardGfx ; gfx
	tx DarkMukName ; name
	db DIAMOND ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DARK_MUK
	db 60 ; hp
	db STAGE1 ; stage
	tx GrimerName ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx RocketStickyGooName ; name
	tx RocketDarkMukStickyGooDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PKMN_POWER_1 ; animation

	; attack 2
	energy GRASS, 2 ; energies
	tx RocketSludgePunchName ; name
	tx RocketPoisonDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw ArbokPoisonFangEffectCommands ; effect commands
	db INFLICT_POISON ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PUNCH ; animation

	db 2 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 89 ; Pokedex number
	db 0
	db 25 ; level
	db 3, 11 ; length
	dw 66 * 10 ; weight
	tx RocketPokemonDescription ; description
	db 0 ; AI info

KoffingLv12Card:
	db TYPE_PKMN_GRASS ; type
	gfx RocketKoffingCardGfx ; gfx
	tx KoffingName ; name
	db CIRCLE ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw KOFFING_LV12
	db 40 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx RocketTackleName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy GRASS, 2 ; energies
	tx RocketGasName ; name
	tx RocketFlipCoinPoisonDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw WeepinbellPoisonPowderEffectCommands ; effect commands
	db INFLICT_POISON ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_FOUL_GAS ; animation

	db 1 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 109 ; Pokedex number
	db 0
	db 12 ; level
	db 2, 0 ; length
	dw 2 * 10 ; weight
	tx RocketPokemonDescription ; description
	db HAS_EVOLUTION ; AI info

DarkWeezingCard:
	db TYPE_PKMN_GRASS ; type
	gfx DarkWeezingCardGfx ; gfx
	tx DarkWeezingName ; name
	db STAR ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DARK_WEEZING
	db 60 ; hp
	db STAGE1 ; stage
	tx KoffingName ; pre-evo name

	; attack 1
	energy GRASS, 1, COLORLESS, 1 ; energies
	tx RocketMassExplosionName ; name
	tx RocketDarkWeezingMassExplosionDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_X ; category
	dw RocketDarkWeezingMassExplosionEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BIG_SELFDESTRUCTION ; animation

	; attack 2
	energy GRASS, 3 ; energies
	tx RocketStunGasName ; name
	tx RocketDarkWeezingStunGasDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw RocketDarkWeezingStunGasEffectCommands + $8000 ; effect commands
	db INFLICT_POISON | INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_FOUL_GAS ; animation

	db 1 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 110 ; Pokedex number
	db 0
	db 24 ; level
	db 3, 11 ; length
	dw 21 * 10 ; weight
	tx RocketPokemonDescription ; description
	db 0 ; AI info

OddishLv21Card:
	db TYPE_PKMN_GRASS ; type
	gfx RocketOddishCardGfx ; gfx
	tx OddishName ; name
	db CIRCLE ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw ODDISH_LV21
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy GRASS, 1 ; energies
	tx RocketSleepName ; name
	tx RocketSleepDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw ExeggcuteHypnosisEffectCommands ; effect commands
	db INFLICT_SLEEP ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_SPORE ; animation

	; attack 2
	energy GRASS, 2 ; energies
	tx RocketPoisonpowderName ; name
	tx RocketPoisonDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw ArbokPoisonFangEffectCommands ; effect commands
	db INFLICT_POISON ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_POISON_POWDER ; animation

	db 1 ; retreat cost
	db WR_FIRE ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 43 ; Pokedex number
	db 0
	db 21 ; level
	db 1, 8 ; length
	dw 12 * 10 ; weight
	tx RocketPokemonDescription ; description
	db HAS_EVOLUTION ; AI info

DarkGloomCard:
	db TYPE_PKMN_GRASS ; type
	gfx DarkGloomCardGfx ; gfx
	tx DarkGloomName ; name
	db DIAMOND ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DARK_GLOOM
	db 50 ; hp
	db STAGE1 ; stage
	tx OddishName ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx RocketPollenStenchName ; name
	tx RocketDarkGloomPollenStenchDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw RocketPollenStenchEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PKMN_POWER_1 ; animation

	; attack 2
	energy GRASS, 2 ; energies
	tx RocketPoisonpowderName ; name
	tx RocketPoisonDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw ArbokPoisonFangEffectCommands ; effect commands
	db INFLICT_POISON ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_POISON_POWDER ; animation

	db 2 ; retreat cost
	db WR_FIRE ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 44 ; Pokedex number
	db 0
	db 21 ; level
	db 2, 7 ; length
	dw 19 * 10 ; weight
	tx RocketPokemonDescription ; description
	db HAS_EVOLUTION ; AI info

DarkVileplumeCard:
	db TYPE_PKMN_GRASS ; type
	gfx DarkVileplumeCardGfx ; gfx
	tx DarkVileplumeName ; name
	db STAR ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DARK_VILEPLUME
	db 60 ; hp
	db STAGE2 ; stage
	tx DarkGloomName ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx RocketHayfeverName ; name
	tx RocketDarkVileplumeHayFeverDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PKMN_POWER_1 ; animation

	; attack 2
	energy GRASS, 3 ; energies
	tx RocketPetalWhirlwindName ; name
	tx RocketDarkVileplumePetalWhirlwindDescription ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_X ; category
	dw RocketDarkVileplumePetalWhirlwindEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PETAL_DANCE ; animation

	db 2 ; retreat cost
	db WR_FIRE ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 45 ; Pokedex number
	db 0
	db 29 ; level
	db 3, 11 ; length
	dw 41 * 10 ; weight
	tx RocketPokemonDescription ; description
	db 0 ; AI info

ZubatLv9Card:
	db TYPE_PKMN_GRASS ; type
	gfx RocketZubatCardGfx ; gfx
	tx ZubatName ; name
	db CIRCLE ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw ZUBAT_LV9
	db 40 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx RocketRamName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy GRASS, 1, COLORLESS, 1 ; energies
	tx RocketBiteName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	db 0 ; retreat cost
	db WR_PSYCHIC ; weakness
	db WR_FIGHTING ; resistance
	tx RocketCategoryName ; category
	db 41 ; Pokedex number
	db 0
	db 9 ; level
	db 2, 7 ; length
	dw 17 * 10 ; weight
	tx RocketPokemonDescription ; description
	db HAS_EVOLUTION ; AI info

DarkGolbatCard:
	db TYPE_PKMN_GRASS ; type
	gfx DarkGolbatCardGfx ; gfx
	tx DarkGolbatName ; name
	db STAR ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DARK_GOLBAT
	db 50 ; hp
	db STAGE1 ; stage
	tx ZubatName ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx RocketSneakAttackName ; name
	tx RocketDarkGolbatSneakAttackDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw RocketDarkGolbatSneakAttackEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PKMN_POWER_1 ; animation

	; attack 2
	energy GRASS, 2 ; energies
	tx RocketFlitterName ; name
	tx RocketDarkGolbatFlitterDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw RocketDarkGolbatFlitterEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_DIVE_BOMB ; animation

	db 0 ; retreat cost
	db WR_PSYCHIC ; weakness
	db WR_FIGHTING ; resistance
	tx RocketCategoryName ; category
	db 42 ; Pokedex number
	db 0
	db 25 ; level
	db 5, 3 ; length
	dw 121 * 10 ; weight
	tx RocketPokemonDescription ; description
	db 0 ; AI info

CharmanderLv9Card:
	db TYPE_PKMN_FIRE ; type
	gfx RocketCharmanderCardGfx ; gfx
	tx CharmanderName ; name
	db CIRCLE ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw CHARMANDER_LV9
	db 40 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx RocketGatherFireName ; name
	tx RocketCharmanderGatherFireDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw RocketCharmanderGatherFireEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PKMN_POWER_1 ; animation

	; attack 2
	energy FIRE, 1 ; energies
	tx RocketFireTailName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_WHIP ; animation

	db 1 ; retreat cost
	db WR_WATER ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 4 ; Pokedex number
	db 0
	db 9 ; level
	db 2, 0 ; length
	dw 19 * 10 ; weight
	tx RocketPokemonDescription ; description
	db HAS_EVOLUTION ; AI info

DarkCharmeleonCard:
	db TYPE_PKMN_FIRE ; type
	gfx DarkCharmeleonCardGfx ; gfx
	tx DarkCharmeleonName ; name
	db DIAMOND ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DARK_CHARMELEON
	db 50 ; hp
	db STAGE1 ; stage
	tx CharmanderName ; pre-evo name

	; attack 1
	energy COLORLESS, 2 ; energies
	tx RocketTailSlapName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_WHIP ; animation

	; attack 2
	energy FIRE, 3 ; energies
	tx RocketFireballName ; name
	tx RocketDarkCharmeleonFireballDescription ; description
	dw NONE ; description (cont)
	db 70 ; damage
	db DAMAGE_NORMAL ; category
	dw RocketDarkCharmeleonFireballEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_SMALL_FLAME ; animation

	db 2 ; retreat cost
	db WR_WATER ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 5 ; Pokedex number
	db 0
	db 23 ; level
	db 3, 7 ; length
	dw 42 * 10 ; weight
	tx RocketPokemonDescription ; description
	db HAS_EVOLUTION ; AI info

DarkCharizardCard:
	db TYPE_PKMN_FIRE ; type
	gfx DarkCharizardCardGfx ; gfx
	tx DarkCharizardName ; name
	db STAR ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DARK_CHARIZARD
	db 80 ; hp
	db STAGE2 ; stage
	tx DarkCharmeleonName ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx RocketNailFlickName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_SLASH ; animation

	; attack 2
	energy FIRE, 2 ; energies
	tx RocketContinuousFireballName ; name
	tx RocketDarkCharizardContinuousFireballDescription ; description
	dw NONE ; description (cont)
	db 50 ; damage
	db DAMAGE_X ; category
	dw RocketDarkCharizardContinuousFireballEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_FIRE_SPIN ; animation

	db 3 ; retreat cost
	db WR_WATER ; weakness
	db WR_FIGHTING ; resistance
	tx RocketCategoryName ; category
	db 6 ; Pokedex number
	db 0
	db 38 ; level
	db 5, 7 ; length
	dw 200 * 10 ; weight
	tx RocketPokemonDescription ; description
	db 0 ; AI info

DarkFlareonCard:
	db TYPE_PKMN_FIRE ; type
	gfx DarkFlareonCardGfx ; gfx
	tx DarkFlareonName ; name
	db DIAMOND ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DARK_FLAREON
	db 50 ; hp
	db STAGE1 ; stage
	tx EeveeName ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx RocketRageName ; name
	tx RocketRageDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_PLUS ; category
	dw FlareonRageEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_RAMPAGE ; animation

	; attack 2
	energy FIRE, 2, COLORLESS, 1 ; energies
	tx RocketPlayingWithFireName ; name
	tx RocketPlayingWithFireDescription ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_PLUS ; category
	dw RocketDarkFlareonPlayingWithFireEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BIG_FLAME ; animation

	db 1 ; retreat cost
	db WR_WATER ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 136 ; Pokedex number
	db 0
	db 23 ; level
	db 2, 11 ; length
	dw 55 * 10 ; weight
	tx RocketPokemonDescription ; description
	db 0 ; AI info

PonytaLv15Card:
	db TYPE_PKMN_FIRE ; type
	gfx RocketPonytaCardGfx ; gfx
	tx PonytaName ; name
	db CIRCLE ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw PONYTA_LV15
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy FIRE, 2 ; energies
	tx RocketEmberName ; name
	tx RocketDiscard1FireEnergyDescription ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw CharmanderEmberEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_SMALL_FLAME ; animation

	; attack 2
	energy 0 ; energies
	dw NONE ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	db 1 ; retreat cost
	db WR_WATER ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 77 ; Pokedex number
	db 0
	db 15 ; level
	db 3, 3 ; length
	dw 66 * 10 ; weight
	tx RocketPokemonDescription ; description
	db HAS_EVOLUTION ; AI info

DarkRapidashCard:
	db TYPE_PKMN_FIRE ; type
	gfx DarkRapidashCardGfx ; gfx
	tx DarkRapidashName ; name
	db DIAMOND ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DARK_RAPIDASH
	db 60 ; hp
	db STAGE1 ; stage
	tx PonytaName ; pre-evo name

	; attack 1
	energy COLORLESS, 2 ; energies
	tx RocketRearKickName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_STRETCH_KICK ; animation

	; attack 2
	energy FIRE, 2 ; energies
	tx RocketFlamePillarName ; name
	tx RocketFlamePillarDescription ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw RocketDarkRapidashFlamePillarEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BIG_FLAME ; animation

	db 0 ; retreat cost
	db WR_WATER ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 78 ; Pokedex number
	db 0
	db 24 ; level
	db 5, 7 ; length
	dw 209 * 10 ; weight
	tx RocketPokemonDescription ; description
	db 0 ; AI info

SquirtleLv16Card:
	db TYPE_PKMN_WATER ; type
	gfx RocketSquirtleCardGfx ; gfx
	tx SquirtleName ; name
	db CIRCLE ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw SQUIRTLE_LV16
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy WATER, 2 ; energies
	tx RocketShellAttackName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy 0 ; energies
	dw NONE ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	db 1 ; retreat cost
	db WR_LIGHTNING ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 7 ; Pokedex number
	db 0
	db 16 ; level
	db 1, 8 ; length
	dw 20 * 10 ; weight
	tx RocketPokemonDescription ; description
	db HAS_EVOLUTION ; AI info

DarkWartortleCard:
	db TYPE_PKMN_WATER ; type
	gfx DarkWartortleCardGfx ; gfx
	tx DarkWartortleName ; name
	db DIAMOND ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DARK_WARTORTLE
	db 60 ; hp
	db STAGE1 ; stage
	tx SquirtleName ; pre-evo name

	; attack 1
	energy WATER, 1 ; energies
	tx RocketDoubleslapName ; name
	tx RocketDoubleslapDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_X ; category
	dw PoliwhirlDoubleslapEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy WATER, 2 ; energies
	tx RocketMirrorShellName ; name
	tx RocketMirrorShellDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw RocketDarkWartortleMirrorShellEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BARRIER ; animation

	db 1 ; retreat cost
	db WR_LIGHTNING ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 8 ; Pokedex number
	db 0
	db 21 ; level
	db 3, 3 ; length
	dw 50 * 10 ; weight
	tx RocketPokemonDescription ; description
	db HAS_EVOLUTION ; AI info

DarkBlastoiseCard:
	db TYPE_PKMN_WATER ; type
	gfx DarkBlastoiseCardGfx ; gfx
	tx DarkBlastoiseName ; name
	db STAR ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DARK_BLASTOISE
	db 70 ; hp
	db STAGE2 ; stage
	tx DarkWartortleName ; pre-evo name

	; attack 1
	energy WATER, 2 ; energies
	tx RocketHydrocannonName ; name
	tx RocketHydrocannonDescription ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_PLUS ; category
	dw RocketDarkBlastoiseHydrocannonEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HYDRO_PUMP ; animation

	; attack 2
	energy WATER, 1, COLORLESS, 2 ; energies
	tx RocketRocketTackleName ; name
	tx RocketRocketTackleDescription ; description
	dw NONE ; description (cont)
	db 40 ; damage
	db DAMAGE_NORMAL ; category
	dw RocketDarkBlastoiseRocketTackleEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BIG_HIT ; animation

	db 2 ; retreat cost
	db WR_LIGHTNING ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 9 ; Pokedex number
	db 0
	db 37 ; level
	db 5, 3 ; length
	dw 189 * 10 ; weight
	tx RocketPokemonDescription ; description
	db 0 ; AI info

PsyduckLv16Card:
	db TYPE_PKMN_WATER ; type
	gfx RocketPsyduckCardGfx ; gfx
	tx PsyduckName ; name
	db CIRCLE ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw PSYDUCK_LV16
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy PSYCHIC, 1 ; energies
	tx RocketDizzinessName ; name
	tx RocketDraw1CardDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw KangaskhanFetchEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_GLOW_EFFECT ; animation

	; attack 2
	energy WATER, 1, COLORLESS, 1 ; energies
	tx RocketWaterGunName ; name
	tx RocketWaterGunDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_PLUS ; category
	dw OmastarWaterGunEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_WATER_GUN ; animation

	db 1 ; retreat cost
	db WR_LIGHTNING ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 54 ; Pokedex number
	db 0
	db 16 ; level
	db 2, 7 ; length
	dw 43 * 10 ; weight
	tx RocketPokemonDescription ; description
	db HAS_EVOLUTION ; AI info

DarkGolduckCard:
	db TYPE_PKMN_WATER ; type
	gfx DarkGolduckCardGfx ; gfx
	tx DarkGolduckName ; name
	db DIAMOND ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DARK_GOLDUCK
	db 60 ; hp
	db STAGE1 ; stage
	tx PsyduckName ; pre-evo name

	; attack 1
	energy PSYCHIC, 1 ; energies
	tx RocketThirdEyeName ; name
	tx RocketThirdEyeDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw RocketDarkGolduckThirdEyeEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PSYCHIC_HIT ; animation

	; attack 2
	energy PSYCHIC, 2, COLORLESS, 1 ; energies
	tx RocketSuperPsyName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 50 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PSYCHIC_HIT ; animation

	db 2 ; retreat cost
	db WR_LIGHTNING ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 55 ; Pokedex number
	db 0
	db 23 ; level
	db 5, 7 ; length
	dw 169 * 10 ; weight
	tx RocketPokemonDescription ; description
	db 0 ; AI info

MagikarpLv10Card:
	db TYPE_PKMN_WATER ; type
	gfx RocketMagikarpCardGfx ; gfx
	tx MagikarpName ; name
	db CIRCLE ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw MAGIKARP_LV10
	db 30 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx RocketFlopName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy WATER, 3 ; energies
	tx RocketRapidEvolutionName ; name
	tx RocketRapidEvolutionDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw RocketMagikarpRapidEvolutionEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_GLOW_EFFECT ; animation

	db 1 ; retreat cost
	db WR_LIGHTNING ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 129 ; Pokedex number
	db 0
	db 10 ; level
	db 2, 11 ; length
	dw 22 * 10 ; weight
	tx RocketPokemonDescription ; description
	db HAS_EVOLUTION ; AI info

DarkGyaradosCard:
	db TYPE_PKMN_WATER ; type
	gfx DarkGyaradosCardGfx ; gfx
	tx DarkGyaradosName ; name
	db STAR ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DARK_GYARADOS
	db 70 ; hp
	db STAGE1 ; stage
	tx MagikarpName ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx RocketFinalBeamName ; name
	tx RocketFinalBeamDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PKMN_POWER_1 ; animation

	; attack 2
	energy WATER, 2, COLORLESS, 1 ; energies
	tx RocketIceBeamName ; name
	tx RocketFlipCoinParalyzeDescription ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw EkansWrapEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BLIZZARD ; animation

	db 2 ; retreat cost
	db WR_GRASS ; weakness
	db WR_FIGHTING ; resistance
	tx RocketCategoryName ; category
	db 130 ; Pokedex number
	db 0
	db 31 ; level
	db 21, 4 ; length
	dw 518 * 10 ; weight
	tx RocketPokemonDescription ; description
	db 0 ; AI info

DarkVaporeonCard:
	db TYPE_PKMN_WATER ; type
	gfx DarkVaporeonCardGfx ; gfx
	tx DarkVaporeonName ; name
	db DIAMOND ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DARK_VAPOREON
	db 60 ; hp
	db STAGE1 ; stage
	tx EeveeName ; pre-evo name

	; attack 1
	energy COLORLESS, 3 ; energies
	tx RocketBiteName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy WATER, 2, COLORLESS, 1 ; energies
	tx RocketWhirlpoolName ; name
	tx RocketWhirlpoolDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw PoliwrathWhirlpoolEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_WHIRLPOOL ; animation

	db 1 ; retreat cost
	db WR_LIGHTNING ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 134 ; Pokedex number
	db 0
	db 28 ; level
	db 3, 3 ; length
	dw 64 * 10 ; weight
	tx RocketPokemonDescription ; description
	db 0 ; AI info

DarkRaichuCard:
	db TYPE_PKMN_LIGHTNING ; type
	gfx DarkRaichuCardGfx ; gfx
	tx DarkRaichuName ; name
	db PROMOSTAR ; rarity
	db ROCKET | PRO | SET_ROCKET ; sets
	dw DARK_RAICHU
	db 70 ; hp
	db STAGE1 ; stage
	tx PikachuName ; pre-evo name

	; attack 1
	energy LIGHTNING, 3 ; energies
	tx RocketSurpriseAttackName ; name
	tx RocketSurpriseAttackDescription ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw RocketDarkRaichuSurpriseAttackEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_THUNDERBOLT ; animation

	; attack 2
	energy 0 ; energies
	dw NONE ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 26 ; Pokedex number
	db 0
	db 31 ; level
	db 2, 7 ; length
	dw 66 * 10 ; weight
	tx RocketPokemonDescription ; description
	db 0 ; AI info

VoltorbLv13Card:
	db TYPE_PKMN_LIGHTNING ; type
	gfx RocketVoltorbCardGfx ; gfx
	tx VoltorbName ; name
	db CIRCLE ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw VOLTORB_LV13
	db 40 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx RocketSpeedballName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_QUICK_ATTACK ; animation

	; attack 2
	energy 0 ; energies
	dw NONE ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 100 ; Pokedex number
	db 0
	db 13 ; level
	db 1, 8 ; length
	dw 23 * 10 ; weight
	tx RocketPokemonDescription ; description
	db HAS_EVOLUTION ; AI info

DarkElectrodeCard:
	db TYPE_PKMN_LIGHTNING ; type
	gfx DarkElectrodeCardGfx ; gfx
	tx DarkElectrodeName ; name
	db DIAMOND ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DARK_ELECTRODE
	db 60 ; hp
	db STAGE1 ; stage
	tx VoltorbName ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx RocketRollingTackleName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy LIGHTNING, 2 ; energies
	tx RocketEnergyBombName ; name
	tx RocketEnergyBombDescription ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw RocketDarkElectrodeEnergyBombEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_THUNDER ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 101 ; Pokedex number
	db 0
	db 24 ; level
	db 3, 11 ; length
	dw 147 * 10 ; weight
	tx RocketPokemonDescription ; description
	db 0 ; AI info

DarkJolteonCard:
	db TYPE_PKMN_LIGHTNING ; type
	gfx DarkJolteonCardGfx ; gfx
	tx DarkJolteonName ; name
	db DIAMOND ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DARK_JOLTEON
	db 50 ; hp
	db STAGE1 ; stage
	tx EeveeName ; pre-evo name

	; attack 1
	energy LIGHTNING, 1 ; energies
	tx RocketLightningFlashName ; name
	tx RocketLightningFlashDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw HorseaSmokescreenEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_THUNDERSHOCK ; animation

	; attack 2
	energy LIGHTNING, 1, COLORLESS, 2 ; energies
	tx RocketThunderAttackName ; name
	tx RocketThunderAttackDescription ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw RocketDarkJolteonThunderAttackEffectCommands + $8000 ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_THUNDER ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 135 ; Pokedex number
	db 0
	db 23 ; level
	db 2, 7 ; length
	dw 54 * 10 ; weight
	tx RocketPokemonDescription ; description
	db 0 ; AI info

MagnemiteLv12Card:
	db TYPE_PKMN_LIGHTNING ; type
	gfx RocketMagnemiteCardGfx ; gfx
	tx MagnemiteName ; name
	db CIRCLE ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw MAGNEMITE_LV12
	db 40 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 2 ; energies
	tx RocketTackleName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy LIGHTNING, 1 ; energies
	tx RocketMagnetismName ; name
	tx RocketMagnetismDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_PLUS ; category
	dw RocketMagnemiteMagnetismEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_THUNDERSHOCK ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 81 ; Pokedex number
	db 0
	db 12 ; level
	db 1, 0 ; length
	dw 13 * 10 ; weight
	tx RocketPokemonDescription ; description
	db HAS_EVOLUTION ; AI info

DarkMagnetonCard:
	db TYPE_PKMN_LIGHTNING ; type
	gfx DarkMagnetonCardGfx ; gfx
	tx DarkMagnetonName ; name
	db STAR ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DARK_MAGNETON
	db 60 ; hp
	db STAGE1 ; stage
	tx MagnemiteName ; pre-evo name

	; attack 1
	energy COLORLESS, 2 ; energies
	tx RocketSonicboomName ; name
	tx RocketNoWeaknessResistanceDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw MagnetonSonicboomEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_SONICBOOM ; animation

	; attack 2
	energy LIGHTNING, 2 ; energies
	tx RocketMagneticLinesName ; name
	tx RocketMagneticLinesDescription ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw RocketDarkMagnetonMagneticLinesEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_MAGNETIC_STORM ; animation

	db 2 ; retreat cost
	db WR_FIGHTING ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 82 ; Pokedex number
	db 0
	db 26 ; level
	db 3, 3 ; length
	dw 132 * 10 ; weight
	tx RocketPokemonDescription ; description
	db 0 ; AI info

DiglettLv15Card:
	db TYPE_PKMN_FIGHTING ; type
	gfx RocketDiglettCardGfx ; gfx
	tx DiglettName ; name
	db CIRCLE ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DIGLETT_LV15
	db 40 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy FIGHTING, 1 ; energies
	tx RocketDigUnderName ; name
	tx RocketDigUnderDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw RocketDiglettDigUnderEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy FIGHTING, 1, COLORLESS, 1 ; energies
	tx RocketScratchName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_SLASH ; animation

	db 0 ; retreat cost
	db WR_GRASS ; weakness
	db WR_LIGHTNING ; resistance
	tx RocketCategoryName ; category
	db 50 ; Pokedex number
	db 0
	db 15 ; level
	db 0, 8 ; length
	dw 2 * 10 ; weight
	tx RocketPokemonDescription ; description
	db HAS_EVOLUTION ; AI info

DarkDugtrioCard:
	db TYPE_PKMN_FIGHTING ; type
	gfx DarkDugtrioCardGfx ; gfx
	tx DarkDugtrioName ; name
	db STAR ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DARK_DUGTRIO
	db 50 ; hp
	db STAGE1 ; stage
	tx DiglettName ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx RocketSinkholeName ; name
	tx RocketSinkholeDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PKMN_POWER_1 ; animation

	; attack 2
	energy FIGHTING, 2 ; energies
	tx RocketKnockDownName ; name
	tx RocketKnockDownDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_PLUS ; category
	dw RocketDarkDugtrioKnockDownEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BIG_HIT ; animation

	db 2 ; retreat cost
	db WR_GRASS ; weakness
	db WR_LIGHTNING ; resistance
	tx RocketCategoryName ; category
	db 51 ; Pokedex number
	db 0
	db 18 ; level
	db 2, 4 ; length
	dw 73 * 10 ; weight
	tx RocketPokemonDescription ; description
	db 0 ; AI info

MankeyLv14Card:
	db TYPE_PKMN_FIGHTING ; type
	gfx RocketMankeyCardGfx ; gfx
	tx MankeyName ; name
	db CIRCLE ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw MANKEY_LV14
	db 40 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx RocketMischiefName ; name
	tx RocketMischiefDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw RocketMankeyMischiefEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_GLOW_EFFECT ; animation

	; attack 2
	energy FIGHTING, 1, COLORLESS, 1 ; energies
	tx RocketAngerName ; name
	tx RocketAngerDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_PLUS ; category
	dw RocketMankeyAngerEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	db 0 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 56 ; Pokedex number
	db 0
	db 14 ; level
	db 1, 8 ; length
	dw 62 * 10 ; weight
	tx RocketPokemonDescription ; description
	db HAS_EVOLUTION ; AI info

DarkPrimeapeCard:
	db TYPE_PKMN_FIGHTING ; type
	gfx DarkPrimeapeCardGfx ; gfx
	tx DarkPrimeapeName ; name
	db DIAMOND ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DARK_PRIMEAPE
	db 60 ; hp
	db STAGE1 ; stage
	tx MankeyName ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx RocketFrenzyName ; name
	tx RocketFrenzyDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PKMN_POWER_1 ; animation

	; attack 2
	energy FIGHTING, 2 ; energies
	tx RocketFrenziedAttackName ; name
	tx RocketFrenziedAttackDescription ; description
	dw NONE ; description (cont)
	db 40 ; damage
	db DAMAGE_NORMAL ; category
	dw RocketDarkPrimeapeFrenziedAttackEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_RAMPAGE ; animation

	db 1 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 57 ; Pokedex number
	db 0
	db 23 ; level
	db 3, 3 ; length
	dw 71 * 10 ; weight
	tx RocketPokemonDescription ; description
	db 0 ; AI info

MachopLv24Card:
	db TYPE_PKMN_FIGHTING ; type
	gfx RocketMachopCardGfx ; gfx
	tx MachopName ; name
	db CIRCLE ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw MACHOP_LV24
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy FIGHTING, 2 ; energies
	tx RocketPunchName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PUNCH ; animation

	; attack 2
	energy 0 ; energies
	dw NONE ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	db 1 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 66 ; Pokedex number
	db 0
	db 24 ; level
	db 2, 7 ; length
	dw 43 * 10 ; weight
	tx RocketPokemonDescription ; description
	db HAS_EVOLUTION ; AI info

DarkMachokeCard:
	db TYPE_PKMN_FIGHTING ; type
	gfx DarkMachokeCardGfx ; gfx
	tx DarkMachokeName ; name
	db DIAMOND ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DARK_MACHOKE
	db 60 ; hp
	db STAGE1 ; stage
	tx MachopName ; pre-evo name

	; attack 1
	energy FIGHTING, 2, COLORLESS, 1 ; energies
	tx RocketDragOffName ; name
	tx RocketDragOffDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NinetalesLureEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PUNCH ; animation

	; attack 2
	energy FIGHTING, 2, COLORLESS, 1 ; energies
	tx RocketKnockBackName ; name
	tx RocketKnockBackDescription ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw ButterfreeWhirlwindEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PUNCH ; animation

	db 2 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 67 ; Pokedex number
	db 0
	db 28 ; level
	db 4, 11 ; length
	dw 155 * 10 ; weight
	tx RocketPokemonDescription ; description
	db HAS_EVOLUTION ; AI info

DarkMachampCard:
	db TYPE_PKMN_FIGHTING ; type
	gfx DarkMachampCardGfx ; gfx
	tx DarkMachampName ; name
	db STAR ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DARK_MACHAMP
	db 70 ; hp
	db STAGE2 ; stage
	tx DarkMachokeName ; pre-evo name

	; attack 1
	energy FIGHTING, 2 ; energies
	tx RocketMegaPunchName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PUNCH ; animation

	; attack 2
	energy FIGHTING, 3, COLORLESS, 1 ; energies
	tx RocketFlingName ; name
	tx RocketFlingDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw RocketDarkMachampFlingEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_SEISMIC_TOSS ; animation

	db 3 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 68 ; Pokedex number
	db 0
	db 30 ; level
	db 5, 3 ; length
	dw 287 * 10 ; weight
	tx RocketPokemonDescription ; description
	db 0 ; AI info

AbraLv14Card:
	db TYPE_PKMN_PSYCHIC ; type
	gfx RocketAbraCardGfx ; gfx
	tx AbraName ; name
	db CIRCLE ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw ABRA_LV14
	db 40 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy PSYCHIC, 1 ; energies
	tx RocketVanishName ; name
	tx RocketVanishDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw RocketAbraVanishEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_GLOW_EFFECT ; animation

	; attack 2
	energy PSYCHIC, 1 ; energies
	tx RocketPsyshockName ; name
	tx RocketFlipCoinParalyzeDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw EkansWrapEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PSYCHIC_HIT ; animation

	db 0 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 63 ; Pokedex number
	db 0
	db 14 ; level
	db 2, 11 ; length
	dw 43 * 10 ; weight
	tx RocketPokemonDescription ; description
	db HAS_EVOLUTION ; AI info

DarkKadabraCard:
	db TYPE_PKMN_PSYCHIC ; type
	gfx DarkKadabraCardGfx ; gfx
	tx DarkKadabraName ; name
	db DIAMOND ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DARK_KADABRA
	db 50 ; hp
	db STAGE1 ; stage
	tx AbraName ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx RocketMatterExchangeName ; name
	tx RocketMatterExchangeDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw RocketDarkKadabraMatterExchangeEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PKMN_POWER_1 ; animation

	; attack 2
	energy PSYCHIC, 2 ; energies
	tx RocketMindShockName ; name
	tx RocketNoWeaknessResistanceDescription ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw MagnetonSonicboomEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PSYCHIC_HIT ; animation

	db 2 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 64 ; Pokedex number
	db 0
	db 24 ; level
	db 4, 3 ; length
	dw 125 * 10 ; weight
	tx RocketPokemonDescription ; description
	db HAS_EVOLUTION ; AI info

DarkAlakazamCard:
	db TYPE_PKMN_PSYCHIC ; type
	gfx DarkAlakazamCardGfx ; gfx
	tx DarkAlakazamName ; name
	db STAR ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DARK_ALAKAZAM
	db 60 ; hp
	db STAGE2 ; stage
	tx DarkKadabraName ; pre-evo name

	; attack 1
	energy PSYCHIC, 2, COLORLESS, 1 ; energies
	tx RocketTeleportBlastName ; name
	tx RocketTeleportBlastDescription ; description
	dw NONE ; description (cont)
	db 30 ; damage
	db DAMAGE_NORMAL ; category
	dw RocketDarkAlakazamTeleportBlastEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PSYCHIC_HIT ; animation

	; attack 2
	energy PSYCHIC, 3 ; energies
	tx RocketMindShockName ; name
	tx RocketNoWeaknessResistanceDescription ; description
	dw NONE ; description (cont)
	db 40 ; damage
	db DAMAGE_NORMAL ; category
	dw MagnetonSonicboomEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PSYCHIC_HIT ; animation

	db 3 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 65 ; Pokedex number
	db 0
	db 30 ; level
	db 4, 11 ; length
	dw 106 * 10 ; weight
	tx RocketPokemonDescription ; description
	db 0 ; AI info

SlowpokeLv16Card:
	db TYPE_PKMN_PSYCHIC ; type
	gfx RocketSlowpokeCardGfx ; gfx
	tx SlowpokeName ; name
	db CIRCLE ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw SLOWPOKE_LV16
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx RocketAfternoonNapName ; name
	tx RocketAfternoonNapDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw RocketSlowpokeAfternoonNapEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_GLOW_EFFECT ; animation

	; attack 2
	energy PSYCHIC, 1, COLORLESS, 1 ; energies
	tx RocketConfusionName ; name
	tx RocketFlipCoinConfuseDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw LaprasConfuseRayEffectCommands ; effect commands
	db INFLICT_CONFUSION ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_CONFUSION_HIT ; animation

	db 1 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 79 ; Pokedex number
	db 0
	db 16 ; level
	db 3, 11 ; length
	dw 79 * 10 ; weight
	tx RocketPokemonDescription ; description
	db HAS_EVOLUTION ; AI info

DarkSlowbroCard:
	db TYPE_PKMN_PSYCHIC ; type
	gfx DarkSlowbroCardGfx ; gfx
	tx DarkSlowbroName ; name
	db STAR ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DARK_SLOWBRO
	db 60 ; hp
	db STAGE1 ; stage
	tx SlowpokeName ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx RocketReelInName ; name
	tx RocketReelInDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw RocketDarkSlowbroReelInEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PKMN_POWER_1 ; animation

	; attack 2
	energy PSYCHIC, 2 ; energies
	tx RocketFickleAttackName ; name
	tx RocketFickleAttackDescription ; description
	dw NONE ; description (cont)
	db 40 ; damage
	db DAMAGE_NORMAL ; category
	dw RocketDarkSlowbroFickleAttackEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PSYCHIC_HIT ; animation

	db 2 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 80 ; Pokedex number
	db 0
	db 27 ; level
	db 5, 3 ; length
	dw 173 * 10 ; weight
	tx RocketPokemonDescription ; description
	db 0 ; AI info

DrowzeeLv10Card:
	db TYPE_PKMN_PSYCHIC ; type
	gfx RocketDrowzeeCardGfx ; gfx
	tx DrowzeeName ; name
	db CIRCLE ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DROWZEE_LV10
	db 50 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx RocketLongDistanceHypnosisName ; name
	tx RocketLongDistanceHypnosisDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw RocketDrowzeeLongDistanceHypnosisEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PKMN_POWER_1 ; animation

	; attack 2
	energy PSYCHIC, 1, COLORLESS, 1 ; energies
	tx RocketNightmareName ; name
	tx RocketSleepDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw ExeggcuteHypnosisEffectCommands ; effect commands
	db INFLICT_SLEEP ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NIGHTMARE ; animation

	db 1 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 96 ; Pokedex number
	db 0
	db 10 ; level
	db 3, 3 ; length
	dw 71 * 10 ; weight
	tx RocketPokemonDescription ; description
	db HAS_EVOLUTION ; AI info

DarkHypnoCard:
	db TYPE_PKMN_PSYCHIC ; type
	gfx DarkHypnoCardGfx ; gfx
	tx DarkHypnoName ; name
	db STAR ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DARK_HYPNO
	db 60 ; hp
	db STAGE1 ; stage
	tx DrowzeeName ; pre-evo name

	; attack 1
	energy PSYCHIC, 1 ; energies
	tx RocketPsypunchName ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PSYCHIC_HIT ; animation

	; attack 2
	energy PSYCHIC, 2, COLORLESS, 1 ; energies
	tx RocketBenchManipulateName ; name
	tx RocketBenchManipulateDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_X ; category
	dw RocketDarkHypnoBenchManipulateEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PSYCHIC_HIT ; animation

	db 2 ; retreat cost
	db WR_PSYCHIC ; weakness
	db NONE ; resistance
	tx RocketCategoryName ; category
	db 97 ; Pokedex number
	db 0
	db 26 ; level
	db 5, 3 ; length
	dw 167 * 10 ; weight
	tx RocketPokemonDescription ; description
	db 0 ; AI info

RattataLv12Card:
	db TYPE_PKMN_COLORLESS ; type
	gfx RocketRattataCardGfx ; gfx
	tx RattataName ; name
	db CIRCLE ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw RATTATA_LV12
	db 40 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx RocketTrickeryName ; name
	tx RocketTrickeryDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw RocketRattataTrickeryEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PKMN_POWER_1 ; animation

	; attack 2
	energy COLORLESS, 1 ; energies
	tx RocketQuickAttackName ; name
	tx RocketQuickAttackDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_PLUS ; category
	dw RocketRattataQuickAttackEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_QUICK_ATTACK ; animation

	db 0 ; retreat cost
	db WR_FIGHTING ; weakness
	db WR_PSYCHIC ; resistance
	tx RocketCategoryName ; category
	db 19 ; Pokedex number
	db 0
	db 12 ; level
	db 1, 0 ; length
	dw 8 * 10 ; weight
	tx RocketPokemonDescription ; description
	db HAS_EVOLUTION ; AI info

DarkRaticateCard:
	db TYPE_PKMN_COLORLESS ; type
	gfx DarkRaticateCardGfx ; gfx
	tx DarkRaticateName ; name
	db DIAMOND ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DARK_RATICATE
	db 50 ; hp
	db STAGE1 ; stage
	tx RattataName ; pre-evo name

	; attack 1
	energy COLORLESS, 2 ; energies
	tx RocketFocusEnergyName ; name
	tx RocketFocusEnergyDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw VaporeonFocusEnergyEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_GLOW_EFFECT ; animation

	; attack 2
	energy COLORLESS, 2 ; energies
	tx RocketHyperFangName ; name
	tx RocketFickleAttackDescription ; description
	dw NONE ; description (cont)
	db 50 ; damage
	db DAMAGE_NORMAL ; category
	dw RocketDarkRaticateHyperFangEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BIG_HIT ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db WR_PSYCHIC ; resistance
	tx RocketCategoryName ; category
	db 20 ; Pokedex number
	db 0
	db 25 ; level
	db 2, 4 ; length
	dw 41 * 10 ; weight
	tx RocketPokemonDescription ; description
	db 0 ; AI info

MeowthLv10Card:
	db TYPE_PKMN_COLORLESS ; type
	gfx RocketMeowthCardGfx ; gfx
	tx MeowthName ; name
	db CIRCLE ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw MEOWTH_LV10
	db 40 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 2 ; energies
	tx RocketCoinHurlName ; name
	tx RocketCoinHurlDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw RocketMeowthCoinHurlEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_CAT_PUNCH ; animation

	; attack 2
	energy 0 ; energies
	dw NONE ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db WR_PSYCHIC ; resistance
	tx RocketCategoryName ; category
	db 52 ; Pokedex number
	db 0
	db 10 ; level
	db 1, 4 ; length
	dw 9 * 10 ; weight
	tx RocketPokemonDescription ; description
	db HAS_EVOLUTION ; AI info

DarkPersianCard:
	db TYPE_PKMN_COLORLESS ; type
	gfx DarkPersianCardGfx ; gfx
	tx DarkPersianName ; name
	db DIAMOND ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DARK_PERSIAN
	db 60 ; hp
	db STAGE1 ; stage
	tx MeowthName ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx RocketFascinateName ; name
	tx RocketFascinateDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw ArbokTerrorStrikeEffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_LEER ; animation

	; attack 2
	energy COLORLESS, 2 ; energies
	tx RocketPoisonClawsName ; name
	tx RocketFlipCoinPoisonDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw WeepinbellPoisonPowderEffectCommands ; effect commands
	db INFLICT_POISON ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_SLASH ; animation

	db 0 ; retreat cost
	db WR_FIGHTING ; weakness
	db WR_PSYCHIC ; resistance
	tx RocketCategoryName ; category
	db 53 ; Pokedex number
	db 0
	db 28 ; level
	db 3, 3 ; length
	dw 71 * 10 ; weight
	tx RocketPokemonDescription ; description
	db 0 ; AI info

EeveeLv9Card:
	db TYPE_PKMN_COLORLESS ; type
	gfx RocketEeveeCardGfx ; gfx
	tx EeveeName ; name
	db CIRCLE ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw EEVEE_LV9
	db 40 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx RocketTumbleName ; name
	tx RocketFickleAttackDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw RocketEeveeTumbleEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_HIT ; animation

	; attack 2
	energy 0 ; energies
	dw NONE ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	db 1 ; retreat cost
	db WR_FIGHTING ; weakness
	db WR_PSYCHIC ; resistance
	tx RocketCategoryName ; category
	db 133 ; Pokedex number
	db 0
	db 9 ; level
	db 1, 0 ; length
	dw 14 * 10 ; weight
	tx RocketPokemonDescription ; description
	db HAS_EVOLUTION ; AI info

PorygonLv20Card:
	db TYPE_PKMN_COLORLESS ; type
	gfx RocketPorygonCardGfx ; gfx
	tx PorygonName ; name
	db DIAMOND ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw PORYGON_LV20
	db 40 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx RocketConversion2Name ; name
	tx RocketConversion2Description ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw PorygonConversion2EffectCommands ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_GLOW_EFFECT ; animation

	; attack 2
	energy COLORLESS, 3 ; energies
	tx RocketPsybeamName ; name
	tx RocketFlipCoinConfuseDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_NORMAL ; category
	dw LaprasConfuseRayEffectCommands ; effect commands
	db INFLICT_CONFUSION ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PSYCHIC_HIT ; animation

	db 0 ; retreat cost
	db WR_FIGHTING ; weakness
	db WR_PSYCHIC ; resistance
	tx RocketCategoryName ; category
	db 137 ; Pokedex number
	db 0
	db 20 ; level
	db 2, 7 ; length
	dw 80 * 10 ; weight
	tx RocketPokemonDescription ; description
	db 0 ; AI info

DratiniLv12Card:
	db TYPE_PKMN_COLORLESS ; type
	gfx RocketDratiniCardGfx ; gfx
	tx DratiniName ; name
	db CIRCLE ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DRATINI_LV12
	db 40 ; hp
	db BASIC ; stage
	dw NONE ; pre-evo name

	; attack 1
	energy COLORLESS, 1 ; energies
	tx RocketWrapName ; name
	tx RocketFlipCoinParalyzeDescription ; description
	dw NONE ; description (cont)
	db 10 ; damage
	db DAMAGE_NORMAL ; category
	dw EkansWrapEffectCommands ; effect commands
	db INFLICT_PARALYSIS ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_WHIP ; animation

	; attack 2
	energy 0 ; energies
	dw NONE ; name
	dw NONE ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db DAMAGE_NORMAL ; category
	dw NONE ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_NONE ; animation

	db 1 ; retreat cost
	db NONE ; weakness
	db WR_PSYCHIC ; resistance
	tx RocketCategoryName ; category
	db 147 ; Pokedex number
	db 0
	db 12 ; level
	db 5, 11 ; length
	dw 7 * 10 ; weight
	tx RocketPokemonDescription ; description
	db HAS_EVOLUTION ; AI info

DarkDragonairCard:
	db TYPE_PKMN_COLORLESS ; type
	gfx DarkDragonairCardGfx ; gfx
	tx DarkDragonairName ; name
	db DIAMOND ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DARK_DRAGONAIR
	db 60 ; hp
	db STAGE1 ; stage
	tx DratiniName ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx RocketEvolutionaryLightName ; name
	tx RocketEvolutionaryLightDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw RocketDarkDragonairEvolutionaryLightEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PKMN_POWER_1 ; animation

	; attack 2
	energy COLORLESS, 3 ; energies
	tx RocketTailStrikeName ; name
	tx RocketTailStrikeDescription ; description
	dw NONE ; description (cont)
	db 20 ; damage
	db DAMAGE_PLUS ; category
	dw RocketDarkDragonairTailStrikeEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_WHIP ; animation

	db 2 ; retreat cost
	db NONE ; weakness
	db WR_PSYCHIC ; resistance
	tx RocketCategoryName ; category
	db 148 ; Pokedex number
	db 0
	db 28 ; level
	db 13, 1 ; length
	dw 36 * 10 ; weight
	tx RocketPokemonDescription ; description
	db HAS_EVOLUTION ; AI info

DarkDragoniteCard:
	db TYPE_PKMN_COLORLESS ; type
	gfx DarkDragoniteCardGfx ; gfx
	tx DarkDragoniteName ; name
	db STAR ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DARK_DRAGONITE
	db 70 ; hp
	db STAGE2 ; stage
	tx DarkDragonairName ; pre-evo name

	; attack 1
	energy 0 ; energies
	tx RocketSummonMinionsName ; name
	tx RocketSummonMinionsDescription ; description
	dw NONE ; description (cont)
	db 0 ; damage
	db POKEMON_POWER ; category
	dw RocketDarkDragoniteSummonMinionsEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_PKMN_POWER_1 ; animation

	; attack 2
	energy COLORLESS, 4 ; energies
	tx RocketGiantTailName ; name
	tx RocketFickleAttackDescription ; description
	dw NONE ; description (cont)
	db 70 ; damage
	db DAMAGE_NORMAL ; category
	dw RocketDarkDragoniteGiantTailEffectCommands + $8000 ; effect commands
	db NONE ; flags 1
	db NONE ; flags 2
	db NONE ; flags 3
	db 0
	db ATK_ANIM_BIG_HIT ; animation

	db 2 ; retreat cost
	db NONE ; weakness
	db WR_FIGHTING ; resistance
	tx RocketCategoryName ; category
	db 149 ; Pokedex number
	db 0
	db 33 ; level
	db 7, 3 ; length
	dw 463 * 10 ; weight
	tx RocketPokemonDescription ; description
	db 0 ; AI info

HereComesTeamRocketCard:
	db TYPE_TRAINER ; type
	gfx HereComesTeamRocketCardGfx ; gfx
	tx HereComesTeamRocketName ; name
	db PROMOSTAR ; rarity
	db ROCKET | PRO | SET_ROCKET ; sets
	dw HERE_COMES_TEAM_ROCKET
	dw RocketHereComesTeamRocketEffectCommands + $8000 ; effect commands
	tx HereComesTeamRocketDescription ; description
	dw NONE ; description (cont)

RocketsSneakAttackCard:
	db TYPE_TRAINER ; type
	gfx RocketsSneakAttackCardGfx ; gfx
	tx RocketsSneakAttackName ; name
	db PROMOSTAR ; rarity
	db ROCKET | PRO | SET_ROCKET ; sets
	dw ROCKETS_SNEAK_ATTACK
	dw RocketRocketsSneakAttackEffectCommands + $8000 ; effect commands
	tx RocketsSneakAttackDescription ; description
	dw NONE ; description (cont)

TheBosssWayCard:
	db TYPE_TRAINER ; type
	gfx TheBosssWayCardGfx ; gfx
	tx TheBosssWayName ; name
	db DIAMOND ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw THE_BOSSS_WAY
	dw RocketTheBosssWayEffectCommands + $8000 ; effect commands
	tx TheBosssWayDescription ; description
	dw NONE ; description (cont)

ChallengeCard:
	db TYPE_TRAINER ; type
	gfx ChallengeCardGfx ; gfx
	tx ChallengeName ; name
	db DIAMOND ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw CHALLENGE
	dw RocketChallengeEffectCommands + $8000 ; effect commands
	tx ChallengeDescription ; description
	dw NONE ; description (cont)

DiggerCard:
	db TYPE_TRAINER ; type
	gfx DiggerCardGfx ; gfx
	tx DiggerName ; name
	db DIAMOND ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw DIGGER
	dw RocketDiggerEffectCommands + $8000 ; effect commands
	tx DiggerDescription ; description
	dw NONE ; description (cont)

ImposterOaksRevengeCard:
	db TYPE_TRAINER ; type
	gfx ImposterOaksRevengeCardGfx ; gfx
	tx ImposterOaksRevengeName ; name
	db DIAMOND ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw IMPOSTER_OAKS_REVENGE
	dw RocketImposterOaksRevengeEffectCommands + $8000 ; effect commands
	tx ImposterOaksRevengeDescription ; description
	dw NONE ; description (cont)

NightlyGarbageRunCard:
	db TYPE_TRAINER ; type
	gfx NightlyGarbageRunCardGfx ; gfx
	tx NightlyGarbageRunName ; name
	db DIAMOND ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw NIGHTLY_GARBAGE_RUN
	dw RocketNightlyGarbageRunEffectCommands + $8000 ; effect commands
	tx NightlyGarbageRunDescription ; description
	dw NONE ; description (cont)

GoopGasAttackCard:
	db TYPE_TRAINER ; type
	gfx GoopGasAttackCardGfx ; gfx
	tx GoopGasAttackName ; name
	db CIRCLE ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw GOOP_GAS_ATTACK
	dw RocketGoopGasAttackEffectCommands + $8000 ; effect commands
	tx GoopGasAttackDescription ; description
	dw NONE ; description (cont)

SleepCard:
	db TYPE_TRAINER ; type
	gfx SleepCardGfx ; gfx
	tx SleepName ; name
	db CIRCLE ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw SLEEP
	dw RocketSleepEffectCommands + $8000 ; effect commands
	tx SleepDescription ; description
	dw NONE ; description (cont)

RainbowEnergyCard:
	db TYPE_ENERGY_DOUBLE_COLORLESS ; type
	gfx RainbowEnergyCardGfx ; gfx
	tx RainbowEnergyName ; name
	db STAR ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw RAINBOW_ENERGY
	dw DoubleColorlessEnergyEffectCommands ; effect commands
	tx RainbowEnergyDescription ; description
	dw NONE ; description (cont)

FullHealEnergyCard:
	db TYPE_ENERGY_DOUBLE_COLORLESS ; type
	gfx FullHealEnergyCardGfx ; gfx
	tx FullHealEnergyName ; name
	db DIAMOND ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw FULL_HEAL_ENERGY
	dw DoubleColorlessEnergyEffectCommands ; effect commands
	tx FullHealEnergyDescription ; description
	dw NONE ; description (cont)

PotionEnergyCard:
	db TYPE_ENERGY_DOUBLE_COLORLESS ; type
	gfx PotionEnergyCardGfx ; gfx
	tx PotionEnergyName ; name
	db DIAMOND ; rarity
	db ROCKET | SET_ROCKET ; sets
	dw POTION_ENERGY
	dw DoubleColorlessEnergyEffectCommands ; effect commands
	tx PotionEnergyDescription ; description
	dw NONE ; description (cont)
