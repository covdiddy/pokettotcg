; Neo Gen 2 card data (Bank 2)

MurkrowCard:
	db TYPE_PKMN_PSYCHIC
	gfx MurkrowCardGfx
	tx MurkrowName
	db DIAMOND
	db NEO_REVELATION | NONE
	dw MURKROW ; 16-bit card ID
	db 40
	db BASIC
	dw NONE
	energy COLORLESS, 1
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
	energy COLORLESS, 2
	tx PesterName
	tx MoreDamageIfDFPInjuredDesc
	dw NONE
	db 10
	db DAMAGE_PLUS
	dw MoreDamageIfDFPInjuredEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	db 0
	db NONE
	db WR_PSYCHIC
	tx DarknessName
	db 198
	db 0
	db 20
	db 1, 8
	dw 5 * 10
	tx MurkrowDescription
	db 16

NeoAbraCard:
	db TYPE_PKMN_PSYCHIC
	gfx NeoAbraCardGfx
	tx AbraName
	db CIRCLE
	db NEO_DESTINY | NONE
	dw NEO_ABRA ; 16-bit card ID
	db 40
	db BASIC
	dw NONE
	energy PSYCHIC, 1
	tx TeleportName
	tx CanSwitchSelfAfterDamageDesc
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw CanSwitchSelfAfterDamageEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_PSYCHIC_HIT
	energy PSYCHIC, 1, COLORLESS, 1
	tx ConfuseRayName
	tx MayInflictConfusionDescription
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw MayInflictConfusionEffectCommands + $4000
	db INFLICT_CONFUSION
	db NONE
	db NONE
	db 0
	db ATK_ANIM_CONFUSE_RAY
	db 1
	db WR_PSYCHIC
	db NONE
	tx PsiName
	db 63
	db 0
	db 7
	db 2, 11
	dw 43 * 10
	tx AbraDescription
	db 19

NeoKadabraCard:
	db TYPE_PKMN_PSYCHIC
	gfx NeoKadabraCardGfx
	tx KadabraName
	db DIAMOND
	db NEO_DESTINY | NONE
	dw NEO_KADABRA ; 16-bit card ID
	db 70
	db STAGE1
	tx AbraName
	energy PSYCHIC, 1, COLORLESS, 1
	tx KinesisName
	tx DPMayDoNothingDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw SmokescreenEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 0
	db ATK_ANIM_PSYCHIC_HIT ; mapped from ATK_ANIM_SPECIAL_PSY
	energy PSYCHIC, 2
	tx MindShockName
	tx DontApplyWRDesc
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw DontApplyWREffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_PSYCHIC_HIT
	db 1
	db WR_PSYCHIC
	db NONE
	tx PsiName
	db 64
	db 0
	db 25
	db 4, 3
	dw 125 * 10
	tx KadabraDescription
	db 19

NeoAlakazamCard:
	db TYPE_PKMN_PSYCHIC
	gfx NeoAlakazamCardGfx
	tx AlakazamName
	db STAR
	db NEO_DESTINY | NONE
	dw NEO_ALAKAZAM ; 16-bit card ID
	db 100
	db STAGE2
	tx KadabraName
	energy PSYCHIC, 2
	tx PsymimicName
	tx PsymimicDescription
	dw NONE
	db 0
	db RESIDUAL
	dw CopyOppAttackEffectCommands + $4000
	db NONE
	db (1 << 6)
	db NONE
	db 0
	db ATK_ANIM_NONE
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
	db 3
	db WR_PSYCHIC
	db NONE
	tx PsiName
	db 65
	db 0
	db 45
	db 4, 11
	dw 106 * 10
	tx AlakazamDescription
	db 19

SlowpokeCard:
	db TYPE_PKMN_PSYCHIC
	gfx SlowpokeCardGfx
	tx SlowpokeName
	db CIRCLE
	db NEO_GENESIS | NONE
	dw SLOWPOKE ; 16-bit card ID
	db 60
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx NapName
	tx Heal1DamageDesc
	dw NONE
	db 0
	db RESIDUAL
	dw SelfHeal10EffectCommands + $4000
	db NONE
	db HEAL_USER
	db NONE
	db 1
	db ATK_ANIM_RECOVER
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
	db WR_PSYCHIC
	db NONE
	tx DopeyName
	db 79
	db 0
	db 19
	db 3, 11
	dw 79 * 10
	tx SlowpokeDescription
	db 16

NeoSlowbroCard:
	db TYPE_PKMN_PSYCHIC
	gfx NeoSlowbroCardGfx
	tx SlowbroName
	db DIAMOND
	db NEO_GENESIS | NONE
	dw NEO_SLOWBRO ; 16-bit card ID
	db 80
	db STAGE1
	tx SlowpokeName
	energy PSYCHIC, 1
	tx BarrierName
	tx ReduceDamageby20Desc
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw ReduceBy20AfterAttackEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 0
	db ATK_ANIM_BOYFRIENDS
	energy PSYCHIC, 2
	tx AmnesiaName
	tx OppCantDo1AttackDesc
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw OppCantUse1AttackEffectCommands + $4000
	db NONE
	db (1 << 6)
	db NONE
	db 2
	db ATK_ANIM_BONEMERANG
	db 2
	db WR_PSYCHIC
	db NONE
	tx HermitcrabName
	db 80
	db 0
	db 37
	db 5, 3
	dw 173 * 10
	tx SlowbroDescription
	db 0

SlowkingCard:
	db TYPE_PKMN_PSYCHIC
	gfx SlowkingCardGfx
	tx SlowkingName
	db STAR
	db NEO_GENESIS | NONE
	dw SLOWKING ; 16-bit card ID
	db 90
	db STAGE1
	tx SlowpokeName
	energy 0
	tx DamageSwapName
	tx DamageSwapDescription
	dw NONE
	db 0
	db POKEMON_POWER
	dw DamageSwapEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_PKMN_POWER_1
	energy PSYCHIC, 2, COLORLESS, 1
	tx PsyshockName
	tx CFHPlus10AndConfuseDesc
	dw NONE
	db 20
	db DAMAGE_PLUS
	dw MayDo10MoreAndConfuseEffectCommands + $4000
	db INFLICT_CONFUSION
	db (1 << 6)
	db NONE
	db 2
	db ATK_ANIM_PSYCHIC_HIT
	db 3
	db WR_PSYCHIC
	db NONE
	tx RoyalName
	db 199
	db 0
	db 45
	db 6, 7
	dw 175 * 10
	tx SlowkingDescription
	db 19

MisdreavusCard:
	db TYPE_PKMN_PSYCHIC
	gfx MisdreavusCardGfx
	tx MisdreavusName
	db STAR
	db NEO_REVELATION | NONE
	dw MISDREAVUS ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy PSYCHIC, 1
	tx NightEyesName
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
	energy PSYCHIC, 2, COLORLESS, 1
	tx PainSplitName
	tx PainSplitDesc
	dw NONE
	db 0
	db DAMAGE_NORMAL
	dw PainSplitEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_SELFDESTRUCT
	db 1
	db NONE
	db WR_FIGHTING
	tx ScreechName
	db 200
	db 0
	db 34
	db 2, 4
	dw 2 * 10
	tx MisdreavusDescription
	db 16

UnownACard:
	db TYPE_PKMN_PSYCHIC
	gfx UnownACardGfx
	tx UnownAName
	db CIRCLE
	db NEO_REVELATION | NONE
	dw UNOWN_A ; 16-bit card ID
	db 40
	db BASIC
	dw NONE
	energy PSYCHIC, 1
	tx ScavengeName
	tx GetTrainerCardDiscard1PDesc
	dw NONE
	db 0
	db RESIDUAL
	dw ScavengeEffectCommands + $4000
	db NONE
	db DISCARD_ENERGY
	db NONE
	db 2
	db ATK_ANIM_GLOW_EFFECT
	energy PSYCHIC, 1
	tx HiddenPowerName
	dw NONE
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw NONE
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_PSYCHIC_HIT
	db 1
	db WR_PSYCHIC
	db NONE
	tx SymbolName
	db 201
	db 0
	db 10
	db 1, 8
	dw 11 * 10
	tx UnownADescription
	db 1

