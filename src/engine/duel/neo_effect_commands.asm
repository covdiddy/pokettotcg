; =============================================================================
; Neo Gen 2 EffectCommands tables (ROMX $55 "Neo Effects 1")
; Bank $0b functions have no offset; Bank $56 Neo functions use - $4000.
; =============================================================================

AllEnergyIsFireEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, EnergyBurnEffect
	db  $00

AltruismEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, StrangeBehavior_CheckDamage
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, StrangeBehavior_SelectAndSwapEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, StrangeBehavior_SwapEffect
	db  $00

AnyTarget10PerEnergyEffectCommands::
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, AnyTargetEffect - $4000
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Deal10DamageToTargetPerEnergy_DamageEffect - $4000
	db  $00

AromatherapyEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, SolarPower_CheckUse
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SolarPower_RemoveStatusEffect
	db  $00

AttackMayDoNothingEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, HornHazard_NoDamage50PercentEffect
	dbw EFFECTCMDTYPE_AI, HornHazard_AIEffect
	db  $00

CF10ToYourOrOppBenchEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Blizzard_BenchDamage50PercentEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Blizzard_BenchDamageEffect
	db  $00

CF10X3EffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, NidoranFFurySwipes_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, NidoranFFurySwipes_AIEffect
	db  $00

CF10X4EffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, AcidEffect
	dbw EFFECTCMDTYPE_AI, GloomPoisonPowder_AIEffect
	db  $00

CF10X9EffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DancingEmbers_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, DancingEmbers_AIEffect
	db  $00

CF20ToABenchEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, HypnoDarkMind_DamageBenchEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, HypnoDarkMind_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, HypnoDarkMind_AISelectEffect
	db  $00

CF20X2EffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Twineedle_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, Twineedle_AIEffect
	db  $00

CF20X3EffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SandslashFurySwipes_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, SandslashFurySwipes_AIEffect
	db  $00

CF20X4EffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, CometPunch_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, CometPunch_AIEffect
	db  $00

CF30PerSelfEnergyEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, BigEggsplosion_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, BigEggsplosion_AIEffect
	db  $00

CF30X2DamageEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, OmastarSpikeCannon_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, OmastarSpikeCannon_AIEffect
	db  $00

CF30X2EffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DragoniteLv41Slam_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, DragoniteLv41Slam_AIEffect
	db  $00

CF30X3EffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, JolteonDoubleKick_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, JolteonDoubleKick_AIEffect
	db  $00

CF40X2EffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DragoniteLv45Slam_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, DragoniteLv45Slam_AIEffect
	db  $00

CFHOppCantAttackEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, LeerEffect
	db  $00

CFT10ToSelfEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ThunderJolt_Recoil50PercentEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, ThunderJolt_RecoilEffect
	db  $00

CFT20ToSelfEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Thrash_ModifierEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Thrash_RecoilEffect
	db  $00

CFT30ToSelfEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RaichuThunder_Recoil50PercentEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, RaichuThunder_RecoilEffect
	db  $00

CFXMill2PerHeadsEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, StoneBarrage_MultiplierEffect
	db  $00

CanDo30ButRecoilEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, FlareonDamageEffect - $4000
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, PlayerYesNoFlareonEffect - $4000
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, FlareonRecoilEffect - $4000
	dbw EFFECTCMDTYPE_AI_SELECTION, FlareonFB_AISelectEffect - $4000
	dbw EFFECTCMDTYPE_AI, FlareonFB_AIEffect - $4000 
	db  $00

CanOnlyUseAttackOnceEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, ShellderSupersonicEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, HideInShellEffect
	db  $00

CanSwitchOppBeforeDamageEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SwitchDFPSwitchEffect - $4000
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, SwitchDFP_PlayerSelectEffect - $4000
	dbw EFFECTCMDTYPE_AI_SELECTION, SwitchDFP_AISelectEffect - $4000
	db  $00

CanSwitchSelfAfterDamageEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Teleport_SwitchEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, Teleport_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Teleport_AISelectEffect
	db  $00

Conversion2EffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Conversion2_ResistanceCheck
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, Conversion2_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Conversion2_ChangeResistanceEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Conversion2_AISelectEffect
	db  $00

CopyOppAttackEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, ClefairyMetronome_CheckAttacks
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, ClefairyMetronome_UseAttackEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, ClefairyMetronome_AISelectEffect
	db  $00

CopyOppAttackEffectCommands2::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, ClefableMetronome_CheckAttacks
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, ClefableMetronome_UseAttackEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, ClefableMetronome_AISelectEffect
	db  $00

CounterLastAttackEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, PidgeottoMirrorMove_InitialEffect1
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, PidgeottoMirrorMove_InitialEffect2
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PidgeottoMirrorMove_BeforeDamage
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, PidgeottoMirrorMove_AfterDamage
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, PidgeottoMirrorMove_PlayerSelection
	dbw EFFECTCMDTYPE_AI_SELECTION, PidgeottoMirrorMove_AISelection
	dbw EFFECTCMDTYPE_AI, PidgeottoMirrorMove_AIEffect
	db  $00

CrossAttackEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, CrossAttackEffect - $4000
	dbw EFFECTCMDTYPE_AI, CrossAttack_AIEffect - $4000
	db  $00

CutenessEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, NeutralizingShieldEffect
	db  $00

DamageAndDo10ToABenchEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, GengarDarkMind_DamageBenchEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, GengarDarkMind_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, GengarDarkMind_AISelectEffect
	db  $00

DamageSwapEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, DamageSwap_CheckDamage
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DamageSwap_SelectAndSwapEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, DamageSwap_SwapEffect
	db  $00

DeepSleepEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, EnergyBurnEffect
	db  $00

DevolutionBeamEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, DevolutionBeam_CheckPlayArea
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, DevolutionBeam_PlayerSelectEffect
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DevolutionBeam_LoadAnimation
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, DevolutionBeam_DevolveEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, DevolutionBeam_AISelectEffect
	db  $00

Discard1EnergyFromTargetEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Whirlpool_DiscardEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, Whirlpool_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Whirlpool_AISelectEffect
	db  $00

Discard1FireEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Ember_CheckEnergy
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, Ember_PlayerSelectEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, Ember_DiscardEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Ember_AISelectEffect
	db  $00

Discard1WHealAllDamageCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, StarmieRecover_CheckEnergyHP
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, StarmieRecover_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, StarmieRecover_HealEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, StarmieRecover_DiscardEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, StarmieRecover_AISelectEffect
	db  $00

Discard2EnergyEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, FireSpin_CheckEnergy
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, FireSpin_PlayerSelectEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, FireSpin_DiscardEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, FireSpin_AISelectEffect
	db  $00

Discard2FThenPlus10PerSelfDamageEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, ArcanineFlamethrower_CheckEnergy
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, ArcanineFlamethrower_PlayerSelectEffect
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, FlamesOfRage_DamageBoostEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, ArcanineFlamethrower_DiscardEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, ArcanineFlamethrower_AISelectEffect
	dbw EFFECTCMDTYPE_AI, FlamesOfRage_AIEffect
	db  $00

DiscardAllEnergyEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ThunderboltEffect
	db  $00

DiscardAllLForPlusDamageEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RaichuLS_DamageEffect - $4000
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, PlayerYesOrNoSelectionRaichu1Effect - $4000
	dbw EFFECTCMDTYPE_AI_SELECTION, RaichuLS_AISelectEffect - $4000
	dbw EFFECTCMDTYPE_AI, RaichuLS_AIEffect - $4000
	db  $00

DiscardFForMoreDamageEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Wildfire_CheckEnergy
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, Wildfire_PlayerSelectEffect
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Wildfire_DiscardDeckEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, Wildfire_DiscardEnergyEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Wildfire_AISelectEffect
	dbw EFFECTCMDTYPE_AI, Wildfire_AIEffect - $4000
	db  $00

DiscardLorFforStuffEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, HoohMoreDamageEffect - $4000
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, HoohRecoverEffect - $4000
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, PlayerForLSelectionHoohCEffect - $4000
	dbw EFFECTCMDTYPE_AI_SELECTION, Hooh_AISelectEffect - $4000
	dbw EFFECTCMDTYPE_AI, HoohAIDamageEffect - $4000
	db  $00

