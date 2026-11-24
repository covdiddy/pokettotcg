; =============================================================================
; Neo Gen 2 Effect Functions (ROMX $56 "Neo Effects 2")
; Imported from Pokemon-TCG-Neo and adapted for 16-bit card IDs and bank $56.
; =============================================================================

; Returns carry if Pokemon Powers are currently disabled (Goop Gas Attack / Muk).
Neo_CheckCantUsePokepowers::
	ld a, [wGoopGasAttackActive]
	or a
	jr z, .ok
	ldtx hl, UnableDueToToxicGasText
	scf
	ret
.ok
	or a
	ret

AnyTargetEffect::
	call AnyTargetEffect2
	ret

Deal10DamageToTargetPerEnergy_DamageEffect::
	ldh a, [hTempPlayAreaLocation_ffa1]
	cp $ff
	ret z
	call SwapTurn
	ld e, a
	call GetPlayAreaCardAttachedEnergies
	ld a, [wTotalAttachedEnergies]
	call ATimes10
	ld e, a
	ld d, 0
	ldh a, [hTempPlayAreaLocation_ffa1]
	ld b, a
	call DealDamageToPlayAreaPokemon_PsyAnim
	call SwapTurn
	ret

FlareonDamageEffect::
	ldh a, [hTemp_ffa0]
	or a
	ret nz ; = no selected
	ld a, ATK_ANIM_BIG_FLAME
	ld [wLoadedAttackAnimation], a
	ld a, 30
	call AddToDamage
	ret

PlayerYesNoFlareonEffect::
	bank1call DrawDuelMainScene
	ldtx hl, FlareonYesNoText
	call TwoItemHorizontalMenu
	ldh a, [hKeysHeld]
	and PAD_B
	ldh a, [hCurMenuItem]
	jr nz, PlayerYesNoFlareonEffect
	ldh a, [hCurMenuItem]
	ldh [hTemp_ffa0], a
	ret

FlareonRecoilEffect::
	ldh a, [hTemp_ffa0]
	or a
	ret nz 
	ld a, 30
	call DealRecoilDamageToSelf
	ret

FlareonFB_AISelectEffect::
	ldh a, [hTempPlayAreaLocation_ff9d]
	add DUELVARS_ARENA_CARD_HP
	call GetNonTurnDuelistVariable ; checks enemy active pkmn
	cp 31
	jr c, .LessThan31HP
	jr nc, .MoreThan31HP 

.LessThan31HP
	ld a, 1 ; =no
	ldh [hTemp_ffa0], a
	ret

.MoreThan31HP
	ld a, 0 ; =yes
	ldh [hTemp_ffa0], a
	ret

FlareonFB_AIEffect::
	ld a, 30
	lb de, 30, 60
	farcall SetExpectedAIDamage
	ret

SwitchDFPSwitchEffect::
	ldh a, [hTemp_ffa0]
 	ld e, a
  	inc a ; cp -1
  	ret z ; return if no Benched Pokemon was selected

	call SwapTurn
	ldh a, [hTemp_ffa0]
	ld e, a
	call SwapArenaWithBenchPokemon
	call SwapTurn
	call ClearDamageReductionSubstatus2
	xor a
	ld [wDuelDisplayedScreen], a
	ret

SwitchDFP_PlayerSelectEffect::
	ld a, -1
   	ldh [hTemp_ffa0], a
   	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
   	call GetNonTurnDuelistVariable
  	dec a ; cp 1
    	ret z ; return with the default variable if the turn holder's Bench is empty
    	ldtx hl, SwitchDFPYesNoText
   	call YesOrNoMenuWithText
   	ret c
  	;fallthrough
	call SwapTurn
	ldtx hl, ChooseAPokemonToSwitchWithActivePokemonText
	call DrawWideTextBox_WaitForInput
	bank1call HasAlivePokemonInBench
	ld a, $01
	ld [wPlayAreaSelectAction], a ; =ld [wPlayAreaSelectAction], a
.loop_input
	bank1call OpenPlayAreaScreenForSelection
	jr c, .loop_input ; must choose, B button can't be used to exit
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	call SwapTurn
	ret

SwitchDFP_AISelectEffect::
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	call GetBenchPokemonWithLowestHP
	or a
	jr z, .no_bench
	ldh [hTemp_ffa0], a
	ret
.no_bench
	ld a, -1
	ldh [hTemp_ffa0], a
	ret