UnownJCard:
	db TYPE_PKMN_PSYCHIC
	gfx UnownJCardGfx
	tx UnownJName
	db STAR
	db NEO_DESTINY | NONE
	dw UNOWN_J ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy PSYCHIC, 1
	tx SymbolSwarmName
	tx SearchFossilEggEffectCommandswnDesc
	dw NONE
	db 0
	db RESIDUAL
	dw SearchFossilEggEffectCommandswnEffectCommands + $4000
	db NONE
	db NONE
	db SPECIAL_AI_HANDLING
	db 0
	db ATK_ANIM_GLOW_EFFECT
	energy PSYCHIC, 2
	tx UnknownSpellName
	tx Do20PerUnownADesc
	dw NONE
	db 20
	db DAMAGE_X
	dw Do20PerUnownAEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_PSYCHIC_HIT
	db 1
	db WR_PSYCHIC
	db NONE
	tx SymbolName
	db 201
	db 0
	db 25
	db 1, 8
	dw 11 * 10
	tx UnownJDescription
	db 16

WobbuffetCard:
	db TYPE_PKMN_PSYCHIC
	gfx WobbuffetCardGfx
	tx WobbuffetName
	db DIAMOND
	db NEO_DESTINY | NONE
	dw WOBBUFFET ; 16-bit card ID
	db 90
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx BopName
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
	energy PSYCHIC, 1
	tx CounterName
	tx CounterDesc
	dw NONE
	db 0
	db DAMAGE_NORMAL
	dw CounterLastAttackEffectCommands + $4000
	db NONE
	db (1 << 6)
	db NONE
	db 0
	db ATK_ANIM_MIRROR_MOVE
	db 3
	db WR_PSYCHIC
	db NONE
	tx PatientName
	db 202
	db 0
	db 30
	db 4, 3
	dw 62 * 10
	tx WobbuffetDescription
	db 19

GirafarigCard:
	db TYPE_PKMN_PSYCHIC
	gfx GirafarigCardGfx
	tx GirafarigName
	db CIRCLE
	db NEO_DISCOVERY | NONE
	dw GIRAFARIG ; 16-bit card ID
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
	energy PSYCHIC, 2
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
	db 2
	db WR_PSYCHIC
	db NONE
	tx LongNeckName
	db 203
	db 0
	db 23
	db 4, 11
	dw 91 * 10
	tx GirafarigDescription
	db 16

SmoochumCard:
	db TYPE_PKMN_PSYCHIC
	gfx SmoochumCardGfx
	tx SmoochumName
	db CIRCLE
	db NEO_DESTINY | NONE
	dw SMOOCHUM ; 16-bit card ID
	db 30
	db BASIC
	dw NONE
	energy PSYCHIC, 1
	tx PsykissName
	tx Discard1EnergyFromTargetDescription
	dw NONE
	db 0
	db RESIDUAL
	dw Discard1EnergyFromTargetEffectCommands + $4000
	db NONE
	db NONE
	db SPECIAL_AI_HANDLING
	db 0
	db ATK_ANIM_LURE
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
	tx KissName
	db 238
	db 0
	db 5
	db 1, 4
	dw 13 * 10
	tx SmoochumDescription
	db 16

NeoJynxCard:
	db TYPE_PKMN_PSYCHIC
	gfx NeoJynxCardGfx
	tx JynxName
	db DIAMOND
	db NEO_DESTINY | NONE
	dw NEO_JYNX ; 16-bit card ID
	db 60
	db BASIC
	dw NONE
	energy PSYCHIC, 1
	tx ConfuseRayName
	tx MayInflictConfusionDescription
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw MayInflictConfusionEffectCommands + $4000
	db INFLICT_CONFUSION
	db NONE
	db NONE
	db 0
	db ATK_ANIM_CONFUSE_RAY
	energy PSYCHIC, 1, COLORLESS, 1
	tx MeditateName
	tx Do10MorePerOppDamageDesc
	dw NONE
	db 10
	db DAMAGE_PLUS
	dw Do10MorePerOppDamageEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_PSYCHIC_HIT
	db 2
	db WR_PSYCHIC
	db NONE
	tx HumanShapeName
	db 124
	db 0
	db 30
	db 4, 7
	dw 89 * 10
	tx JynxDescription
	db 1

CelebiCard:
	db TYPE_PKMN_PSYCHIC
	gfx CelebiCardGfx
	tx CelebiName
	db STAR
	db NEO_DISCOVERY | NONE
	dw CELEBI ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy PSYCHIC, 1
	tx TimeLoopName
	tx TimeLoopDescription
	dw NONE
	db 0
	db RESIDUAL
	dw TimeLoopEffectCommands + $4000
	db NONE
	db (1 << 6)
	db NONE
	db 0
	db ATK_ANIM_GLOW_EFFECT
	energy PSYCHIC, 1, COLORLESS, 1
	tx PsywaveName
	tx DamageAndDo10ToABenchDesc
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw DamageAndDo10ToABenchEffectCommands + $4000
	db DAMAGE_TO_OPPONENT_BENCH
	db NONE
	db NONE
	db 10
	db ATK_ANIM_PSYCHIC_HIT
	db 1
	db WR_PSYCHIC
	db NONE
	tx TimeTravelName
	db 251
	db 0
	db 36
	db 2, 0
	dw 11 * 10
	tx CelebiDescription
	db 19

MewtwoSCard:
	db TYPE_PKMN_PSYCHIC
	gfx MewtwoSCardGfx
	tx MewtwoName
	db STAR
	db NEO_GENESIS | NONE
	dw MEWTWO_S ; 16-bit card ID
	db 70
	db BASIC
	dw NONE
	energy PSYCHIC, 1, FIRE, 1
	tx BarrierName
	tx ReduceDamageby20Desc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw ReduceBy20AfterAttackEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 0
	db ATK_ANIM_BOYFRIENDS
	energy PSYCHIC, 2, FIRE, 1
	tx PsyburnName
	tx Do20MorePerOppEnergyDesc
	dw NONE
	db 10
	db DAMAGE_PLUS
	dw Do20MorePerOppEnergyEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_PSYCHIC_HIT
	db 3
	db WR_PSYCHIC
	db NONE
	tx GeneticName
	db 150
	db 0
	db 70
	db 6, 7
	dw 269 * 10
	tx MewtwoSDescription
	db 0

MewSCard:
	db TYPE_PKMN_PSYCHIC
	gfx MewSCardGfx
	tx MewName
	db STAR
	db NEO_REVELATION | NONE
	dw MEW_S ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy 0
	tx MythicalShieldName
	tx MythicalShieldDescription
	tx MythicalShieldDescriptionCont
	db 0
	db POKEMON_POWER
	dw MythicalShieldEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_GLOW_EFFECT
	energy PSYCHIC, 1, WATER, 1
	tx MysteryAttackName
	tx MysteryAttackDescription
	dw NONE
	db 0
	db DAMAGE_NORMAL
	dw MysteryAttackEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT_EFFECT
	db 1
	db WR_PSYCHIC
	db NONE
	tx NewSpeciesName
	db 151
	db 0
	db 66
	db 1, 4
	dw 9 * 10
	tx MewSDescription
	db 3

NeoSnorlaxCard:
	db TYPE_PKMN_COLORLESS
	gfx NeoSnorlaxCardGfx
	tx SnorlaxName
	db DIAMOND
	db NEO_DISCOVERY | NONE
	dw NEO_SNORLAX ; 16-bit card ID
	db 80
	db BASIC
	dw NONE
	energy COLORLESS, 2
	tx RestName
	tx SLPAndHealDescription
	dw NONE
	db 0
	db RESIDUAL
	dw SLPAndHealEffectCommands + $4000
	db NONE
	db HEAL_USER
	db NONE
	db 1
	db ATK_ANIM_NONE ; mapped from ATK_ANIM_SELF_SLEEP
	energy COLORLESS, 4
	tx BodySlamName
	tx MayInflictParalysisDescription
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw MayInflictParalysisEffectCommands + $4000
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_BIG_HIT
	db 4
	db WR_FIGHTING
	db NONE
	tx SleepingName
	db 143
	db 0
	db 30
	db 6, 11
	dw 1014 * 10
	tx SnorlaxDescription
	db 19

