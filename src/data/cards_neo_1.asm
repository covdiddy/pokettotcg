; Neo Gen 2 card data (Bank 1)

Chikorita1Card:
	db TYPE_PKMN_GRASS
	gfx Chikorita1CardGfx
	tx ChikoritaName
	db CIRCLE
	db NEO_GENESIS | NONE
	dw CHIKORITA1 ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx GrowlName
	tx ReduceDamageBy10Desc
	dw NONE
	db 0
	db DAMAGE_NORMAL
	dw ReduceDamageBy10EffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 10
	db ATK_ANIM_SUPERSONIC
	energy GRASS, 1, COLORLESS, 1
	tx PoisonPowderName
	tx MayInflictPoisonDescription
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw MayInflictPoisonEffectCommands + $4000
	db INFLICT_POISON
	db NONE
	db NONE
	db 0
	db ATK_ANIM_POWDER_EFFECT_CHANCE
	db 1
	db WR_FIRE
	db NONE
	tx LeafName
	db 152
	db 0
	db 12
	db 2, 11
	dw 10 * 14
	tx Chikorita1Description
	db 16

Chikorita2Card:
	db TYPE_PKMN_GRASS
	gfx Chikorita2CardGfx
	tx ChikoritaName
	db CIRCLE
	db NEO_GENESIS | NONE
	dw CHIKORITA2 ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx SleepPowderName
	tx MayInflictSleepDescription
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw MayInflictSleepEffectCommands + $4000
	db INFLICT_SLEEP
	db NONE
	db NONE
	db 0
	db ATK_ANIM_POWDER_EFFECT_CHANCE
	energy GRASS, 1, COLORLESS, 1
	tx RazorLeafName
	dw NONE
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_WHIP
	db 1
	db WR_FIRE
	db NONE
	tx LeafName
	db 152
	db 0
	db 15
	db 2, 11
	dw 14 * 10
	tx Chikorita2Description
	db 16

Bayleef1Card:
	db TYPE_PKMN_GRASS
	gfx Bayleef1CardGfx
	tx BayleefName
	db DIAMOND
	db NEO_GENESIS | NONE
	dw BAYLEEF1 ; 16-bit card ID
	db 70
	db STAGE1
	tx ChikoritaName
	energy GRASS, 1, COLORLESS, 1
	tx PoisonPowderName
	tx MayInflictPoisonDescription
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw MayInflictPoisonEffectCommands + $4000
	db INFLICT_POISON
	db NONE
	db NONE
	db 0
	db ATK_ANIM_POWDER_EFFECT_CHANCE
	energy GRASS, 2, COLORLESS, 1
	tx PollenShieldName
	tx NoSpecialConditions1TurnDesc
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw NoSpecialConditionsEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 0
	db ATK_ANIM_PROTECT ; mapped from ATK_ANIM_POLLEN_SHIELD
	db 1
	db WR_FIRE
	db NONE
	tx LeafName
	db 153
	db 0
	db 29
	db 3, 11
	dw 35 * 10
	tx Bayleef1Description
	db 0

Bayleef2Card:
	db TYPE_PKMN_GRASS
	gfx Bayleef2CardGfx
	tx BayleefName
	db DIAMOND
	db NEO_GENESIS | NONE
	dw BAYLEEF2 ; 16-bit card ID
	db 80
	db STAGE1
	tx ChikoritaName
	energy GRASS, 1
	tx AbsorbName
	tx HealHalfDamageDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw HealHalfDamageEffectCommands + $4000
	db NONE
	db HEAL_USER
	db NONE
	db 2
	db ATK_ANIM_DRAIN
	energy GRASS, 2, COLORLESS, 1
	tx GrassKnotName
	tx Do10MorePerOppRCDesc
	dw NONE
	db 30
	db DAMAGE_PLUS
	dw Do10MorePerOppRCEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_WHIP
	db 2
	db WR_FIRE
	db NONE
	tx LeafName
	db 153
	db 0
	db 26
	db 3, 11
	dw 35 * 10
	tx Bayleef2Description
	db 0

Meganium1Card:
	db TYPE_PKMN_GRASS
	gfx Meganium1CardGfx
	tx MeganiumName
	db STAR
	db NEO_GENESIS | NONE
	dw MEGANIUM1 ; 16-bit card ID
	db 100
	db STAGE2
	tx BayleefName
	energy GRASS, 2
	tx FullBloomName
	tx AttackSearchAttachEnergyDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw SearchAndAttachEnergyEffectCommands + $4000
	db NONE
	db NONE
	db SPECIAL_AI_HANDLING
	db 0
	db ATK_ANIM_PETAL_DANCE
	energy GRASS, 3, COLORLESS, 1
	tx GigaDrainName
	tx HealHalfDamageDesc
	dw NONE
	db 50
	db DAMAGE_NORMAL
	dw HealHalfDamageEffectCommands + $4000
	db NONE
	db HEAL_USER
	db NONE
	db 2
	db ATK_ANIM_DRAIN
	db 2
	db WR_FIRE
	db WR_WATER
	tx HerbName
	db 154
	db 0
	db 52
	db 5, 11
	dw 221 * 10
	tx Meganium1Description
	db 0

Meganium2Card:
	db TYPE_PKMN_GRASS
	gfx Meganium2CardGfx
	tx MeganiumName
	db STAR
	db NEO_GENESIS | NONE
	dw MEGANIUM2 ; 16-bit card ID
	db 120
	db STAGE2
	tx BayleefName
	energy 0
	tx AromatherapyName
	tx AromatherapyDescription
	tx AromatherapyDescriptionCont
	db 0
	db POKEMON_POWER
	dw AromatherapyEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_SOLAR_POWER
	energy GRASS, 2, COLORLESS, 2
	tx BodySlamName
	tx MayInflictParalysisDescription
	dw NONE
	db 40
	db DAMAGE_NORMAL
	dw MayInflictParalysisEffectCommands + $4000
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_BIG_HIT
	db 2
	db WR_FIRE
	db WR_WATER
	tx HerbName
	db 154
	db 0
	db 55
	db 5, 11
	dw 221 * 10
	tx Meganium2Description
	db 16

NeoBulbasaurCard:
	db TYPE_PKMN_GRASS
	gfx NeoBulbasaurCardGfx
	tx BulbasaurName
	db CIRCLE
	db NEO_GENESIS | NONE
	dw NEO_BULBASAUR ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy GRASS, 1
	tx SleepSeedName
	tx InflictSleepDescription
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw InflictSleepEffectCommands + $4000
	db INFLICT_SLEEP
	db NONE
	db NONE
	db 0
	db ATK_ANIM_POWDER_EFFECT_CHANCE
	energy GRASS, 1, COLORLESS, 1
	tx GrassKnotName
	tx Do10MorePerOppRCDesc
	dw NONE
	db 10
	db DAMAGE_PLUS
	dw Do10MorePerOppRCEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_WHIP
	db 1
	db WR_FIRE
	db NONE
	tx SeedName
	db 1
	db 0
	db 10
	db 2, 4
	dw 15 * 10
	tx BulbasaurDescription
	db 19

NeoIvysaurCard:
	db TYPE_PKMN_GRASS
	gfx NeoIvysaurCardGfx
	tx IvysaurName
	db DIAMOND
	db NEO_GENESIS | NONE
	dw NEO_IVYSAUR ; 16-bit card ID
	db 70
	db STAGE1
	tx BulbasaurName
	energy GRASS, 1, COLORLESS, 1
	tx PoisonVineName
	tx InflictPoisonDescription
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw InflictPoisonEffectCommands + $4000
	db INFLICT_POISON
	db NONE
	db NONE
	db 0
	db ATK_ANIM_POISON_WHIP
	energy GRASS, 2, COLORLESS, 1
	tx TangleName
	tx MayInflictConfusionDescription
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw MayInflictConfusionEffectCommands + $4000
	db INFLICT_CONFUSION
	db NONE
	db NONE
	db 0
	db ATK_ANIM_WHIP
	db 2
	db WR_FIRE
	db NONE
	tx SeedName
	db 2
	db 0
	db 24
	db 3, 3
	dw 29 * 10
	tx IvysaurDescription
	db 19

VenusaurCard:
	db TYPE_PKMN_GRASS
	gfx VenusaurCardGfx
	tx VenusaurName
	db STAR
	db NEO_GENESIS | NONE
	dw VENUSAUR ; 16-bit card ID
	db 100
	db STAGE2
	tx IvysaurName
	energy GRASS, 2, COLORLESS, 1
	tx MegaDrainName
	tx HealHalfDamageDesc
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw HealHalfDamageEffectCommands + $4000
	db NONE
	db HEAL_USER
	db NONE
	db 2
	db ATK_ANIM_DRAIN
	energy GRASS, 3, COLORLESS, 1
	tx MysteryPowderName
	tx MayInflictRandomStatusDesc
	dw NONE
	db 40
	db DAMAGE_NORMAL
	dw RandomStatusEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_POWDER_EFFECT_CHANCE
	db 3
	db WR_FIRE
	db WR_WATER
	tx SeedName
	db 3
	db 0
	db 57
	db 6, 7
	dw 220 * 10
	tx VenusaurDescription
	db 19

LedybaCard:
	db TYPE_PKMN_GRASS
	gfx LedybaCardGfx
	tx LedybaName
	db CIRCLE
	db NEO_GENESIS | NONE
	dw LEDYBA ; 16-bit card ID
	db 40
	db BASIC
	dw NONE
	energy GRASS, 1
	tx SupersonicName
	tx MayInflictConfusionDescription
	dw NONE
	db 0
	db DAMAGE_NORMAL
	dw MayInflictConfusionEffectCommands + $4000
	db INFLICT_CONFUSION
	db NONE
	db NONE
	db 0
	db ATK_ANIM_SUPERSONIC
	energy GRASS, 2
	tx CometPunchName
	tx QuadrupleAttackX10Description
	dw NONE
	db 10
	db DAMAGE_X
	dw CF10X4EffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_PUNCH
	db 0
	db WR_FIRE
	db WR_FIGHTING
	tx FiveStarName
	db 165
	db 0
	db 8
	db 3, 0
	dw 23 * 10
	tx LedybaDescription
	db 0

LedianCard:
	db TYPE_PKMN_GRASS
	gfx LedianCardGfx
	tx LedianName
	db DIAMOND
	db NEO_GENESIS | NONE
	dw LEDIAN ; 16-bit card ID
	db 60
	db STAGE1
	tx LedybaName
	energy GRASS, 1
	tx LightScreenName
	tx OppHalfDamageDesc
	tx OppHalfDamageDescCont
	db 0
	db RESIDUAL
	dw HalveDamageEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 0
	db ATK_ANIM_BARRIER
	energy GRASS, 2, COLORLESS, 1
	tx CometPunchName
	tx QuadrupleAttackX20Description
	dw NONE
	db 20
	db DAMAGE_X
	dw CF20X4EffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_PUNCH
	db 0
	db WR_FIRE
	db WR_FIGHTING
	tx FiveStarName
	db 166
	db 0
	db 27
	db 4, 7
	dw 78 * 10
	tx LedianDescription
	db 19

SpinarakCard:
	db TYPE_PKMN_GRASS
	gfx SpinarakCardGfx
	tx SpinarakName
	db CIRCLE
	db NEO_DESTINY | NONE
	dw SPINARAK ; 16-bit card ID
	db 40
	db BASIC
	dw NONE
	energy GRASS, 1
	tx PoisonStingName
	tx MayInflictPoisonDescription
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw MayInflictPoisonEffectCommands + $4000
	db INFLICT_POISON
	db NONE
	db NONE
	db 0
	db ATK_ANIM_NEEDLES
	energy GRASS, 1
	tx StringShotName
	tx MayInflictParalysisDescription
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw MayInflictParalysisEffectCommands + $4000
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_STRING_SHOT
	db 1
	db WR_FIRE
	db NONE
	tx StringSpitName
	db 167
	db 0
	db 10
	db 1, 8
	dw 18 * 10
	tx SpinarakDescription
	db 16

AriadosCard:
	db TYPE_PKMN_GRASS
	gfx AriadosCardGfx
	tx AriadosName
	db DIAMOND
	db NEO_DESTINY | NONE
	dw ARIADOS ; 16-bit card ID
	db 60
	db STAGE1
	tx SpinarakName
	energy GRASS, 1
	tx ToxicWebName
	tx SwitchOppActiveThenPSNDesc
	dw NONE
	db 0
	db RESIDUAL
	dw SwitchAndPoisonEffectCommands + $4000
	db INFLICT_POISON
	db SWITCH_OPPONENT_POKEMON
	db NONE
	db 0
	db ATK_ANIM_CAT_PUNCH
	energy GRASS, 2
	tx SpiderBiteName
	tx HealHalfDamageDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw HealHalfDamageEffectCommands + $4000
	db NONE
	db HEAL_USER
	db NONE
	db 2
	db ATK_ANIM_DRAIN
	db 1
	db WR_FIRE
	db NONE
	tx LongLegName
	db 168
	db 0
	db 23
	db 3, 7
	dw 74 * 10
	tx AriadosDescription
	db 0

NeoZubatCard:
	db TYPE_PKMN_GRASS
	gfx NeoZubatCardGfx
	tx ZubatName
	db CIRCLE
	db NEO_DESTINY | NONE
	dw NEO_ZUBAT ; 16-bit card ID
	db 40
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx BiteName
	dw NONE
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	energy GRASS, 1, COLORLESS, 1
	tx PoisonFangName
	tx InflictPoisonDescription
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw InflictPoisonEffectCommands + $4000
	db INFLICT_POISON
	db NONE
	db NONE
	db 0
	db ATK_ANIM_POISON_FANG
	db 0
	db WR_PSYCHIC
	db WR_FIGHTING
	tx BatName
	db 41
	db 0
	db 11
	db 2, 7
	dw 16 * 10
	tx ZubattDescription
	db 19

NeoGolbatCard:
	db TYPE_PKMN_GRASS
	gfx NeoGolbatCardGfx
	tx GolbatName
	db DIAMOND
	db NEO_DESTINY | NONE
	dw NEO_GOLBAT ; 16-bit card ID
	db 60
	db STAGE1
	tx ZubatName
	energy COLORLESS, 1
	tx BiteName
	dw NONE
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	energy GRASS, 1, COLORLESS, 1
	tx LeechLifeName
	tx HealEqualToDamageDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw HealEqualToDamageEffectCommands + $4000
	db NONE
	db HEAL_USER
	db NONE
	db 3
	db ATK_ANIM_DRAIN
	db 0
	db WR_PSYCHIC
	db WR_FIGHTING
	tx BatName
	db 42
	db 0
	db 27
	db 5, 3
	dw 121 * 10
	tx GolbatDescription
	db 0

CrobatCard:
	db TYPE_PKMN_GRASS
	gfx CrobatCardGfx
	tx CrobatName
	db STAR
	db NEO_DESTINY | NONE
	dw CROBAT ; 16-bit card ID
	db 80
	db STAGE2
	tx GolbatName
	energy GRASS, 1
	tx SurpriseBiteName
	tx Do20ToABenchDesc
	dw NONE
	db 0
	db RESIDUAL
	dw Do20ToABenchEffectCommands + $4000
	db DAMAGE_TO_OPPONENT_BENCH
	db (1 << 6)
	db NONE
	db 3
	db ATK_ANIM_HIT
	energy GRASS, 2, COLORLESS, 1
	tx ToxicName
	tx ToxicDescription
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw ToxicEffectCommands + $4000
	db INFLICT_POISON
	db (1 << 6)
	db NONE
	db 2
	db ATK_ANIM_TOXIC
	db 0
	db WR_PSYCHIC
	db WR_FIGHTING
	tx BatName
	db 169
	db 0
	db 42
	db 5, 11
	dw 165 * 10
	tx CrobatDescription
	db 19

NeoOddishCard:
	db TYPE_PKMN_GRASS
	gfx NeoOddishCardGfx
	tx OddishName
	db CIRCLE
	db NEO_REVELATION | NONE
	dw NEO_ODDISH ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx TackleName
	dw NONE
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	energy GRASS, 1, COLORLESS, 1
	tx SleepPowderName
	tx InflictSleepDescription
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw InflictSleepEffectCommands + $4000
	db INFLICT_SLEEP
	db NONE
	db NONE
	db 0
	db ATK_ANIM_POWDER_EFFECT_CHANCE
	db 1
	db WR_FIRE
	db NONE
	tx WeedName
	db 43
	db 0
	db 13
	db 1, 8
	dw 12 * 10
	tx OddishDescription
	db 16

NeoGloomCard:
	db TYPE_PKMN_GRASS
	gfx NeoGloomCardGfx
	tx GloomName
	db DIAMOND
	db NEO_REVELATION | NONE
	dw NEO_GLOOM ; 16-bit card ID
	db 70
	db STAGE1
	tx OddishName
	energy GRASS, 1, COLORLESS, 1
	tx FoulStenchName
	tx IfHeadsCFNAndPSNDesc
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw MayConfuseAndPoisonEffectCommands + $4000
	db INFLICT_POISON | INFLICT_CONFUSION
	db NONE
	db NONE
	db 0
	db ATK_ANIM_POWDER_EFFECT_CHANCE
	energy GRASS, 2
	tx MegaDrainName
	tx HealHalfDamageDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw HealHalfDamageEffectCommands + $4000
	db NONE
	db HEAL_USER
	db NONE
	db 2
	db ATK_ANIM_DRAIN
	db 1
	db WR_FIRE
	db NONE
	tx WeedName
	db 44
	db 0
	db 28
	db 2, 7
	dw 19 * 10
	tx GloomDescription
	db 0

NeoVileplumeCard:
	db TYPE_PKMN_GRASS
	gfx NeoVileplumeCardGfx
	tx VileplumeName
	db DIAMOND
	db NEO_REVELATION | NONE
	dw NEO_VILEPLUME ; 16-bit card ID
	db 90
	db STAGE2
	tx GloomName
	energy GRASS, 2
	tx PoisonPowderName
	tx InflictPoisonDescription
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw InflictPoisonEffectCommands + $4000
	db INFLICT_POISON
	db NONE
	db NONE
	db 0
	db ATK_ANIM_POWDER_HIT_POISON
	energy GRASS, 2, COLORLESS, 1
	tx HayFeverName
	tx NoTrainersDesc
	dw NONE
	db 40
	db DAMAGE_NORMAL
	dw NoOppTrainersEffectCommands + $4000
	db NONE
	db (1 << 6)
	db NONE
	db 0
	db ATK_ANIM_PETAL_DANCE
	db 2
	db WR_FIRE
	db WR_WATER
	tx FlowerName
	db 45
	db 0
	db 33
	db 3, 11
	dw 41 * 10
	tx VileplumeDescription
	db 19

BellossomCard:
	db TYPE_PKMN_GRASS
	gfx BellossomCardGfx
	tx BellossomName
	db STAR
	db NEO_REVELATION | NONE
	dw BELLOSSOM ; 16-bit card ID
	db 90
	db STAGE2
	tx GloomName
	energy GRASS, 2
	tx MegaDrainName
	tx HealHalfDamageDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw HealHalfDamageEffectCommands + $4000
	db NONE
	db HEAL_USER
	db NONE
	db 2
	db ATK_ANIM_DRAIN
	energy GRASS, 2, COLORLESS, 1
	tx FlowerDanceName
	tx Do10MorePerYourBenchedDesc
	dw NONE
	db 20
	db DAMAGE_PLUS
	dw Do10MorePerSelfBenchEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_PETAL_DANCE
	db 2
	db WR_FIRE
	db WR_WATER
	tx FlowerName
	db 182
	db 0
	db 35
	db 1, 4
	dw 12 * 10
	tx BellossomDescription
	db 16