; return carry if no cards in Deck

CrossAttackEffect::
	call CrossAttackEffect2
	ret

CrossAttack_AIEffect::
	ld a, (40 * 2) / 2
	lb de, 0, 80
	farcall SetExpectedAIDamage
	ret

RaichuLS_DamageEffect::
	ldh a, [hTemp_ffa0]
	or a
	ret nz ; = no selected
	call DiscardAllLEffect ; otherwise yes selected
	ld a, ATK_ANIM_THUNDER_WHOLE_SCREEN
	ld [wLoadedAttackAnimation], a
	ld a, 80
	farcall SetDefiniteDamage
	ret

PlayerYesOrNoSelectionRaichu1Effect::
	bank1call DrawDuelMainScene
	ldtx hl, RaichuYesNoText
	call TwoItemHorizontalMenu
	ldh a, [hKeysHeld]
	and PAD_B
	ldh a, [hCurMenuItem]
	jr nz, PlayerYesOrNoSelectionRaichu1Effect ; loop back if nothing selected
	ldh a, [hCurMenuItem]
	ldh [hTemp_ffa0], a
	ret

RaichuLS_AISelectEffect::
	ldh a, [hTempPlayAreaLocation_ff9d]
	add DUELVARS_ARENA_CARD_HP
	call GetNonTurnDuelistVariable ; checks enemy active pkmn
	cp 41
	jr c, .LessThan41HP
	jr nc, .MoreThan41HP 

.LessThan41HP
	ld a, 1 ; =no
	ldh [hTemp_ffa0], a
	ret

.MoreThan41HP
	ld a, 0 ; =yes
	ldh [hTemp_ffa0], a
	ret

RaichuLS_AIEffect::
	ld a, 40
	lb de, 40, 80
	farcall SetExpectedAIDamage
	ret

Wildfire_AIEffect::
	ld a, 70
	lb de, 70, 70
	farcall SetExpectedAIDamage
	ret

HoohMoreDamageEffect::
	call HoohMoreDamageEffect2
	ret

HoohRecoverEffect::
	call HoohRecoverEffect2
	ret

PlayerForLSelectionHoohCEffect::
	call PlayerForLSelectionHoohCEffect2
	ret

Hooh_AISelectEffect::
	call Hooh_AISelectEffect2
	ret

HoohAIDamageEffect::
	ld a, 40
	lb de, 40, 60
	farcall SetExpectedAIDamage
	ret

Psychic_DamageBoostEffect2:: ; 2dd81 (b:5d81)
	farcall GetEnergyAttachedMultiplierDamage
	ld hl, wDamage
	ld a, e
	add a
	add [hl]
	ld [hli], a
	ld a, d
	adc [hl]
	ld [hl], a
	ret

; return carry if no Psychic Energy attached

Psychic_AIEffect2:: ; 2dd7b (b:5d7b)
	call Psychic_DamageBoostEffect2
	farcall SetDefiniteAIDamage
	ret

CriticalStrikeEffect::
	ld a, DUELVARS_ARENA_CARD_STATUS
	call GetNonTurnDuelistVariable
	or a
	jr nz, .has_status
	jr z, .no_status
.has_status
	ld a, 30
	call AddToDamage
	ret

.no_status
	ret

CriticalStrikeEffectAIEffect::
	ld a, (20 + 30) / 2
	lb de, 20, 50
	farcall SetExpectedAIDamage
	ret

FeintAttackDamageEffect::
	ldh a, [hTempPlayAreaLocation_ffa1]
	cp $ff
	ret z ; no target chosen
	call SwapTurn
	ld b, a
	ld de, 40
	call DealDamageToPlayAreaPokemon_RegularAnim ; Special animation found below to make it look good.
	call SwapTurn
	ret

SpecialTargetPokemonWithLowestHP_AISelection::
	call SpecialTargetPokemonWithLowestHP_AISelection2
	ret

FeintAttackAIEffect::
	lb de, 40, 40
	farcall SetExpectedAIDamage
	ret

DracoMeteorDamageEffect::
	ldh a, [hTempPlayAreaLocation_ffa1]
	cp $ff
	ret z ; no target chosen
	call SwapTurn
	ld b, a
	ld de, 80
	call DealDamageToPlayAreaPokemon_DracoAnim ; Special animation found below to make it look good.
	call SwapTurn
	ret