NeoDratiniCard:
	db TYPE_PKMN_COLORLESS
	gfx NeoDratiniCardGfx
	tx DratiniName
	db CIRCLE
	db NEO_REVELATION | NONE
	dw NEO_DRATINI ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx DragonSmashName
	tx MayDoNothingDescription
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw AttackMayDoNothingEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
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
	db 1
	db NONE
	db NONE
	tx DragonName
	db 147
	db 0
	db 17
	db 5, 11
	dw 7 * 10
	tx DratiniDescription
	db 18

NeoDragonairCard:
	db TYPE_PKMN_COLORLESS
	gfx NeoDragonairCardGfx
	tx DragonairName
	db DIAMOND
	db NEO_REVELATION | NONE
	dw NEO_DRAGONAIR ; 16-bit card ID
	db 80
	db STAGE1
	tx DratiniName
	energy COLORLESS, 2
	tx HealingLightName
	tx Heal10FromAllDesc
	dw NONE
	db 0
	db RESIDUAL
	dw Heal10FromAllEffectCommands + $4000
	db NONE
	db HEAL_USER
	db NONE
	db 1
	db ATK_ANIM_NONE
	energy COLORLESS, 2
	tx ProtectiveWaveName
	tx NoSpecialConditions1TurnDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw NoSpecialConditionsEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 0
	db ATK_ANIM_PROTECT ; mapped from ATK_ANIM_LIGHT_PROTECT
	db 2
	db NONE
	db NONE
	tx DragonName
	db 148
	db 0
	db 37
	db 13, 1
	dw 36 * 10
	tx DragonairDescription
	db 0

DragoniteCard:
	db TYPE_PKMN_COLORLESS
	gfx DragoniteCardGfx
	tx DragoniteName
	db STAR
	db NEO_REVELATION | NONE
	dw DRAGONITE ; 16-bit card ID
	db 120
	db STAGE2
	tx DragonairName
	energy 0
	tx TailwindName
	tx TailwindDescription
	dw NONE
	db 0
	db POKEMON_POWER
	dw ReduceRCBy2EffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_PKMN_POWER_1
	energy COLORLESS, 4
	tx DragonTailName
	tx DoubleAttackX40Description
	dw NONE
	db 40
	db DAMAGE_X
	dw CF40X2EffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	db 3
	db NONE
	db WR_FIGHTING
	tx DragonName
	db 149
	db 0
	db 64
	db 7, 3
	dw 463 * 10
	tx DragoniteDescription
	db 0

SentretCard:
	db TYPE_PKMN_COLORLESS
	gfx SentretCardGfx
	tx SentretName
	db CIRCLE
	db NEO_GENESIS | NONE
	dw SENTRET ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx FetchName
	tx Draw1CardDesc
	dw NONE
	db 0
	db RESIDUAL
	dw Draw1CardEffectCommands + $4000
	db DRAW_CARD
	db NONE
	db SPECIAL_AI_HANDLING
	db 0
	db ATK_ANIM_GLOW_EFFECT
	energy COLORLESS, 2
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
	db 0
	db WR_FIGHTING
	db NONE
	tx ScoutName
	db 161
	db 0
	db 14
	db 2, 7
	dw 13 * 10
	tx SentretDescription
	db 0

FurretCard:
	db TYPE_PKMN_COLORLESS
	gfx FurretCardGfx
	tx FurretName
	db DIAMOND
	db NEO_GENESIS | NONE
	dw FURRET ; 16-bit card ID
	db 60
	db STAGE1
	tx SentretName
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
	energy COLORLESS, 3
	tx SlamName
	tx DoubleAttackX30Description
	dw NONE
	db 30
	db DAMAGE_X
	dw CF30X2EffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	db 0
	db WR_FIGHTING
	db WR_PSYCHIC
	tx LongBodyName
	db 162
	db 0
	db 30
	db 5, 11
	dw 71 * 10
	tx FurretDescription
	db 0

HoothootCard:
	db TYPE_PKMN_COLORLESS
	gfx HoothootCardGfx
	tx HoothootName
	db CIRCLE
	db NEO_REVELATION | NONE
	dw HOOTHOOT ; 16-bit card ID
	db 40
	db BASIC
	dw NONE
	energy COLORLESS, 1
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
	energy COLORLESS, 2
	tx PeckName
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
	db 0
	db WR_LIGHTNING
	db WR_FIGHTING
	tx OwlName
	db 163
	db 0
	db 8
	db 2, 4
	dw 46 * 10
	tx HoothootDescription
	db 3

NoctowlCard:
	db TYPE_PKMN_COLORLESS
	gfx NoctowlCardGfx
	tx NoctowlName
	db DIAMOND
	db NEO_REVELATION | NONE
	dw NOCTOWL ; 16-bit card ID
	db 70
	db STAGE1
	tx HoothootName
	energy COLORLESS, 2
	tx TalonClutchName
	tx MaySwitchAndNoRetreatDesc
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw SwitchAndNoRetreatEffectCommands + $4000
	db NONE
	db (1 << 6) | SWITCH_OPPONENT_POKEMON
	db NONE
	db 1
	db ATK_ANIM_QUICK_ATTACK
	energy COLORLESS, 3
	tx WingAttackName
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
	db 0
	db WR_LIGHTNING
	db WR_FIGHTING
	tx OwlName
	db 164
	db 0
	db 31
	db 5, 3
	dw 90 * 10
	tx NoctowlDescription
	db 0

CleffaCard:
	db TYPE_PKMN_COLORLESS
	gfx CleffaCardGfx
	tx CleffaName
	db CIRCLE
	db NEO_REVELATION | NONE
	dw CLEFFA ; 16-bit card ID
	db 30
	db BASIC
	dw NONE
	energy COLORLESS, 2
	tx EeekName
	tx EeeekDescription
	dw NONE
	db 0
	db RESIDUAL
	dw ShuffleHandThenDraw7EffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_SING
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
	tx StarshapeName
	db 173
	db 0
	db 5
	db 1, 0
	dw 6 * 10
	tx CleffaDescription
	db 8

NeoClefairyCard:
	db TYPE_PKMN_COLORLESS
	gfx NeoClefairyCardGfx
	tx ClefairyName
	db CIRCLE
	db NEO_REVELATION | NONE
	dw NEO_CLEFAIRY ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx SingName
	tx InflictSleepDescription
	dw NONE
	db 0
	db DAMAGE_NORMAL
	dw InflictSleepEffectCommands + $4000
	db INFLICT_SLEEP
	db NONE
	db NONE
	db 0
	db ATK_ANIM_LULLABY
	energy COLORLESS, 3
	tx DoubleSlapName
	tx Do20x2Description
	dw NONE
	db 20
	db DAMAGE_X
	dw CF20X2EffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	db 1
	db WR_FIGHTING
	db WR_PSYCHIC
	tx FairyName
	db 35
	db 0
	db 18
	db 2, 0
	dw 16 * 10
	tx ClefairyDescription
	db 18

NeoClefableCard:
	db TYPE_PKMN_COLORLESS
	gfx NeoClefableCardGfx
	tx ClefableName
	db STAR
	db NEO_REVELATION | NONE
	dw NEO_CLEFABLE ; 16-bit card ID
	db 80
	db STAGE1
	tx ClefairyName
	energy 0
	tx MoonlightName
	tx MoonlightDescription
	dw NONE
	db 0
	db POKEMON_POWER
	dw MoonlightEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_GLOW_EFFECT
	energy COLORLESS, 3
	tx BodySlamName
	tx MayInflictParalysisDescription
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw MayInflictParalysisEffectCommands + $4000
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_BIG_HIT
	db 1
	db WR_FIGHTING
	db WR_PSYCHIC
	tx FairyName
	db 36
	db 0
	db 36
	db 4, 3
	dw 88 * 10
	tx ClefableDescription
	db 16