HoppipCard:
	db TYPE_PKMN_GRASS
	gfx HoppipCardGfx
	tx HoppipName
	db CIRCLE
	db NEO_DESTINY | NONE
	dw HOPPIP ; 16-bit card ID
	db 30
	db BASIC
	dw NONE
	energy GRASS, 1
	tx TackleName
	dw NONE
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	energy 0
	dw NONE
	dw NONE
	dw NONE
	db 0
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_NONE
	db 0
	db WR_FIRE
	db NONE
	tx CottonweedName
	db 187
	db 0
	db 5
	db 1, 4
	dw 1 * 10
	tx HoppipDescription
	db 0

SkiploomCard:
	db TYPE_PKMN_GRASS
	gfx SkiploomCardGfx
	tx SkiploomName
	db DIAMOND
	db NEO_DESTINY | NONE
	dw SKIPLOOM ; 16-bit card ID
	db 60
	db STAGE1
	tx HoppipName
	energy GRASS, 1
	tx PoisonPowderName
	tx MayInflictPoisonDescription
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw MayInflictPoisonEffectCommands + $4000
	db INFLICT_POISON
	db NONE
	db NONE
	db 0
	db ATK_ANIM_POWDER_EFFECT_CHANCE
	energy GRASS, 1
	tx StunSporeName
	tx MayInflictParalysisDescription
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw MayInflictParalysisEffectCommands + $4000
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_POWDER_EFFECT_CHANCE
	db 0
	db WR_FIRE
	db WR_FIGHTING
	tx CottonweedName
	db 188
	db 0
	db 19
	db 2, 0
	dw 2 * 10
	tx SkiploomDescription
	db 16

JumpluffCard:
	db TYPE_PKMN_GRASS
	gfx JumpluffCardGfx
	tx JumpluffName
	db STAR
	db NEO_DESTINY | NONE
	dw JUMPLUFF ; 16-bit card ID
	db 80
	db STAGE2
	tx SkiploomName
	energy GRASS, 1,
	tx SleepPowderName
	tx InflictSleepDescription
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw InflictSleepEffectCommands + $4000
	db INFLICT_SLEEP
	db NONE
	db NONE
	db 0
	db ATK_ANIM_POWDER_EFFECT_CHANCE
	energy GRASS, 2,
	tx LeechSeedName
	tx HealEqualToDamageDesc
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw HealEqualToDamageEffectCommands + $4000
	db NONE
	db HEAL_USER
	db NONE
	db 3
	db ATK_ANIM_DRAIN
	db 0
	db WR_FIRE
	db WR_FIGHTING
	tx CottonweedName
	db 189
	db 0
	db 30
	db 2, 7
	dw 6 * 10
	tx JumpluffDescription
	db 0

SunkernCard:
	db TYPE_PKMN_GRASS
	gfx SunkernCardGfx
	tx SunkernName
	db CIRCLE
	db NEO_DISCOVERY | NONE
	dw SUNKERN ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy GRASS, 2
	tx AbsorbName
	tx HealHalfDamageDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw HealHalfDamageEffectCommands + $4000
	db NONE
	db HEAL_USER
	db NONE
	db 2
	db ATK_ANIM_DRAIN
	energy 0
	dw NONE
	dw NONE
	dw NONE
	db 0
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_NONE
	db 1
	db WR_FIRE
	db NONE
	tx SeedName
	db 191
	db 0
	db 6
	db 1, 0
	dw 4 * 10
	tx SunkernDescription
	db 16

SunfloraCard:
	db TYPE_PKMN_GRASS
	gfx SunfloraCardGfx
	tx SunfloraName
	db DIAMOND
	db NEO_DISCOVERY | NONE
	dw SUNFLORA ; 16-bit card ID
	db 70
	db STAGE1
	tx SunkernName
	energy GRASS, 1, COLORLESS, 1
	tx EnergyGrowthName
	tx SearchEnergyAndAttachDesc
	dw NONE
	db 0
	db RESIDUAL
	dw SearchAndAttachEnergyEffectCommands + $4000
	db NONE
	db NONE
	db SPECIAL_AI_HANDLING
	db 0
	db ATK_ANIM_GLOW_EFFECT
	energy GRASS, 3
	tx SolarBeamName
	dw NONE
	dw NONE
	db 50
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_BEAM
	db 1
	db WR_FIRE
	db NONE
	tx SunName
	db 192
	db 0
	db 22
	db 2, 7
	dw 19 * 10
	tx SunfloraDescription
	db 16

YanmaCard:
	db TYPE_PKMN_GRASS
	gfx YanmaCardGfx
	tx YanmaName
	db STAR
	db NEO_GENESIS | NONE
	dw YANMA ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy COLORLESS, 2
	tx AgilityName
	tx MayGetImmunityDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw MayGetImmunityEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 0
	db ATK_ANIM_QUICK_ATTACK
	energy GRASS, 1, COLORLESS, 2
	tx SonicboomName
	tx DontApplyWRDesc
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw DontApplyWREffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_SONICBOOM
	db 0
	db WR_FIRE
	db WR_FIGHTING
	tx ClearWingName
	db 193
	db 0
	db 29
	db 3, 11
	dw 84 * 10
	tx YanmaDescription
	db 0

PinecoCard:
	db TYPE_PKMN_GRASS
	gfx PinecoCardGfx
	tx PINECOName
	db CIRCLE
	db NEO_DESTINY | NONE
	dw PINECO ; 16-bit card ID
	db 40
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx TackleName
	dw NONE
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	energy GRASS, 1, COLORLESS, 1
	tx SelfdestructName
	tx Do10toAllBenchand40ToSelfDesc
	dw NONE
	db 40
	db DAMAGE_NORMAL
	dw Do10ToAllBenchAnd40ToSelfEffectCommands + $4000
	db HIGH_RECOIL
	db NONE
	db NONE
	db 60
	db ATK_ANIM_BIG_SELFDESTRUCTION
	db 2
	db WR_FIRE
	db NONE
	tx BagwormName
	db 204
	db 0
	db 8
	db 2, 0
	dw 16 * 10
	tx PinecoDescription
	db 16

ForretressCard:
	db TYPE_PKMN_GRASS
	gfx ForretressCardGfx
	tx ForretressName
	db DIAMOND
	db NEO_DESTINY | NONE
	dw FORRETRESS ; 16-bit card ID
	db 70
	db STAGE1
	tx PINECOName
	energy 0
	tx IroncladName
	tx IroncladDesc
	tx IroncladDescCont
	db 0
	db POKEMON_POWER
	dw IroncladEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_PKMN_POWER_1
	energy GRASS, 2
	tx PinMissileName
	tx TripleAttackX20Description
	dw NONE
	db 20
	db DAMAGE_X
	dw CF20X3EffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_MULTIPLE_SLASH
	db 3
	db WR_FIRE
	db NONE
	tx BagwormName
	db 205
	db 0
	db 38
	db 3, 11
	dw 277 * 10
	tx ForretressDescription
	db 0

NeoScytherCard:
	db TYPE_PKMN_GRASS
	gfx NeoScytherCardGfx
	tx ScytherName
	db CIRCLE
	db NEO_DISCOVERY | NONE
	dw NEO_SCYTHER ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy GRASS, 1
	tx UTurnName
	tx CanSwitchSelfAfterDamageDesc
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw CanSwitchSelfAfterDamageEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_QUICK_ATTACK
	energy GRASS, 1, COLORLESS, 2
	tx SlashName
	dw NONE
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_SLASH
	db 0
	db WR_FIRE
	db NONE
	tx MantisName
	db 123
	db 0
	db 20
	db 4, 11
	dw 123 * 10
	tx ScytherDescription
	db 19

ScizorCard:
	db TYPE_PKMN_GRASS
	gfx ScizorCardGfx
	tx ScizorName
	db STAR
	db NEO_DISCOVERY | NONE
	dw SCIZOR ; 16-bit card ID
	db 80
	db STAGE1
	tx ScytherName
	energy GRASS, 1, COLORLESS, 1
	tx SlashName
	dw NONE
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_SLASH
	energy GRASS, 2, COLORLESS, 1
	tx FuryCutterName
	tx CF10X9Desc
	dw NONE
	db 10
	db DAMAGE_X
	dw CF10X9EffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_MULTIPLE_SLASH
	db 1
	db WR_FIRE
	db WR_GRASS
	tx PincerName
	db 212
	db 0
	db 33
	db 5, 11
	dw 260 * 10
	tx ScizorDescription
	db 0

HeracrossCard:
	db TYPE_PKMN_GRASS
	gfx HeracrossCardGfx
	tx HeracrossName
	db STAR
	db NEO_DESTINY | NONE
	dw HERACROSS ; 16-bit card ID
	db 70
	db BASIC
	dw NONE
	energy 0
	tx FinalBlowName
	tx FinalBlowDesc
	dw NONE
	db 0
	db POKEMON_POWER
	dw FinalBlowEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_PKMN_POWER_1
	energy GRASS, 2, COLORLESS, 2
	tx MegahornName
	dw NONE
	dw NONE
	db 40
	db DAMAGE_NORMAL
	dw FinalBlowActualEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_DRILL
	db 3
	db WR_FIRE
	db NONE
	tx SinglehornName
	db 214
	db 0
	db 40
	db 4, 11
	dw 119 * 10
	tx HeracrossDescription
	db 19

CrobatSCard:
	db TYPE_PKMN_GRASS
	gfx CrobatSCardGfx
	tx CrobatName
	db STAR
	db NEO_DESTINY | NONE
	dw CROBAT_S ; 16-bit card ID
	db 90
	db STAGE2
	tx GolbatName
	energy GRASS, 1
	tx CriticalStrikeName
	tx CriticalStrikeDesc
	dw NONE
	db 20
	db DAMAGE_PLUS
	dw Do30moreIfDFPStatusedEffectCommands + $4000
	db NONE
	db (1 << 6)
	db NONE
	db 2
	db ATK_ANIM_DARK_MIND
	energy GRASS, 2, FIRE, 1
	tx CrossAttackName
	tx CrossAttackDesc
	dw NONE
	db 40
	db DAMAGE_X
	dw CrossAttackEffectCommands + $4000
	db INFLICT_POISON | INFLICT_CONFUSION
	db NONE
	db NONE
	db 1
	db ATK_ANIM_TOXIC
	db 1
	db WR_PSYCHIC
	db WR_FIGHTING
	tx BatName
	db 169
	db 0
	db 59
	db 5, 11
	dw 165 * 10
	tx CrobatDescription
	db 19

CelebiSCard:
	db TYPE_PKMN_GRASS
	gfx CelebiSCardGfx
	tx CelebiName
	db STAR
	db NEO_DISCOVERY | NONE
	dw CELEBI_S ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy GRASS, 1
	tx AbsorbName
	tx Heal1DamageifSuccessDesc
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw Heal1DamageifSuccessEffectCommands + $4000
	db NONE
	db HEAL_USER
	db NONE
	db 2
	db ATK_ANIM_DRAIN
	energy GRASS, 1, PSYCHIC, 1
	tx MysticalLeafName
	tx HeadsPSNTailsCFNDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw HeadsPSNTailsCFNEffectCommands + $4000
	db INFLICT_POISON | INFLICT_CONFUSION
	db NONE
	db NONE
	db 0
	db ATK_ANIM_PETAL_DANCE
	db 1
	db WR_FIRE
	db NONE
	tx TimeTravelName
	db 251
	db 0
	db 53
	db 2, 0
	dw 11 * 10
	tx CelebiSDescription
	db 16

Cyndaquil1Card:
	db TYPE_PKMN_FIRE
	gfx Cyndaquil1CardGfx
	tx CyndaquilName
	db CIRCLE
	db NEO_GENESIS | NONE
	dw CYNDAQUIL1 ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy FIRE, 1
	tx BurnName
	tx Mill1CardIfSuccessDesc
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw Mill1OppCardEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_SMALL_FLAME
	energy FIRE, 1, COLORLESS, 1
	tx SwiftName
	tx DontApplyWRDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw DontApplyWREffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_CONFUSE_RAY
	db 1
	db WR_WATER
	db NONE
	tx FireMouseName
	db 155
	db 0
	db 14
	db 1, 8
	dw 17 * 10
	tx Cyndaquil1Description
	db 0

Cyndaquil2Card:
	db TYPE_PKMN_FIRE
	gfx Cyndaquil2CardGfx
	tx CyndaquilName
	db CIRCLE
	db NEO_GENESIS | NONE
	dw CYNDAQUIL2 ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx TackleName
	dw NONE
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	energy FIRE, 1, COLORLESS, 1
	tx CombustionName
	tx Discard1FDescription
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw Discard1FireEffectCommands + $4000
	db NONE
	db DISCARD_ENERGY
	db NONE
	db 3
	db ATK_ANIM_SMALL_FLAME
	db 1
	db WR_WATER
	db NONE
	tx FireMouseName
	db 155
	db 0
	db 12
	db 1, 8
	dw 17 * 10
	tx Cyndaquil2Description
	db 18

Quilava1Card:
	db TYPE_PKMN_FIRE
	gfx Quilava1CardGfx
	tx QuilavaName
	db DIAMOND
	db NEO_GENESIS | NONE
	dw QUILAVA1 ; 16-bit card ID
	db 70
	db STAGE1
	tx CyndaquilName
	energy FIRE, 2, COLORLESS, 1
	tx FireSpinName
	tx DamageAndDo10ToABenchDesc
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw DamageAndDo10ToABenchEffectCommands + $4000
	db DAMAGE_TO_OPPONENT_BENCH
	db NONE
	db NONE
	db 10
	db ATK_ANIM_FIRE_SPIN
	energy FIRE, 2, COLORLESS, 1
	tx FlamethrowerName
	tx CharmeleonsFlamethrowerDescription
	dw NONE
	db 50
	db DAMAGE_NORMAL
	dw Discard1FireEffectCommands + $4000
	db NONE
	db DISCARD_ENERGY
	db NONE
	db 3
	db ATK_ANIM_BIG_FLAME
	db 1
	db WR_WATER
	db NONE
	tx VolcanoName
	db 156
	db 0
	db 21
	db 2, 11
	dw 42 * 10
	tx Quilava1Description
	db 0

Quilava2Card:
	db TYPE_PKMN_FIRE
	gfx Quilava2CardGfx
	tx QuilavaName
	db DIAMOND
	db NEO_GENESIS | NONE
	dw QUILAVA2 ; 16-bit card ID
	db 60
	db STAGE1
	tx CyndaquilName
	energy FIRE, 1
	tx BurnName
	tx Mill3IfSuccessDesc
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw Mill3OppCardsEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_SMALL_FLAME
	energy FIRE, 3
	tx FlameWheelName
	dw NONE
	dw NONE
	db 50
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_FIRE_SPIN
	db 1
	db WR_WATER
	db NONE
	tx VolcanoName
	db 156
	db 0
	db 28
	db 2, 11
	dw 42 * 10
	tx Quilava2Description
	db 16

Typhlosion1Card:
	db TYPE_PKMN_FIRE
	gfx Typhlosion1CardGfx
	tx TyphlosionName
	db STAR
	db NEO_GENESIS | NONE
	dw TYPHLOSION1 ; 16-bit card ID
	db 100
	db STAGE2
	tx QuilavaName
	energy 0
	tx FireBoostName
	tx FireBoostDescription
	dw NONE
	db 0
	db POKEMON_POWER
	dw Get4FireFromDeckEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_FIREGIVER
	energy FIRE, 4
	tx EruptionName
	tx Minus10PerSelfDamageDesc
	dw NONE
	db 90
	db DAMAGE_MINUS
	dw Do10LessPerSelfDamageEffectCommands + $4000
	db NONE
	db FLAG_2_BIT_7
	db NONE
	db 0
	db ATK_ANIM_FIRE_SPIN ; mapped from ATK_ANIM_ERUPTION
	db 2
	db WR_WATER
	db WR_GRASS
	tx VolcanoName
	db 157
	db 0
	db 58
	db 5, 7
	dw 175 * 10
	tx Typhlosion1Description
	db 0

Typhlosion2Card:
	db TYPE_PKMN_FIRE
	gfx Typhlosion2CardGfx
	tx TyphlosionName
	db STAR
	db NEO_GENESIS | NONE
	dw TYPHLOSION2 ; 16-bit card ID
	db 90
	db STAGE2
	tx QuilavaName
	energy FIRE, 1
	tx BurnName
	tx Mill3IfSuccessDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw Mill3OppCardsEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_SMALL_FLAME
	energy FIRE, 2
	tx RushingFlamesName
	tx RushingFlamesDesc
	dw NONE
	db 30
	db DAMAGE_PLUS
	dw DiscardFForMoreDamageEffectCommands + $4000
	db NONE
	db DISCARD_ENERGY
	db BOOST_IF_TAKEN_DAMAGE
	db 6
	db ATK_ANIM_FIRE_SPIN
	db 1
	db WR_WATER
	db WR_GRASS
	tx VolcanoName
	db 157
	db 0
	db 49
	db 5, 7
	dw 175 * 10
	tx Typhlosion2Description
	db 0

MagbyCard:
	db TYPE_PKMN_FIRE
	gfx MagbyCardGfx
	tx MagbyName
	db CIRCLE
	db NEO_DESTINY | NONE
	dw MAGBY ; 16-bit card ID
	db 30
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx SmokescreenName
	tx DPMayDoNothingDesc
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw SmokescreenEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 0
	db ATK_ANIM_DARK_GAS
	energy FIRE, 1
	tx FlareName
	tx Retrieve2DiscardedEnergyDesc
	dw NONE
	db 0
	db RESIDUAL
	dw Retrieve2DiscardedEnergyEffectCommands + $4000
	db NONE
	db NONE
	db SPECIAL_AI_HANDLING
	db 10
	db ATK_ANIM_ENERGY_CONVERSION
	db 0
	db NONE
	db NONE
	tx LiveCoalName
	db 240
	db 0
	db 5
	db 2, 4
	dw 47 * 10
	tx MagbyDescription
	db 0

MagmarCard:
	db TYPE_PKMN_FIRE
	gfx MagmarCardGfx
	tx MagmarName
	db DIAMOND
	db NEO_DESTINY | NONE
	dw MAGMAR ; 16-bit card ID
	db 60
	db BASIC
	dw NONE
	energy FIRE, 1
	tx SmokescreenName
	tx DPMayDoNothingDesc
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw SmokescreenEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 0
	db ATK_ANIM_DARK_GAS
	energy FIRE, 1, COLORLESS, 1
	tx FirePunchName
	dw NONE
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_FIRE_PUNCH
	db 2
	db WR_WATER
	db NONE
	tx SpitfireName
	db 126
	db 0
	db 21
	db 4, 3
	dw 98 * 10
	tx MagmarDescription
	db 19