AttackDraw2Effect::
	ld hl, wDealtDamage
	ld a, [hli]
	or [hl]
	ret z ; return if no damage dealt 

	ld a, 2
	bank1call DisplayDrawNCardsScreen
	ld c, 2
.loop_draw
	call DrawCardFromDeck
	jr c, .done
	ldh [hTempCardIndex_ff98], a
	call AddCardToHand
	farcall IsPlayerTurn
	jr nc, .skip_display_screen
	push bc
	bank1call DisplayPlayerDrawCardScreen
	pop bc
.skip_display_screen
	dec c
	jr nz, .loop_draw
.done
	ret

DriveOffCheck::
	call Neo_CheckCantUsePokepowers
	ret c
	ldh a, [hTempPlayAreaLocation_ff9d]
	or a
	jr nz, .not_arcanine
	ld a, DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	call GetCardIDFromDeckIndex
	ld bc, ARCANINE
	call CompareDEtoBC
	jr nz, .not_arcanine
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	ldtx hl, EffectNoPokemonOnTheBenchText
	cp 2
	ret c
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	add DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	and USED_PKMN_POWER_THIS_TURN
	jr nz, .already_used
	ldh a, [hTempPlayAreaLocation_ff9d]
	call CheckIsIncapableOfUsingPkmnPower
	ret

.not_arcanine
	ldtx hl, ArcNoActiveText
	scf
	ret

.already_used
	ldtx hl, OnlyOncePerTurnText
	scf
	ret

DriveOffSetFlag::
	ldh a, [hTemp_ffa0]
	add DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	set USED_PKMN_POWER_THIS_TURN_F, [hl]
	ldh a, [hTempPlayAreaLocation_ff9d]
	ld b, a
	ld c, $00
	ldh a, [hWhoseTurn]
	ld h, a
	ld a, ATK_ANIM_WHIRLWIND
	ld [wLoadedAttackAnimation], a
	bank1call PlayAttackAnimation
	bank1call PlayStatusConditionQueueAnimations
	bank1call WaitAttackAnimation
	bank1call ApplyStatusConditionQueue
	bank1call DrawDuelHUDs
	bank1call PrintFailedEffectText
	call c, WaitForWideTextBoxInput
	ldh a, [hTempPlayAreaLocation_ffa1]
	farcall HandleSwitchDefendingPokemonEffect
	ret

EeveelutionCheckDeckEffect::
	call EeveelutionCheckDeckEffect2
	ret

EeveelutionAddToHandEffect::
	call EeveelutionAddToHandEffect2
	ret

EeveelutionPlayerSelectEffect::
	call EeveelutionPlayerSelectEffect2
	ret

EeveelutionAISelectEffect::
	call EeveelutionAISelectEffect2
	ret

DreamEaterAIEffect::
	ld a, (30 + 20) / 2
	lb de, 30, 50
	farcall SetExpectedAIDamage
	ret

FinalBlowEffect::
	call FinalBlowEffect2
	ret

FinalBlowAIEffect::
	call FinalBlowAIEffect2
	ret

FinalBlowPPEffect:: ; just to keep the game from messing up
	scf
	ret

FloodlightCheckEffect::
	call CheckIsIncapableOfUsingPkmnPower
	jr c, .NoBoost
	call Neo_CheckCantUsePokepowers
	jr c, .NoBoost
	jp FloodlightEffect
.NoBoost
	ret

FloodlightEffect::
	lb bc, 0, 2
	jp NoLimitWDamage

MewtwoLv60EnergyAbsorption_CheckDiscardPile::
	farcall CreateEnergyCardListFromDiscardPile_AllEnergy
	ldtx hl, ThereAreNoEnergyCardsInDiscardPileText
	ret

MewtwoLv60EnergyAbsorption_AddToHandEffect::
	ld hl, hTempList
.loop
	ld a, [hli]
	cp $ff
	ret z
	push hl
	call MoveDiscardPileCardToHand
	call GetTurnDuelistVariable
	ld [hl], CARD_LOCATION_ARENA
	pop hl
	jr .loop

; returns carry if Strange Behavior cannot be used.

MewtwoLv60EnergyAbsorption_PlayerSelectEffect::
	ldtx hl, Choose2EnergyCardsFromDiscardPileToAttachText
	farcall HandleEnergyCardsInDiscardPileSelection
	ret