Do10LessPerOppRCEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PoliwagWaterGunEffect
	dbw EFFECTCMDTYPE_AI, PoliwagWaterGunEffect
	db  $00

Do10LessPerSelfDamageEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, KarateChop_DamageSubtractionEffect
	dbw EFFECTCMDTYPE_AI, KarateChop_AIEffect
	db  $00

Do10MorePerInjuredPokesEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ZubatLeechLifeEffect
	dbw EFFECTCMDTYPE_AI, BeedrillPoisonSting_AIEffect
	db  $00

Do10MorePerOppDamageEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, MrMimeMeditate_DamageBoostEffect
	dbw EFFECTCMDTYPE_AI, MrMimeMeditate_AIEffect
	db  $00

Do10MorePerOppEnergyEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Psychic_DamageBoostEffect
	dbw EFFECTCMDTYPE_AI, Psychic_AIEffect
	db  $00

Do10MorePerOppRCEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ButterfreeMegaDrainEffect
	dbw EFFECTCMDTYPE_AI, ButterfreeMegaDrainEffect
	db  $00

Do10MorePerSelfBenchEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DoTheWaveEffect
	dbw EFFECTCMDTYPE_AI, DoTheWaveEffect
	db  $00

Do10MorePerSelfDamageEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, CuboneRage_DamageBoostEffect
	dbw EFFECTCMDTYPE_AI, CuboneRage_AIEffect
	db  $00

Do10PerOppRCEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ClampEffect
	dbw EFFECTCMDTYPE_AI, ClampEffect
	db  $00

Do10PerSelfDamageThenMayConfuseEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Rampage_Confusion50PercentEffect
	dbw EFFECTCMDTYPE_AI, Rampage_AIEffect
	db  $00

Do10To3BenchedEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Gigashock_BenchDamageEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, Gigashock_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Gigashock_AISelectEffect
	db  $00

Do10ToAllBenchAnd40ToSelfEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, GolemSelfdestructEffect
	db  $00

Do10ToAllOppBenchedEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, MagnetonLv28SelfdestructEffect
	db  $00

Do10ToOwnBenchEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, EarthquakeEffect
	db  $00

Do10XPerSelfDamageEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, MagikarpFlail_HPCheck
	dbw EFFECTCMDTYPE_AI, MagikarpFlail_AIEffect
	db  $00

Do10XPerYouAndOppEnergiesEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, NidorinoDoubleKick_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, NidorinoDoubleKick_AIEffect
	db  $00

Do20MorePerOppEnergyEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Psychic_DamageBoostEffect2 - $4000
	dbw EFFECTCMDTYPE_AI, Psychic_AIEffect2 - $4000
	db  $00

Do20MorePerSelfPEnergyEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SeadraWaterGunEffect
	dbw EFFECTCMDTYPE_AI, SeadraWaterGunEffect
	db  $00

Do20PerUnownAEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, BoyfriendsEffect
	db  $00

Do20ToABenchEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, LeekSlap_SetUsedThisDuelFlag
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, LeekSlap_OncePerDuelCheck
	dbw EFFECTCMDTYPE_AI_SELECTION, GengarDarkMind_AISelectEffect
	db  $00

Do20ToAllBenchAnd50ToSelfEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, WeezingSelfdestructEffect
	db  $00

Do20ToOppBenchOnlyEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, StretchKick_CheckBench
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, PikachuLv16GrowlEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, StretchKick_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, StretchKick_AISelectEffect
	db  $00

Do20ToSelfEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, JigglypuffDoubleEdgeEffect
	db  $00

Do20moreIfDFPStatusedEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DreamEaterEffect
	dbw EFFECTCMDTYPE_AI, TransparencyEffect ; Define damage for AI here (10+20)
	db  $00

Do30ToABenchEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, StretchKick_CheckBench
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, StretchKick_BenchDamageEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, StretchKick_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, StretchKick_AISelectEffect
	db  $00

Do30moreIfDFPStatusedEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, CriticalStrikeEffect - $4000
	dbw EFFECTCMDTYPE_AI, CriticalStrikeEffectAIEffect - $4000 ; Define damage for AI here (20+30)
	db  $00