SlugmaCard:
	db TYPE_PKMN_FIRE
	gfx SlugmaCardGfx
	tx SlugmaName
	db CIRCLE
	db NEO_DISCOVERY | NONE
	dw SLUGMA ; 16-bit card ID
	db 60
	db BASIC
	dw NONE
	energy FIRE, 2
	tx EmberName
	dw NONE
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_SMALL_FLAME
	energy 0
	dw NONE
	dw NONE
	dw NONE
	db 0
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_NONE
	db 2
	db WR_WATER
	db NONE
	tx LavaName
	db 218
	db 0
	db 15
	db 2, 4
	dw 77 * 10
	tx SlugmaDescription
	db 0

MagcargoCard:
	db TYPE_PKMN_FIRE
	gfx MagcargoCardGfx
	tx MagcargoName
	db DIAMOND
	db NEO_DISCOVERY | NONE
	dw MAGCARGO ; 16-bit card ID
	db 80
	db STAGE1
	tx SlugmaName
	energy 0
	tx MagmaArmorName
	tx MagmaArmorDesc
	tx MagmaArmorDescCont
	db 0
	db POKEMON_POWER
	dw MagmaArmorEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_GLOW_EFFECT
	energy FIRE, 2, COLORLESS, 1
	tx LavaStreamName
	tx LavaStreamDesc
	dw NONE
	db 30
	db DAMAGE_PLUS
	dw TangelaStunSporeEffectCommands
	db NONE
	db ATTACHED_ENERGY_BOOST
	db NONE
	db MAX_ENERGY_BOOST_IS_LIMITED
	db ATK_ANIM_FIRE_SPIN
	db 3
	db WR_WATER
	db NONE
	tx LavaName
	db 219
	db 0
	db 33
	db 2, 7
	dw 121 * 10
	tx MagcargoDescription
	db 0

Houndour1Card:
	db TYPE_PKMN_FIRE
	gfx Houndour1CardGfx
	tx HoundourName
	db CIRCLE
	db NEO_DISCOVERY | NONE
	dw HOUNDOUR1 ; 16-bit card ID
	db 40
	db BASIC
	dw NONE
	energy FIRE, 1
	tx SmogName
	tx MayInflictPoisonDescription
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw MayInflictPoisonEffectCommands + $4000
	db INFLICT_POISON
	db NONE
	db NONE
	db 0
	db ATK_ANIM_SMOG
	energy FIRE, 1, COLORLESS, 1
	tx EmberName
	dw NONE
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_SMALL_FLAME
	db 1
	db WR_WATER
	db WR_PSYCHIC
	tx DarkName
	db 228
	db 0
	db 16
	db 2, 0
	dw 23 * 10
	tx Houndour1Description
	db 0

Houndour2Card:
	db TYPE_PKMN_FIRE
	gfx Houndour2CardGfx
	tx HoundourName
	db CIRCLE
	db NEO_DESTINY | NONE
	dw HOUNDOUR2 ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx CornerName
	tx NoRetreatText
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw NoRetreatEffectCommands + $4000
	db NONE
	db (1 << 6)
	db NONE
	db 1
	db ATK_ANIM_HIT
	energy FIRE, 1, COLORLESS, 1
	tx ThreatenName
	tx NoTrainersDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw NoOppTrainersEffectCommands + $4000
	db NONE
	db (1 << 6)
	db NONE
	db 2
	db ATK_ANIM_DARK_MIND
	db 1
	db WR_WATER
	db NONE
	tx DarkName
	db 228
	db 0
	db 22
	db 2, 0
	dw 23 * 10
	tx Houndour2Description
	db 21

HoundoomCard:
	db TYPE_PKMN_FIRE
	gfx HoundoomCardGfx
	tx HoundoomName
	db STAR
	db NEO_DESTINY | NONE
	dw HOUNDOOM ; 16-bit card ID
	db 70
	db STAGE1
	tx HoundourName
	energy FIRE, 1, COLORLESS, 1
	tx DarkHowlName
	tx NoPokepowersNextTurnDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw NoPokepowersNextTurnEffect + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_SMALL_FLAME
	energy FIRE, 2, COLORLESS, 1
	tx MidnightBlazeName
	tx Do10MorePerOppDamageDesc
	dw NONE
	db 30
	db DAMAGE_PLUS
	dw Do10MorePerOppDamageEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_FIRE_SPIN
	db 1
	db WR_WATER
	db WR_PSYCHIC
	tx DarkName
	db 229
	db 0
	db 44
	db 4, 7
	dw 77 * 10
	tx HoundoomDescription
	db 18

NeoVulpixCard:
	db TYPE_PKMN_FIRE
	gfx NeoVulpixCardGfx
	tx VulpixName
	db CIRCLE
	db NEO_DESTINY | NONE
	dw NEO_VULPIX ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy FIRE, 1
	tx ConfuseRayName
	tx MayInflictConfusionDescription
	dw NONE
	db 0
	db RESIDUAL
	dw MayInflictConfusionEffectCommands + $4000
	db INFLICT_CONFUSION
	db NONE
	db NONE
	db 0
	db ATK_ANIM_CONFUSE_RAY
	energy FIRE, 1, COLORLESS, 1
	tx EmberName
	dw NONE
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_SMALL_FLAME
	db 1
	db WR_WATER
	db NONE
	tx FoxName
	db 37
	db 0
	db 9
	db 2, 0
	dw 22 * 10
	tx VulpixDescription
	db 19

NinetalesCard:
	db TYPE_PKMN_FIRE
	gfx NinetalesCardGfx
	tx NinetalesName
	db DIAMOND
	db NEO_DESTINY | NONE
	dw NINETALES ; 16-bit card ID
	db 80
	db STAGE1
	tx VulpixName
	energy FIRE, 1
	tx MisleadName
	tx NoTrainersDesc
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw NoOppTrainersEffectCommands + $4000
	db NONE
	db (1 << 6)
	db NONE
	db 2
	db ATK_ANIM_BONEMERANG
	energy FIRE, 2, COLORLESS, 1
	tx EtheralFlameName
	tx EtheralFlameDesc
	dw NONE
	db 30
	db DAMAGE_PLUS
	dw EtherealFlameEffectCommands + $4000
	db INFLICT_CONFUSION
	db NONE
	db NONE
	db 0
	db ATK_ANIM_FIRE_SPIN
	db 2
	db WR_WATER
	db NONE
	tx FoxName
	db 38
	db 0
	db 39
	db 3, 7
	dw 44 * 10
	tx NinetalesDescription
	db 19

NeoGrowlitheCard:
	db TYPE_PKMN_FIRE
	gfx NeoGrowlitheCardGfx
	tx GrowlitheName
	db CIRCLE
	db NEO_GENESIS | NONE
	dw NEO_GROWLITHE ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx RoarName
	tx SwitchAfterDamageDesc
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw SwitchOppAfterDamageEffectCommands + $4000
	db NONE
	db SWITCH_OPPONENT_POKEMON
	db NONE
	db 0
	db ATK_ANIM_WHIRLWIND
	energy COLORLESS, 2
	tx BiteName
	dw NONE
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	db 1
	db WR_WATER
	db NONE
	tx PuppyName
	db 58
	db 0
	db 15
	db 2, 4
	dw 42 * 10
	tx GrowlitheDescription
	db 16

ArcanineCard:
	db TYPE_PKMN_FIRE
	gfx ArcanineCardGfx
	tx ArcanineName
	db STAR
	db NEO_GENESIS | NONE
	dw ARCANINE ; 16-bit card ID
	db 90
	db STAGE1
	tx GrowlitheName
	energy 0
	tx DriveOffName
	tx DriveOffDesc
	tx DriveOffDesc2
	db 0
	db POKEMON_POWER
	dw DriveOffEffectCommands + $4000
	db NONE
	db SWITCH_OPPONENT_POKEMON
	db NONE
	db 0
	db ATK_ANIM_PKMN_POWER_1
	energy FIRE, 1, COLORLESS, 2
	tx GentleFlamesName
	tx LessDamageifDFPInjuredDesc
	dw NONE
	db 50
	db DAMAGE_NORMAL
	dw LessDamageifDFPInjuredEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_BIG_FLAME
	db 2
	db WR_WATER
	db NONE
	tx LegendaryName
	db 59
	db 0
	db 40
	db 6, 3
	dw 342 * 10
	tx ArcanineDescription
	db 0

NeoPonytaCard:
	db TYPE_PKMN_FIRE
	gfx NeoPonytaCardGfx
	tx PonytaName
	db CIRCLE
	db NEO_DISCOVERY | NONE
	dw NEO_PONYTA ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy FIRE, 1
	tx FlareName
	tx Retrieve2DiscardedEnergyDesc
	dw NONE
	db 0
	db RESIDUAL
	dw Retrieve2DiscardedEnergyEffectCommands + $4000
	db NONE
	db NONE
	db SPECIAL_AI_HANDLING
	db 10
	db ATK_ANIM_ENERGY_CONVERSION
	energy COLORLESS, 2
	tx SmashKickName
	dw NONE
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	db 1
	db WR_WATER
	db NONE
	tx FireHorseName
	db 77
	db 0
	db 12
	db 3, 3
	dw 66 * 10
	tx PonytaDescription
	db 19

NeoRapidashCard:
	db TYPE_PKMN_FIRE
	gfx NeoRapidashCardGfx
	tx RapidashName
	db DIAMOND
	db NEO_DISCOVERY | NONE
	dw NEO_RAPIDASH ; 16-bit card ID
	db 70
	db STAGE1
	tx PonytaName
	energy COLORLESS, 2
	tx OverrunName
	tx Do10To1BenchDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw DamageAndDo10ToABenchEffectCommands + $4000
	db DAMAGE_TO_OPPONENT_BENCH
	db NONE
	db NONE
	db 10
	db ATK_ANIM_HIT
	energy FIRE, 1, COLORLESS, 2
	tx GallopName
	tx AttackDraw2Description
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw Draw2EffectCommands + $4000
	db DRAW_CARD
	db NONE
	db NONE
	db 0
	db ATK_ANIM_BIG_HIT
	db 1
	db WR_WATER
	db NONE
	tx FireHorseName
	db 78
	db 0
	db 32
	db 5, 7
	dw 209 * 10
	tx RapidashDescription
	db 19

FlareonCard:
	db TYPE_PKMN_FIRE
	gfx FlareonCardGfx
	tx FlareonName
	db DIAMOND
	db NEO_REVELATION | NONE
	dw FLAREON ; 16-bit card ID
	db 80
	db STAGE1
	tx EeveeName
	energy COLORLESS, 1
	tx QuickAttackName
	tx MayDo20Plus10Description
	dw NONE
	db 20
	db DAMAGE_PLUS
	dw MayDo20Plus10EffectCommands + $4000
	db NONE
	db (1 << 6)
	db NONE
	db 1
	db ATK_ANIM_QUICK_ATTACK
	energy FIRE, 2, COLORLESS, 1
	tx FlareBlitzName
	tx MayRecoilForMoreDamageDesc
	dw NONE
	db 30
	db DAMAGE_PLUS
	dw CanDo30ButRecoilEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 3
	db ATK_ANIM_BIG_FLAME ; mapped from ATK_ANIM_FLARE_BLITZ
	db 1
	db WR_WATER
	db NONE
	tx FlameName
	db 136
	db 0
	db 34
	db 2, 11
	dw 55 * 10
	tx FlareonDescription
	db 0

MoltresCard:
	db TYPE_PKMN_FIRE
	gfx MoltresCardGfx
	tx MoltresName
	db STAR
	db NEO_DISCOVERY | NONE
	dw MOLTRES ; 16-bit card ID
	db 70
	db BASIC
	dw NONE
	energy FIRE, 1
	tx KindlingName
	tx EnergyAbsorptionDescription
	dw NONE
	db 0
	db RESIDUAL
	dw Get2DiscardEnergyAttachToSelfEffectCommands + $4000
	db NONE
	db NONE
	db SPECIAL_AI_HANDLING
	db 0
	db ATK_ANIM_GLOW_EFFECT
	energy FIRE, 2, COLORLESS, 2
	tx FireWingName
	dw NONE
	dw NONE
	db 40
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 3
	db ATK_ANIM_DIVE_BOMB
	db 2
	db NONE
	db WR_FIGHTING
	tx FlameName
	db 146
	db 0
	db 45
	db 6, 7
	dw 132 * 10
	tx MoltresDescription
	db 19

Entei1Card:
	db TYPE_PKMN_FIRE
	gfx Entei1CardGfx
	tx EnteiName
	db STAR
	db NEO_REVELATION | NONE
	dw ENTEI1 ; 16-bit card ID
	db 70
	db BASIC
	dw NONE
	energy 0
	tx EnergyBurnName
	tx EnergyBurnDescription
	dw NONE
	db 0
	db POKEMON_POWER
	dw AllEnergyIsFireEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_PKMN_POWER_1
	energy FIRE, 3
	tx FireSpinName
	tx Discard2EnergyDescription
	dw NONE
	db 60
	db DAMAGE_NORMAL
	dw Discard2EnergyEffectCommands + $4000
	db NONE
	db DISCARD_ENERGY
	db NONE
	db 6
	db ATK_ANIM_FIRE_SPIN
	db 1
	db WR_WATER
	db NONE
	tx VolcanoName
	db 244
	db 0
	db 45
	db 6, 11
	dw 436 * 10
	tx Entei1Description
	db 0

Entei2Card:
	db TYPE_PKMN_FIRE
	gfx Entei2CardGfx
	tx EnteiName
	db STAR
	db NEO_DESTINY | NONE
	dw ENTEI2 ; 16-bit card ID
	db 70
	db BASIC
	dw NONE
	energy 0
	tx StepInName
	tx StepInDescription
	dw NONE
	db 0
	db POKEMON_POWER
	dw StepInEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_GLOW_EFFECT
	energy FIRE, 3
	tx ProtectiveFlameName
	tx MayGetImmunityDesc
	dw NONE
	db 40
	db DAMAGE_NORMAL
	dw Entei2MayGetImmunityEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 0
	db ATK_ANIM_BIG_FLAME
	db 1
	db WR_WATER
	db NONE
	tx VolcanoName
	db 244
	db 0
	db 60
	db 6, 11
	dw 436 * 10
	tx Entei2Description
	db 18

HoohCard:
	db TYPE_PKMN_FIRE
	gfx HoohCardGfx
	tx HoohName
	db STAR
	db NEO_DISCOVERY | NONE
	dw HOOH ; 16-bit card ID
	db 90
	db BASIC
	dw NONE
	energy FIRE, 3
	tx SacredFireName
	tx Do30toaBenchDesc
	dw NONE
	db 0
	db RESIDUAL
	dw Do30ToABenchEffectCommands + $4000
	db DAMAGE_TO_OPPONENT_BENCH
	db (1 << 6)
	db NONE
	db 3
	db ATK_ANIM_GLOW_EFFECT
	energy FIRE, 5
	tx PhoenixFlareName
	dw NONE
	dw NONE
	db 80
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_DIVE_BOMB
	db 3
	db WR_WATER
	db WR_FIGHTING
	tx RainbowName
	db 250
	db 0
	db 77
	db 12, 6
	dw 438 * 10
	tx HoohDescription
	db 0

NeoCharmanderCard:
	db TYPE_PKMN_FIRE
	gfx NeoCharmanderCardGfx
	tx CharmanderName
	db CIRCLE
	db NEO_DISCOVERY | NONE
	dw NEO_CHARMANDER ; 16-bit card ID
	db 40
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx GrowlName
	tx ReduceDamageBy10Desc
	dw NONE
	db 0
	db DAMAGE_NORMAL
	dw ReduceDamageBy10EffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 10
	db ATK_ANIM_SUPERSONIC
	energy FIRE, 1, COLORLESS, 1
	tx EmberName
	dw NONE
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 3
	db ATK_ANIM_SMALL_FLAME
	db 1
	db WR_WATER
	db NONE
	tx LizardName
	db 4
	db 0
	db 15
	db 2, 0
	dw 19 * 10
	tx CharmanderDescription
	db 0

NeoCharmeleonCard:
	db TYPE_PKMN_FIRE
	gfx NeoCharmeleonCardGfx
	tx CharmeleonName
	db DIAMOND
	db NEO_DISCOVERY | NONE
	dw NEO_CHARMELEON ; 16-bit card ID
	db 70
	db STAGE1
	tx CharmanderName
	energy FIRE, 1, COLORLESS, 1
	tx SmokescreenName
	tx OpponentAttackMayDoNothingDescription
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw SmokescreenEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 0
	db ATK_ANIM_DARK_GAS
	energy FIRE, 1, COLORLESS, 2
	tx FlameTailName
	dw NONE
	dw NONE
	db 40
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_BIG_FLAME
	db 1
	db WR_WATER
	db NONE
	tx FlameName
	db 5
	db 0
	db 28
	db 3, 7
	dw 42 * 10
	tx CharmeleonDescription
	db 16

CharizardSCard:
	db TYPE_PKMN_FIRE
	gfx CharizardSCardGfx
	tx CharizardName
	db STAR
	db NEO_DISCOVERY | NONE
	dw CHARIZARD_S ; 16-bit card ID
	db 120
	db STAGE2
	tx CharmeleonName
	energy COLORLESS, 3
	tx SlashName
	dw NONE
	dw NONE
	db 40
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_SLASH
	energy FIRE, 1, LIGHTNING, 1, COLORLESS, 2
	tx SearingFlameName
	tx Do40ToSelfDesc
	dw NONE
	db 100
	db DAMAGE_NORMAL
	dw Do40ToSelfEffectCommands + $4000
	db LOW_RECOIL
	db NONE
	db NONE
	db 40
	db ATK_ANIM_FIRE_SPIN
	db 3
	db WR_WATER
	db WR_GRASS
	tx FlameName
	db 6
	db 0
	db 80
	db 5, 7
	dw 199 * 10
	tx CharizardSDescription
	db 0

Totodile1Card:
	db TYPE_PKMN_WATER
	gfx Totodile1CardGfx
	tx TotodileName
	db CIRCLE
	db NEO_GENESIS | NONE
	dw TOTODILE1 ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx BiteName
	dw NONE
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	energy WATER, 1, COLORLESS, 1
	tx RageName
	tx Do10MorePerSelfDamageDesc
	dw NONE
	db 10
	db DAMAGE_PLUS
	dw Do10MorePerSelfDamageEffectCommands + $4000
	db NONE
	db NONE
	db BOOST_IF_TAKEN_DAMAGE
	db 0
	db ATK_ANIM_HIT
	db 1
	db WR_GRASS
	db NONE
	tx BigJawName
	db 158
	db 0
	db 14
	db 2, 0
	dw 21 * 10
	tx Totodile1Description
	db 0

Totodile2Card:
	db TYPE_PKMN_WATER
	gfx Totodile2CardGfx
	tx TotodileName
	db CIRCLE
	db NEO_GENESIS | NONE
	dw TOTODILE2 ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy WATER, 1
	tx WaterGunName
	tx Do10MorePerWaterEnergyMax20Desc
	dw NONE
	db 10
	db DAMAGE_PLUS
	dw WWaterBoostEffectCommands + $4000
	db NONE
	db ATTACHED_ENERGY_BOOST
	db NONE
	db MAX_ENERGY_BOOST_IS_LIMITED
	db ATK_ANIM_WATER_GUN
	energy 0
	dw NONE
	dw NONE
	dw NONE
	db 0
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_NONE
	db 1
	db WR_GRASS
	db NONE
	tx BigJawName
	db 158
	db 0
	db 10
	db 2, 0
	dw 21 * 10
	tx Totodile2Description
	db 21