MewtwoLv60EnergyAbsorption_AISelectEffect::
; AI picks first 2 energy cards
	farcall CreateEnergyCardListFromDiscardPile_AllEnergy
	ld hl, wDuelTempList
	ld de, hTempList
	ld c, 2
.loop
	ld a, [hli]
	cp $ff
	jr z, .done
	ld [de], a
	inc de
	dec c
	jr nz, .loop
.done
	ld a, $ff ; terminating byte
	ld [de], a
	ret

Heal10FromAllEffect::
	ldh a, [hTempPlayAreaLocation_ff9d]
	ld b, a
	ld c, $00
	ldh a, [hWhoseTurn]
	ld h, a
	bank1call PlayAttackAnimation
	bank1call WaitAttackAnimation
	ld a, ATK_ANIM_HEALING_WIND_PLAY_AREA
	ld [wLoadedAttackAnimation], a


	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ld d, a
	ld e, PLAY_AREA_ARENA
.loop_play_area
	push de
	ld a, e
	ldh [hTempPlayAreaLocation_ff9d], a
	call GetCardDamageAndMaxHP
	or a
	jr z, .next_pkmn ; skip if no damage

; if less than 20 damage, cap recovery at 10 damage
	ld de, 10
	cp e
	jr nc, .heal
	ld e, a

.heal
; add HP to this card
	ldh a, [hTempPlayAreaLocation_ff9d]
	add DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	add e
	ld [hl], a

; play heal animation
	ldh a, [hTempPlayAreaLocation_ff9d]
	ld b, a
	ld c, $01
	ldh a, [hWhoseTurn]
	ld h, a
	bank1call PlayAttackAnimation
	bank1call WaitAttackAnimation
.next_pkmn
	pop de
	inc e
	dec d
	jr nz, .loop_play_area
	ret

LessDamageifDFPDamagedEffect::
	call SwapTurn
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	or a
	jr nz, .LessDamage
	call SwapTurn
	ret
	
.LessDamage
	call SwapTurn
	ld a, 20
	call SubtractFromDamage
	ret

BubbleShowerBenchEffect::
	call LoadTxRam3
	ldh a, [hTemp_ffa0]
	or a
	jp z, .noeffect
	farcall MagnetonLv28SelfdestructEffect
	ret
.noeffect
	ret

MayPSNAndPRZEffect::
	ldtx de, MayPSNPARText
	farcall TossCoin_BankB
	ret nc
	farcall PoisonEffect
	farcall ParalysisEffect
	ret c
	ld a, POISONED | PARALYZED
	ld [wNoEffectFromWhichStatus], a
	ret

PRZorCFNEffect::
	ldtx de, ParOrConText
	farcall TossCoin_BankB
	jp c, ParalysisEffect
	farcall ConfusionEffect
	ret

MoreDamageifDFPDamagedEffect::
	call SwapTurn
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	or a
	jr nz, .MoreDamage
	call SwapTurn
	ret
	
.MoreDamage
	call SwapTurn
	ld a, 20
	call AddToDamage
	ret

MoreDamageifDFPDamagedAIEffect::
	call MoreDamageifDFPDamagedEffect
	farcall SetDefiniteAIDamage
	ret

SpecialParalysisEffect::
	call SpecialParalysisEffect2
	ret

.NoBoost
	farcall Paralysis50PercentEffect
	ret

BlastoiseHydroPumpEffect::
	lb bc, 2, 1
	jp NoLimitWDamage

DisablePokepowersEffect::
	ld a, 1
	ld [wGoopGasAttackActive], a
	ret

SuctionCupsEffect::
	scf
	ret

; return carry if has less than 2 Fire Energy cards

NewAcidEffect::
	ld a, SUBSTATUS2_ACID
	farcall ApplySubstatus2ToDefendingCard
	ret

StatusImmunityEffect:: ; grants immunity from special conditions for 1 turn
	ld a, SUBSTATUS1_AGILITY
	call ApplySubstatus1ToDefendingCard
	ret

PsywaveAIEffect::
	farcall PsywaveEffect
	ld hl, wDamage + 1
	set UNAFFECTED_BY_WEAKNESS_RESISTANCE_F, [hl]
	ret

; returns carry if neither Duelist has evolved Pokemon.