Do40AnyTargetEffectCommands::
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, AnyTargetEffect - $4000
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, FeintAttackDamageEffect - $4000
	dbw EFFECTCMDTYPE_AI_SELECTION, SpecialTargetPokemonWithLowestHP_AISelection - $4000
	dbw EFFECTCMDTYPE_AI, FeintAttackAIEffect - $4000
	db  $00

Do40ToSelfEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, TakeDownEffect
	db  $00

DontApplyWREffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, MagnetonSonicboom_UnaffectedByColorEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, MagnetonSonicboom_NullEffect
	dbw EFFECTCMDTYPE_AI, MagnetonSonicboom_UnaffectedByColorEffect
	db  $00

DracoMeteorEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, FireSpin_CheckEnergy
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, FireSpin_PlayerSelectEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, FireSpin_DiscardEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, AnyTargetEffect - $4000
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, DracoMeteorDamageEffect - $4000 ; in functions, contains a special animation effect found in: DealDamageToPlayAreaPokemon_DracoAnim.
	dbw EFFECTCMDTYPE_AI_SELECTION, FireSpin_AISelectEffect
	db  $00

Draw1CardEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, FetchEffect
	db  $00

Draw2EffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, AttackDraw2Effect - $4000
	db  $00

DriveOffEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, DriveOffCheck - $4000
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DriveOffSetFlag - $4000
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, PidgeottoWhirlwind_SelectEffect
	dbw EFFECTCMDTYPE_AI_SWITCH_DEFENDING_PKMN, PidgeottoWhirlwind_SelectEffect
	db  $00

ETB10ToOppBenchEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Quickfreeze_InitialEffect
	dbw EFFECTCMDTYPE_PKMN_POWER_TRIGGER, MagnetonLv35SelfdestructEffect
	db  $00

ETB30ToARandomEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, PealOfThunder_InitialEffect
	dbw EFFECTCMDTYPE_PKMN_POWER_TRIGGER, PealOfThunder_RandomlyDamageEffect
	db  $00

ETBCFPRZEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Quickfreeze_InitialEffect
	dbw EFFECTCMDTYPE_PKMN_POWER_TRIGGER, Quickfreeze_Paralysis50PercentEffect
	db  $00

ETBHeal30AllSelfEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, HealingWind_InitialEffect
	dbw EFFECTCMDTYPE_PKMN_POWER_TRIGGER, HealingWind_PlayAreaHealEffect
	db  $00

ETBNoOppTrainersEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Quickfreeze_InitialEffect
	dbw EFFECTCMDTYPE_PKMN_POWER_TRIGGER, HeadacheEffect
	db  $00

EeveelutionEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, EeveelutionCheckDeckEffect - $4000
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, EeveelutionAddToHandEffect - $4000
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, EeveelutionPlayerSelectEffect - $4000
	dbw EFFECTCMDTYPE_AI_SELECTION, EeveelutionAISelectEffect - $4000
	db  $00

EnergyTransEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, EnergyTrans_CheckPlayArea
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, EnergyTrans_TransferEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, EnergyTrans_AIEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, EnergyTrans_PrintProcedure
	db  $00

Entei2MayGetImmunityEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SeadraAgilityEffect
	db  $00

EtherealFlameEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DreamEaterEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Confusion50PercentEffect
	dbw EFFECTCMDTYPE_AI, DreamEaterAIEffect - $4000 ; Define damage for AI here
	db  $00

FinalBlowActualEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, FinalBlowEffect - $4000
	dbw EFFECTCMDTYPE_AI, FinalBlowAIEffect - $4000
	db  $00

FinalBlowEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, FinalBlowPPEffect - $4000
	db  $00

FloodlightEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, FloodlightCheckEffect - $4000
	dbw EFFECTCMDTYPE_AFTER_DAMAGE,Paralysis50PercentEffect
	dbw EFFECTCMDTYPE_AI, FloodlightEffect - $4000
	db  $00

Get2DiscardEnergyAttachToSelfEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, MewtwoLv60EnergyAbsorption_CheckDiscardPile - $4000
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, MewtwoLv60EnergyAbsorption_AddToHandEffect - $4000
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, MewtwoLv60EnergyAbsorption_PlayerSelectEffect - $4000
	dbw EFFECTCMDTYPE_AI_SELECTION, MewtwoLv60EnergyAbsorption_AISelectEffect - $4000
	db  $00