Croconaw1Card:
	db TYPE_PKMN_WATER
	gfx Croconaw1CardGfx
	tx CroconawName
	db DIAMOND
	db NEO_GENESIS | NONE
	dw CROCONAW1 ; 16-bit card ID
	db 70
	db STAGE1
	tx TotodileName
	energy COLORLESS, 1
	tx BiteName
	dw NONE
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	energy WATER, 2, COLORLESS, 1
	tx ClampName
	tx NoRetreatText
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw NoRetreatEffectCommands + $4000
	db NONE
	db (1 << 6)
	db NONE
	db 1
	db ATK_ANIM_HIT
	db 2
	db WR_GRASS
	db NONE
	tx BigJawName
	db 159
	db 0
	db 26
	db 3, 7
	dw 55 * 10
	tx Croconaw1Description
	db 18

Croconaw2Card:
	db TYPE_PKMN_WATER
	gfx Croconaw2CardGfx
	tx CroconawName
	db DIAMOND
	db NEO_GENESIS | NONE
	dw CROCONAW2 ; 16-bit card ID
	db 70
	db STAGE1
	tx TotodileName
	energy COLORLESS, 2
	tx PounceName
	tx PounceDescription
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw ReduceDamageBy10EffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 10
	db ATK_ANIM_HIT
	energy WATER, 2, COLORLESS, 1
	tx TakeDownName
	tx Do20toSelfDesc
	dw NONE
	db 50
	db DAMAGE_NORMAL
	dw Do20ToSelfEffectCommands + $4000
	db LOW_RECOIL
	db NONE
	db NONE
	db 20
	db ATK_ANIM_HIT_RECOIL
	db 2
	db WR_GRASS
	db NONE
	tx BigJawName
	db 159
	db 0
	db 29
	db 3, 7
	dw 55 * 10
	tx Croconaw2Description
	db 0

Feraligatr1Card:
	db TYPE_PKMN_WATER
	gfx Feraligatr1CardGfx
	tx FeraligatrName
	db STAR
	db NEO_GENESIS | NONE
	dw FERALIGATR1 ; 16-bit card ID
	db 100
	db STAGE2
	tx CroconawName
	energy WATER, 1, COLORLESS, 1
	tx ClampName
	tx NoRetreatText
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw NoRetreatEffectCommands + $4000
	db NONE
	db (1 << 6)
	db NONE
	db 1
	db ATK_ANIM_HIT
	energy WATER, 3, COLORLESS, 1
	tx RampageName
	tx Do10MorePerSelfDamageDesc
	dw NONE
	db 20
	db DAMAGE_PLUS
	dw Do10MorePerSelfDamageEffectCommands + $4000
	db NONE
	db NONE
	db BOOST_IF_TAKEN_DAMAGE
	db 0
	db ATK_ANIM_BIG_HIT
	db 3
	db WR_GRASS
	db WR_FIRE
	tx BigJawName
	db 160
	db 0
	db 58
	db 7, 7
	dw 195 * 10
	tx Feraligatr1Description
	db 19

Feraligatr2Card:
	db TYPE_PKMN_WATER
	gfx Feraligatr2CardGfx
	tx FeraligatrName
	db STAR
	db NEO_GENESIS | NONE
	dw FERALIGATR2 ; 16-bit card ID
	db 90
	db STAGE2
	tx CroconawName
	energy 0
	tx ScareName
	tx ScareDescription
	dw NONE
	db 0
	db POKEMON_POWER
	dw NoPokePowersEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_PKMN_POWER_1
	energy WATER, 2, COLORLESS, 1
	tx WhirlpoolName
	tx Discard1EnergyFromTargetDescription
	dw NONE
	db 40
	db DAMAGE_NORMAL
	dw Discard1EnergyFromTargetEffectCommands + $4000
	db NONE
	db (1 << 6)
	db NONE
	db 3
	db ATK_ANIM_WHIRLPOOL
	db 3
	db WR_GRASS
	db WR_FIRE
	tx BigJawName
	db 160
	db 0
	db 55
	db 7, 7
	dw 195 * 10
	tx Feraligatr2Description
	db 3

NeoSquirtleCard:
	db TYPE_PKMN_WATER
	gfx NeoSquirtleCardGfx
	tx SquirtleName
	db CIRCLE
	db NEO_REVELATION | NONE
	dw NEO_SQUIRTLE ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx TackleName
	dw NONE
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	energy WATER, 2
	tx BubbleName
	tx MayInflictParalysisDescription
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw MayInflictParalysisEffectCommands + $4000
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_BUBBLES
	db 1
	db WR_GRASS
	db NONE
	tx TinyTurtleName
	db 7
	db 0
	db 10
	db 1, 8
	dw 20 * 10
	tx SquirtleDescription
	db 19

NeoWartortleCard:
	db TYPE_PKMN_WATER
	gfx NeoWartortleCardGfx
	tx WartortleName
	db DIAMOND
	db NEO_REVELATION | NONE
	dw NEO_WARTORTLE ; 16-bit card ID
	db 80
	db STAGE1
	tx SquirtleName
	energy WATER, 1
	tx WaveSplashName
	dw NONE
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_WATER_JETS
	energy WATER, 1, COLORLESS, 2
	tx AquaJetName
	tx CanSwitchSelfAfterDamageDesc
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw CanSwitchSelfAfterDamageEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_WATER_JETS
	db 2
	db WR_GRASS
	db NONE
	tx TurtleName
	db 8
	db 0
	db 20
	db 3, 3
	dw 50 * 10
	tx WartortleDescription
	db 19

NeoBlastoiseCard:
	db TYPE_PKMN_WATER
	gfx NeoBlastoiseCardGfx
	tx BlastoiseName
	db STAR
	db NEO_REVELATION | NONE
	dw NEO_BLASTOISE ; 16-bit card ID
	db 110
	db STAGE2
	tx WartortleName
	energy WATER, 1, COLORLESS, 2
	tx JetStreamName
	tx Discard1EnergyFromTargetDescription
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw Discard1EnergyFromTargetEffectCommands + $4000
	db NONE
	db (1 << 6)
	db NONE
	db 3
	db ATK_ANIM_WHIRLPOOL
	energy WATER, 2, COLORLESS, 1
	tx HydroPumpName
	tx NoLimitExtraWDamageDesc
	dw NONE
	db 40
	db DAMAGE_PLUS
	dw NoLimitExtraWEffectCommands + $4000
	db NONE
	db ATTACHED_ENERGY_BOOST
	db NONE
	db MAX_ENERGY_BOOST_IS_NOT_LIMITED
	db ATK_ANIM_HYDRO_PUMP
	db 3
	db WR_GRASS
	db WR_FIRE
	tx ShellfishName
	db 9
	db 0
	db 52
	db 5, 3
	dw 188 * 10
	tx BlastoiseDescription
	db 19

NeoOmanyteCard:
	db TYPE_PKMN_WATER
	gfx NeoOmanyteCardGfx
	tx OmanyteName
	db CIRCLE
	db NEO_DISCOVERY | NONE
	dw NEO_OMANYTE ; 16-bit card ID
	db 70
	db STAGE1
	tx FossilEggName
	energy WATER, 1
	tx WrapName
	tx MayInflictParalysisDescription
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw MayInflictParalysisEffectCommands + $4000
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	energy WATER, 1, COLORLESS, 1
	tx WaterGunName
	tx Do10MorePerWaterEnergyMax20Desc
	dw NONE
	db 20
	db DAMAGE_PLUS
	dw WEWaterBoostEffectCommands + $4000
	db NONE
	db ATTACHED_ENERGY_BOOST
	db NONE
	db MAX_ENERGY_BOOST_IS_LIMITED
	db ATK_ANIM_WATER_GUN
	db 1
	db WR_GRASS
	db NONE
	tx SpiralName
	db 138
	db 0
	db 21
	db 1, 4
	dw 16 * 10
	tx OmanyteDescription
	db 0

NeoOmastarCard:
	db TYPE_PKMN_WATER
	gfx NeoOmastarCardGfx
	tx OmastarName
	db DIAMOND
	db NEO_DISCOVERY | NONE
	dw NEO_OMASTAR ; 16-bit card ID
	db 90
	db STAGE2
	tx OmanyteName
	energy WATER, 1, COLORLESS, 1
	tx AncientpowerName
	tx CantUse1AttackDesc
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw OppCantUse1AttackEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 0
	db ATK_ANIM_BONEMERANG
	energy WATER, 1, COLORLESS, 2
	tx AbyssalAmbushName
	tx MoreDamageIfDFPInjuredDesc
	dw NONE
	db 30
	db DAMAGE_PLUS
	dw MoreDamageIfDFPInjuredEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_WATER_JETS
	db 1
	db WR_GRASS
	db NONE
	tx SpiralName
	db 139
	db 0
	db 37
	db 3, 3
	dw 77 * 10
	tx OmastarDescription
	db 3

NeoKabutoCard:
	db TYPE_PKMN_WATER
	gfx NeoKabutoCardGfx
	tx KabutoName
	db CIRCLE
	db NEO_DISCOVERY | NONE
	dw NEO_KABUTO ; 16-bit card ID
	db 70
	db STAGE1
	tx FossilEggName
	energy WATER, 1
	tx WaterGunName
	tx Do10MorePerWaterEnergyMax20Desc
	dw NONE
	db 10
	db DAMAGE_PLUS
	dw WWaterBoostEffectCommands + $4000
	db NONE
	db ATTACHED_ENERGY_BOOST
	db NONE
	db MAX_ENERGY_BOOST_IS_LIMITED
	db ATK_ANIM_WATER_GUN
	energy WATER, 1, COLORLESS, 1
	tx ScratchName
	dw NONE
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_SLASH
	db 1
	db WR_GRASS
	db NONE
	tx ShellfishName
	db 140
	db 0
	db 18
	db 1, 8
	dw 25 * 10
	tx KabutoDescription
	db 0

NeoKabutopsCard:
	db TYPE_PKMN_WATER
	gfx NeoKabutopsCardGfx
	tx KabutopsName
	db STAR
	db NEO_DISCOVERY | NONE
	dw NEO_KABUTOPS ; 16-bit card ID
	db 90
	db STAGE1
	tx KabutoName
	energy COLORLESS, 1
	tx SlashName
	dw NONE
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_SLASH
	energy WATER, 1
	tx HydrocutterName
	tx CF30PerSelfEnergyDesc
	dw NONE
	db 30
	db DAMAGE_X
	dw CF30PerSelfEnergyEffectCommands + $4000
	db NONE
	db ATTACHED_ENERGY_BOOST
	db NONE
	db MAX_ENERGY_BOOST_IS_NOT_LIMITED
	db ATK_ANIM_MULTIPLE_SLASH
	db 2
	db WR_GRASS
	db NONE
	tx ShellfishName
	db 141
	db 0
	db 46
	db 4, 3
	dw 89 * 10
	tx KabotopsDescription
	db 0

VaporeonCard:
	db TYPE_PKMN_WATER
	gfx VaporeonCardGfx
	tx VaporeonName
	db DIAMOND
	db NEO_REVELATION | NONE
	dw VAPOREON ; 16-bit card ID
	db 90
	db STAGE1
	tx EeveeName
	energy COLORLESS, 1
	tx MistName
	tx NoSpecialConditions1TurnDesc
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw NoSpecialConditionsEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 0
	db ATK_ANIM_WATER_JETS ; mapped from ATK_ANIM_MIST
	energy WATER, 2
	tx SurfName
	dw NONE
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_WATER_JETS
	db 1
	db WR_LIGHTNING
	db NONE
	tx BubbleJetName
	db 134
	db 0
	db 29
	db 3, 3
	dw 63 * 10
	tx VaporeonDescription
	db 0

Marill1Card:
	db TYPE_PKMN_WATER
	gfx Marill1CardGfx
	tx MarillName
	db CIRCLE
	db NEO_GENESIS | NONE
	dw MARILL1 ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx CurlUpName
	tx PreventDamageButNotEffectsDesc
	dw NONE
	db 0
	db RESIDUAL
	dw MayPreventDamageOnlyEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 0
	db ATK_ANIM_NONE
	energy WATER, 2
	tx BubbleName
	tx MayInflictParalysisDescription
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw MayInflictParalysisEffectCommands + $4000
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_BUBBLES
	db 1
	db WR_LIGHTNING
	db NONE
	tx AquamouseName
	db 183
	db 0
	db 13
	db 1, 4
	dw 18 * 10
	tx Marill1Description
	db 19

Marill2Card:
	db TYPE_PKMN_WATER
	gfx Marill2CardGfx
	tx MarillName
	db CIRCLE
	db NEO_GENESIS | NONE
	dw MARILL2 ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy WATER, 1
	tx BubbleName
	tx MayInflictParalysisDescription
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw MayInflictParalysisEffectCommands + $4000
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_BUBBLES
	energy WATER, 1
	tx WaterGunName
	tx Do10MorePerWaterEnergyMax20Desc
	dw NONE
	db 10
	db DAMAGE_PLUS
	dw WWaterBoostEffectCommands + $4000
	db NONE
	db ATTACHED_ENERGY_BOOST
	db NONE
	db MAX_ENERGY_BOOST_IS_LIMITED
	db ATK_ANIM_WATER_GUN
	db 1
	db WR_LIGHTNING
	db NONE
	tx AquamouseName
	db 183
	db 0
	db 14
	db 1, 4
	dw 18 * 10
	tx Marill2Description
	db 16

Azumarill1Card:
	db TYPE_PKMN_WATER
	gfx Azumarill1CardGfx
	tx AzumarillName
	db STAR
	db NEO_GENESIS | NONE
	dw AZUMARILL1 ; 16-bit card ID
	db 80
	db STAGE1
	tx MarillName
	energy COLORLESS, 1
	tx TackleName
	dw NONE
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	energy WATER, 3
	tx BubbleShowerName
	tx MayDo10toOppsBenchandPRZDesc
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw MayDo10ToOppBenchAndPRZEffectCommands + $4000
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_BUBBLES
	db 1
	db WR_LIGHTNING
	db WR_FIRE
	tx AquarabbitName
	db 184
	db 0
	db 38
	db 2, 7
	dw 63 * 10
	tx Azumarill1Description
	db 0

Azumarill2Card:
	db TYPE_PKMN_WATER
	gfx Azumarill2CardGfx
	tx AzumarillName
	db STAR
	db NEO_REVELATION | NONE
	dw AZUMARILL2 ; 16-bit card ID
	db 80
	db STAGE1
	tx MarillName
	energy WATER, 1, COLORLESS, 1
	tx AmnesiaName
	tx CantUse1AttackDesc
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw OppCantUse1AttackEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 0
	db ATK_ANIM_BONEMERANG
	energy WATER, 1, COLORLESS, 2
	tx AquaJetName
	tx CanSwitchSelfAfterDamageDesc
	dw NONE
	db 40
	db DAMAGE_NORMAL
	dw CanSwitchSelfAfterDamageEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_WATER_JETS
	db 1
	db WR_LIGHTNING
	db WR_FIRE
	tx AquarabbitName
	db 184
	db 0
	db 31
	db 2, 7
	dw 63 * 10
	tx Azumarill2Description
	db 19

NeoPoliwagCard:
	db TYPE_PKMN_WATER
	gfx NeoPoliwagCardGfx
	tx PoliwagName
	db CIRCLE
	db NEO_DISCOVERY | NONE
	dw NEO_POLIWAG ; 16-bit card ID
	db 40
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx TackleName
	dw NONE
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	energy WATER, 1
	tx HypnosisName
	tx InflictSleepDescription
	dw NONE
	db 0
	db DAMAGE_NORMAL
	dw InflictSleepEffectCommands + $4000
	db INFLICT_SLEEP
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HYPNOSIS
	db 1
	db WR_GRASS
	db NONE
	tx TadpoleName
	db 60
	db 0
	db 9
	db 2, 0
	dw 27 * 10
	tx PoliwagDescription
	db 0

NeoPoliwhirlCard:
	db TYPE_PKMN_WATER
	gfx NeoPoliwhirlCardGfx
	tx PoliwhirlName
	db DIAMOND
	db NEO_DISCOVERY | NONE
	dw NEO_POLIWHIRL ; 16-bit card ID
	db 70
	db STAGE1
	tx PoliwagName
	energy WATER, 1
	tx BubbleName
	tx MayInflictParalysisDescription
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw MayInflictParalysisEffectCommands + $4000
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_BUBBLES
	energy COLORLESS, 2
	tx MegaPunchName
	dw NONE
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	db 1
	db WR_GRASS
	db NONE
	tx TadpoleName
	db 61
	db 0
	db 29
	db 3, 3
	dw 44 * 10
	tx PoliwhirlDescription
	db 19

PolitoedCard:
	db TYPE_PKMN_WATER
	gfx PolitoedCardGfx
	tx PolitoedName
	db STAR
	db NEO_DISCOVERY | NONE
	dw POLITOED ; 16-bit card ID
	db 100
	db STAGE2
	tx PoliwhirlName
	energy 0
	tx RainDanceName
	tx RainDanceDescription
	tx RainDanceDescriptionCont
	db 0
	db POKEMON_POWER
	dw RainDanceEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_PKMN_POWER_1
	energy WATER, 3
	tx SurfName
	dw NONE
	dw NONE
	db 40
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_WATER_JETS
	db 2
	db WR_GRASS
	db WR_FIRE
	tx FrogName
	db 186
	db 0
	db 50
	db 3, 7
	dw 74 * 10
	tx PolitoedDescription
	db 0

WooperCard:
	db TYPE_PKMN_WATER
	gfx WooperCardGfx
	tx WooperName
	db CIRCLE
	db NEO_REVELATION | NONE
	dw WOOPER ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx SandAttackName
	tx OpponentAttackMayDoNothingDescription
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw SandshrewSandAttackEffectCommands
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 0
	db ATK_ANIM_DARK_GAS
	energy COLORLESS, 2
	tx HeadbuttName
	dw NONE
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	db 1
	db WR_GRASS
	db NONE
	tx WaterFishName
	db 194
	db 0
	db 15
	db 1, 4
	dw 18 * 10
	tx WooperDescription
	db 19

QuagsireCard:
	db TYPE_PKMN_WATER
	gfx QuagsireCardGfx
	tx QuagsireName
	db DIAMOND
	db NEO_REVELATION | NONE
	dw QUAGSIRE ; 16-bit card ID
	db 80
	db STAGE1
	tx WooperName
	energy WATER, 1, COLORLESS, 1
	tx SurfName
	dw NONE
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_WATER_JETS
	energy FIGHTING, 2, COLORLESS, 1
	tx EarthquakeName
	tx Do10ToOwnBenchDesc
	dw NONE
	db 50
	db DAMAGE_NORMAL
	dw Do10ToOwnBenchEffectCommands + $4000
	db NONE
	db NONE
	db SPECIAL_AI_HANDLING
	db 0
	db ATK_ANIM_HIT
	db 2
	db WR_GRASS
	db WR_LIGHTNING
	tx WaterFishName
	db 195
	db 0
	db 33
	db 4, 7
	dw 165 * 10
	tx QuagsireDescription
	db 0