IgglybuffCard:
	db TYPE_PKMN_COLORLESS
	gfx IgglybuffCardGfx
	tx IgglybuffName
	db CIRCLE
	db NEO_DISCOVERY | NONE
	dw IGGLYBUFF ; 16-bit card ID
	db 30
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx ExpandName
	tx ExpandDescription
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw ReduceDamageBy10AfterDamageEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 10
	db ATK_ANIM_EXPAND
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
	tx BalloonName
	db 174
	db 0
	db 5
	db 1, 0
	dw 2 * 10
	tx IgglybuffDescription
	db 0

JigglypuffCard:
	db TYPE_PKMN_COLORLESS
	gfx JigglypuffCardGfx
	tx JigglypuffName
	db CIRCLE
	db NEO_DISCOVERY | NONE
	dw JIGGLYPUFF ; 16-bit card ID
	db 60
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx NapName
	tx Heal1DamageDesc
	dw NONE
	db 0
	db RESIDUAL
	dw SelfHeal10EffectCommands + $4000
	db NONE
	db HEAL_USER
	db NONE
	db 1
	db ATK_ANIM_RECOVER
	energy COLORLESS, 2
	tx LullabyName
	tx InflictSleepDescription
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw InflictSleepEffectCommands + $4000
	db INFLICT_SLEEP
	db NONE
	db NONE
	db 0
	db ATK_ANIM_LULLABY
	db 1
	db WR_FIGHTING
	db NONE
	tx BalloonName
	db 39
	db 0
	db 12
	db 1, 8
	dw 12 * 10
	tx JigglypuffDescription
	db 0

NeoWigglytuffCard:
	db TYPE_PKMN_COLORLESS
	gfx NeoWigglytuffCardGfx
	tx WigglytuffName
	db DIAMOND
	db NEO_DISCOVERY | NONE
	dw NEO_WIGGLYTUFF ; 16-bit card ID
	db 90
	db STAGE1
	tx JigglypuffName
	energy COLORLESS, 1
	tx FriendshipSongName
	tx WailDescription
	dw NONE
	db 0
	db RESIDUAL
	dw WailEffectCommands + $4000
	db NONE
	db NONE
	db SPECIAL_AI_HANDLING
	db 0
	db ATK_ANIM_LULLABY
	energy COLORLESS, 3
	tx ExpandName
	tx ExpandDescription
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw ReduceDamageBy10AfterDamageEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 10
	db ATK_ANIM_EXPAND
	db 2
	db WR_FIGHTING
	db WR_PSYCHIC
	tx BalloonName
	db 40
	db 0
	db 29
	db 3, 3
	dw 26 * 10
	tx WigglytuffDescription
	db 19

Togepi1Card:
	db TYPE_PKMN_COLORLESS
	gfx Togepi1CardGfx
	tx TogepiName
	db CIRCLE
	db NEO_GENESIS | NONE
	dw TOGEPI1 ; 16-bit card ID
	db 40
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
	energy COLORLESS, 2
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
	db 1
	db WR_FIGHTING
	db NONE
	tx SpikeBallName
	db 175
	db 0
	db 12
	db 1, 0
	dw 3 * 10
	tx Togepi1Description
	db 3

Togepi2Card:
	db TYPE_PKMN_COLORLESS
	gfx Togepi2CardGfx
	tx TogepiName
	db CIRCLE
	db NEO_DESTINY | NONE
	dw TOGEPI2 ; 16-bit card ID
	db 40
	db BASIC
	dw NONE
	energy COLORLESS, 1
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
	energy COLORLESS, 1
	tx PoundName
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
	db 1
	db WR_FIGHTING
	db NONE
	tx SpikeBallName
	db 175
	db 0
	db 14
	db 1, 0
	dw 3 * 10
	tx Togepi2Description
	db 19

Togetic1Card:
	db TYPE_PKMN_COLORLESS
	gfx Togetic1CardGfx
	tx TogeticName
	db STAR
	db NEO_GENESIS | NONE
	dw TOGETIC1 ; 16-bit card ID
	db 70
	db STAGE1
	tx TogepiName
	energy COLORLESS, 1
	tx MetronomeName
	tx CopyOppAttackDescription
	dw NONE
	db 0
	db RESIDUAL
	dw CopyOppAttackEffectCommands2 + $4000
	db NONE
	db (1 << 6)
	db NONE
	db 0
	db ATK_ANIM_NONE
	energy COLORLESS, 3
	tx FlyName
	tx MayGetImmunityDesc
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw MayGetImmunityEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 0
	db ATK_ANIM_QUICK_ATTACK
	db 0
	db NONE
	db WR_FIGHTING
	tx HappinessName
	db 176
	db 0
	db 33
	db 2, 0
	dw 7 * 10
	tx Togetic1Description
	db 0

Togetic2Card:
	db TYPE_PKMN_COLORLESS
	gfx Togetic2CardGfx
	tx TogeticName
	db STAR
	db NEO_DESTINY | NONE
	dw TOGETIC2 ; 16-bit card ID
	db 90
	db STAGE1
	tx TogepiName
	energy 0
	tx AltruismName
	tx AltruismDesc
	dw NONE
	db 0
	db POKEMON_POWER
	dw AltruismEffectCommands + $4000
	db NONE
	db (1 << 6)
	db NONE
	db 0
	db ATK_ANIM_PKMN_POWER_1
	energy COLORLESS, 2
	tx SweetKissName
	tx AttackDraw2Description
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw Draw2EffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_SEISMIC_TOSS
	db 1
	db NONE
	db WR_FIGHTING
	tx HappinessName
	db 176
	db 0
	db 36
	db 2, 0
	dw 7 * 10
	tx Togetic2Description
	db 18

AipomCard:
	db TYPE_PKMN_COLORLESS
	gfx AipomCardGfx
	tx AipomName
	db CIRCLE
	db NEO_DESTINY | NONE
	dw AIPOM ; 16-bit card ID
	db 40
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx FetchName
	tx Draw1CardDesc
	dw NONE
	db 0
	db RESIDUAL
	dw Draw1CardEffectCommands + $4000
	db DRAW_CARD
	db NONE
	db SPECIAL_AI_HANDLING
	db 0
	db ATK_ANIM_GLOW_EFFECT
	energy COLORLESS, 2
	tx TailGrabName
	tx MayDraw1CardDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw MayDraw1CardEffectCommands + $4000
	db DRAW_CARD
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	db 0
	db WR_FIGHTING
	db WR_PSYCHIC
	tx TailGrabName
	db 190
	db 0
	db 16
	db 2, 7
	dw 25 * 10
	tx AipomDescription
	db 0

NeoEeveeCard:
	db TYPE_PKMN_COLORLESS
	gfx NeoEeveeCardGfx
	tx EeveeName
	db CIRCLE
	db NEO_DISCOVERY | NONE
	dw NEO_EEVEE ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx RapidEvolutionName
	tx RapidEvolutionDesc
	dw NONE
	db 0
	db RESIDUAL
	dw EeveelutionEffectCommands + $4000
	db NONE
	db NONE
	db SPECIAL_AI_HANDLING
	db 0
	db ATK_ANIM_GLOW_EFFECT
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
	db 1
	db ATK_ANIM_HIT
	db 1
	db WR_FIGHTING
	db NONE
	tx EvolutionName
	db 133
	db 0
	db 15
	db 1, 0
	dw 14 * 10
	tx EeveeDescription
	db 16