RandomStatusEffect::
	ld a, 40
	farcall SetDefiniteDamage
	ldtx de, RandomStatusText
	farcall TossCoin_BankB
	ret nc ; return if tails

	call UpdateRNGSources
	and %111
	ldh [hTemp_ffa0], a
	ld hl, .random_effect
	jp JumpToFunctionInTable

.random_effect ; NOTE: NEED 8 OPTIONS FOR THIS SORT OF EFFECT TO WORK.
	dw ParalysisEffect
	dw PoisonEffect
	dw SleepEffect
	dw ConfusionEffect
	dw ParalysisEffect
	dw PoisonEffect
	dw SleepEffect
	dw ConfusionEffect

RandomStatusEffect_AI::
	ld a, 20
	lb de, 20, 20
	farcall SetExpectedAIDamage
	ret


SLPHealEffect::
	lb de, 0, 30 ; heal 30 damage
	farcall ApplyAndAnimateHPRecovery
	call SwapTurn
	farcall SleepEffect ; cause self sleep
	call SwapTurn
	ret

PresentEffect::
	call PresentEffect2
	ret

PoisonAcidEffect::
	farcall PoisonEffect
	; fallthrough

Lure_CheckBench::
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	ldtx hl, EffectNoPokemonOnTheBenchText
	cp 2
	ret

Lure_SwitchEffect::
	call SwapTurn
	ldh a, [hTemp_ffa0]
	ld e, a
	call HandleNShieldAndTransparency
	call nc, SwapArenaWithBenchPokemon
	call SwapTurn
	xor a
	ld [wDuelDisplayedScreen], a
	ret

Lure_PlayerSelectEffect::
	ldtx hl, SelectPkmnOnBenchToSwitchWithActiveText
	call DrawWideTextBox_WaitForInput
	call SwapTurn
	bank1call HasAlivePokemonInBench
.loop_input
	bank1call OpenPlayAreaScreenForSelection
	jr c, .loop_input
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	call SwapTurn
	ret

Lure_AISelectEffect::
	call GetBenchPokemonWithLowestHP
	ldh [hTemp_ffa0], a
	ret

AnyTargetEffect2::
	xor a  ; PLAY_AREA_ARENA
	ldh [hTempPlayAreaLocation_ffa1], a
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	cp 2
	jr c, .done ; has no Bench Pokemon

	ldtx hl, ChoosePkmnToGiveDamageText
	call DrawWideTextBox_WaitForInput
	call SwapTurn
	bank1call HasAlivePokemonInPlayArea
.loop_input
	bank1call OpenPlayAreaScreenForSelection
	jr c, .loop_input
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTempPlayAreaLocation_ffa1], a
	call SwapTurn
.done
	or a
	ret

DealDamageToPlayAreaPokemon_PsyAnim::
	ld a, ATK_ANIM_PSYCHIC_HIT 
	ld [wLoadedAttackAnimation], a
	jp DealDamageToPlayAreaPokemon	

GetBenchPokemonWithLowestHP::
	call SwapTurn
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ld c, a
	lb de, PLAY_AREA_ARENA, $ff
	ld b, d
	ld a, DUELVARS_BENCH1_CARD_HP
	call GetTurnDuelistVariable
	jr .start
; find Play Area location with least amount of HP
.loop_bench
	ld a, e
	cp [hl]
	jr c, .next ; skip if HP is higher
	ld e, [hl]
	ld d, b

.next
	inc hl
.start
	inc b
	dec c
	jr nz, .loop_bench

	ld a, d
	call SwapTurn
	ret

; handles drawing and selection of screen for
; choosing a color (excluding colorless), for use
; of Shift Pkmn Power and Conversion attacks.
; outputs in a the color that was selected or,
; if B was pressed, returns carry.
; input:
;	a  = Play Area location (PLAY_AREA_*), with:
;	     bit 7 not set if it's applying to opponent's card
;	     bit 7 set if it's applying to player's card
;	hl = text to be printed in the bottom box
; output:
;	a = color that was selected

CrossAttackEffect2::
	ld hl, 40
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	ld a, 2
	farcall TossCoinATimes_BankB
	jp nc, .NoDamage
	add a
	add a
	call ATimes10
	farcall SetDefiniteDamage
	ret
.NoDamage
	ld a, 0
	farcall SetDefiniteDamage
	farcall ConfusionEffect
	farcall PoisonEffect
	ret

DiscardAllLEffect::
	call DiscardAllLEffect2
	ret