QwilfishCard:
	db TYPE_PKMN_WATER
	gfx QwilfishCardGfx
	tx QwilfishName
	db DIAMOND
	db NEO_DISCOVERY | NONE
	dw QWILFISH ; 16-bit card ID
	db 60
	db BASIC
	dw NONE
	energy WATER, 1
	tx PoisonStingName
	tx MayInflictPoisonDescription
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw MayInflictPoisonEffectCommands + $4000
	db INFLICT_POISON
	db NONE
	db NONE
	db 0
	db ATK_ANIM_NEEDLES
	energy WATER, 2
	tx StunNeedleName
	tx MayInflictParalysisDescription
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw MayInflictParalysisEffectCommands + $4000
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_NEEDLES
	db 1
	db WR_LIGHTNING
	db NONE
	tx BalloonName
	db 211
	db 0
	db 18
	db 1, 8
	dw 8 * 10
	tx QwilfishDescription
	db 16

SneaselCard:
	db TYPE_PKMN_WATER
	gfx SneaselCardGfx
	tx SneaselName
	db STAR
	db NEO_DESTINY | NONE
	dw SNEASEL ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx FurySwipesName
	tx TripleAttackX10Description
	dw NONE
	db 10
	db DAMAGE_X
	dw CF10X3EffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_MULTIPLE_SLASH
	energy WATER, 2, COLORLESS, 1
	tx BeatUpName
	tx Do10MorePerYourBenchedDesc
	dw NONE
	db 10
	db DAMAGE_PLUS
	dw Do10MorePerSelfBenchEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	db 1
	db WR_FIGHTING
	db WR_PSYCHIC
	tx SharpClawName
	db 215
	db 0
	db 37
	db 2, 11
	dw 62 * 10
	tx SneaselDescription
	db 0

RemoraidCard:
	db TYPE_PKMN_WATER
	gfx RemoraidCardGfx
	tx RemoraidName
	db CIRCLE
	db NEO_DISCOVERY | NONE
	dw REMORAID ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy WATER, 2
	tx SnipeName
	tx Do20ToABenchDesc
	dw NONE
	db 0
	db RESIDUAL
	dw Do20ToOppBenchOnlyEffectCommands + $4000
	db DAMAGE_TO_OPPONENT_BENCH
	db (1 << 6)
	db NONE
	db 3
	db ATK_ANIM_NONE
	energy 0
	dw NONE
	dw NONE
	dw NONE
	db 0
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_NONE
	db 0
	db WR_LIGHTNING
	db NONE
	tx JetName
	db 223
	db 0
	db 18
	db 2, 0
	dw 26 * 10
	tx RemoraidDescription
	db 19

OctilleryCard:
	db TYPE_PKMN_WATER
	gfx OctilleryCardGfx
	tx OctilleryName
	db STAR
	db NEO_DISCOVERY | NONE
	dw OCTILLERY ; 16-bit card ID
	db 90
	db STAGE1
	tx RemoraidName
	energy 0
	tx SuctionCupsName
	tx NoRetreatAbilityDesc
	dw NONE
	db 0
	db POKEMON_POWER
	dw NoRetreatAbilityEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_PKMN_POWER_1
	energy WATER, 2, COLORLESS, 1
	tx OctazookaName
	tx OpponentAttackMayDoNothingDescription
	dw NONE
	db 40
	db DAMAGE_NORMAL
	dw SmokescreenEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 0
	db ATK_ANIM_DARK_GAS
	db 2
	db WR_LIGHTNING
	db NONE
	tx JetName
	db 224
	db 0
	db 46
	db 2, 11
	dw 63 * 10
	tx OctilleryDescription
	db 0

MantineCard:
	db TYPE_PKMN_WATER
	gfx MantineCardGfx
	tx MantineName
	db CIRCLE
	db NEO_DESTINY | NONE
	dw MANTINE ; 16-bit card ID
	db 60
	db BASIC
	dw NONE
	energy WATER, 1
	tx BubbleName
	tx MayInflictParalysisDescription
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw MayInflictParalysisEffectCommands + $4000
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_BUBBLES
	energy WATER, 2
	tx AgilityName
	tx MayGetImmunityDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw MayGetImmunityEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 0
	db ATK_ANIM_QUICK_ATTACK
	db 1
	db WR_LIGHTNING
	db WR_FIGHTING
	tx KiteName
	db 226
	db 0
	db 20
	db 6, 11
	dw 485 * 10
	tx MantineDescription
	db 21

NeoHorseaCard:
	db TYPE_PKMN_WATER
	gfx NeoHorseaCardGfx
	tx HorseaName
	db CIRCLE
	db NEO_REVELATION | NONE
	dw NEO_HORSEA ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy WATER, 1
	tx WaterGunName
	tx Do10MorePerWaterEnergyMax20Desc
	dw NONE
	db 10
	db DAMAGE_PLUS
	dw WWaterBoostEffectCommands + $4000
	db NONE
	db ATTACHED_ENERGY_BOOST
	db NONE
	db MAX_ENERGY_BOOST_IS_LIMITED
	db ATK_ANIM_WATER_GUN
	energy WATER, 2
	tx AquaJetName
	tx CanSwitchSelfAfterDamageDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw CanSwitchSelfAfterDamageEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_WATER_JETS
	db 1
	db WR_LIGHTNING
	db NONE
	tx DragonName
	db 116
	db 0
	db 17
	db 1, 4
	dw 17 * 10
	tx HorseaDescription
	db 0

NeoSeadraCard:
	db TYPE_PKMN_WATER
	gfx NeoSeadraCardGfx
	tx SeadraName
	db DIAMOND
	db NEO_REVELATION | NONE
	dw NEO_SEADRA ; 16-bit card ID
	db 70
	db STAGE1
	tx HorseaName
	energy WATER, 2
	tx SnipeName
	tx Do20ToABenchDesc
	dw NONE
	db 0
	db RESIDUAL
	dw Do20ToOppBenchOnlyEffectCommands + $4000
	db DAMAGE_TO_OPPONENT_BENCH
	db (1 << 6)
	db NONE
	db 3
	db ATK_ANIM_NONE
	energy WATER, 2, COLORLESS, 1
	tx WaterGunName
	tx Do10MorePerWaterEnergyMax20Desc
	dw NONE
	db 30
	db DAMAGE_PLUS
	dw WWEWaterBoostEffectCommands + $4000
	db NONE
	db ATTACHED_ENERGY_BOOST
	db NONE
	db MAX_ENERGY_BOOST_IS_LIMITED
	db ATK_ANIM_WATER_GUN
	db 1
	db WR_LIGHTNING
	db NONE
	tx DragonName
	db 117
	db 0
	db 34
	db 3, 11
	dw 55 * 10
	tx SeadraDescription
	db 19

KingdraCard:
	db TYPE_PKMN_WATER
	gfx KingdraCardGfx
	tx KingdraName
	db STAR
	db NEO_REVELATION | NONE
	dw KINGDRA ; 16-bit card ID
	db 100
	db STAGE2
	tx SeadraName
	energy WATER, 2
	tx DragonTornadoName
	tx CanSwitchDPBeforeDamageDesc
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw CanSwitchOppBeforeDamageEffectCommands + $4000
	db NONE
	db SWITCH_OPPONENT_POKEMON
	db NONE
	db 0
	db ATK_ANIM_WHIRLWIND
	energy WATER, 4
	tx WhirlpoolName
	tx Discard1EnergyFromTargetDescription
	dw NONE
	db 60
	db DAMAGE_NORMAL
	dw Discard1EnergyFromTargetEffectCommands + $4000
	db NONE
	db (1 << 6)
	db NONE
	db 3
	db ATK_ANIM_WHIRLPOOL
	db 2
	db NONE
	db WR_FIRE
	tx DragonName
	db 230
	db 0
	db 59
	db 5, 11
	dw 335 * 10
	tx KingdraDescription
	db 0

ArticunoCard:
	db TYPE_PKMN_WATER
	gfx ArticunoCardGfx
	tx ArticunoName
	db STAR
	db NEO_REVELATION | NONE
	dw ARTICUNO ; 16-bit card ID
	db 70
	db BASIC
	dw NONE
	energy 0
	tx QuickfreezeName
	tx QuickfreezeDescription
	dw NONE
	db 0
	db POKEMON_POWER
	dw ETBCFPRZEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_QUICKFREEZE
	energy WATER, 2, COLORLESS, 2
	tx BlizzardName
	tx CF10ToYourOrOppBenchDesc
	dw NONE
	db 40
	db DAMAGE_NORMAL
	dw CF10ToYourOrOppBenchEffectCommands + $4000
	db DAMAGE_TO_OPPONENT_BENCH
	db NONE
	db NONE
	db 10
	db ATK_ANIM_BLIZZARD ; mapped from ATK_ANIM_BLIZZARD_REAL
	db 2
	db NONE
	db WR_FIGHTING
	tx FreezeName
	db 144
	db 0
	db 48
	db 5, 7
	dw 122 * 10
	tx ArticunoDescription
	db 19

SuicuneCard:
	db TYPE_PKMN_WATER
	gfx SuicuneCardGfx
	tx SuicuneName
	db STAR
	db NEO_REVELATION | NONE
	dw SUICUNE ; 16-bit card ID
	db 70
	db BASIC
	dw NONE
	energy 0
	tx PureBodyName
	tx PureBodyDescription
	dw NONE
	db 0
	db POKEMON_POWER
	dw PokepowerNoStatusEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_GLOW_EFFECT
	energy WATER, 3
	tx AuroraBeamName
	tx MayInflictParalysisDescription
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw MayInflictParalysisEffectCommands + $4000
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_BEAM
	db 1
	db WR_LIGHTNING
	db NONE
	tx AuroraName
	db 245
	db 0
	db 47
	db 6, 7
	dw 412 * 10
	tx SuicuneDescription
	db 0

MagikarpSCard:
	db TYPE_PKMN_WATER
	gfx MagikarpSCardGfx
	tx MagikarpName
	db DIAMOND
	db NEO_DISCOVERY | NONE
	dw MAGIKARP_S ; 16-bit card ID
	db 30
	db BASIC
	dw NONE
	energy FIRE, 1
	tx GoldScaleName
	tx MailFromBillDescription
	dw NONE
	db 0
	db RESIDUAL
	dw BillEffectCommands
	db DRAW_CARD
	db NONE
	db NONE
	db 0
	db ATK_ANIM_GLOW_EFFECT
	energy WATER, 1
	tx FlailName
	tx Do10XPerSelfDamageDesc
	dw NONE
	db 10
	db DAMAGE_X
	dw Do10XPerSelfDamageEffectCommands + $4000
	db NONE
	db NONE
	db BOOST_IF_TAKEN_DAMAGE
	db 0
	db ATK_ANIM_BIG_HIT
	db 0
	db WR_LIGHTNING
	db NONE
	tx FishName
	db 129
	db 0
	db 19
	db 2, 11
	dw 22 * 10
	tx MagikarpSDescription
	db 0

GyaradosSCard:
	db TYPE_PKMN_WATER
	gfx GyaradosSCardGfx
	tx GyaradosName
	db STAR
	db NEO_DISCOVERY | NONE
	dw GYARADOS_S ; 16-bit card ID
	db 100
	db STAGE1
	tx MagikarpName
	energy WATER, 1, FIRE, 1
	tx RampageName
	tx Do10PerSelfDamageThenMayConfuse
	dw NONE
	db 20
	db DAMAGE_PLUS
	dw Do10PerSelfDamageThenMayConfuseEffectCommands + $4000
	db NONE
	db NONE
	db BOOST_IF_TAKEN_DAMAGE
	db 0
	db ATK_ANIM_RAMPAGE
	energy WATER, 2, FIRE, 2
	tx DevastateName
	tx Do20ToAllBench50ToSelfDesc
	dw NONE
	db 80
	db DAMAGE_NORMAL
	dw Do20ToAllBenchAnd50ToSelfEffectCommands + $4000
	db HIGH_RECOIL
	db NONE
	db NONE
	db 50
	db ATK_ANIM_DRAGON_RAGE
	db 3
	db WR_LIGHTNING
	db WR_FIGHTING
	tx AtrociousName
	db 130
	db 0
	db 79
	db 21, 4
	dw 518 * 10
	tx GyaradosSDescription
	db 0

KingdraSCard:
	db TYPE_PKMN_WATER
	gfx KingdraSCardGfx
	tx KingdraName
	db STAR
	db NEO_DISCOVERY | NONE
	dw KINGDRA_S ; 16-bit card ID
	db 110
	db STAGE2
	tx SeadraName
	energy WATER, 1, PSYCHIC, 1
	tx DragonbreathName
	tx MayInflictParalysisDescription
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw MagnetonThunderWaveEffectCommands
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_DRAGON_RAGE
	energy WATER, 2, PSYCHIC, 2
	tx DracoMeteorName
	tx DracoMeteorDesc
	dw NONE
	db 0
	db DAMAGE_NORMAL
	dw DracoMeteorEffectCommands + $4000
	db DAMAGE_TO_OPPONENT_BENCH
	db DISCARD_ENERGY
	db NONE
	db 0
	db NONE
	db 3
	db NONE
	db WR_FIRE
	tx DragonName
	db 230
	db 0
	db 91
	db 5, 11
	dw 335 * 10
	tx KingdraSDescription
	db 17

JolteonCard:
	db TYPE_PKMN_LIGHTNING
	gfx JolteonCardGfx
	tx JolteonName
	db DIAMOND
	db NEO_REVELATION | NONE
	dw JOLTEON ; 16-bit card ID
	db 70
	db STAGE1
	tx EeveeName
	energy LIGHTNING, 1
	tx EnergyBoostName
	tx SearchEnergyAndAttachDesc
	dw NONE
	db 0
	db RESIDUAL
	dw SearchAndAttachEnergyEffectCommands + $4000
	db NONE
	db NONE
	db SPECIAL_AI_HANDLING
	db 0
	db ATK_ANIM_GLOW_EFFECT
	energy LIGHTNING, 2
	tx StunNeedleName
	tx MayInflictParalysisDescription
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw MayInflictParalysisEffectCommands + $4000
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_NEEDLES
	db 0
	db WR_FIGHTING
	db NONE
	tx LightningName
	db 135
	db 0
	db 32
	db 2, 7
	dw 54 * 10
	tx JolteonDescription
	db 0

Chinchou1Card:
	db TYPE_PKMN_LIGHTNING
	gfx Chinchou1CardGfx
	tx ChinchouName
	db CIRCLE
	db NEO_DESTINY | NONE
	dw CHINCHOU1 ; 16-bit card ID
	db 40
	db BASIC
	dw NONE
	energy LIGHTNING, 1
	tx ThundershockName
	tx MayInflictParalysisDescription
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw MayInflictParalysisEffectCommands + $4000
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_THUNDERSHOCK
	energy LIGHTNING, 1, COLORLESS, 1
	tx SparkName
	tx Do10To1BenchDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw DamageAndDo10ToABenchEffectCommands + $4000
	db DAMAGE_TO_OPPONENT_BENCH
	db NONE
	db NONE
	db 10
	db ATK_ANIM_THUNDER_WHOLE_SCREEN
	db 1
	db WR_FIGHTING
	db NONE
	tx AnglerName
	db 170
	db 0
	db 25
	db 1, 8
	dw 26 * 10
	tx Chinchou1Description
	db 0

Chinchou2Card:
	db TYPE_PKMN_LIGHTNING
	gfx Chinchou2CardGfx
	tx ChinchouName
	db CIRCLE
	db NEO_DESTINY | NONE
	dw CHINCHOU2 ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx CurlUpName
	tx PreventDamageButNotEffectsDesc
	dw NONE
	db 0
	db RESIDUAL
	dw MayPreventDamageOnlyEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 0
	db ATK_ANIM_NONE
	energy LIGHTNING, 1, COLORLESS, 1
	tx ThundershockName
	tx MayInflictParalysisDescription
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw MayInflictParalysisEffectCommands + $4000
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_THUNDERSHOCK
	db 1
	db WR_FIGHTING
	db NONE
	tx AnglerName
	db 170
	db 0
	db 22
	db 1, 8
	dw 26 * 10
	tx Chinchou2Description
	db 17

Lanturn1Card:
	db TYPE_PKMN_LIGHTNING
	gfx Lanturn1CardGfx
	tx LanturnName
	db DIAMOND
	db NEO_DESTINY | NONE
	dw LANTURN1 ; 16-bit card ID
	db 90
	db STAGE1
	tx ChinchouName
	energy 0
	tx HydroelectricPowerName
	tx HydroelectricPowerDesc
	dw NONE
	db 0
	db POKEMON_POWER
	dw RainDanceEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_PKMN_POWER_1
	energy LIGHTNING, 2
	tx FloodlightName
	tx MayInflictParalysisDescription
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw FloodlightEffectCommands + $4000
	db INFLICT_PARALYSIS
	db ATTACHED_ENERGY_BOOST
	db NONE
	db MAX_ENERGY_BOOST_IS_NOT_LIMITED
	db ATK_ANIM_THUNDER_WAVE
	db 2
	db WR_FIGHTING
	db NONE
	tx LightName
	db 171
	db 0
	db 32
	db 3, 11
	dw 49 * 10
	tx Lanturn1Description
	db 0

Lanturn2Card:
	db TYPE_PKMN_LIGHTNING
	gfx Lanturn2CardGfx
	tx LanturnName
	db STAR
	db NEO_REVELATION | NONE
	dw LANTURN2 ; 16-bit card ID
	db 90
	db STAGE1
	tx ChinchouName
	energy LIGHTNING, 1, COLORLESS, 1
	tx IonStormName
	tx Do10ToAllOppBenchDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw Do10ToAllOppBenchedEffectCommands + $4000
	db DAMAGE_TO_OPPONENT_BENCH
	db NONE
	db NONE
	db 0
	db ATK_ANIM_MAGNETIC_STORM
	energy LIGHTNING, 2, COLORLESS, 1
	tx ThunderName
	tx MayDo20ToSelfDesc
	dw NONE
	db 60
	db DAMAGE_NORMAL
	dw CFT20ToSelfEffectCommands + $4000
	db LOW_RECOIL
	db NONE
	db NONE
	db 0
	db ATK_ANIM_THUNDERSHOCK
	db 2
	db WR_FIGHTING
	db NONE
	tx LightName
	db 172
	db 0
	db 43
	db 3, 11
	dw 39 * 10
	tx Lanturn2Description
	db 0

PichuCard:
	db TYPE_PKMN_LIGHTNING
	gfx PichuCardGfx
	tx PichuName
	db STAR
	db NEO_GENESIS | NONE
	dw PICHU ; 16-bit card ID
	db 30
	db BASIC
	dw NONE
	energy 0
	tx CutenessName
	tx CutenessDescription
	dw NONE
	db 0
	db POKEMON_POWER
	dw CutenessEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_PKMN_POWER_1
	energy LIGHTNING, 1
	tx ThunderJoltName
	tx MayDo10ToSelfDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw CFT10ToSelfEffectCommands + $4000
	db LOW_RECOIL
	db NONE
	db NONE
	db 0
	db ATK_ANIM_THUNDERSHOCK
	db 0
	db NONE
	db NONE
	tx TinyMouseName
	db 172
	db 0
	db 5
	db 1, 0
	dw 4 * 10
	tx PichuDescription
	db 0