DunsparceCard:
	db TYPE_PKMN_COLORLESS
	gfx DunsparceCardGfx
	tx DunsparceName
	db CIRCLE
	db NEO_REVELATION | NONE
	dw DUNSPARCE ; 16-bit card ID
	db 40
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx GlareName
	tx MayInflictParalysisDescription
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw MayInflictParalysisEffectCommands + $4000
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_DARK_MIND
	energy COLORLESS, 3
	tx FlyName
	tx MayPreventAllDamageOrNothingDesc
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw MayGetImmunityOrDoNothingEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 0
	db ATK_ANIM_QUICK_ATTACK
	db 0
	db WR_FIGHTING
	db WR_PSYCHIC
	tx LandSnakeName
	db 206
	db 0
	db 21
	db 4, 11
	dw 31 * 10
	tx DunsparceDescription
	db 16

SnubbullCard:
	db TYPE_PKMN_COLORLESS
	gfx SnubbullCardGfx
	tx SnubbullName
	db CIRCLE
	db NEO_GENESIS | NONE
	dw SNUBBULL ; 16-bit card ID
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
	tx LickName
	tx MayInflictParalysisDescription
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw MayInflictParalysisEffectCommands + $4000
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_GOO
	db 1
	db WR_FIGHTING
	db NONE
	tx FairyName
	db 209
	db 0
	db 14
	db 2, 0
	dw 17 * 10
	tx SnubbullDescription
	db 16

GranbullCard:
	db TYPE_PKMN_COLORLESS
	gfx GranbullCardGfx
	tx GranbullName
	db DIAMOND
	db NEO_GENESIS | NONE
	dw GRANBULL ; 16-bit card ID
	db 70
	db STAGE1
	tx SnubbullName
	energy COLORLESS, 2
	tx RoarName
	tx SwitchAfterDamageDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw SwitchOppAfterDamageEffectCommands + $4000
	db NONE
	db SWITCH_OPPONENT_POKEMON
	db NONE
	db 0
	db ATK_ANIM_WHIRLWIND
	energy COLORLESS, 3
	tx RampageName
	tx Do10PerSelfDamageThenMayConfuse
	dw NONE
	db 30
	db DAMAGE_PLUS
	dw Do10PerSelfDamageThenMayConfuseEffectCommands + $4000
	db NONE
	db NONE
	db BOOST_IF_TAKEN_DAMAGE
	db 0
	db ATK_ANIM_RAMPAGE
	db 2
	db WR_FIGHTING
	db WR_PSYCHIC
	tx FairyName
	db 210
	db 0
	db 40
	db 4, 7
	dw 26 * 10
	tx GranbullDescription
	db 0

TeddiursaCard:
	db TYPE_PKMN_COLORLESS
	gfx TeddiursaCardGfx
	tx TeddiursaName
	db CIRCLE
	db NEO_DESTINY | NONE
	dw TEDDIURSA ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx NapName
	tx Heal1DamageDesc
	dw NONE
	db 0
	db RESIDUAL
	dw SelfHeal10EffectCommands + $4000
	db NONE
	db HEAL_USER
	db NONE
	db 1
	db ATK_ANIM_RECOVER
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
	db 1
	db WR_FIGHTING
	db NONE
	tx LittleBearName
	db 216
	db 0
	db 10
	db 2, 0
	dw 19 * 10
	tx TeddiursaDescription
	db 16

UrsaringCard:
	db TYPE_PKMN_COLORLESS
	gfx UrsaringCardGfx
	tx UrsaringName
	db STAR
	db NEO_DESTINY | NONE
	dw URSARING ; 16-bit card ID
	db 90
	db STAGE1
	tx TeddiursaName
	energy COLORLESS, 3
	tx BodySlamName
	tx MayInflictParalysisDescription
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw MayInflictParalysisEffectCommands + $4000
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_BIG_HIT
	energy COLORLESS, 4
	tx SlamName
	tx DoubleAttackX40Description
	dw NONE
	db 40
	db DAMAGE_X
	dw CF40X2EffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HIT
	db 3
	db WR_FIGHTING
	db WR_PSYCHIC
	tx HibernatorName
	db 217
	db 0
	db 42
	db 5, 11
	dw 277 * 10
	tx UrsaringDescription
	db 16

DelibirdCard:
	db TYPE_PKMN_COLORLESS
	gfx DelibirdCardGfx
	tx DeliBirdName
	db STAR
	db NEO_DESTINY | NONE
	dw DELIBIRD ; 16-bit card ID
	db 60
	db BASIC
	dw NONE
	energy COLORLESS, 2
	tx SurprisePresentName
	tx PresentDesc
	dw NONE
	db 0
	db RESIDUAL
	dw SurprisePresentEffectCommands + $4000
	db NONE
	db (1 << 6)
	db NONE
	db 2
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
	db 1
	db WR_LIGHTNING
	db WR_FIGHTING
	tx DeliveryName
	db 225
	db 0
	db 25
	db 2, 11
	dw 35 * 10
	tx DelibirdDescription
	db 0

SkarmoryCard:
	db TYPE_PKMN_COLORLESS
	gfx SkarmoryCardGfx
	tx SkarmoryName
	db STAR
	db NEO_DISCOVERY | NONE
	dw SKARMORY ; 16-bit card ID
	db 60
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
	energy COLORLESS, 3
	tx SteelWingName
	tx ExpandDescription
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw ReduceDamageBy10AfterDamageEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 10
	db ATK_ANIM_HIT
	db 2
	db WR_FIRE
	db WR_GRASS
	tx ArmorBirdName
	db 227
	db 0
	db 27
	db 5, 7
	dw 111 * 10
	tx SkarmoryDescription
	db 3

NeoPorygonCard:
	db TYPE_PKMN_COLORLESS
	gfx NeoPorygonCardGfx
	tx PorygonName
	db CIRCLE
	db NEO_DESTINY | NONE
	dw NEO_PORYGON ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx DataSortName
	tx Draw1CardDesc
	dw NONE
	db 0
	db RESIDUAL
	dw Draw1CardEffectCommands + $4000
	db DRAW_CARD
	db NONE
	db SPECIAL_AI_HANDLING
	db 0
	db ATK_ANIM_GLOW_EFFECT
	energy COLORLESS, 2
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
	db 1
	db WR_FIGHTING
	db NONE
	tx VirtualName
	db 137
	db 0
	db 18
	db 2, 7
	dw 80 * 10
	tx PorygonDescription
	db 19

Porygon2Card:
	db TYPE_PKMN_COLORLESS
	gfx Porygon2CardGfx
	tx Porygon2Name
	db STAR
	db NEO_DESTINY | NONE
	dw PORYGON_2 ; 16-bit card ID
	db 80
	db STAGE1
	tx PorygonName
	energy COLORLESS, 1
	tx Conversion2Name
	tx Conversion2Description
	dw NONE
	db 0
	db RESIDUAL
	dw Conversion2EffectCommands + $4000
	db NONE
	db NONE
	db SPECIAL_AI_HANDLING
	db 0
	db ATK_ANIM_GLOW_EFFECT
	energy COLORLESS, 3
	tx DataDistortionName
	tx MayChangeWeaknessDesc
	dw NONE
	db 40
	db DAMAGE_NORMAL
	dw MayChangeWeaknessEffectCommands + $4000
	db NONE
	db NONE
	db SPECIAL_AI_HANDLING
	db 0
	db ATK_ANIM_STRETCH_KICK
	db 1
	db WR_FIGHTING
	db WR_PSYCHIC
	tx VirtualName
	db 223
	db 0
	db 40
	db 2, 0
	dw 71 * 10
	tx Porygon2Description
	db 1