HoohMoreDamageEffect2::
	ldh a, [hTemp_ffa0]
	or a
	ret nz ; return if no
	ld a, 20
	call AddToDamage
	ret

HoohRecoverEffect2::
	ldh a, [hTemp_ffa0]
	or a
	ret z ; return if yes
	ld de, 20
	farcall ApplyAndAnimateHPRecovery
	ret 

PlayerForLSelectionHoohCEffect2::
	bank1call DrawDuelMainScene
	ldtx hl, HoohFLText
	call TwoItemHorizontalMenu
	ldh a, [hKeysHeld]
	and PAD_B
	ldh a, [hCurMenuItem]
	jr nz, PlayerForLSelectionHoohCEffect2
	ldh a, [hCurMenuItem]
	ldh [hTemp_ffa0], a
	;fallthrough

Hooh_AISelectEffect2::
	ldh a, [hTempPlayAreaLocation_ff9d]
	add DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable ; checks self for hp
	cp 41
	jr c, .LessThan41HP ;reversed until testing done
	jr nc, .MoreThan41HP 

.LessThan41HP
	call AIPickLightningEnergyCardToDiscard
	farcall Ember_DiscardEffect
	ld a, 1
	ldh [hTemp_ffa0], a
	ret

.MoreThan41HP
	farcall AIPickFireEnergyCardToDiscard
	farcall Ember_DiscardEffect
	ld a, ATK_ANIM_DIVE_BOMB
	ld [wLoadedAttackAnimation], a
	ld a, 20
	call AddToDamage
	ld a, 0 ; =yes, loaded again for the after damage effect.
	ldh [hTemp_ffa0], a
	ret

SpecialTargetPokemonWithLowestHP_AISelection2::
    call SwapTurn
    ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
    call GetTurnDuelistVariable
    ld c, a
    lb de, PLAY_AREA_ARENA, $ff
    ld b, d
    ld a, DUELVARS_ARENA_CARD_HP
    call GetTurnDuelistVariable

; find the location of the Pokemon with the least amount of remaining HP
.loop_bench
    ld a, e
    cp [hl]
    jr c, .next ; skip if HP is higher
    ld e, [hl]
    ld d, b
.next
    inc hl
    inc b
    dec c
    jr nz, .loop_bench

    ld a, d
    ldh [hTempPlayAreaLocation_ffa1], a
    jp SwapTurn

DealDamageToPlayAreaPokemon_DracoAnim::
	ld a, ATK_ANIM_BIG_HIT ; Loads this animation for the proper selected pkmn, then jumps to normal damage calc.
	ld [wLoadedAttackAnimation], a
	jp DealDamageToPlayAreaPokemon

EeveelutionCheckDeckEffect2::
	farcall CheckIfDeckIsEmpty
	ret nc ; return if no cards in deck
	ccf
	ret

EeveelutionAddToHandEffect2::
	ldh a, [hTemp_ffa0]
	cp $ff
	jr z, .shuffle
	call SearchCardInDeckAndAddToHand
	call AddCardToHand
	farcall IsPlayerTurn
	jr c, .shuffle
	; display card on screen
	ldh a, [hTemp_ffa0]
	ldtx hl, FoundCardText
	bank1call DisplayCardDetailScreen
.shuffle
	farcall ShuffleCardsInDeck
	ret

Neo_EeveelutionCardIDs:
	dw FLAREON
	dw JOLTEON
	dw VAPOREON
	dw ESPEON1
	dw ESPEON2
	dw UMBREON
	dw 0

; Returns z if 16-bit card ID in de is an Eeveelution, nz otherwise.
Neo_IsEeveelutionCardID:
	push hl
	push bc
	ld hl, Neo_EeveelutionCardIDs
.loop
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	or c
	jr z, .not_found
	ld a, c
	cp e
	jr nz, .loop
	ld a, b
	cp d
	jr nz, .loop
	pop bc
	pop hl
	xor a ; set z
	ret
.not_found
	pop bc
	pop hl
	or 1 ; clear z
	ret

EeveelutionPlayerSelectEffect2::
	ld a, $ff
	ldh [hTemp_ffa0], a
	call CreateDeckCardList
	; draw Deck list interface and print text
	bank1call InitAndDrawCardListScreenLayout_WithSelectCheckMenu
	ldtx hl, ChooseAnEeveelutionText
	ldtx de, DuelistDeckText
	bank1call SetCardListHeaderText