PikachuCard:
	db TYPE_PKMN_LIGHTNING
	gfx PikachuCardGfx
	tx PikachuName
	db CIRCLE
	db NEO_DESTINY | NONE
	dw PIKACHU ; 16-bit card ID
	db 40
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx QuickAttackName
	tx MayDo10Plus20Desc
	dw NONE
	db 10
	db DAMAGE_PLUS
	dw MayDo10Plus20EffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_QUICK_ATTACK
	energy LIGHTNING, 2
	tx AgilityName
	tx MayGetImmunityDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw MayGetImmunityEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 0
	db ATK_ANIM_QUICK_ATTACK
	db 1
	db WR_FIGHTING
	db NONE
	tx MouseName
	db 25
	db 0
	db 17
	db 1, 4
	dw 13 * 10
	tx PikachuDescription
	db 19

Pikachu2Card:
	db TYPE_PKMN_LIGHTNING
	gfx Pikachu2CardGfx
	tx PikachuName
	db CIRCLE
	db NEO_GENESIS | NONE
	dw PIKACHU2 ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx HideName
	tx MayGetImmunityDesc
	dw NONE
	db 0
	db RESIDUAL
	dw MayGetImmunityNoDMGEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 0
	db ATK_ANIM_NONE
	energy LIGHTNING, 1, COLORLESS, 1
	tx SparkName
	tx Do10To1BenchDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw DamageAndDo10ToABenchEffectCommands + $4000
	db DAMAGE_TO_OPPONENT_BENCH
	db NONE
	db NONE
	db 10
	db ATK_ANIM_THUNDER_WHOLE_SCREEN
	db 1
	db WR_FIGHTING
	db NONE
	tx MouseName
	db 25
	db 0
	db 12
	db 1, 4
	dw 13 * 10
	tx Pikachu2Description
	db 19

RaichuCard:
	db TYPE_PKMN_LIGHTNING
	gfx RaichuCardGfx
	tx RaichuName
	db DIAMOND
	db NEO_DESTINY | NONE
	dw RAICHU ; 16-bit card ID
	db 70
	db STAGE1
	tx PikachuName
	energy LIGHTNING, 2
	tx ThundershockName
	tx MayInflictParalysisDescription
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw MayInflictParalysisEffectCommands + $4000
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_THUNDERSHOCK
	energy LIGHTNING, 3
	tx LightningStrikeName
	tx LightningStrikeDesc
	dw NONE
	db 40
	db DAMAGE_NORMAL
	dw DiscardAllLForPlusDamageEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_THUNDER
	db 1
	db WR_FIGHTING
	db NONE
	tx MouseName
	db 26
	db 0
	db 36
	db 2, 7
	dw 66 * 10
	tx RaichuDescription
	db 16

Raichu2Card:
	db TYPE_PKMN_LIGHTNING
	gfx Raichu2CardGfx
	tx RaichuName
	db STAR
	db NEO_GENESIS | NONE
	dw RAICHU2 ; 16-bit card ID
	db 80
	db STAGE1
	tx PikachuName
	energy LIGHTNING, 1
	tx SparkName
	tx Do10To1BenchDesc
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw DamageAndDo10ToABenchEffectCommands + $4000
	db DAMAGE_TO_OPPONENT_BENCH
	db NONE
	db NONE
	db 10
	db ATK_ANIM_THUNDER_WHOLE_SCREEN
	energy LIGHTNING, 2, COLORLESS, 1,
	tx ShockBoltName
	tx MorePARIfHPLowDesc
	dw NONE
	db 40
	db DAMAGE_PLUS
	dw MorePARifHPLowEffectCommands + $4000
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_THUNDER
	db 1
	db WR_FIGHTING
	db NONE
	tx MouseName
	db 26
	db 0
	db 39
	db 2, 7
	dw 66 * 10
	tx Raichu2Description
	db 19

Mareep1Card:
	db TYPE_PKMN_LIGHTNING
	gfx Mareep1CardGfx
	tx MareepName
	db CIRCLE
	db NEO_GENESIS | NONE
	dw MAREEP1 ; 16-bit card ID
	db 40
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx GrowlName
	tx ReduceDamageBy10Desc
	dw NONE
	db 0
	db DAMAGE_NORMAL
	dw ReduceDamageBy10EffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 10
	db ATK_ANIM_SUPERSONIC
	energy LIGHTNING, 2
	tx ThundershockName
	tx MayInflictParalysisDescription
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw MayInflictParalysisEffectCommands + $4000
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_THUNDERSHOCK
	db 1
	db WR_FIGHTING
	db NONE
	tx WoolName
	db 179
	db 0
	db 14
	db 2, 0
	dw 17 * 10
	tx Mareep1Description
	db 16

Mareep2Card:
	db TYPE_PKMN_LIGHTNING
	gfx Mareep2CardGfx
	tx MareepName
	db CIRCLE
	db NEO_GENESIS | NONE
	dw MAREEP2 ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy LIGHTNING, 1, COLORLESS, 1
	tx ThunderJoltName
	tx MayDo10ToSelfDesc
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw CFT10ToSelfEffectCommands + $4000
	db LOW_RECOIL
	db NONE
	db NONE
	db 0
	db ATK_ANIM_THUNDERSHOCK
	energy 0
	dw NONE
	dw NONE
	dw NONE
	db 0
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_NONE
	db 1
	db WR_FIGHTING
	db NONE
	tx WoolName
	db 179
	db 0
	db 11
	db 2, 0
	dw 17 * 10
	tx Mareep2Description
	db 16

Flaaffy1Card:
	db TYPE_PKMN_LIGHTNING
	gfx Flaaffy1CardGfx
	tx FlaaffyName
	db DIAMOND
	db NEO_GENESIS | NONE
	dw FLAAFFY1 ; 16-bit card ID
	db 70
	db STAGE1
	tx MareepName
	energy LIGHTNING, 1
	tx ChargeName
	tx EnergyAbsorptionDescription
	dw NONE
	db 0
	db RESIDUAL
	dw Get2DiscardEnergyAttachToSelfEffectCommands + $4000
	db NONE
	db NONE
	db SPECIAL_AI_HANDLING
	db 0
	db ATK_ANIM_GLOW_EFFECT
	energy LIGHTNING, 2
	tx ThunderpunchName
	tx MayDoPlus10or10ToSelfDesc
	dw NONE
	db 30
	db DAMAGE_PLUS
	dw MayDoPlus10Or10ToSelfEffectCommands + $4000
	db LOW_RECOIL
	db NONE
	db NONE
	db 0
	db ATK_ANIM_THUNDERPUNCH
	db 1
	db WR_FIGHTING
	db NONE
	tx WoolName
	db 180
	db 0
	db 21
	db 2, 7
	dw 29 * 10
	tx Flaaffy1Description
	db 3

Flaaffy2Card:
	db TYPE_PKMN_LIGHTNING
	gfx Flaaffy2CardGfx
	tx FlaaffyName
	db DIAMOND
	db NEO_GENESIS | NONE
	dw FLAAFFY2 ; 16-bit card ID
	db 60
	db STAGE1
	tx MareepName
	energy LIGHTNING, 1
	tx ThreatenName
	tx NoTrainersDesc
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw NoOppTrainersEffectCommands + $4000
	db NONE
	db (1 << 6)
	db NONE
	db 2
	db ATK_ANIM_DARK_MIND
	energy LIGHTNING, 1, COLORLESS, 1
	tx StunWaveName
	tx NoPokepowersNextTurnDesc
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw NoPokepowersNextTurnEffect + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_THUNDER_WAVE
	db 1
	db WR_FIGHTING
	db NONE
	tx WoolName
	db 180
	db 0
	db 29
	db 2, 7
	dw 29 * 10
	tx Flaaffy2Description
	db 0

Ampharos1Card:
	db TYPE_PKMN_LIGHTNING
	gfx Ampharos1CardGfx
	tx AmpharosName
	db STAR
	db NEO_GENESIS | NONE
	dw AMPHAROS1 ; 16-bit card ID
	db 90
	db STAGE2
	tx FlaaffyName
	energy 0
	tx EnergyFluxName
	tx EnergyTransDescription
	dw NONE
	db 0
	db POKEMON_POWER
	dw EnergyTransEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_PKMN_POWER_1
	energy LIGHTNING, 3, COLORLESS, 1
	tx GigashockName
	tx Do10To3BenchedDesc
	dw NONE
	db 40
	db DAMAGE_NORMAL
	dw Do10To3BenchedEffectCommands + $4000
	db DAMAGE_TO_OPPONENT_BENCH
	db NONE
	db NONE
	db 10
	db ATK_ANIM_THUNDER_WHOLE_SCREEN
	db 2
	db WR_FIGHTING
	db NONE
	tx LightName
	db 181
	db 0
	db 48
	db 4, 7
	dw 135 * 10
	tx Ampharos1Description
	db 0

Ampharos2Card:
	db TYPE_PKMN_LIGHTNING
	gfx Ampharos2CardGfx
	tx AmpharosName
	db STAR
	db NEO_DISCOVERY | NONE
	dw AMPHAROS2 ; 16-bit card ID
	db 80
	db STAGE2
	tx FlaaffyName
	energy 0
	tx ConductivityName
	tx ConductivityDesc
	dw NONE
	db 0
	db POKEMON_POWER
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_GLOW_EFFECT
	energy LIGHTNING, 2, COLORLESS, 2
	tx GigavoltName
	tx CFHPlus20orTPARDesc
	dw NONE
	db 30
	db DAMAGE_PLUS
	dw MayDo20MoreOrPRZEffectCommands + $4000
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_BLIZZARD
	db 2
	db WR_FIGHTING
	db NONE
	tx LightName
	db 181
	db 0
	db 45
	db 4, 7
	dw 135 * 10
	tx Ampharos2Description
	db 0

MagnemiteCard:
	db TYPE_PKMN_LIGHTNING
	gfx MagnemiteCardGfx
	tx MagnemiteName
	db CIRCLE
	db NEO_REVELATION | NONE
	dw MAGNEMITE ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy LIGHTNING, 1
	tx MagnetismName
	tx SwitchOppDesc
	dw NONE
	db 0
	db RESIDUAL
	dw SwitchOppEffectCommands + $4000
	db NONE
	db SWITCH_OPPONENT_POKEMON
	db NONE
	db 0
	db ATK_ANIM_THUNDER_WAVE ; mapped from ATK_ANIM_MAGNETISM
	energy LIGHTNING, 1, COLORLESS, 1
	tx ThundershockName
	tx MayInflictParalysisDescription
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw MayInflictParalysisEffectCommands + $4000
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_THUNDERSHOCK
	db 1
	db WR_FIGHTING
	db NONE
	tx MagnetName
	db 82
	db 0
	db 14
	db 1, 0
	dw 13 * 10
	tx MagnemiteDescription
	db 19

MagnetonCard:
	db TYPE_PKMN_LIGHTNING
	gfx MagnetonCardGfx
	tx MagnetonName
	db DIAMOND
	db NEO_REVELATION | NONE
	dw MAGNETON ; 16-bit card ID
	db 80
	db STAGE1
	tx MagnemiteName
	energy 0
	tx DisruptionName
	tx ETBNoOPPTrainersDescription
	dw NONE
	db 0
	db POKEMON_POWER
	dw ETBNoOppTrainersEffectCommands + $4000
	db NONE
	db (1 << 6)
	db NONE
	db 0
	db ATK_ANIM_PKMN_POWER_1
	energy LIGHTNING, 2, COLORLESS, 1
	tx EMPName
	tx NoPokepowersNextTurnDesc
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw NoPokepowersNextTurnEffect + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_MAGNETIC_STORM
	db 2
	db WR_FIGHTING
	db NONE
	tx MagnetName
	db 82
	db 0
	db 33
	db 3, 3
	dw 132 * 10
	tx MagnetonDescription
	db 19

NeoVoltorbCard:
	db TYPE_PKMN_LIGHTNING
	gfx NeoVoltorbCardGfx
	tx VoltorbName
	db CIRCLE
	db NEO_DESTINY | NONE
	dw NEO_VOLTORB ; 16-bit card ID
	db 40
	db BASIC
	dw NONE
	energy LIGHTNING, 1
	tx SwiftName
	tx DontApplyWRDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw DontApplyWREffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_CONFUSE_RAY
	energy 0
	dw NONE
	dw NONE
	dw NONE
	db 0
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_NONE
	db 1
	db WR_FIGHTING
	db NONE
	tx BallName
	db 100
	db 0
	db 8
	db 1, 8
	dw 23 * 10
	tx VoltorbDescription
	db 19

ElectrodeCard:
	db TYPE_PKMN_LIGHTNING
	gfx ElectrodeCardGfx
	tx ElectrodeName
	db DIAMOND
	db NEO_DESTINY | NONE
	dw ELECTRODE ; 16-bit card ID
	db 80
	db STAGE1
	tx VoltorbName
	energy LIGHTNING, 1, COLORLESS, 1
	tx EnergyBoostName
	tx SearchEnergyAndAttachDesc
	dw NONE
	db 0
	db RESIDUAL
	dw SearchAndAttachEnergyEffectCommands + $4000
	db NONE
	db NONE
	db SPECIAL_AI_HANDLING
	db 0
	db ATK_ANIM_GLOW_EFFECT
	energy LIGHTNING, 2, COLORLESS, 1
	tx EnergyBurstName
	tx Do10xPerYouAndOppEnergyDesc
	dw NONE
	db 10
	db DAMAGE_X
	dw Do10XPerYouAndOppEnergiesEffectCommands + $4000
	db NONE
	db ATTACHED_ENERGY_BOOST
	db NONE
	db MAX_ENERGY_BOOST_IS_NOT_LIMITED
	db ATK_ANIM_BIG_SELFDESTRUCTION
	db 1
	db WR_FIGHTING
	db NONE
	tx BallName
	db 101
	db 0
	db 29
	db 3, 11
	dw 147 * 10
	tx ElectrodeDescription
	db 19

ElekidCard:
	db TYPE_PKMN_LIGHTNING
	gfx ElekidCardGfx
	tx ElekidName
	db CIRCLE
	db NEO_DISCOVERY | NONE
	dw ELEKID ; 16-bit card ID
	db 30
	db BASIC
	dw NONE
	energy LIGHTNING, 1
	tx ThundershockName
	tx MayInflictParalysisDescription
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw MayInflictParalysisEffectCommands + $4000
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_THUNDERSHOCK
	energy 0
	dw NONE
	dw NONE
	dw NONE
	db 0
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_NONE
	db 0
	db NONE
	db NONE
	tx ElectricName
	db 239
	db 0
	db 5
	db 2, 0
	dw 52 * 10
	tx ElekidDescription
	db 0

ElectabuzzCard:
	db TYPE_PKMN_LIGHTNING
	gfx ElectabuzzCardGfx
	tx ElectabuzzName
	db DIAMOND
	db NEO_DISCOVERY | NONE
	dw ELECTABUZZ ; 16-bit card ID
	db 60
	db BASIC
	dw NONE
	energy COLORLESS, 2
	tx SwiftName
	tx DontApplyWRDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw DontApplyWREffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_CONFUSE_RAY
	energy LIGHTNING, 2
	tx ThunderpunchName
	tx MayDoPlus10or10ToSelfDesc
	dw NONE
	db 30
	db DAMAGE_PLUS
	dw MayDoPlus10Or10ToSelfEffectCommands + $4000
	db LOW_RECOIL
	db NONE
	db NONE
	db 0
	db ATK_ANIM_THUNDERPUNCH
	db 1
	db WR_FIGHTING
	db NONE
	tx ElectricName
	db 125
	db 0
	db 32
	db 3, 7
	dw 66 * 10
	tx ElectabuzzDescription
	db 19

ZapdosCard:
	db TYPE_PKMN_LIGHTNING
	gfx ZapdosCardGfx
	tx ZapdosName
	db STAR
	db NEO_DESTINY | NONE
	dw ZAPDOS ; 16-bit card ID
	db 70
	db BASIC
	dw NONE
	energy LIGHTNING, 1
	tx ThundershockName
	tx MayInflictParalysisDescription
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw MayInflictParalysisEffectCommands + $4000
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_THUNDERSHOCK
	energy LIGHTNING, 3
	tx LightningBurnName
	tx CF20ToABenchDesc
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw CF20ToABenchEffectCommands + $4000
	db DAMAGE_TO_OPPONENT_BENCH
	db NONE
	db NONE
	db 20
	db ATK_ANIM_THUNDER_WHOLE_SCREEN
	db 2
	db NONE
	db WR_FIGHTING
	tx ElectricName
	db 145
	db 0
	db 37
	db 1, 8
	dw 12 * 10
	tx ZapdosDescription
	db 19

RaikouCard:
	db TYPE_PKMN_LIGHTNING
	gfx RaikouCardGfx
	tx RaikouName
	db STAR
	db NEO_REVELATION | NONE
	dw RAIKOU ; 16-bit card ID
	db 70
	db BASIC
	dw NONE
	energy 0
	tx LightningBurstName
	tx LightningBurstDescription
	dw NONE
	db 0
	db POKEMON_POWER
	dw ETB30ToARandomEffectCommands + $4000
	db DAMAGE_TO_OPPONENT_BENCH
	db NONE
	db NONE
	db 0
	db ATK_ANIM_PEAL_OF_THUNDER
	energy LIGHTNING, 3,
	tx ThunderName
	tx MayDo30ToSelfDesc
	dw NONE
	db 60
	db DAMAGE_NORMAL
	dw CFT30ToSelfEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_THUNDER
	db 1
	db WR_FIGHTING
	db NONE
	tx ThunderName
	db 243
	db 0
	db 45
	db 6, 3
	dw 392 * 10
	tx RaikouDescription
	db 19

RaichuSCard:
	db TYPE_PKMN_LIGHTNING
	gfx RaichuSCardGfx
	tx RaichuName
	db STAR
	db NEO_DISCOVERY | NONE
	dw RAICHU_S ; 16-bit card ID
	db 90
	db STAGE1
	tx PikachuName
	energy LIGHTNING, 1, WATER, 1
	tx SparkName
	tx Do10To1BenchDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw DamageAndDo10ToABenchEffectCommands + $4000
	db DAMAGE_TO_OPPONENT_BENCH
	db NONE
	db NONE
	db 10
	db ATK_ANIM_THUNDER_WHOLE_SCREEN
	energy LIGHTNING, 2, WATER, 2
	tx ThundersquallName
	tx MayDo20ToEachOppsBenchDesc
	dw NONE
	db 60
	db DAMAGE_NORMAL
	dw MayDo20ToEachOppBenchEffectCommands + $4000
	db DAMAGE_TO_OPPONENT_BENCH
	db NONE
	db NONE
	db 1
	db ATK_ANIM_THUNDERSTORM
	db 1
	db WR_FIGHTING
	db NONE
	tx MouseName
	db 26
	db 0
	db 67
	db 2, 7
	dw 66 * 10
	tx RaichuSDescription
	db 0