StantlerCard:
	db TYPE_PKMN_COLORLESS
	gfx StantlerCardGfx
	tx StantlerName
	db CIRCLE
	db NEO_REVELATION | NONE
	dw STANTLER ; 16-bit card ID
	db 60
	db BASIC
	dw NONE
	energy COLORLESS, 2
	tx ConfuseRayName
	tx MayInflictConfusionDescription
	dw NONE
	db 10
	db DAMAGE_NORMAL
	dw MayInflictConfusionEffectCommands + $4000
	db INFLICT_CONFUSION
	db NONE
	db NONE
	db 0
	db ATK_ANIM_CONFUSE_RAY
	energy COLORLESS, 3
	tx StompName
	tx MayDo20Plus20Desc
	dw NONE
	db 20
	db DAMAGE_PLUS
	dw MayDo10Plus20EffectCommands + $4000
	db NONE
	db (1 << 6)
	db NONE
	db 1
	db ATK_ANIM_HIT
	db 2
	db WR_FIGHTING
	db WR_PSYCHIC
	tx BigHornName
	db 234
	db 0
	db 18
	db 4, 7
	dw 157 * 10
	tx StantlerDescription
	db 0

SmeargleCard:
	db TYPE_PKMN_COLORLESS
	gfx SmeargleCardGfx
	tx SmeargleName
	db STAR
	db NEO_GENESIS | NONE
	dw SMEARGLE ; 16-bit card ID
	db 50
	db BASIC
	dw NONE
	energy COLORLESS, 2
	tx SketchName
	tx SketchDescription
	dw NONE
	db 0
	db RESIDUAL
	dw CopyOppAttackEffectCommands + $4000
	db NONE
	db (1 << 6)
	db NONE
	db 0
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
	db 1
	db WR_FIGHTING
	db NONE
	tx PainterName
	db 235
	db 0
	db 22
	db 3, 11
	dw 127 * 10
	tx SmeargleDescription
	db 8

MiltankCard:
	db TYPE_PKMN_COLORLESS
	gfx MiltankCardGfx
	tx MiltankName
	db CIRCLE
	db NEO_DISCOVERY | NONE
	dw MILTANK ; 16-bit card ID
	db 70
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx MilkDrinkName
	tx Heal2DamageDesc
	dw NONE
	db 0
	db RESIDUAL
	dw Heal20DamageEffectCommands + $4000
	db NONE
	db HEAL_USER
	db NONE
	db 1
	db ATK_ANIM_RECOVER
	energy COLORLESS, 3
	tx BodySlamName
	tx MayInflictParalysisDescription
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw MayInflictParalysisEffectCommands + $4000
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_BIG_HIT
	db 2
	db WR_FIGHTING
	db WR_PSYCHIC
	tx MilkCowName
	db 241
	db 0
	db 25
	db 3, 11
	dw 166 * 10
	tx MiltankDescription
	db 0

NeoChanseyCard:
	db TYPE_PKMN_COLORLESS
	gfx NeoChanseyCardGfx
	tx ChanseyName
	db DIAMOND
	db NEO_DESTINY | NONE
	dw NEO_CHANSEY ; 16-bit card ID
	db 80
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx PoundName
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
	energy COLORLESS, 3
	tx DoubleEdgeName
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
	db 2
	db WR_FIGHTING
	db NONE
	tx EggName
	db 113
	db 0
	db 24
	db 3, 7
	dw 76 * 10
	tx ChanseyDescription
	db 0

BlisseyCard:
	db TYPE_PKMN_COLORLESS
	gfx BlisseyCardGfx
	tx BlisseyName
	db STAR
	db NEO_DESTINY | NONE
	dw BLISSEY ; 16-bit card ID
	db 120
	db STAGE1
	tx ChanseyName
	energy 0
	tx SoftboiledName
	tx SoftboiledDescription
	dw NONE
	db 0
	db POKEMON_POWER
	dw ETBHeal30AllSelfEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HEALING_WIND
	energy COLORLESS, 4
	tx BodySlamName
	tx MayInflictParalysisDescription
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw MayInflictParalysisEffectCommands + $4000
	db INFLICT_PARALYSIS
	db NONE
	db NONE
	db 0
	db ATK_ANIM_BIG_HIT
	db 2
	db WR_FIGHTING
	db WR_PSYCHIC
	tx HappinessName
	db 242
	db 0
	db 41
	db 4, 11
	dw 103 * 10
	tx BlisseyDescription
	db 0

LugiaCard:
	db TYPE_PKMN_COLORLESS
	gfx LugiaCardGfx
	tx LugiaName
	db STAR
	db NEO_REVELATION | NONE
	dw LUGIA ; 16-bit card ID
	db 80
	db BASIC
	dw NONE
	energy COLORLESS, 1
	tx EnergyAbsorptionName
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
	energy FIRE, 1, WATER, 1, LIGHTNING, 1
	tx ElementalBlastName
	tx DiscardAllEnergyDesc
	dw NONE
	db 70
	db DAMAGE_NORMAL
	dw DiscardAllEnergyEffectCommands + $4000
	db NONE
	db DISCARD_ENERGY
	db NONE
	db 9
	db ATK_ANIM_HYPER_BEAM
	db 2
	db WR_PSYCHIC
	db WR_FIGHTING
	tx DivingName
	db 249
	db 0
	db 67
	db 17, 1
	dw 476 * 10
	tx LugiaDescription
	db 17

NoctowlSCard:
	db TYPE_PKMN_COLORLESS
	gfx NoctowlSCardGfx
	tx NoctowlName
	db STAR
	db NEO_REVELATION | NONE
	dw NOCTOWL_S ; 16-bit card ID
	db 70
	db STAGE1
	tx HoothootName
	energy 0
	tx ShinyFeatherName
	tx ShinyFeatherDescription
	dw NONE
	db 0
	db POKEMON_POWER
	dw ShinyFeatherEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_GLOW_EFFECT
	energy PSYCHIC, 1, LIGHTNING, 1, COLORLESS, 1
	tx PiercingGazeName
	tx MayPARorCFNDesc
	dw NONE
	db 30
	db DAMAGE_NORMAL
	dw MayParalyzeOrConfuseEffectCommands + $4000
	db INFLICT_PARALYSIS | INFLICT_CONFUSION
	db NONE
	db NONE
	db 2
	db ATK_ANIM_PSYCHIC_HIT
	db 1
	db WR_LIGHTNING
	db WR_FIGHTING
	tx OwlName
	db 164
	db 0
	db 50
	db 5, 3
	dw 89 * 10
	tx NoctowlSDescription
	db 0

CharizardCCard:
	db TYPE_PKMN_COLORLESS
	gfx CharizardCCardGfx
	tx CharizardName
	db STAR
	db NEO_DESTINY | NONE
	dw CHARIZARD_C ; 16-bit card ID
	db 110
	db STAGE2
	tx CharmeleonName
	energy FIRE, 2, FIGHTING, 1
	tx FlamesOfRageName
	tx Discard2FDo10MorePerSelfDamageDesc
	dw NONE
	db 20
	db DAMAGE_PLUS
	dw Discard2FThenPlus10PerSelfDamageEffectCommands + $4000
	db NONE
	db DISCARD_ENERGY
	db BOOST_IF_TAKEN_DAMAGE
	db 3
	db ATK_ANIM_FIRE_SPIN
	energy FIRE, 2, FIGHTING, 2
	tx BlastBurnName
	tx SelfDoubleDamageDesc
	dw NONE
	db 100
	db DAMAGE_NORMAL
	dw SelfDoubleDamageEffectCommands + $4000
	db NONE
	db NULLIFY_OR_WEAKEN_ATTACK
	db NONE
	db 0
	db ATK_ANIM_FIRE_SPIN
	db 3
	db NONE
	db WR_GRASS
	tx FlameName
	db 6
	db 0
	db 99
	db 5, 7
	dw 199 * 10
	tx CharizardCDescription
	db 18

LugiaCCard:
	db TYPE_PKMN_COLORLESS
	gfx LugiaCCardGfx
	tx LugiaName
	db STAR
	db NEO_DESTINY | NONE
	dw LUGIA_C ; 16-bit card ID
	db 70
	db BASIC
	dw NONE
	energy LIGHTNING, 1, WATER, 1
	tx WhirlwindName
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
	energy LIGHTNING, 1, WATER, 2
	tx AeroblastName
	tx AeroblastDescription
	dw NONE
	db 30
	db DAMAGE_PLUS
	dw MayDoPlusCF20x2EffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_HYPER_BEAM
	db 3
	db NONE
	db WR_FIGHTING
	tx DivingName
	db 249
	db 0
	db 99
	db 17, 1
	dw 476 * 10
	tx LugiaCDescription
	db 16