.loop
	bank1call DisplayCardList
	jr c, .pressed_b
	call GetCardIDFromDeckIndex
	call Neo_IsEeveelutionCardID
	jr nz, .play_sfx
	ldh a, [hTempCardIndex_ff98]
	ldh [hTemp_ffa0], a
	or a
	ret

.play_sfx
	call PlaySFX_InvalidChoice
	jr .loop

.pressed_b
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
.loop_b_press
	ld a, [hl]
	cp CARD_LOCATION_DECK
	jr nz, .next
	ld a, l
	call GetCardIDFromDeckIndex
	call Neo_IsEeveelutionCardID
	jr z, .play_sfx
.next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop_b_press
	ld a, $ff
	ldh [hTemp_ffa0], a
	or a
	ret

EeveelutionAISelectEffect2::
	call CreateDeckCardList
	ld hl, wDuelTempList
.loop_deck
	ld a, [hli]
	ldh [hTemp_ffa0], a
	cp $ff
	ret z ; none found
	call GetCardIDFromDeckIndex
	call Neo_IsEeveelutionCardID
	jr nz, .loop_deck
	ret

FinalBlowEffect2::
	call CheckIsIncapableOfUsingPkmnPower
	jr c, .MoreThan31HP 
	farcall Neo_CheckCantUsePokepowers
	jr c, .MoreThan31HP
	ldh a, [hTempPlayAreaLocation_ff9d]
	add DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	cp 31
	jr c, .LessThan31HP
	jr nc, .MoreThan31HP 
	ret

.LessThan31HP
	ld a, ATK_ANIM_DRILL
	ld [wLoadedAttackAnimation], a
	ld a, 80
	farcall SetDefiniteDamage
	ret

.MoreThan31HP
	ld a, ATK_ANIM_DRILL
	ld [wLoadedAttackAnimation], a
	ld a, 40
	farcall SetDefiniteDamage
	ret

FinalBlowAIEffect2::
	call CheckIsIncapableOfUsingPkmnPower
	jr nz, .MoreThan31HP
	ldh a, [hTempPlayAreaLocation_ff9d]
	add DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	cp 31
	jr c, .LessThan31HP
	jr nc, .MoreThan31HP 
	ret

.LessThan31HP
	ld a, 80
	farcall SetDefiniteAIDamage
	ret

.MoreThan31HP
	ld a, 40
	farcall SetDefiniteAIDamage
	ret

NoLimitWDamage::
	ld a, [wMetronomeEnergyCost]
	or a
	jr z, .not_metronome
	ld c, a ; amount of colorless needed for Metronome
	ld b, 0 ; no Water energy needed for Metronome

.not_metronome
	push bc
	ldh a, [hTempPlayAreaLocation_ff9d]
	ld e, a
	call GetPlayAreaCardAttachedEnergies
	pop bc

	ld hl, wAttachedEnergies + WATER
	ld a, c
	or a
	jr z, .check_bonus ; is Energy cost all water energy

	; it's not, so we need to remove the
	; psychic energy cards from calculations
	; if they pay for colorless instead.
	ld a, [wTotalAttachedEnergies]
	cp [hl]
	jr nz, .check_bonus ; skip if at least 1 non-Water energy attached

	; Water is the only energy color attached
	ld a, c
	add b
	ld b, a
	; b += c

.check_bonus
	ld a, [hl]
	sub b
	jr c, .skip_bonus ; is water energy <  b?
	jr z, .skip_bonus ; is water energy == b?

; a holds number of water energy not payed for energy cost
	cp 59
	jr c, .less_than_3
	ld a, 58 ; cap this to 2 for bonus effect
.less_than_3
	call ATimes10
	call AddToDamage ; add 10 * a to damage

.skip_bonus
	ld a, [wDamage]
	ld [wAIMinDamage], a
	ld [wAIMaxDamage], a
	ret

SpecialParalysisEffect2::
	ldh a, [hTempPlayAreaLocation_ff9d]
	add DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	cp 31
	jr c, .LessThan31HP
	jr nc, .MoreThan31HP 
	ret

.LessThan31HP
	call LoadTxRam3
	ldtx de, ParalysisIfAnyHeadsText
	ld a, 2
	farcall TossCoinATimes_BankB
	jp nc, .NoParalysis
	farcall ParalysisEffect