NeoPoliwrathCard:
	db TYPE_PKMN_FIGHTING
	gfx NeoPoliwrathCardGfx
	tx PoliwrathName
	db DIAMOND
	db NEO_DISCOVERY | NONE
	dw NEO_POLIWRATH ; 16-bit card ID
	db 110
	db STAGE2
	tx PoliwhirlName
	energy FIGHTING, 1, COLORLESS, 1
	tx MegaPunchName
	dw NONE
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	energy FIGHTING, 2, COLORLESS, 2
	tx SubmissionName
	tx Do20ToSelfDesc
	dw NONE
	db 70
	db DAMAGE_NORMAL
	dw Do20ToSelfEffectCommands + $4000
	db LOW_RECOIL
	db NONE
	db NONE
	db 20
	db ATK_ANIM_HIT_RECOIL
	db 2
	db WR_PSYCHIC
	db NONE
	tx TadpoleName
	db 62
	db 0
	db 37
	db 4, 3
	dw 119 * 10
	tx PoliwrathDescription
	db 0

NeoAerodactylCard:
	db TYPE_PKMN_FIGHTING
	gfx NeoAerodactylCardGfx
	tx AerodactylName
	db DIAMOND
	db NEO_DESTINY | NONE
	dw NEO_AERODACTYL ; 16-bit card ID
	db 60
	db STAGE1
	tx FossilEggName
	energy COLORLESS, 1
	tx FossilHuntName
	tx SearchForFossilEggDesc
	dw NONE
	db 0
	db RESIDUAL
	dw GolduckPsyshockEffectCommands
	db NONE
	db NONE
	db SPECIAL_AI_HANDLING
	db 0
	db ATK_ANIM_GLOW_EFFECT
	energy FIGHTING, 1, COLORLESS, 1
	tx RisingLungeName
	tx MayDo20Plus20Desc
	dw NONE
	db 20
	db DAMAGE_PLUS
	dw MayDo20Plus20EffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_QUICK_ATTACK
	db 1
	db WR_WATER
	db WR_FIGHTING
	tx FossilName
	db 142
	db 0
	db 33
	db 5, 11
	dw 130 * 10
	tx AerodactylDescription
	db 21

SudowoodoCard:
	db TYPE_PKMN_FIGHTING
	gfx SudowoodoCardGfx
	tx SudowoodoName
	db DIAMOND
	db NEO_REVELATION | NONE
	dw SUDOWOODO ; 16-bit card ID
	db 60
	db BASIC
	dw NONE
	energy FIGHTING, 1
	tx FlailName
	tx Do10XPerSelfDamageDesc
	dw NONE
	db 10
	db DAMAGE_X
	dw Do10XPerSelfDamageEffectCommands + $4000
	db NONE
	db NONE
	db BOOST_IF_TAKEN_DAMAGE
	db 0
	db ATK_ANIM_BIG_HIT
	energy FIGHTING, 1, COLORLESS, 1
	tx RockThrowName
	dw NONE
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_ROCK_THROW
	db 3
	db WR_WATER
	db NONE
	tx ImitationName
	db 185
	db 0
	db 20
	db 3, 11
	dw 84 * 10
	tx SudowoodoDescription
	db 0

GligarCard:
	db TYPE_PKMN_FIGHTING
	gfx GligarCardGfx
	tx GligarName
	db DIAMOND
	db NEO_REVELATION | NONE
	dw GLIGAR ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy FIGHTING, 1, COLORLESS, 1
	tx StunPoisonName
	tx CFHPsnAndCfnDesc
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw MayPRZandPSNEffectCommands + $4000
	db INFLICT_POISON | INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_NEEDLES
	energy 0
	dw NONE
	dw NONE
	dw NONE
	db 0
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_NONE
	db 0
	db WR_WATER
	db WR_FIGHTING
	tx FlyScorpionName
	db 207
	db 0
	db 14
	db 3, 7
	dw 143 * 10
	tx GligarDescription
	db 0

NeoOnixCard:
	db TYPE_PKMN_FIGHTING
	gfx NeoOnixCardGfx
	tx OnixName
	db CIRCLE
	db NEO_GENESIS | NONE
	dw NEO_ONIX ; 16-bit card ID
	db 60
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx LeerName
	tx LeerDescription
	dw NONE
	db 0
	db DAMAGE_NORMAL
	dw CFHOppCantAttackEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 0
	db ATK_ANIM_NONE
	energy FIGHTING, 2
	tx RageName
	tx Do10MorePerSelfDamageDesc
	dw NONE
	db 10
	db DAMAGE_PLUS
	dw Do10MorePerSelfDamageEffectCommands + $4000
	db NONE
	db NONE
	db BOOST_IF_TAKEN_DAMAGE
	db 0
	db ATK_ANIM_HIT
	db 2
	db WR_GRASS
	db NONE
	tx RockSnakeName
	db 95
	db 0
	db 19
	db 28, 10
	dw 463 * 10
	tx OnixDescription
	db 0

SteelixCard:
	db TYPE_PKMN_FIGHTING
	gfx SteelixCardGfx
	tx SteelixName
	db STAR
	db NEO_GENESIS | NONE
	dw STEELIX ; 16-bit card ID
	db 110
	db STAGE1
	tx OnixName
	energy FIGHTING, 1, COLORLESS, 1
	tx HeavySlamName
	tx Do10lessPerOppRCDesc
	dw NONE
	db 40
	db DAMAGE_MINUS
	dw Do10LessPerOppRCEffectCommands + $4000
	db NONE
	db FLAG_2_BIT_7
	db NONE
	db 0
	db ATK_ANIM_HIT
	energy FIGHTING, 3, COLORLESS, 1
	tx IronTailName
	tx ReduceDamageby20Desc
	dw NONE
	db 50
	db DAMAGE_NORMAL
	dw ReduceBy20AfterAttackEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 0
	db ATK_ANIM_BIG_HIT
	db 4
	db WR_FIRE
	db WR_GRASS
	tx IronSnakeName
	db 208
	db 0
	db 53
	db 30, 2
	dw 882 * 10
	tx SteelixDescription
	db 0

ShuckleCard:
	db TYPE_PKMN_FIGHTING
	gfx ShuckleCardGfx
	tx ShuckleName
	db CIRCLE
	db NEO_DESTINY | NONE
	dw SHUCKLE ; 16-bit card ID
	db 60
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx WithdrawName
	tx PreventDamageButNotEffectsDesc
	dw NONE
	db 0
	db RESIDUAL
	dw MayPreventDamageOnlyEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 0
	db ATK_ANIM_NONE
	energy FIGHTING, 2
	tx WrapName
	tx MayInflictParalysisDescription
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw MayInflictParalysisEffectCommands + $4000
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	db 1
	db WR_WATER
	db NONE
	tx MoldName
	db 213
	db 0
	db 17
	db 2, 0
	dw 45 * 10
	tx ShuckleDescription
	db 0

SwinubCard:
	db TYPE_PKMN_FIGHTING
	gfx SwinubCardGfx
	tx SwinubName
	db CIRCLE
	db NEO_REVELATION | NONE
	dw SWINUB ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx TackleName
	dw NONE
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	energy FIGHTING, 1, COLORLESS, 1
	tx TakeDownName
	tx Do20toSelfDesc
	dw NONE
	db 40
	db DAMAGE_NORMAL
	dw Do20ToSelfEffectCommands + $4000
	db LOW_RECOIL
	db NONE
	db NONE
	db 20
	db ATK_ANIM_HIT_RECOIL
	db 1
	db WR_GRASS
	db WR_LIGHTNING
	tx PigName
	db 220
	db 0
	db 16
	db 1, 4
	dw 14 * 10
	tx SwinubDescription
	db 0

PiloswineCard:
	db TYPE_PKMN_FIGHTING
	gfx PiloswineCardGfx
	tx PiloswineName
	db DIAMOND
	db NEO_REVELATION | NONE
	dw PILOSWINE ; 16-bit card ID
	db 80
	db STAGE1
	tx SwinubName
	energy FIGHTING, 2
	tx RamName
	tx SwitchAfterDamageDesc
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw SwitchOppAfterDamageEffectCommands + $4000
	db NONE
	db SWITCH_OPPONENT_POKEMON
	db NONE
	db 0
	db ATK_ANIM_HIT
	energy FIGHTING, 3, COLORLESS, 1
	tx EarthquakeName
	tx Do10ToOwnBenchDesc
	dw NONE
	db 70
	db DAMAGE_NORMAL
	dw Do10ToOwnBenchEffectCommands + $4000
	db NONE
	db NONE
	db SPECIAL_AI_HANDLING
	db 0
	db ATK_ANIM_HIT
	db 3
	db WR_GRASS
	db WR_LIGHTNING
	tx SwineName
	db 221
	db 0
	db 40
	db 3, 7
	dw 123 * 10
	tx PiloswineDescription
	db 0

CorsolaCard:
	db TYPE_PKMN_FIGHTING
	gfx CorsolaCardGfx
	tx CorsolaName
	db CIRCLE
	db NEO_DESTINY | NONE
	dw CORSOLA ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy WATER, 1
	tx RecoverName
	tx Discard1WHealAllDamageDesc
	dw NONE
	db 0
	db RESIDUAL
	dw Discard1WHealAllDamageCommands + $4000
	db NONE
	db DISCARD_ENERGY
	db NONE
	db 3
	db ATK_ANIM_RECOVER
	energy FIGHTING, 1, COLORLESS, 1
	tx SpikeCannonName
	tx DoubleAttackX30Description
	dw NONE
	db 30
	db DAMAGE_X
	dw CF30X2DamageEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_NEEDLES
	db 1
	db WR_GRASS
	db NONE
	tx CoralName
	db 222
	db 0
	db 25
	db 2, 0
	dw 11 * 10
	tx CorsolaDescription
	db 0

Phanpy1Card:
	db TYPE_PKMN_FIGHTING
	gfx Phanpy1CardGfx
	tx PhanpyName
	db CIRCLE
	db NEO_GENESIS | NONE
	dw PHANPY1 ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx SnivelName
	tx ReduceBy20Descr
	dw NONE
	db 0
	db DAMAGE_NORMAL
	dw ReduceDamageBy20EffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 10
	db ATK_ANIM_CRY
	energy FIGHTING, 1, COLORLESS, 1
	tx RamName
	tx SwitchAfterDamageDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw SwitchOppAfterDamageEffectCommands + $4000
	db NONE
	db SWITCH_OPPONENT_POKEMON
	db NONE
	db 0
	db ATK_ANIM_HIT
	db 1
	db WR_GRASS
	db WR_LIGHTNING
	tx LongNoseName
	db 231
	db 0
	db 9
	db 1, 8
	dw 74 * 10
	tx Phanpy1Description
	db 0

Phanpy2Card:
	db TYPE_PKMN_FIGHTING
	gfx Phanpy2CardGfx
	tx PhanpyName
	db CIRCLE
	db NEO_DESTINY | NONE
	dw PHANPY2 ; 16-bit card ID
	db 60
	db BASIC
	dw NONE
	energy FIGHTING, 1
	tx SandAttackName
	tx OpponentAttackMayDoNothingDescription
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw SandshrewSandAttackEffectCommands
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 0
	db ATK_ANIM_DARK_GAS
	energy COLORLESS, 1
	tx FlailName
	tx Do10XPerSelfDamageDesc
	dw NONE
	db 10
	db DAMAGE_X
	dw Do10XPerSelfDamageEffectCommands + $4000
	db NONE
	db NONE
	db BOOST_IF_TAKEN_DAMAGE
	db 0
	db ATK_ANIM_BIG_HIT
	db 1
	db WR_GRASS
	db WR_LIGHTNING
	tx LongNoseName
	db 231
	db 0
	db 14
	db 1, 8
	dw 74 * 10
	tx Phanpy2Description
	db 19

Donphan1Card:
	db TYPE_PKMN_FIGHTING
	gfx Donphan1CardGfx
	tx DonphanName
	db DIAMOND
	db NEO_GENESIS | NONE
	dw DONPHAN1 ; 16-bit card ID
	db 80
	db STAGE1
	tx PhanpyName
	energy COLORLESS, 1
	tx FlailName
	tx Do10XPerSelfDamageDesc
	dw NONE
	db 10
	db DAMAGE_X
	dw CanSwitchOppBeforeDamageEffectCommands + $4000
	db NONE
	db NONE
	db BOOST_IF_TAKEN_DAMAGE
	db 0
	db ATK_ANIM_BIG_HIT
	energy FIGHTING, 1, COLORLESS, 2
	tx RapidSpinName
	tx CanSwitchSelfAfterDamageDesc
	dw NONE
	db 40
	db DAMAGE_NORMAL
	dw CanSwitchSelfAfterDamageEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_BIG_HIT
	db 3
	db WR_GRASS
	db WR_LIGHTNING
	tx ArmorName
	db 232
	db 0
	db 35
	db 3, 7
	dw 264 * 10
	tx Donphan1Description
	db 0

Donphan2Card:
	db TYPE_PKMN_FIGHTING
	gfx Donphan2CardGfx
	tx DonphanName
	db STAR
	db NEO_DESTINY | NONE
	dw DONPHAN2 ; 16-bit card ID
	db 80
	db STAGE1
	tx PhanpyName
	energy FIGHTING, 2, COLORLESS, 1
	tx ThrashName
	tx IfNoKOThenReturntoHandDesc
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw IfNoKOReturnToHandEffectCommands + $4000
	db NONE
	db FLAG_2_BIT_7
	db NONE
	db 0
	db ATK_ANIM_MULTIPLE_SLASH
	energy FIGHTING, 4
	tx GreatTuskName
	dw NONE
	dw NONE
	db 60
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_BIG_HIT
	db 3
	db WR_GRASS
	db WR_LIGHTNING
	tx ArmorName
	db 232
	db 0
	db 41
	db 3, 7
	dw 264 * 10
	tx Donphan2Description
	db 19

NeoMachopCard:
	db TYPE_PKMN_FIGHTING
	gfx NeoMachopCardGfx
	tx MachopName
	db CIRCLE
	db NEO_DISCOVERY | NONE
	dw NEO_MACHOP ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy FIGHTING, 1, COLORLESS, 1
	tx LowKickName
	tx Do10PerOppRCDesc
	dw NONE
	db 10
	db DAMAGE_X
	dw Do10PerOppRCEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	energy FIGHTING, 1, COLORLESS, 1
	tx FlingName
	tx SwitchAfterDamageDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw SwitchOppAfterDamageEffectCommands + $4000
	db NONE
	db SWITCH_OPPONENT_POKEMON
	db NONE
	db 0
	db ATK_ANIM_HIT
	db 1
	db WR_PSYCHIC
	db NONE
	tx SuperpowerName
	db 66
	db 0
	db 8
	db 2, 7
	dw 43 * 10
	tx MachopDescription
	db 19

NeoMachokeCard:
	db TYPE_PKMN_FIGHTING
	gfx NeoMachokeCardGfx
	tx MachokeName
	db DIAMOND
	db NEO_DISCOVERY | NONE
	dw NEO_MACHOKE ; 16-bit card ID
	db 80
	db STAGE1
	tx MachopName
	energy FIGHTING, 1, COLORLESS, 1
	tx MegaPunchName
	dw NONE
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	energy FIGHTING, 2, COLORLESS, 1
	tx VitalThrowName
	tx VitalThrowDesc
	dw NONE
	db 50
	db DAMAGE_MINUS
	dw ArticunoFreezeDryEffectCommands
	db NONE
	db SWITCH_OPPONENT_POKEMON
	db NONE
	db 0
	db ATK_ANIM_HIT
	db 2
	db WR_PSYCHIC
	db NONE
	tx SuperpowerName
	db 67
	db 0
	db 31
	db 4, 11
	dw 155 * 10
	tx MachokeDescription
	db 19

NeoMachampCard:
	db TYPE_PKMN_FIGHTING
	gfx NeoMachampCardGfx
	tx MachampName
	db STAR
	db NEO_DISCOVERY | NONE
	dw NEO_MACHAMP ; 16-bit card ID
	db 110
	db STAGE2
	tx MachokeName
	energy FIGHTING, 1, COLORLESS, 1
	tx DragOffName
	tx CanSwitchDPBeforeDamageDesc
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw CanSwitchOppBeforeDamageEffectCommands + $4000
	db NONE
	db SWITCH_OPPONENT_POKEMON
	db NONE
	db 0
	db ATK_ANIM_HIT
	energy FIGHTING, 2, COLORLESS, 2
	tx IronFistName
	tx Do10MorePerInjuredPokesDesc
	dw NONE
	db 40
	db DAMAGE_PLUS
	dw Do10MorePerInjuredPokesEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_BIG_HIT
	db 3
	db WR_PSYCHIC
	db NONE
	tx SuperpowerName
	db 68
	db 0
	db 67
	db 5, 3
	dw 286 * 10
	tx MachampDescription
	db 19

TyrogueCard:
	db TYPE_PKMN_FIGHTING
	gfx TyrogueCardGfx
	tx TyrogueName
	db CIRCLE
	db NEO_GENESIS | NONE
	dw TYROGUE ; 16-bit card ID
	db 30
	db BASIC
	dw NONE
	energy FIGHTING, 1
	tx CallforFriendName
	tx SearchForTandPutOnBenchDesc
	dw NONE
	db 0
	db RESIDUAL
	dw SearchForTPutOnBenchEffectCommands + $4000
	db NONE
	db NONE
	db SPECIAL_AI_HANDLING
	db 0
	db ATK_ANIM_GLOW_EFFECT
	energy FIGHTING, 1
	tx SmashKickName
	tx MayDoNothingDescription
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw AttackMayDoNothingEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	db 0
	db NONE
	db NONE
	tx ScuffleName
	db 236
	db 0
	db 5
	db 2, 4
	dw 46 * 10
	tx TyrogueDescription
	db 0

NeoHitmonleeCard:
	db TYPE_PKMN_FIGHTING
	gfx NeoHitmonleeCardGfx
	tx HitmonleeName
	db DIAMOND
	db NEO_REVELATION | NONE
	dw NEO_HITMONLEE ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy FIGHTING, 1
	tx LowKickName
	tx Do10PerOppRCDesc
	dw NONE
	db 10
	db DAMAGE_X
	dw Do10PerOppRCEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	energy FIGHTING, 2, COLORLESS, 1
	tx HighJumpKickName
	tx MayDo30ToSelfDesc
	dw NONE
	db 50
	db DAMAGE_NORMAL
	dw CFT30ToSelfEffectCommands + $4000
	db LOW_RECOIL
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT ; mapped from ATK_ANIM_KICK
	db 2
	db WR_PSYCHIC
	db NONE
	tx KickingName
	db 106
	db 0
	db 26
	db 4, 11
	dw 109 * 10
	tx HitmonleeDescription
	db 17