HoohCCard:
	db TYPE_PKMN_COLORLESS
	gfx HoohCCardGfx
	tx HoohName
	db STAR
	db NEO_DESTINY | NONE
	dw HOOH_C ; 16-bit card ID
	db 70
	db BASIC
	dw NONE
	energy LIGHTNING, 1, FIRE, 1
	tx HolyFlameName
	tx Heal1DamageifSuccessDesc
	dw NONE
	db 20
	db DAMAGE_NORMAL
	dw Heal1DamageifSuccessEffectCommands + $4000
	db NONE
	db HEAL_USER
	db NONE
	db 1
	db ATK_ANIM_SMALL_FLAME
	energy FIRE, 2, LIGHTNING, 1
	tx PhoenixFlameName
	tx PhoenixFlameDesc
	dw NONE
	db 40
	db DAMAGE_PLUS
	dw DiscardLorFforStuffEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 10
	db ATK_ANIM_DIVE_BOMB
	db 3
	db NONE
	db WR_GRASS
	tx RainbowName
	db 250
	db 0
	db 99
	db 12, 6
	dw 438 * 10
	tx HoohCDescription
	db 0

CelebiCCard:
	db TYPE_PKMN_COLORLESS
	gfx CelebiCCardGfx
	tx CelebiName
	db STAR
	db NEO_DESTINY | NONE
	dw CELEBI_C ; 16-bit card ID
	db 70
	db BASIC
	dw NONE
	energy GRASS, 1
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
	energy GRASS, 2, PSYCHIC, 1
	tx MegaDrainName
	tx HealHalfDamageDesc
	dw NONE
	db 40
	db DAMAGE_NORMAL
	dw HealHalfDamageEffectCommands + $4000
	db NONE
	db HEAL_USER
	db NONE
	db 2
	db ATK_ANIM_DRAIN
	db 2
	db NONE
	db WR_WATER
	tx TimeTravelName
	db 251
	db 0
	db 99
	db 2, 0
	dw 11 * 10
	tx CelebiCDescription
	db 0

ShadowLugiaCard:
	db TYPE_PKMN_PSYCHIC
	gfx ShadowLugiaCardGfx
	tx ShadowLugiaName
	db STAR
	db NEO_DESTINY | NONE
	dw SHADOW_LUGIA ; 16-bit card ID
	db 80
	db BASIC
	dw NONE
	energy 0
	tx DarkDescentName
	tx DarkDescentDesc
	dw NONE
	db 0
	db POKEMON_POWER
	dw ETB10ToOppBenchEffectCommands + $4000
	db NONE
	db NONE
	db NONE
	db 0
	db ATK_ANIM_QUICKFREEZE
	energy PSYCHIC, 1, FIGHTING, 2
	tx ShadowBlastName
	tx Do20morePerSelfPsychicEnergyDesc
	dw NONE
	db 40
	db DAMAGE_PLUS
	dw Do20MorePerSelfPEnergyEffectCommands + $4000
	db NONE
	db ATTACHED_ENERGY_BOOST
	db NONE
	db MAX_ENERGY_BOOST_IS_NOT_LIMITED
	db ATK_ANIM_POT_SMASH
	db 3
	db NONE
	db WR_FIGHTING
	tx DivingName
	db 249
	db 0
	db 99
	db 17, 1
	dw 476 * 10
	tx ShadowLugiaDescription
	db 17

ProfessorElmCard:
	db TYPE_TRAINER
	gfx ProfessorElmCardGfx
	tx ProfessorElmName
	db DIAMOND
	db NEO_GENESIS | NONE
	dw PROFESSOR_ELM ; 16-bit card ID
	dw ProfessorOakEffectCommands
	tx ProfessorElmDescription
	dw NONE

TeamRocketsEvilDeedsCard:
	db TYPE_TRAINER
	gfx TeamRocketsEvilDeedsCardGfx
	tx TeamRocketsEvilDeedsName
	db DIAMOND
	db NEO_DESTINY | NONE
	dw TEAM_ROCKETS_EVIL_DEEDS ; 16-bit card ID
	dw ImposterProfessorOakEffectCommands
	tx TeamRocketsEvilDeedsDesc
	dw NONE

MailFromBillCard:
	db TYPE_TRAINER
	gfx MailFromBillCardGfx
	tx MailFromBillName
	db CIRCLE
	db NEO_DISCOVERY | NONE
	dw MAIL_FROM_BILL ; 16-bit card ID
	dw BillEffectCommands
	tx MailFromBillDescription
	dw NONE

ForestGuardianCard:
	db TYPE_TRAINER
	gfx ForestGuardianCardGfx
	tx ForestGuardianName
	db CIRCLE
	db NEO_REVELATION | NONE
	dw FOREST_GUARDIAN ; 16-bit card ID
	dw MrFujiEffectCommands
	tx ForestGuardianDescription
	dw NONE

SeerCard:
	db TYPE_TRAINER
	gfx SeerCardGfx
	tx SeerName
	db DIAMOND
	db NEO_DISCOVERY | NONE
	dw SEER ; 16-bit card ID
	dw LassEffectCommands
	tx SeerDescription
	dw NONE

PokemonFanClubCard:
	db TYPE_TRAINER
	gfx PokemonFanClubCardGfx
	tx PokemonFanClubName
	db DIAMOND
	db NEO_REVELATION | NONE
	dw POKEMON_FAN_CLUB ; 16-bit card ID
	dw PokemonTraderEffectCommands
	tx PokemonFanClubDescription
	dw NONE

StarPieceCard:
	db TYPE_TRAINER
	gfx StarPieceCardGfx
	tx StarPieceName
	db DIAMOND
	db NEO_REVELATION | NONE
	dw STAR_PIECE ; 16-bit card ID
	dw PokemonBreederEffectCommands
	tx StarPieceDescription
	dw NONE

PokeDollCard:
	db TYPE_TRAINER
	gfx PokeDollCardGfx
	tx PokeDollName
	db DIAMOND
	db NEO_GENESIS | NONE
	dw POKE_DOLL ; 16-bit card ID
	dw ClefairyDollEffectCommands
	tx PokeDollDescription
	tx PokeDollDescriptionCont

FossilEggCard:
	db TYPE_TRAINER
	gfx FossilEggCardGfx
	tx FossilEggName
	db CIRCLE
	db NEO_REVELATION | NONE
	dw FOSSIL_EGG ; 16-bit card ID
	dw MysteriousFossilEffectCommands
	tx FossilEggDescription
	tx FossilEggDescriptionCont

EnergyArkCard:
	db TYPE_TRAINER
	gfx EnergyArkCardGfx
	tx EnergyArkName
	db CIRCLE
	db NEO_GENESIS | NONE
	dw ENERGY_ARK ; 16-bit card ID
	dw EnergyRetrievalEffectCommands
	tx EnergyArkDescription
	dw NONE

NeoSuperEnergyRetrievalCard:
	db TYPE_TRAINER
	gfx NeoSuperEnergyRetrievalCardGfx
	tx SuperEnergyRetrievalName
	db STAR
	db NEO_DISCOVERY | NONE
	dw NEO_SUPER_ENERGY_RETRIEVAL ; 16-bit card ID
	dw SuperEnergyRetrievalEffectCommands
	tx SuperEnergyRetrievalDescription
	dw NONE

NeoEnergySearchCard:
	db TYPE_TRAINER
	gfx NeoEnergySearchCardGfx
	tx EnergySearchName
	db CIRCLE
	db NEO_GENESIS | NONE
	dw NEO_ENERGY_SEARCH ; 16-bit card ID
	dw EnergySearchEffectCommands
	tx EnergySearchDescription
	dw NONE