.NoParalysis
	ld a, ATK_ANIM_THUNDERBOLT
	ld [wLoadedAttackAnimation], a
	ld a, 50
	farcall SetDefiniteDamage
	ret

.MoreThan31HP
	farcall Paralysis50PercentEffect
	ld a, ATK_ANIM_THUNDER
	ld [wLoadedAttackAnimation], a
	ld a, 40
	farcall SetDefiniteDamage
	ret

ApplySubstatus1ToDefendingCard::
	push af
	ld a, DUELVARS_ARENA_CARD_SUBSTATUS1
	call GetTurnDuelistVariable
	pop af
	ld [hli], a
	ret

PresentEffect2::
	ldtx de, PresentEffectText
	farcall TossCoin_BankB
	jr c, .OneH
	jr nc, .OneT
	xor a
	ret
.OneH
	ldtx de, PresentEffectText
	farcall TossCoin_BankB
	jr c, .TwoH
	jr nc, .OneHOneT
	xor a
	ret
.OneT
	ldtx de, PresentEffectText
	farcall TossCoin_BankB
	jr c, .OneHOneT
	jr nc, .TwoT
	xor a
	ret
.OneHOneT
	ldtx de, PresentEffectText
	farcall TossCoin_BankB
	jr c, .TwoHOneT
	jr nc, .OneHTwoT
	xor a
	ret
.TwoT
	ldtx de, PresentEffectText
	farcall TossCoin_BankB
	jr c, .OneHTwoT
	call SwapTurn
	lb de, 0, 120
	call PresentHPRecovery
	call SwapTurn
	ret
.TwoH
	ldtx de, PresentEffectText
	farcall TossCoin_BankB
	jr nc, .TwoHOneT
	ld a, 70
	farcall SetDefiniteDamage
	ld a, ATK_ANIM_BIG_HIT
	ld [wLoadedAttackAnimation], a
	ret
.TwoHOneT
	call SwapTurn
	lb de, 0, 30
	call PresentHPRecovery
	call SwapTurn
	ret
.OneHTwoT
	ld a, 40
	farcall SetDefiniteDamage
	ld a, ATK_ANIM_HIT
	ld [wLoadedAttackAnimation], a
	ret

DiscardAllLEffect2::
	xor a
	call CreateListOfElectricEnergyAttachedToArena
	ld hl, wDuelTempList
; put all energy cards in Discard Pile
.loop
	ld a, [hli]
	cp $ff
	ret z
	call PutCardInDiscardPile
	jr .loop

AIPickLightningEnergyCardToDiscard::
	call CreateListOfElectricEnergyAttachedToArena
	ld a, [wDuelTempList]
	ldh [hTempList], a ; pick first in list
	ret

PresentHPRecovery::
	push de
	ld hl, wUnused_HPRecoverAmount
	ld [hl], e
	inc hl
	ld [hl], d

; get Arena card's damage
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	pop de
	or a
	ret z ; return if no damage

; load correct animation
	push de
	ld a, ATK_ANIM_HEAL
	ld [wLoadedAttackAnimation], a
	lb bc, PLAY_AREA_ARENA, $1 ; arrow
	bank1call PlayAttackAnimation

; compare HP to be restored with max HP
; if HP to be restored would cause HP to
; be larger than max HP, cap it accordingly
	ld e, PLAY_AREA_ARENA
	call GetCardDamageAndMaxHP
	ld b, $00
	pop de
	ld a, DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	add e
	ld e, a
	ld a, 0
	adc d
	ld d, a
	; de = damage dealt + current HP
	; bc = max HP of card
	call CompareDEtoBC
	jr c, .skip_cap
	; cap de to value in bc
	ld e, c
	ld d, b

.skip_cap
	ld [hl], e ; apply new HP to arena card
	bank1call WaitAttackAnimation
	ret

CreateListOfElectricEnergyAttachedToArena::
	ld a, TYPE_ENERGY_LIGHTNING
	ld b, a
	ld c, 0
	ld de, wDuelTempList
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
.loop
	ld a, [hl]
	cp CARD_LOCATION_ARENA
	jr nz, .next
	push de
	ld a, l
	call GetCardIDFromDeckIndex
	call GetCardType
	pop de
	cp b
	jr nz, .next ; is same as input type?
	ld a, l
	ld [de], a
	inc de
	inc c
.next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop

	ld a, $ff
	ld [de], a
	ld a, c
	ret