NeoHitmonchanCard:
	db TYPE_PKMN_FIGHTING
	gfx NeoHitmonchanCardGfx
	tx HitmonchanName
	db DIAMOND
	db NEO_DISCOVERY | NONE
	dw NEO_HITMONCHAN ; 16-bit card ID
	db 60
	db BASIC
	dw NONE
	energy FIGHTING, 1
	tx JabName
	dw NONE
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_PUNCH
	energy FIGHTING, 2, COLORLESS, 1
	tx SpecialPunch
	tx DontApplyWRDesc
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw DontApplyWREffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_PUNCH
	db 3
	db WR_PSYCHIC
	db NONE
	tx PunchingName
	db 107
	db 0
	db 30
	db 4, 7
	dw 110 * 10
	tx HitmonchanDescription
	db 0

HitmontopCard:
	db TYPE_PKMN_FIGHTING
	gfx HitmontopCardGfx
	tx HitmontopName
	db STAR
	db NEO_DESTINY | NONE
	dw HITMONTOP ; 16-bit card ID
	db 60
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx CurlUpName
	tx PreventDamageButNotEffectsDesc
	dw NONE
	db 0
	db RESIDUAL
	dw MayPreventDamageOnlyEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 0
	db ATK_ANIM_NONE
	energy FIGHTING, 3
	tx TripleKickName
	tx TripleAttackX30Description
	dw NONE
	db 30
	db DAMAGE_X
	dw CF30X3EffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	db 1
	db WR_PSYCHIC
	db NONE
	tx HandstandName
	db 237
	db 0
	db 33
	db 4, 7
	dw 106 * 10
	tx HitmontopDescription
	db 21

NeoRhyhornCard:
	db TYPE_PKMN_FIGHTING
	gfx NeoRhyhornCardGfx
	tx RhyhornName
	db DIAMOND
	db NEO_DISCOVERY | NONE
	dw NEO_RHYHORN ; 16-bit card ID
	db 60
	db BASIC
	dw NONE
	energy FIGHTING, 1, COLORLESS, 1
	tx RageName
	tx Do10MorePerSelfDamageDesc
	dw NONE
	db 10
	db DAMAGE_PLUS
	dw Do10MorePerSelfDamageEffectCommands + $4000
	db NONE
	db NONE
	db BOOST_IF_TAKEN_DAMAGE
	db 0
	db ATK_ANIM_HIT
	energy FIGHTING, 1, COLORLESS, 1
	tx TakeDownName
	tx Do20toSelfDesc
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw MachokeSubmissionEffectCommands
	db LOW_RECOIL
	db NONE
	db NONE
	db 20
	db ATK_ANIM_HIT_RECOIL
	db 2
	db WR_GRASS
	db WR_LIGHTNING
	tx SpikesName
	db 111
	db 0
	db 19
	db 3, 3
	dw 253 * 10
	tx RhyhornDescription
	db 19

NeoRhydonCard:
	db TYPE_PKMN_FIGHTING
	gfx NeoRhydonCardGfx
	tx RhydonName
	db STAR
	db NEO_DISCOVERY | NONE
	dw NEO_RHYDON ; 16-bit card ID
	db 110
	db STAGE1
	tx RhyhornName
	energy FIGHTING, 1, COLORLESS, 2
	tx StompName
	tx CFH30Plus20DamageDesc
	dw NONE
	db 30
	db DAMAGE_PLUS
	dw MayDo30Plus20EffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_BIG_HIT
	energy FIGHTING, 3, COLORLESS, 1
	tx HornDrillName
	tx CanOnlyUseOnceDesc
	dw NONE
	db 100
	db DAMAGE_NORMAL
	dw CanOnlyUseAttackOnceEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_DRILL
	db 4
	db WR_GRASS
	db WR_LIGHTNING
	tx DrillName
	db 112
	db 0
	db 60
	db 6, 3
	dw 264 * 10
	tx RhydonDescription
	db 19

LarvitarCard:
	db TYPE_PKMN_FIGHTING
	gfx LarvitarCardGfx
	tx LarvitarName
	db CIRCLE
	db NEO_DISCOVERY | NONE
	dw LARVITAR ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx LeerName
	tx LeerDescription
	dw NONE
	db 0
	db DAMAGE_NORMAL
	dw CFHOppCantAttackEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 0
	db ATK_ANIM_NONE
	energy FIGHTING, 1, COLORLESS, 1
	tx RockThrowName
	dw NONE
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_ROCK_THROW
	db 1
	db WR_GRASS
	db WR_LIGHTNING
	tx RockSkinName
	db 246
	db 0
	db 19
	db 2, 0
	dw 158 * 10
	tx LarvitarDescription
	db 16

PupitarCard:
	db TYPE_PKMN_FIGHTING
	gfx PupitarCardGfx
	tx PupitarName
	db DIAMOND
	db NEO_DISCOVERY | NONE
	dw PUPITAR ; 16-bit card ID
	db 70
	db STAGE1
	tx LarvitarName
	energy COLORLESS, 2
	tx TackleName
	dw NONE
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	energy FIGHTING, 2
	tx SandstormName
	tx Do10ToAllOppBenchDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw Do10ToAllOppBenchedEffectCommands + $4000
	db DAMAGE_TO_OPPONENT_BENCH
	db NONE
	db NONE
	db 0
	db ATK_ANIM_SMOG
	db 2
	db WR_GRASS
	db WR_LIGHTNING
	tx HardShellName
	db 247
	db 0
	db 37
	db 3, 11
	dw 287 * 10
	tx PupitarDescription
	db 0

TyranitarCard:
	db TYPE_PKMN_FIGHTING
	gfx TyranitarCardGfx
	tx TyranitarName
	db STAR
	db NEO_DISCOVERY | NONE
	dw TYRANITAR ; 16-bit card ID
	db 100
	db STAGE2
	tx PupitarName
	energy FIGHTING, 2, COLORLESS, 1
	tx HyperBeamName
	tx Discard1EnergyFromTargetDescription
	dw NONE
	db 40
	db DAMAGE_NORMAL
	dw Discard1EnergyFromTargetEffectCommands + $4000
	db NONE
	db NONE
	db SPECIAL_AI_HANDLING
	db 0
	db ATK_ANIM_HYPER_BEAM
	energy FIGHTING, 2, COLORLESS, 2
	tx TrampleName
	tx MayDo20ToEachOppsBenchDesc
	dw NONE
	db 60
	db DAMAGE_NORMAL
	dw MayDo20ToEachOppBenchEffectCommands + $4000
	db DAMAGE_TO_OPPONENT_BENCH
	db NONE
	db NONE
	db 1
	db ATK_ANIM_BIG_HIT
	db 4
	db WR_GRASS
	db WR_PSYCHIC
	tx ArmorName
	db 248
	db 0
	db 75
	db 6, 7
	dw 445 * 10
	tx TyranitarDescription
	db 19

KabutopsSCard:
	db TYPE_PKMN_FIGHTING
	gfx KabutopsSCardGfx
	tx KabutopsName
	db STAR
	db NEO_REVELATION | NONE
	dw KABUTOPS_S ; 16-bit card ID
	db 90
	db STAGE2
	tx KabutoName
	energy 0
	tx PrimalAuraName
	tx PrimalAuraDesc
	dw NONE
	db 0
	db POKEMON_POWER
	dw NoMoreEvosBothPlayersEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_PKMN_POWER_1
	energy FIGHTING, 2, GRASS, 1
	tx DrainSlashName
	tx Heal20IfSuccessDesc
	dw NONE
	db 50
	db DAMAGE_NORMAL
	dw Heal20IfSuccessEffectCommands + $4000
	db NONE
	db HEAL_USER
	db NONE
	db 0
	db ATK_ANIM_SONICBOOM
	db 2
	db WR_GRASS
	db NONE
	tx ShellfishName
	db 141
	db 0
	db 70
	db 4, 3
	dw 89 * 10
	tx KabutopsSDescription
	db 16

SteelixSCard:
	db TYPE_PKMN_FIGHTING
	gfx SteelixSCardGfx
	tx SteelixName
	db STAR
	db NEO_GENESIS | NONE
	dw STEELIX_S ; 16-bit card ID
	db 100
	db STAGE1
	tx OnixName
	energy FIGHTING, 1, LIGHTNING, 1
	tx SandstormName
	tx Do10ToAllOppBenchDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw Do10ToAllOppBenchedEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_SMOG
	energy FIGHTING, 2, LIGHTNING, 2
	tx TectonicRiftName
	tx Mill5CardsIfSuccessDesc
	dw NONE
	db 60
	db DAMAGE_NORMAL
	dw OppMill5IfSuccessEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_BIG_HIT
	db 4
	db WR_FIRE
	db WR_GRASS
	tx IronSnakeName
	db 208
	db 0
	db 63
	db 30, 2
	dw 882 * 10
	tx SteelixSDescription
	db 0

TyranitarSCard:
	db TYPE_PKMN_FIGHTING
	gfx TyranitarSCardGfx
	tx TyranitarName
	db STAR
	db NEO_DISCOVERY | NONE
	dw TYRANITAR_S ; 16-bit card ID
	db 100
	db STAGE2
	tx PupitarName
	energy FIGHTING, 1, FIRE, 1
	tx MountainCrushName
	tx Mill2PerHeadsDesc
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw CFXMill2PerHeadsEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_MULTIPLE_SLASH
	energy FIGHTING, 2, FIRE, 2
	tx HyperBeamName
	tx Discard1EnergyFromTargetDescription
	dw NONE
	db 70
	db DAMAGE_NORMAL
	dw Discard1EnergyFromTargetEffectCommands + $4000
	db NONE
	db NONE
	db SPECIAL_AI_HANDLING
	db 0
	db ATK_ANIM_HYPER_BEAM
	db 4
	db NONE
	db WR_PSYCHIC
	tx ArmorName
	db 249
	db 0
	db 81
	db 6, 7
	dw 445 * 10
	tx TyranitarSDescription
	db 0

GastlyCard:
	db TYPE_PKMN_PSYCHIC
	gfx GastlyCardGfx
	tx GastlyName
	db CIRCLE
	db NEO_DESTINY | NONE
	dw GASTLY ; 16-bit card ID
	db 30
	db BASIC
	dw NONE
	energy PSYCHIC, 1
	tx NightmareName
	tx InflictSleepDescription
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw InflictSleepAfterDamageEffectCommands + $4000
	db INFLICT_SLEEP
	db NONE
	db NONE
	db 0
	db ATK_ANIM_NIGHTMARE
	energy 0
	dw NONE
	dw NONE
	dw NONE
	db 0
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_NONE
	db 0
	db NONE
	db WR_FIGHTING
	tx GasName
	db 92
	db 0
	db 16
	db 4, 3
	dw 0 * 10
	tx GastlyDescription
	db 19

HaunterCard:
	db TYPE_PKMN_PSYCHIC
	gfx HaunterCardGfx
	tx HaunterName
	db DIAMOND
	db NEO_DESTINY | NONE
	dw HAUNTER ; 16-bit card ID
	db 60
	db STAGE1
	tx GastlyName
	energy PSYCHIC, 1
	tx HexName
	tx MoreDamageifDFPStatusedDesc
	dw NONE
	db 10
	db DAMAGE_PLUS
	dw Do20moreIfDFPStatusedEffectCommands + $4000
	db NONE
	db (1 << 6)
	db NONE
	db 2
	db ATK_ANIM_DARK_MIND
	energy PSYCHIC, 1, COLORLESS, 1
	tx ConfuseRayName
	tx MayInflictConfusionDescription
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw MayInflictConfusionEffectCommands + $4000
	db INFLICT_CONFUSION
	db NONE
	db NONE
	db 0
	db ATK_ANIM_CONFUSE_RAY
	db 0
	db NONE
	db WR_FIGHTING
	tx GasName
	db 93
	db 0
	db 28
	db 5, 3
	dw 0 * 10
	tx HaunterDescription
	db 0

NeoGengarCard:
	db TYPE_PKMN_PSYCHIC
	gfx NeoGengarCardGfx
	tx GengarName
	db STAR
	db NEO_DESTINY | NONE
	dw NEO_GENGAR ; 16-bit card ID
	db 80
	db STAGE2
	tx HaunterName
	energy 0
	tx DeepSleepName
	tx DeepSleepDesc
	dw NONE
	db 0
	db POKEMON_POWER
	dw DeepSleepEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_PKMN_POWER_1
	energy PSYCHIC, 2, COLORLESS, 1
	tx NightmareName
	tx InflictSleepDescription
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw InflictSleepAfterDamageEffectCommands + $4000
	db INFLICT_SLEEP
	db NONE
	db NONE
	db 0
	db ATK_ANIM_NIGHTMARE
	db 1
	db NONE
	db WR_FIGHTING
	tx ShadowName
	db 94
	db 0
	db 49
	db 4, 11
	dw 89 * 10
	tx GengarDescription
	db 0

MewtwoCard:
	db TYPE_PKMN_PSYCHIC
	gfx MewtwoCardGfx
	tx MewtwoName
	db STAR
	db NEO_DESTINY | NONE
	dw MEWTWO ; 16-bit card ID
	db 60
	db BASIC
	dw NONE
	energy PSYCHIC, 1
	tx SwiftName
	tx DontApplyWRDesc
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw DontApplyWREffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_CONFUSE_RAY
	energy PSYCHIC, 2, COLORLESS, 1
	tx PsychicName
	tx Do10MorePerOppEenergyDesc
	dw NONE
	db 20
	db DAMAGE_PLUS
	dw Do10MorePerOppEnergyEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_PSYCHIC_HIT
	db 2
	db WR_PSYCHIC
	db NONE
	tx GeneticName
	db 150
	db 0
	db 42
	db 6, 7
	dw 269 * 10
	tx MewtwoDescription
	db 0

MewCard:
	db TYPE_PKMN_PSYCHIC
	gfx MewCardGfx
	tx MewName
	db STAR
	db NEO_REVELATION | NONE
	dw MEW ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy PSYCHIC, 1
	tx DevolutionBeamName
	tx DevolutionBeamDescription
	dw NONE
	db 0
	db RESIDUAL
	dw DevolutionBeamEffectCommands + $4000
	db NONE
	db NONE
	db SPECIAL_AI_HANDLING
	db 0
	db ATK_ANIM_NONE
	energy PSYCHIC, 2
	tx SuperPsywaveName
	tx Do10PerEnergyAnyTargetDesc
	dw NONE
	db 0
	db DAMAGE_NORMAL
	dw AnyTarget10PerEnergyEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 10
	db ATK_ANIM_NONE
	db 1
	db WR_PSYCHIC
	db NONE
	tx NewSpeciesName
	db 151
	db 0
	db 38
	db 1, 4
	dw 9 * 10
	tx MewDescription
	db 0

NatuCard:
	db TYPE_PKMN_PSYCHIC
	gfx NatuCardGfx
	tx NatuName
	db CIRCLE
	db NEO_REVELATION | NONE
	dw NATU ; 16-bit card ID
	db 40
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx PeckName
	dw NONE
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	energy PSYCHIC, 2
	tx PsywaveName
	tx Do20ToABenchDesc
	dw NONE
	db 0
	db RESIDUAL
	dw Do20ToOppBenchOnlyEffectCommands + $4000
	db DAMAGE_TO_OPPONENT_BENCH
	db (1 << 6)
	db NONE
	db 3
	db ATK_ANIM_NONE
	db 0
	db WR_PSYCHIC
	db WR_FIGHTING
	tx LittleBirdName
	db 177
	db 0
	db 23
	db 0, 8
	dw 4 * 10
	tx NatuDescription
	db 16

XatuCard:
	db TYPE_PKMN_PSYCHIC
	gfx XatuCardGfx
	tx XatuName
	db DIAMOND
	db NEO_REVELATION | NONE
	dw XATU ; 16-bit card ID
	db 90
	db STAGE1
	tx NatuName
	energy PSYCHIC, 1
	tx ProphecyName
	tx ProphecyDescription
	dw NONE
	db 0
	db RESIDUAL
	dw ProphecyEffectCommands + $4000
	db NONE
	db (1 << 5)
	db NONE
	db 0
	db ATK_ANIM_GLOW_EFFECT
	energy PSYCHIC, 2, COLORLESS, 1
	tx ConfuseRayName
	tx MayInflictConfusionDescription
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw MayInflictConfusionEffectCommands + $4000
	db INFLICT_CONFUSION
	db NONE
	db NONE
	db 0
	db ATK_ANIM_CONFUSE_RAY
	db 1
	db WR_PSYCHIC
	db WR_FIGHTING
	tx MysticName
	db 178
	db 0
	db 39
	db 4, 11
	dw 33 * 10
	tx XatuDescription
	db 0

Espeon1Card:
	db TYPE_PKMN_PSYCHIC
	gfx Espeon1CardGfx
	tx EspeonName
	db STAR
	db NEO_DISCOVERY | NONE
	dw ESPEON1 ; 16-bit card ID
	db 70
	db STAGE1
	tx EeveeName
	energy 0
	tx PrecognitionName
	tx PrecognitionDescription
	dw NONE
	db 0
	db POKEMON_POWER
	dw PrecognitionEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_PKMN_POWER_1
	energy PSYCHIC, 2, COLORLESS, 1
	tx PsychicName
	tx Do10MorePerOppEenergyDesc
	dw NONE
	db 30
	db DAMAGE_PLUS
	dw Do10MorePerOppEnergyEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_PSYCHIC_HIT
	db 0
	db WR_PSYCHIC
	db NONE
	tx SunName
	db 196
	db 0
	db 43
	db 2, 11
	dw 58 * 10
	tx Espeon1Description
	db 19

Espeon2Card:
	db TYPE_PKMN_PSYCHIC
	gfx Espeon2CardGfx
	tx EspeonName
	db STAR
	db NEO_DESTINY | NONE
	dw ESPEON2 ; 16-bit card ID
	db 60
	db STAGE1
	tx EeveeName
	energy PSYCHIC, 1
	tx PsylockName
	tx NoRetreatText
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw NoRetreatEffectCommands + $4000
	db NONE
	db (1 << 6)
	db NONE
	db 1
	db ATK_ANIM_PSYCHIC_HIT
	energy PSYCHIC, 2, COLORLESS, 1
	tx PsysplashName
	tx PsysplashDesc
	dw NONE
	db 10
	db DAMAGE_X
	dw PsysplashEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_PSYCHIC_HIT
	db 0
	db WR_PSYCHIC
	db WR_FIGHTING
	tx SunName
	db 196
	db 0
	db 47
	db 2, 11
	dw 58 * 10
	tx Espeon2Description
	db 0

UmbreonCard:
	db TYPE_PKMN_PSYCHIC
	gfx UmbreonCardGfx
	tx UmbreonName
	db STAR
	db NEO_DISCOVERY | NONE
	dw UMBREON ; 16-bit card ID
	db 80
	db STAGE1
	tx EeveeName
	energy PSYCHIC, 1, COLORLESS, 1
	tx ThreatenName
	tx NoTrainersDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw NoOppTrainersEffectCommands + $4000
	db NONE
	db (1 << 6)
	db NONE
	db 2
	db ATK_ANIM_DARK_MIND
	energy PSYCHIC, 2, COLORLESS, 1
	tx FeintAttackName
	tx Do40AnyTargetDesc
	dw NONE
	db 0
	db DAMAGE_NORMAL
	dw Do40AnyTargetEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_NONE
	db 1
	db NONE
	db WR_PSYCHIC
	tx MoonlightName
	db 197
	db 0
	db 38
	db 3, 3
	dw 59 * 10
	tx UmbreonDescription
	db 1