EnergyRemoval2Card:
	db TYPE_TRAINER
	gfx EnergyRemoval2CardGfx
	tx EnergyRemoval2Name
	db CIRCLE
	db NEO_GENESIS | NONE
	dw ENERGY_REMOVAL2 ; 16-bit card ID
	dw EnergyRemovalEffectCommands
	tx EnergyRemoval2Description
	dw NONE

MasterBallCard:
	db TYPE_TRAINER
	gfx MasterBallCardGfx
	tx MasterBallName
	db STAR
	db NEO_DESTINY | NONE
	dw MASTER_BALL ; 16-bit card ID
	dw SuperEnergyRemovalEffectCommands
	tx MasterBallDescription
	dw NONE

NeoSwitchCard:
	db TYPE_TRAINER
	gfx NeoSwitchCardGfx
	tx SwitchName
	db CIRCLE
	db NEO_DESTINY | NONE
	dw NEO_SWITCH ; 16-bit card ID
	dw SwitchEffectCommands
	tx SwitchDescription
	dw NONE

PokemonNurseCard:
	db TYPE_TRAINER
	gfx PokemonNurseCardGfx
	tx PokemonNurseName
	db CIRCLE
	db NEO_DISCOVERY | NONE
	dw POKEMON_NURSE ; 16-bit card ID
	dw PokemonCenterEffectCommands
	tx PokemonNurseDescription
	dw NONE

NeoPokeBallCard:
	db TYPE_TRAINER
	gfx NeoPokeBallCardGfx
	tx PokeBallName
	db CIRCLE
	db NEO_REVELATION | NONE
	dw NEO_POKE_BALL ; 16-bit card ID
	dw PokeBallEffectCommands
	tx PokeBallDescription
	dw NONE

SuperScoopUpCard:
	db TYPE_TRAINER
	gfx SuperScoopUpCardGfx
	tx SuperScoopUpName
	db DIAMOND
	db NEO_DISCOVERY | NONE
	dw SUPER_SCOOP_UP ; 16-bit card ID
	dw ScoopUpEffectCommands
	tx SuperScoopUpDescription
	dw NONE

PokegearCard:
	db TYPE_TRAINER
	gfx PokegearCardGfx
	tx PokegearName
	db STAR
	db NEO_DESTINY | NONE
	dw POKEGEAR ; 16-bit card ID
	dw ComputerSearchEffectCommands
	tx PokegearDescription
	dw NONE

NewPokedexCard:
	db TYPE_TRAINER
	gfx NewPokedexCardGfx
	tx NewPokedexName
	db CIRCLE
	db NEO_DISCOVERY | NONE
	dw NEW_POKEDEX ; 16-bit card ID
	dw PokedexEffectCommands
	tx NewPokedexDescription
	dw NONE

StrengthCharmCard:
	db TYPE_TRAINER
	gfx StrengthCharmCardGfx
	tx StrengthCharmName
	db CIRCLE
	db NEO_REVELATION | NONE
	dw STRENGTH_CHARM ; 16-bit card ID
	dw PlusPowerEffectCommands
	tx StrengthCharmDescription
	dw NONE

CrystalShardCard:
	db TYPE_TRAINER
	gfx CrystalShardCardGfx
	tx CrystalShardName
	db CIRCLE
	db NEO_REVELATION | NONE
	dw CRYSTAL_SHARD ; 16-bit card ID
	dw DefenderEffectCommands
	tx CrystalShardDescription
	dw NONE

RuinWallCard:
	db TYPE_TRAINER
	gfx RuinWallCardGfx
	tx RuinWallName
	db DIAMOND
	db NEO_DESTINY | NONE
	dw RUIN_WALL ; 16-bit card ID
	dw ItemFinderEffectCommands
	tx RuinWallDescription
	dw NONE

PokemonReversalCard:
	db TYPE_TRAINER
	gfx PokemonReversalCardGfx
	tx PokemonReversalName
	db CIRCLE
	db NEO_REVELATION | NONE
	dw POKEMON_REVERSAL ; 16-bit card ID
	dw GustOfWindEffectCommands
	tx PokemonReversalDescription
	dw NONE

NeoPotionCard:
	db TYPE_TRAINER
	gfx NeoPotionCardGfx
	tx PotionName
	db CIRCLE
	db NEO_GENESIS | NONE
	dw NEO_POTION ; 16-bit card ID
	dw PotionEffectCommands
	tx PotionDescription
	dw NONE

HyperPotionCard:
	db TYPE_TRAINER
	gfx HyperPotionCardGfx
	tx HyperPotionName
	db DIAMOND
	db NEO_DESTINY | NONE
	dw HYPER_POTION ; 16-bit card ID
	dw SuperPotionEffectCommands
	tx HyperPotionDescription
	dw NONE

NeoFullHealCard:
	db TYPE_TRAINER
	gfx NeoFullHealCardGfx
	tx FullHealName
	db CIRCLE
	db NEO_DISCOVERY | NONE
	dw NEO_FULL_HEAL ; 16-bit card ID
	dw FullHealEffectCommands
	tx FullHealDescription
	dw NONE

BillsMaintenanceCard:
	db TYPE_TRAINER
	gfx BillsMaintenanceCardGfx
	tx BillsMaintenanceName
	db CIRCLE
	db NEO_DISCOVERY | NONE
	dw BILLS_MAINTENANCE ; 16-bit card ID
	dw MaintenanceEffectCommands
	tx BillsMaintenanceDescription
	dw NONE

ArcadeGameCard:
	db TYPE_TRAINER
	gfx ArcadeGameCardGfx
	tx ArcadeGameName
	db CIRCLE
	db NEO_GENESIS | NONE
	dw ARCADE_GAME ; 16-bit card ID
	dw GamblerEffectCommands
	tx ArcadeGameDescription
	dw NONE

DarknessEnergyCard:
	db TYPE_ENERGY_DOUBLE_COLORLESS
	gfx RainbowEnergyCardGfx
	tx DarknessEnergyName
	db STAR
	db NEO_GENESIS | NONE
	dw DARKNESS_ENERGY ; 16-bit card ID
	dw DoubleColorlessEnergyEffectCommands
	tx DarknessEnergyDescription
	dw NONE

MetalEnergyCard:
	db TYPE_ENERGY_DOUBLE_COLORLESS
	gfx RainbowEnergyCardGfx
	tx MetalEnergyName
	db STAR
	db NEO_GENESIS | NONE
	dw METAL_ENERGY ; 16-bit card ID
	dw DoubleColorlessEnergyEffectCommands
	tx MetalEnergyDescription
	dw NONE

BerryCard:
	db TYPE_TRAINER
	gfx NeoPotionCardGfx
	tx BerryName
	db CIRCLE
	db NEO_GENESIS | NONE
	dw BERRY ; 16-bit card ID
	dw PokemonToolEffectCommands + $4000
	tx BerryDescription
	dw NONE

GoldBerryCard:
	db TYPE_TRAINER
	gfx HyperPotionCardGfx
	tx GoldBerryName
	db DIAMOND
	db NEO_GENESIS | NONE
	dw GOLD_BERRY ; 16-bit card ID
	dw PokemonToolEffectCommands + $4000
	tx GoldBerryDescription
	dw NONE

FocusBandCard:
	db TYPE_TRAINER
	gfx StrengthCharmCardGfx
	tx FocusBandName
	db STAR
	db NEO_GENESIS | NONE
	dw FOCUS_BAND ; 16-bit card ID
	dw PokemonToolEffectCommands + $4000
	tx FocusBandDescription
	dw NONE

MiracleBerryCard:
	db TYPE_TRAINER
	gfx NeoFullHealCardGfx
	tx MiracleBerryName
	db DIAMOND
	db NEO_GENESIS | NONE
	dw MIRACLE_BERRY ; 16-bit card ID
	dw PokemonToolEffectCommands + $4000
	tx MiracleBerryDescription
	dw NONE