Get4FireFromDeckEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Firegiver_InitialEffect
	dbw EFFECTCMDTYPE_PKMN_POWER_TRIGGER, Firegiver_AddToHandEffect
	db  $00

HalveDamageEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, LightScreenEffect
	db  $00

HeadsPSNTailsCFNEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, FoulGas_PoisonOrConfusionEffect
	dbw EFFECTCMDTYPE_AI, FoulGas_AIEffect
	db  $00

Heal10FromAllEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Heal10FromAllEffect - $4000
	db  $00

Heal1DamageifSuccessEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, BulbasaurLeechSeedEffect
	db  $00

Heal20DamageEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, DodrioRage_AIEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, DodrioRage_DamageBoostEffect
	db  $00

Heal20IfSuccessEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, ClefableMinimizeEffect
	db  $00

HealEqualToDamageEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, GolbatLeechLifeEffect
	db  $00

HealHalfDamageEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, AbsorbEffect
	db  $00

IfNoKOReturnToHandEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, HurricaneEffect
	db  $00

InflictPoisonEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PoisonEffect
	dbw EFFECTCMDTYPE_AI, PoisonFang_AIEffect
	db  $00

InflictSleepAfterDamageEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SleepEffect
	db  $00

InflictSleepEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SleepEffect
	db  $00

IroncladEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, KabutoArmorEffect
	db  $00

LessDamageifDFPInjuredEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, LessDamageifDFPDamagedEffect - $4000
	dbw EFFECTCMDTYPE_AI, WeedlePoisonSting_AIEffect
	db  $00

MagmaArmorEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, StrikesBackEffect
	db  $00

MayChangeWeaknessEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, Conversion1_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Conversion1_ChangeWeaknessEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Conversion1_AISelectEffect
	db  $00

MayConfuseAndPoisonEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, VenomPowder_PoisonConfusion50PercentEffect
	dbw EFFECTCMDTYPE_AI, VenomPowder_AIEffect
	db  $00

MayDo10MoreAndConfuseEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, NidorinaDoubleKick_MultiplierEffect
	dbw EFFECTCMDTYPE_AI, NidorinaDoubleKick_AIEffect
	db  $00

MayDo10Plus20EffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, EeveeQuickAttack_DamageBoostEffect
	dbw EFFECTCMDTYPE_AI, EeveeQuickAttack_AIEffect
	db  $00

MayDo10ToOppBenchAndPRZEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, WartortleWithdrawEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, BubbleShowerBenchEffect - $4000
	db  $00

MayDo20MoreOrPRZEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, BellsproutCallForFamily_PutInPlayAreaEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, BellsproutCallForFamily_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI, BellsproutCallForFamily_AISelectEffect
	db  $00

MayDo20Plus10EffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, TaurosStomp_DamageBoostEffect
	dbw EFFECTCMDTYPE_AI, TaurosStomp_AIEffect
	db  $00

MayDo20Plus20EffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ElectabuzzQuickAttack_DamageBoostEffect
	dbw EFFECTCMDTYPE_AI, ElectabuzzQuickAttack_AIEffect
	db  $00

MayDo20ToEachOppBenchEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, ExeggcuteLeechSeedEffect
	db  $00

MayDo30Plus20EffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ArcanineQuickAttack_DamageBoostEffect
	dbw EFFECTCMDTYPE_AI, ArcanineQuickAttack_AIEffect
	db  $00

MayDoPlus10Or10ToSelfEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Thunderpunch_ModifierEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Thunderpunch_RecoilEffect
	dbw EFFECTCMDTYPE_AI, Thunderpunch_AIEffect
	db  $00

MayDoPlusCF20x2EffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, TerrorStrike_SwitchDefendingPokemon
	dbw EFFECTCMDTYPE_AI, TerrorStrike_50PercentSelectSwitchPokemon
	db  $00

MayDraw1CardEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, PayDayEffect
	db  $00

MayGetImmunityEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, FearowAgilityEffect
	db  $00

MayGetImmunityNoDMGEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, ScrunchEffect
	db  $00

MayGetImmunityOrDoNothingEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Fly_Success50PercentEffect
	dbw EFFECTCMDTYPE_AI, Fly_AIEffect
	db  $00

MayInflictConfusionEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, NidorinaSupersonicEffect
	db  $00

MayInflictParalysisEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Paralysis50PercentEffect
	db  $00

MayInflictPoisonEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Poison50PercentEffect
	dbw EFFECTCMDTYPE_AI, WeepinbellPoisonPowder_AIEffect
	db  $00

MayInflictSleepEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SleepingGasEffect
	db  $00

MayPRZandPSNEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, MayPSNAndPRZEffect - $4000
	dbw EFFECTCMDTYPE_AI, WeepinbellPoisonPowder_AIEffect
	db  $00

MayParalyzeOrConfuseEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PRZorCFNEffect - $4000
	db  $00

MayPreventDamageOnlyEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, MetapodStiffenEffect
	db  $00

Mill1OppCardEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, SpitPoison_AIEffect
	db  $00

Mill3OppCardsEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, MorphEffect
	db  $00

MoonlightEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, EnergySearch_DeckCheck
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, NidoranFCallForFamily_CheckDeckAndPlayArea
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, EnergySearch_AddToHandEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, EnergySearch_PlayerSelection
	db  $00

MoreDamageIfDFPInjuredEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, MoreDamageifDFPDamagedEffect - $4000
	dbw EFFECTCMDTYPE_AI, MoreDamageifDFPDamagedAIEffect - $4000
	db  $00

MorePARifHPLowEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SpecialParalysisEffect - $4000
	db  $00

MysteryAttackEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, MysteryAttack_RandomEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, MysteryAttack_RecoverEffect
	dbw EFFECTCMDTYPE_AI, MysteryAttack_AIEffect
	db  $00

MythicalShieldEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, InvisibleWallEffect
	db  $00

NoLimitExtraWEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, BlastoiseHydroPumpEffect - $4000
	dbw EFFECTCMDTYPE_AI, BlastoiseHydroPumpEffect - $4000
	db  $00

NoMoreEvosBothPlayersEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, PrehistoricPowerEffect
	db  $00

NoOppTrainersEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, HeadacheEffect
	db  $00

NoPokePowersEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, ToxicGasEffect
	db  $00

NoPokepowersNextTurnEffect::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, DisablePokepowersEffect - $4000
	db  $00

NoRetreatAbilityEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, SuctionCupsEffect - $4000
	db  $00

NoRetreatEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, NewAcidEffect - $4000
	db  $00

NoSpecialConditionsEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, StatusImmunityEffect - $4000
	db  $00

OppCantUse1AttackEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, PoliwhirlAmnesia_CheckAttacks
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, PoliwhirlAmnesia_PlayerSelectEffect
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PoliwhirlAmnesia_DisableEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, PoliwhirlAmnesia_AISelectEffect
	db  $00

OppMill5IfSuccessEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, SingEffect
	db  $00

PainSplitEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SuperFang_HalfHPEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, BulbasaurLeechSeedEffect
	dbw EFFECTCMDTYPE_AI, SuperFang_AIEffect
	db  $00

PokepowerNoStatusEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, ThickSkinnedEffect
	db  $00

PrecognitionEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, ClairvoyanceEffect
	db  $00

ProphecyEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Prophecy_CheckDeck
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Prophecy_ReorderDeckEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, Prophecy_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Prophecy_AISelectEffect
	db  $00

PsysplashEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PsywaveEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, ChainLightningEffect
	dbw EFFECTCMDTYPE_AI, PsywaveAIEffect - $4000
	db  $00

RainDanceEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, RainDanceEffect
	db  $00

RandomStatusEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RandomStatusEffect - $4000
	dbw EFFECTCMDTYPE_AI, RandomStatusEffect_AI - $4000
	db  $00

ReduceBy20AfterAttackEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, GrimerMinimizeEffect
	db  $00

ReduceDamageBy10AfterDamageEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, ExpandEffect
	db  $00

ReduceDamageBy10EffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PikachuAltLv16GrowlEffect
	db  $00

ReduceDamageBy20EffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SnivelEffect
	db  $00

ReduceRCBy2EffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, RetreatAidEffect
	db  $00

Retrieve2DiscardedEnergyEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, EnergyConversion_CheckEnergy
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, EnergyConversion_AddToHandEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, EnergyConversion_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, EnergyConversion_AISelectEffect
	db  $00

SLPAndHealEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, SLPHealEffect - $4000
	db  $00

ScavengeEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Scavenge_CheckDiscardPile
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, Scavenge_PlayerSelectEnergyEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Scavenge_AddToHandEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, Scavenge_PlayerSelectTrainerEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, Scavenge_DiscardEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, Scavenge_AISelectEffect
	db  $00

SearchAndAttachEnergyEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, EnergySpike_DeckCheck
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, EnergySpike_AttachEnergyEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, EnergySpike_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, EnergySpike_AISelectEffect
	db  $00

SearchForTPutOnBenchEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, MarowakCallForFamily_CheckDeckAndPlayArea
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, MarowakCallForFamily_PutInPlayAreaEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, MarowakCallForFamily_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, MarowakCallForFamily_AISelectEffect
	db  $00

SearchFossilEggEffectCommandswnEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, KrabbyCallForFamily_CheckDeckAndPlayArea
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, KrabbyCallForFamily_PutInPlayAreaEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, KrabbyCallForFamily_PlayerSelectEffect
	dbw EFFECTCMDTYPE_AI_SELECTION, KrabbyCallForFamily_AISelectEffect
	db  $00

SelfDoubleDamageEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, FocusEnergyEffect
	db  $00

SelfHeal10EffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, FirstAid_DamageCheck
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, FirstAid_HealEffect
	db  $00

ShinyFeatherEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Quickfreeze_InitialEffect
	dbw EFFECTCMDTYPE_PKMN_POWER_TRIGGER, MagneticStormEffect
	db  $00

ShuffleHandThenDraw7EffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, FoulOdorEffect
	db  $00

SmokescreenEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, MagmarSmokescreenEffect
	db  $00

StepInEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, StepIn_BenchCheck
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, StepIn_SwitchEffect
	db  $00

SurprisePresentEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PresentEffect - $4000
	db  $00

SwitchAndNoRetreatEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SwitchDFPSwitchEffect - $4000
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, SwitchDFP_PlayerSelectEffect - $4000
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, NewAcidEffect - $4000
	dbw EFFECTCMDTYPE_AI_SELECTION, SwitchDFP_AISelectEffect - $4000
	db  $00

SwitchAndPoisonEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, SwitchDFPSwitchEffect - $4000
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, SwitchDFP_PlayerSelectEffect - $4000
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, PoisonAcidEffect - $4000
	dbw EFFECTCMDTYPE_AI_SELECTION, SwitchDFP_AISelectEffect - $4000
	db  $00

SwitchOppAfterDamageEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, PidgeyWhirlwind_SwitchEffect
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, PidgeyWhirlwind_SelectEffect
	dbw EFFECTCMDTYPE_AI_SWITCH_DEFENDING_PKMN, PidgeyWhirlwind_SelectEffect
	db  $00

SwitchOppEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Lure_CheckBench - $4000
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Lure_SwitchEffect - $4000
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, Lure_PlayerSelectEffect - $4000
	dbw EFFECTCMDTYPE_AI_SELECTION, Lure_AISelectEffect - $4000
	db  $00

TimeLoopEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, MrFuji_BenchCheck
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, MrFuji_PlayerSelection
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, KadabraRecover_PlayerSelectEffect
	dbw EFFECTCMDTYPE_DISCARD_ENERGY, KadabraRecover_DiscardEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, MrFuji_ReturnToDeckEffect
	db  $00

ToxicEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, Toxic_DoublePoisonEffect
	dbw EFFECTCMDTYPE_AI, Toxic_AIEffect
	db  $00

WEWaterBoostEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, OmastarWaterGunEffect
	dbw EFFECTCMDTYPE_AI, OmastarWaterGunEffect
	db  $00

WWEWaterBoostEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, VaporeonWaterGunEffect
	dbw EFFECTCMDTYPE_AI, VaporeonWaterGunEffect
	db  $00

WWaterBoostEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, OmanyteWaterGunEffect
	dbw EFFECTCMDTYPE_AI, OmanyteWaterGunEffect
	db  $00

WailEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, Wail_BenchCheck
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, Wail_FillBenchEffect
	db  $00

