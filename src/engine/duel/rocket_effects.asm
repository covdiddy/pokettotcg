; Team Rocket set effect commands and effect functions (placed in "Cards 2" ROM bank).
; Referenced from cards_rocket.asm using `+ $8000` so CheckMatchingCommand
; switches to BANK("Cards 2").

; ============================================================================
; Shared Helpers
; ============================================================================

RocketOncePerTurnCheck:
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	add DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	and USED_PKMN_POWER_THIS_TURN
	jr nz, .already_used
	ldh a, [hTempPlayAreaLocation_ff9d]
	call CheckIsIncapableOfUsingPkmnPower
	ret
.already_used
	ldtx hl, OnlyOncePerTurnText
	scf
	ret

RocketMarkPowerUsed:
	ldh a, [hTemp_ffa0]
	add DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	set USED_PKMN_POWER_THIS_TURN_F, [hl]
	ret

; Returns carry if Turn Duelist is Player, nc if AI/Link.
RocketIsPlayerTurn:
	ld a, DUELVARS_DUELIST_TYPE
	call GetTurnDuelistVariable
	cp DUELIST_TYPE_PLAYER
	jr z, .player
	or a
	ret
.player
	scf
	ret

; Lets Turn Duelist choose 1 of Opponent's Play Area Pokemon.
; Stores result in hTempPlayAreaLocation_ffa1.
RocketSelectOpponentPokemon:
	call RocketIsPlayerTurn
	jr nc, .ai_pick
	call SwapTurn
	bank1call HasAlivePokemonInPlayArea
.loop
	bank1call OpenPlayAreaScreenForSelection
	jr c, .loop
	call SwapTurn
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTempPlayAreaLocation_ffa1], a
	or a
	ret
.ai_pick
	xor a ; PLAY_AREA_ARENA
	ldh [hTempPlayAreaLocation_ffa1], a
	or a
	ret

; Deals `de` damage (no Weakness/Resistance) to opponent's Play Area slot `b`.
RocketDealDamageToOpponentSlot:
	call SwapTurn
	call DealDamageToPlayAreaPokemon
	call SwapTurn
	ret

; Adds `a` to wDamage (and AI min/max).
RocketAddDamage:
	ld hl, wDamage
	add [hl]
	ld [hl], a
	ret

; Sets wDamage = a (and clears high byte).
RocketSetDamage:
	ld [wDamage], a
	xor a
	ld [wDamage + 1], a
	ret

; Tosses 1 coin; if tails, sets damage = 0 and marks unsuccessful.
RocketTossCoinIfTailsNoDamage:
	ldtx de, DamageCheckIfTailsNoDamageText
	call TossCoin
	ret c
	xor a
	call RocketSetDamage
	farcall SetWasUnsuccessful
	ret

; Discards `c` Fire Energy cards from Turn Duelist's Arena Pokemon.
; Assumes at least `c` Fire Energy cards are attached.
RocketDiscardFireEnergyFromArena:
	ld a, c
	or a
	ret z
	ld b, c
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
.loop
	ld a, [hl]
	cp CARD_LOCATION_ARENA
	jr nz, .next
	push hl
	push bc
	ld a, l
	call GetCardIDFromDeckIndex
	call GetCardType
	pop bc
	pop hl
	cp TYPE_ENERGY_FIRE
	jr nz, .next
	ld a, l
	push hl
	push bc
	call PutCardInDiscardPile
	pop bc
	pop hl
	dec b
	ret z
.next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop
	ret

; Counts attached Energy of type `b` (TYPE_ENERGY_*) on Turn Duelist's Arena card.
; Returns count in `a`.
RocketCountArenaEnergyOfType:
	push bc
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardAttachedEnergies
	pop bc
	ld a, b
	and $07
	ld e, a
	ld d, 0
	ld hl, wAttachedEnergies
	add hl, de
	ld a, [hl]
	ret

; Helper: moves deck card `a` to Turn Duelist's Hand.
RocketMoveDeckCardToHand:
	push af
	call SearchCardInDeckAndAddToHand
	pop af
	call AddCardToHand
	ret

; Helper: checks if card ID in `de` is Koffing, Weezing, or Dark Weezing.
; Returns carry if true.
RocketIsKoffingFamily:
	ld a, d
	or a
	jr nz, .check_dark
	ld a, e
	cp KOFFING_LV12
	jr z, .match
	cp KOFFING
	jr z, .match
	cp WEEZING
	jr z, .match
	or a
	ret
.check_dark
	cp HIGH(DARK_WEEZING)
	jr nz, .no_match
	ld a, e
	cp LOW(DARK_WEEZING)
	jr z, .match
.no_match
	or a
	ret
.match
	scf
	ret

; Helper: checks if card ID in `de` is Magnemite, Magneton, or Dark Magneton.
; Returns carry if true.
RocketIsMagnemiteFamily:
	ld a, d
	or a
	jr nz, .check_dark
	ld a, e
	cp MAGNEMITE_LV13
	jr z, .match
	cp MAGNEMITE_LV15
	jr z, .match
	cp MAGNETON_LV28
	jr z, .match
	cp MAGNETON_LV35
	jr z, .match
	or a
	ret
.check_dark
	cp HIGH(DARK_MAGNETON)
	jr nz, .no_match
	ld a, e
	cp LOW(DARK_MAGNETON)
	jr z, .match
.no_match
	or a
	ret
.match
	scf
	ret

; Helper: checks if card ID in `de` is a Dark Evolution card (Stage 1 or Stage 2).
; Returns carry if true.
RocketIsDarkEvolution:
	push hl
	push de
	ld a, e
	ld [wLoadedCard1ID], a
	ld a, d
	ld [wLoadedCard1ID + 1], a
	; Check all Dark Stage 1/2 IDs (DARK_ARBOK..DARK_DRAGONITE)
	ld hl, .DarkEvoTable
.loop
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	or c
	jr z, .not_found
	ld a, e
	cp c
	jr nz, .loop
	ld a, d
	cp b
	jr nz, .loop
	pop de
	pop hl
	scf
	ret
.not_found
	pop de
	pop hl
	or a
	ret
.DarkEvoTable:
	dw DARK_ARBOK
	dw DARK_MUK
	dw DARK_WEEZING
	dw DARK_GLOOM
	dw DARK_VILEPLUME
	dw DARK_GOLBAT
	dw DARK_CHARMELEON
	dw DARK_CHARIZARD
	dw DARK_FLAREON
	dw DARK_RAPIDASH
	dw DARK_WARTORTLE
	dw DARK_BLASTOISE
	dw DARK_GOLDUCK
	dw DARK_GYARADOS
	dw DARK_VAPOREON
	dw DARK_RAICHU
	dw DARK_ELECTRODE
	dw DARK_JOLTEON
	dw DARK_MAGNETON
	dw DARK_DUGTRIO
	dw DARK_PRIMEAPE
	dw DARK_MACHOKE
	dw DARK_MACHAMP
	dw DARK_KADABRA
	dw DARK_ALAKAZAM
	dw DARK_SLOWBRO
	dw DARK_HYPNO
	dw DARK_RATICATE
	dw DARK_PERSIAN
	dw DARK_DRAGONAIR
	dw DARK_DRAGONITE
	dw 0

; ============================================================================
; Pokemon Power Effect Commands & Functions
; ============================================================================

RocketPollenStenchEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, RocketOncePerTurnCheck + $8000
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketPollenStenchEffect + $8000
	db $00

RocketPollenStenchEffect:
	call RocketMarkPowerUsed
	ldtx de, ConfusionCheckText
	call TossCoin
	jr nc, .tails
	farcall ConfusionEffect
	ret
.tails
	call SwapTurn
	farcall ConfusionEffect
	call SwapTurn
	ret

RocketDarkGolbatSneakAttackEffectCommands::
	dbw EFFECTCMDTYPE_PKMN_POWER_TRIGGER, RocketDarkGolbatSneakAttackEffect + $8000
	db $00

RocketDarkGolbatSneakAttackEffect:
	ldh a, [hTempPlayAreaLocation_ff9d]
	call CheckIsIncapableOfUsingPkmnPower
	ret c
	call RocketSelectOpponentPokemon
	ldh a, [hTempPlayAreaLocation_ffa1]
	ld b, a
	ld de, 10
	call RocketDealDamageToOpponentSlot
	ret

RocketCharmanderGatherFireEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, RocketGatherFireCheck + $8000
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketGatherFireEffect + $8000
	db $00

RocketGatherFireCheck:
	call RocketOncePerTurnCheck
	ret c
	; check if any other Play Area Pokemon has a Fire Energy attached
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
	ldh a, [hTemp_ffa0]
	or CARD_LOCATION_PLAY_AREA
	ld b, a
.loop
	ld a, [hl]
	and CARD_LOCATION_PLAY_AREA
	jr z, .next
	ld a, [hl]
	cp b
	jr z, .next ; skip Charmander itself
	push hl
	push bc
	ld a, l
	call GetCardIDFromDeckIndex
	call GetCardType
	pop bc
	pop hl
	cp TYPE_ENERGY_FIRE
	jr nz, .next
	or a
	ret
.next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop
	ldtx hl, NoEnergyCardsText
	scf
	ret

RocketGatherFireEffect:
	call RocketMarkPowerUsed
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
	ldh a, [hTemp_ffa0]
	or CARD_LOCATION_PLAY_AREA
	ld b, a
.loop
	ld a, [hl]
	and CARD_LOCATION_PLAY_AREA
	jr z, .next
	ld a, [hl]
	cp b
	jr z, .next
	push hl
	push bc
	ld a, l
	call GetCardIDFromDeckIndex
	call GetCardType
	pop bc
	pop hl
	cp TYPE_ENERGY_FIRE
	jr nz, .next
	ld [hl], b ; move Fire Energy to Charmander
	bank1call DrawDuelHUDs
	ret
.next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop
	ret

RocketDarkKadabraMatterExchangeEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, RocketMatterExchangeCheck + $8000
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketMatterExchangeEffect + $8000
	db $00

RocketMatterExchangeCheck:
	call RocketOncePerTurnCheck
	ret c
	ld a, DUELVARS_NUMBER_OF_CARDS_IN_HAND
	call GetTurnDuelistVariable
	or a
	jr z, .no_cards
	call CheckIfDeckIsEmpty
	ret
.no_cards
	ldtx hl, NoCardsInHandText
	scf
	ret

RocketMatterExchangeEffect:
	call RocketMarkPowerUsed
	call CreateHandCardList
	jr c, .done
	call RocketIsPlayerTurn
	jr nc, .ai_discard
	bank1call InitAndDrawCardListScreenLayout
	ldtx hl, ChooseCardToDiscardFromHandText
	ldtx de, DuelistHandText
	bank1call SetCardListHeaderText
.loop
	bank1call DisplayCardList
	jr c, .loop
	jr .do_discard
.ai_discard
	ld a, [wDuelTempList]
.do_discard
	call PutCardInDiscardPile
	call DrawCardFromDeck
	jr c, .done
	call AddCardToHand
.done
	ret

RocketDarkSlowbroReelInEffectCommands::
	dbw EFFECTCMDTYPE_PKMN_POWER_TRIGGER, RocketReelInEffect + $8000
	db $00

RocketReelInEffect:
	ldh a, [hTempPlayAreaLocation_ff9d]
	call CheckIsIncapableOfUsingPkmnPower
	ret c
	; build list of Pokemon cards in discard pile
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
	ld de, wDuelTempList
	ld c, 0
.loop
	ld a, [hl]
	cp CARD_LOCATION_DISCARD_PILE
	jr nz, .next
	push hl
	push de
	push bc
	ld a, l
	call LoadCardDataToBuffer1_FromDeckIndex
	pop bc
	pop de
	pop hl
	ld a, [wLoadedCard1Type]
	bit TYPE_ENERGY_F, a
	jr nz, .next
	cp TYPE_TRAINER
	jr z, .next
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
	or a
	ret z
	; add up to 3 cards to hand
	ld b, 3
	ld hl, wDuelTempList
.add_loop
	ld a, [hli]
	cp $ff
	ret z
	push hl
	push bc
	call MoveDiscardPileCardToHand
	call AddCardToHand
	pop bc
	pop hl
	dec b
	jr nz, .add_loop
	ret

RocketDrowzeeLongDistanceHypnosisEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, RocketOncePerTurnCheck + $8000
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketLongDistanceHypnosisEffect + $8000
	db $00

RocketLongDistanceHypnosisEffect:
	call RocketMarkPowerUsed
	ldtx de, SleepCheckText
	call TossCoin
	jr nc, .tails
	farcall SleepEffect
	ret
.tails
	call SwapTurn
	farcall SleepEffect
	call SwapTurn
	ret

RocketRattataTrickeryEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, RocketTrickeryCheck + $8000
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketTrickeryEffect + $8000
	db $00

RocketTrickeryCheck:
	call RocketOncePerTurnCheck
	ret c
	call CheckIfDeckIsEmpty
	ret c
	call CountPrizes
	or a
	ret nz
	ldtx hl, NoCardsLeftInTheDeckText
	scf
	ret

RocketTrickeryEffect:
	call RocketMarkPowerUsed
	; find top card of deck and first remaining prize card
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
	ld b, $ff ; top of deck
	ld c, $ff ; first prize
.loop
	ld a, [hl]
	cp CARD_LOCATION_DECK
	jr nz, .not_deck
	ld b, l
	jr .next
.not_deck
	cp CARD_LOCATION_PRIZE
	jr nz, .next
	ld a, c
	cp $ff
	jr nz, .next
	ld c, l
.next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop
	ld a, b
	cp $ff
	ret z
	ld a, c
	cp $ff
	ret z
	; swap locations of b (deck) and c (prize)
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
	ld l, b
	ld [hl], CARD_LOCATION_PRIZE
	ld l, c
	ld [hl], CARD_LOCATION_DECK
	ldtx hl, RocketSwitchedPrizeWithDeckText
	call DrawWideTextBox_WaitForInput
	ret

RocketDarkDragonairEvolutionaryLightEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, RocketEvolutionaryLightCheck + $8000
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketEvolutionaryLightEffect + $8000
	db $00

RocketEvolutionaryLightCheck:
	call RocketOncePerTurnCheck
	ret c
	call CheckIfDeckIsEmpty
	ret

RocketEvolutionaryLightEffect:
	call RocketMarkPowerUsed
	; find all Evolution cards in deck
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
	ld de, wDuelTempList
	ld c, 0
.loop
	ld a, [hl]
	cp CARD_LOCATION_DECK
	jr nz, .next
	push hl
	push de
	push bc
	ld a, l
	call LoadCardDataToBuffer1_FromDeckIndex
	pop bc
	pop de
	pop hl
	ld a, [wLoadedCard1Type]
	bit TYPE_ENERGY_F, a
	jr nz, .next
	cp TYPE_TRAINER
	jr z, .next
	ld a, [wLoadedCard1Stage]
	or a ; BASIC
	jr z, .next
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
	or a
	jr nz, .found
	ldtx hl, RocketNoEvolutionCardText
	call DrawWideTextBox_WaitForInput
	farcall ShuffleCardsInDeck
	ret
.found
	call RocketIsPlayerTurn
	jr nc, .ai_pick
	bank1call InitAndDrawCardListScreenLayout
	ldtx hl, ChooseCardToPlaceInHandText
	ldtx de, DuelistDeckText
	bank1call SetCardListHeaderText
	bank1call DisplayCardList
	jr c, .shuffle_only
	jr .add_card
.ai_pick
	ld a, [wDuelTempList]
.add_card
	call RocketMoveDeckCardToHand
.shuffle_only
	farcall ShuffleCardsInDeck
	ret

RocketDarkDragoniteSummonMinionsEffectCommands::
	dbw EFFECTCMDTYPE_PKMN_POWER_TRIGGER, RocketSummonMinionsEffect + $8000
	db $00

RocketSummonMinionsEffect:
	ldh a, [hTempPlayAreaLocation_ff9d]
	call CheckIsIncapableOfUsingPkmnPower
	ret c
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	cp MAX_PLAY_AREA_POKEMON
	ret nc
	call CheckIfDeckIsEmpty
	ret c
	; build list of Basic Pokemon in deck
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
	ld de, wDuelTempList
	ld c, 0
.loop
	ld a, [hl]
	cp CARD_LOCATION_DECK
	jr nz, .next
	push hl
	push de
	push bc
	ld a, l
	call LoadCardDataToBuffer1_FromDeckIndex
	pop bc
	pop de
	pop hl
	ld a, [wLoadedCard1Type]
	bit TYPE_ENERGY_F, a
	jr nz, .next
	cp TYPE_TRAINER
	jr z, .next
	ld a, [wLoadedCard1Stage]
	or a ; BASIC
	jr nz, .next
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
	or a
	jr z, .shuffle
	; place up to 2 Basic Pokemon onto bench
	ld b, 2
	ld hl, wDuelTempList
.place_loop
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	cp MAX_PLAY_AREA_POKEMON
	jr nc, .shuffle
	ld a, [hli]
	cp $ff
	jr z, .shuffle
	push hl
	push bc
	call RocketPutDeckCardOnBench
	pop bc
	pop hl
	dec b
	jr nz, .place_loop
.shuffle
	farcall ShuffleCardsInDeck
	ret

; Puts deck card `a` onto Turn Duelist's Bench.
RocketPutDeckCardOnBench:
	push af
	call SearchCardInDeckAndAddToHand
	pop af
	call PutHandPokemonCardInPlayArea
	ret

; ============================================================================
; Attack Effect Commands & Functions
; ============================================================================

RocketDarkArbokStareEffectCommands::
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, RocketSelectOpponentPokemon + $8000
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, RocketDarkArbokStareEffect + $8000
	db $00

RocketDarkArbokStareEffect:
	ldh a, [hTempPlayAreaLocation_ffa1]
	ld b, a
	ld de, 10
	call RocketDealDamageToOpponentSlot
	call SwapTurn
	ldh a, [hTempPlayAreaLocation_ffa1]
	add DUELVARS_ARENA_CARD_FLAGS
	call GetTurnDuelistVariable
	set PKMN_POWER_DISABLED_F, [hl]
	call SwapTurn
	ret

RocketDarkArbokPoisonVaporEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, PoisonEffect
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, RocketPoisonVaporBenchEffect + $8000
	db $00

RocketPoisonVaporBenchEffect:
	call SwapTurn
	ld a, 10
	farcall DealDamageToAllBenchedPokemon
	call SwapTurn
	ret

RocketDarkWeezingMassExplosionEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketMassExplosionDamageEffect + $8000
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, RocketMassExplosionSelfBenchEffect + $8000
	db $00

RocketMassExplosionDamageEffect:
	call .CountInPlayArea
	ld b, a
	call SwapTurn
	call .CountInPlayArea
	call SwapTurn
	add b
	; multiply by 20
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld a, l
	call RocketSetDamage
	ret
.CountInPlayArea:
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ld c, a
	ld b, 0
	ld e, 0
.loop
	ld a, DUELVARS_ARENA_CARD
	add b
	call GetTurnDuelistVariable
	push bc
	push de
	call GetCardIDFromDeckIndex
	call RocketIsKoffingFamily
	pop de
	pop bc
	jr nc, .next
	inc e
.next
	inc b
	dec c
	jr nz, .loop
	ld a, e
	ret

RocketMassExplosionSelfBenchEffect:
	call .DamagePlayArea
	call SwapTurn
	call .DamagePlayArea
	call SwapTurn
	ret
.DamagePlayArea:
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ld c, a
	ld b, PLAY_AREA_ARENA
.loop
	ld a, DUELVARS_ARENA_CARD
	add b
	call GetTurnDuelistVariable
	push bc
	call GetCardIDFromDeckIndex
	call RocketIsKoffingFamily
	pop bc
	jr nc, .next
	push bc
	ld de, 20
	call DealDamageToPlayAreaPokemon
	pop bc
.next
	inc b
	dec c
	jr nz, .loop
	ret

RocketDarkWeezingStunGasEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketStunGasEffect + $8000
	db $00

RocketStunGasEffect:
	ldtx de, PoisonCheckText
	call TossCoin
	jr nc, .tails
	farcall PoisonEffect
	ret
.tails
	farcall ParalysisEffect
	ret

RocketDarkVileplumePetalWhirlwindEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketPetalWhirlwindEffect + $8000
	db $00

RocketPetalWhirlwindEffect:
	ld hl, 30
	call LoadTxRam3
	ld a, 3
	ldtx de, DamageCheckIfHeadsXDamageText
	call TossCoinATimes
	push af
	; 30 * heads
	ld e, a
	ld d, 0
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld a, l
	sub e
	sub e
	call RocketSetDamage
	pop af
	cp 2
	ret c
	call SwapTurn
	farcall ConfusionEffect
	call SwapTurn
	ret

RocketDarkGolbatFlitterEffectCommands::
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, RocketSelectOpponentPokemon + $8000
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, RocketFlitterEffect + $8000
	db $00

RocketFlitterEffect:
	ldh a, [hTempPlayAreaLocation_ffa1]
	ld b, a
	ld de, 20
	call RocketDealDamageToOpponentSlot
	ret

RocketDarkCharmeleonFireballEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketFireballEffect + $8000
	db $00

RocketFireballEffect:
	ld b, TYPE_ENERGY_FIRE
	call RocketCountArenaEnergyOfType
	or a
	jr z, .fail
	call RocketTossCoinIfTailsNoDamage
	ld a, [wDamage]
	or a
	ret z
	ld c, 1
	call RocketDiscardFireEnergyFromArena
	ret
.fail
	xor a
	call RocketSetDamage
	farcall SetWasUnsuccessful
	ret

RocketDarkCharizardContinuousFireballEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketContinuousFireballEffect + $8000
	db $00

RocketContinuousFireballEffect:
	ld b, TYPE_ENERGY_FIRE
	call RocketCountArenaEnergyOfType
	or a
	jr z, .zero
	ld hl, 50
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	call TossCoinATimes
	or a
	jr z, .zero
	push af
	ld c, a
	xor a
.mul_loop
	add 50
	dec c
	jr nz, .mul_loop
	call RocketSetDamage
	pop af
	ld c, a
	call RocketDiscardFireEnergyFromArena
	ret
.zero
	xor a
	call RocketSetDamage
	ret

RocketDarkFlareonPlayingWithFireEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketPlayingWithFireEffect + $8000
	db $00

RocketPlayingWithFireEffect:
	ld b, TYPE_ENERGY_FIRE
	call RocketCountArenaEnergyOfType
	or a
	ret z
	ld hl, 20
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsPlusDamageText
	call TossCoin
	ret nc
	ld c, 1
	call RocketDiscardFireEnergyFromArena
	ld a, 20
	call RocketAddDamage
	ret

RocketDarkRapidashFlamePillarEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, RocketFlamePillarEffect + $8000
	db $00

RocketFlamePillarEffect:
	ld b, TYPE_ENERGY_FIRE
	call RocketCountArenaEnergyOfType
	or a
	ret z
	call SwapTurn
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	call SwapTurn
	cp 2
	ret c
	call RocketIsPlayerTurn
	ret nc ; AI skips optional discard
	ld c, 1
	call RocketDiscardFireEnergyFromArena
	call SwapTurn
	bank1call HasAlivePokemonInBench
.loop
	bank1call OpenPlayAreaScreenForSelection
	jr c, .loop
	ldh a, [hTempPlayAreaLocation_ff9d]
	ld b, a
	ld de, 10
	call DealDamageToPlayAreaPokemon
	call SwapTurn
	ret

RocketDarkWartortleMirrorShellEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketMirrorShellEffect + $8000
	db $00

RocketMirrorShellEffect:
	ld a, SUBSTATUS1_MIRROR_SHELL
	farcall ApplySubstatus1ToAttackingCard
	ret

RocketDarkBlastoiseHydrocannonEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketHydrocannonEffect + $8000
	db $00

RocketHydrocannonEffect:
	ld b, TYPE_ENERGY_WATER
	call RocketCountArenaEnergyOfType
	sub 2
	ret c
	ret z
	cp 3
	jr c, .ok
	ld a, 2
.ok
	; add 20 * a
	ld c, a
	xor a
.loop
	add 20
	dec c
	jr nz, .loop
	call RocketAddDamage
	ret

RocketDarkBlastoiseRocketTackleEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketRocketTackleProtectEffect + $8000
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, RocketRocketTackleRecoilEffect + $8000
	db $00

RocketRocketTackleProtectEffect:
	ldtx de, IfHeadsNoDamageNextTurnText
	call TossCoin
	ret nc
	ld a, SUBSTATUS1_NO_DAMAGE_WITHDRAW
	farcall ApplySubstatus1ToAttackingCard
	ret

RocketRocketTackleRecoilEffect:
	ld a, TRUE
	ld [wIsDamageToSelf], a
	ld b, PLAY_AREA_ARENA
	ld de, 10
	call DealDamageToPlayAreaPokemon
	xor a
	ld [wIsDamageToSelf], a
	ret

RocketDarkGolduckThirdEyeEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, RocketThirdEyeCheck + $8000
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketThirdEyeEffect + $8000
	db $00

RocketThirdEyeCheck:
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardAttachedEnergies
	ld a, [wTotalAttachedEnergies]
	or a
	ret nz
	ldtx hl, NoEnergyCardsText
	scf
	ret

RocketThirdEyeEffect:
	; discard 1 attached energy from Arena
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
.loop
	ld a, [hl]
	cp CARD_LOCATION_ARENA
	jr nz, .next
	push hl
	ld a, l
	call GetCardIDFromDeckIndex
	call GetCardType
	pop hl
	bit TYPE_ENERGY_F, a
	jr z, .next
	ld a, l
	call PutCardInDiscardPile
	jr .draw
.next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop
.draw
	ld c, 3
.draw_loop
	push bc
	call DrawCardFromDeck
	jr c, .done_draw
	call AddCardToHand
	pop bc
	dec c
	jr nz, .draw_loop
	ret
.done_draw
	pop bc
	ret

RocketMagikarpRapidEvolutionEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, RocketRapidEvolutionCheck + $8000
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketRapidEvolutionEffect + $8000
	db $00

RocketRapidEvolutionCheck:
	call CheckIfDeckIsEmpty
	ret

RocketRapidEvolutionEffect:
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
.loop
	ld a, [hl]
	cp CARD_LOCATION_DECK
	jr nz, .next
	push hl
	ld a, l
	call GetCardIDFromDeckIndex
	pop hl
	ld a, d
	or a
	jr nz, .check_dark_gyarados
	ld a, e
	cp GYARADOS
	jr z, .found
	jr .next
.check_dark_gyarados
	cp HIGH(DARK_GYARADOS)
	jr nz, .next
	ld a, e
	cp LOW(DARK_GYARADOS)
	jr z, .found
.next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop
	farcall ShuffleCardsInDeck
	ret
.found
	ld a, l
	push af
	call SearchCardInDeckAndAddToHand
	pop af
	ld e, a
	ld a, PLAY_AREA_ARENA
	call EvolvePokemonCard
	farcall ShuffleCardsInDeck
	ret

RocketDarkRaichuSurpriseAttackEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketTossCoinIfTailsNoDamage + $8000
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, RocketSurpriseAttackBenchEffect + $8000
	db $00

RocketSurpriseAttackBenchEffect:
	ld a, [wDamage]
	or a
	ret z
	call SwapTurn
	ld a, 10
	farcall DealDamageToAllBenchedPokemon
	call SwapTurn
	ret

RocketDarkElectrodeEnergyBombEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, RocketEnergyBombEffect + $8000
	db $00

RocketEnergyBombEffect:
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	dec a
	jr z, .discard_all
	; move all attached energies from Arena to Bench 1
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
.move_loop
	ld a, [hl]
	cp CARD_LOCATION_ARENA
	jr nz, .move_next
	push hl
	ld a, l
	call GetCardIDFromDeckIndex
	call GetCardType
	pop hl
	bit TYPE_ENERGY_F, a
	jr z, .move_next
	ld [hl], CARD_LOCATION_BENCH_1
.move_next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .move_loop
	ret
.discard_all
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
.disc_loop
	ld a, [hl]
	cp CARD_LOCATION_ARENA
	jr nz, .disc_next
	push hl
	ld a, l
	call GetCardIDFromDeckIndex
	call GetCardType
	pop hl
	bit TYPE_ENERGY_F, a
	jr z, .disc_next
	ld a, l
	push hl
	call PutCardInDiscardPile
	pop hl
.disc_next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .disc_loop
	ret

RocketDarkJolteonThunderAttackEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketThunderAttackCoinEffect + $8000
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, RocketThunderAttackRecoilEffect + $8000
	db $00

RocketThunderAttackCoinEffect:
	xor a
	ldh [hTemp_ffa0], a
	ldtx de, ParalysisCheckText
	call TossCoin
	jr nc, .tails
	farcall ParalysisEffect
	ret
.tails
	ld a, 1
	ldh [hTemp_ffa0], a
	ret

RocketThunderAttackRecoilEffect:
	ldh a, [hTemp_ffa0]
	or a
	ret z
	ld a, TRUE
	ld [wIsDamageToSelf], a
	ld b, PLAY_AREA_ARENA
	ld de, 10
	call DealDamageToPlayAreaPokemon
	xor a
	ld [wIsDamageToSelf], a
	ret

RocketMagnemiteMagnetismEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketMagnetismEffect + $8000
	db $00

RocketMagnetismEffect:
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	dec a
	ret z
	ld c, a
	ld b, PLAY_AREA_BENCH_1
	ld e, 0
.loop
	ld a, DUELVARS_ARENA_CARD
	add b
	call GetTurnDuelistVariable
	push bc
	push de
	call GetCardIDFromDeckIndex
	call RocketIsMagnemiteFamily
	pop de
	pop bc
	jr nc, .next
	inc e
.next
	inc b
	dec c
	jr nz, .loop
	; add 10 * e
	ld a, e
	or a
	ret z
	ld c, a
	xor a
.mul
	add 10
	dec c
	jr nz, .mul
	call RocketAddDamage
	ret

RocketDarkMagnetonMagneticLinesEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, RocketMagneticLinesEffect + $8000
	db $00

RocketMagneticLinesEffect:
	call SwapTurn
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	cp 2
	jr c, .done
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
.loop
	ld a, [hl]
	cp CARD_LOCATION_ARENA
	jr nz, .next
	push hl
	ld a, l
	call GetCardIDFromDeckIndex
	call GetCardType
	pop hl
	bit TYPE_ENERGY_F, a
	jr z, .next
	ld [hl], CARD_LOCATION_BENCH_1
	jr .done
.next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop
.done
	call SwapTurn
	ret

RocketDiglettDigUnderEffectCommands::
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, RocketSelectOpponentPokemon + $8000
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, RocketDigUnderEffect + $8000
	db $00

RocketDigUnderEffect:
	ldh a, [hTempPlayAreaLocation_ffa1]
	ld b, a
	ld de, 10
	call RocketDealDamageToOpponentSlot
	ret

RocketDarkDugtrioKnockDownEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketKnockDownEffect + $8000
	db $00

RocketKnockDownEffect:
	ld hl, 20
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsPlusDamageText
	call TossCoin
	ret c ; heads = 20, tails = +20
	ld a, 20
	call RocketAddDamage
	ret

RocketMankeyMischiefEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketMischiefEffect + $8000
	db $00

RocketMischiefEffect:
	call SwapTurn
	farcall ShuffleCardsInDeck
	call SwapTurn
	ldtx hl, RocketOpponentShuffledDeckText
	call DrawWideTextBox_WaitForInput
	ret

RocketMankeyAngerEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketAngerEffect + $8000
	db $00

RocketAngerEffect:
	ld hl, 10
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsPlusDamageText
	call TossCoin
	ret nc
	ld a, 10
	call RocketAddDamage
	ret

RocketDarkPrimeapeFrenziedAttackEffectCommands::
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, RocketFrenziedAttackEffect + $8000
	db $00

RocketFrenziedAttackEffect:
	call SwapTurn
	farcall ConfusionEffect
	call SwapTurn
	ret

RocketDarkMachampFlingEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, RocketFlingCheck + $8000
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, RocketFlingSelect + $8000
	dbw EFFECTCMDTYPE_AI_SWITCH_DEFENDING_PKMN, RocketFlingSelect + $8000
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, RocketFlingEffect + $8000
	db $00

RocketFlingCheck:
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	cp 2
	ret nc
	ldtx hl, ThereAreNoPokemonOnBenchText
	scf
	ret

RocketFlingSelect:
	farcall DuelistSelectForcedSwitch
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTempPlayAreaLocation_ffa1], a
	ret

RocketFlingEffect:
	call SwapTurn
	; move opponent's Arena card and all attached cards to deck, then shuffle
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
.loop
	ld a, [hl]
	cp CARD_LOCATION_ARENA
	jr nz, .next
	ld [hl], CARD_LOCATION_DECK
.next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop
	farcall ShuffleCardsInDeck
	call SwapTurn
	ldh a, [hTempPlayAreaLocation_ffa1]
	farcall HandleSwitchDefendingPokemonEffect
	ret

RocketAbraVanishEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, RocketVanishCheck + $8000
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, RocketVanishSelect + $8000
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, RocketVanishEffect + $8000
	db $00

RocketVanishCheck:
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	cp 2
	ret nc
	ldtx hl, ThereAreNoPokemonOnBenchText
	scf
	ret

RocketVanishSelect:
	call RocketIsPlayerTurn
	jr nc, .ai
	bank1call HasAlivePokemonInBench
.loop
	bank1call OpenPlayAreaScreenForSelection
	jr c, .loop
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	ret
.ai
	ld a, PLAY_AREA_BENCH_1
	ldh [hTemp_ffa0], a
	ret

RocketVanishEffect:
	; discard all attached cards on Arena, shuffle Abra itself into deck, switch bench to Arena
	ld a, DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	ld b, a ; Abra deck index
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
.loop
	ld a, [hl]
	cp CARD_LOCATION_ARENA
	jr nz, .next
	ld a, l
	cp b
	jr z, .is_abra
	push hl
	push bc
	call PutCardInDiscardPile
	pop bc
	pop hl
	jr .next
.is_abra
	ld [hl], CARD_LOCATION_DECK
.next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop
	ldh a, [hTemp_ffa0]
	ld e, a
	call SwapArenaWithBenchPokemon
	farcall ShuffleCardsInDeck
	ret

RocketSlowpokeAfternoonNapEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, RocketAfternoonNapCheck + $8000
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketAfternoonNapEffect + $8000
	db $00

RocketAfternoonNapCheck:
	call CheckIfDeckIsEmpty
	ret

RocketAfternoonNapEffect:
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
.loop
	ld a, [hl]
	cp CARD_LOCATION_DECK
	jr nz, .next
	push hl
	ld a, l
	call GetCardIDFromDeckIndex
	call GetCardType
	pop hl
	cp TYPE_ENERGY_PSYCHIC
	jr nz, .next
	ld [hl], CARD_LOCATION_ARENA
	jr .shuffle
.next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop
.shuffle
	farcall ShuffleCardsInDeck
	ret

RocketDarkSlowbroFickleAttackEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketTossCoinIfTailsNoDamage + $8000
	db $00

RocketDarkHypnoBenchManipulateEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketBenchManipulateEffect + $8000
	db $00

RocketBenchManipulateEffect:
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetNonTurnDuelistVariable
	dec a
	jr z, .zero
	ld hl, 20
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsXDamageText
	push af
	call TossCoinATimes
	ld b, a ; heads
	pop af
	sub b ; tails = total - heads
	jr z, .zero
	ld c, a
	xor a
.mul
	add 20
	dec c
	jr nz, .mul
	call RocketSetDamage
	ld hl, wDamage + 1
	set UNAFFECTED_BY_WEAKNESS_RESISTANCE_F, [hl]
	ret
.zero
	xor a
	call RocketSetDamage
	ret

RocketRattataQuickAttackEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketAngerEffect + $8000 ; +10 on heads
	db $00

RocketDarkRaticateHyperFangEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketTossCoinIfTailsNoDamage + $8000
	db $00

RocketMeowthCoinHurlEffectCommands::
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, RocketSelectOpponentPokemon + $8000
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, RocketCoinHurlEffect + $8000
	db $00

RocketCoinHurlEffect:
	ldtx de, DamageCheckIfTailsNoDamageText
	call TossCoin
	ret nc
	ldh a, [hTempPlayAreaLocation_ffa1]
	ld b, a
	ld de, 20
	call RocketDealDamageToOpponentSlot
	ret

RocketEeveeTumbleEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketTossCoinIfTailsNoDamage + $8000
	db $00

RocketDarkDragonairTailStrikeEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketTailStrikeEffect + $8000
	db $00

RocketTailStrikeEffect:
	ld hl, 20
	call LoadTxRam3
	ldtx de, DamageCheckIfHeadsPlusDamageText
	call TossCoin
	ret nc
	ld a, 20
	call RocketAddDamage
	ret

RocketDarkDragoniteGiantTailEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketTossCoinIfTailsNoDamage + $8000
	db $00

; ============================================================================
; Trainer Effect Commands & Functions
; ============================================================================

RocketHereComesTeamRocketEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketHereComesTeamRocketEffect + $8000
	db $00

RocketHereComesTeamRocketEffect:
	ld a, 1
	ld [wHereComesTeamRocketActive], a
	ldtx hl, RocketHereComesTeamRocketText
	call DrawWideTextBox_WaitForInput
	ret

RocketRocketsSneakAttackEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketRocketsSneakAttackEffect + $8000
	db $00

RocketRocketsSneakAttackEffect:
	call SwapTurn
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
	ld de, wDuelTempList
	ld c, 0
.loop
	ld a, [hl]
	cp CARD_LOCATION_HAND
	jr nz, .next
	push hl
	push de
	push bc
	ld a, l
	call LoadCardDataToBuffer1_FromDeckIndex
	pop bc
	pop de
	pop hl
	ld a, [wLoadedCard1Type]
	cp TYPE_TRAINER
	jr nz, .next
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
	or a
	jr z, .done
	; shuffle first found trainer into opponent's deck
	ld a, [wDuelTempList]
	call RemoveCardFromHand
	ld l, a
	ld h, HIGH(wOpponentDeck)
	ldh a, [hWhoseTurn]
	ld h, a
	ld [hl], CARD_LOCATION_DECK
	farcall ShuffleCardsInDeck
.done
	call SwapTurn
	ret

RocketTheBosssWayEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, RocketTheBosssWayCheck + $8000
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketTheBosssWayEffect + $8000
	db $00

RocketTheBosssWayCheck:
	call CheckIfDeckIsEmpty
	ret

RocketTheBosssWayEffect:
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
	ld de, wDuelTempList
	ld c, 0
.loop
	ld a, [hl]
	cp CARD_LOCATION_DECK
	jr nz, .next
	push hl
	push de
	push bc
	ld a, l
	call GetCardIDFromDeckIndex
	call RocketIsDarkEvolution
	pop bc
	pop de
	pop hl
	jr nc, .next
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
	or a
	jr nz, .found
	ldtx hl, RocketNoDarkEvolutionText
	call DrawWideTextBox_WaitForInput
	farcall ShuffleCardsInDeck
	ret
.found
	call RocketIsPlayerTurn
	jr nc, .ai_pick
	bank1call InitAndDrawCardListScreenLayout
	ldtx hl, ChooseCardToPlaceInHandText
	ldtx de, DuelistDeckText
	bank1call SetCardListHeaderText
	bank1call DisplayCardList
	jr c, .shuffle
	jr .add_card
.ai_pick
	ld a, [wDuelTempList]
.add_card
	call RocketMoveDeckCardToHand
.shuffle
	farcall ShuffleCardsInDeck
	ret

RocketChallengeEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketChallengeEffect + $8000
	db $00

RocketChallengeEffect:
	; Opponent declines -> Turn Duelist draws 2 cards
	ld c, 2
.loop
	push bc
	call DrawCardFromDeck
	jr c, .done
	call AddCardToHand
	pop bc
	dec c
	jr nz, .loop
	ret
.done
	pop bc
	ret

RocketDiggerEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketDiggerEffect + $8000
	db $00

RocketDiggerEffect:
.loop
	ldtx de, DamageCheckIfTailsNoDamageText
	call TossCoin
	jr nc, .tails_turn
	call SwapTurn
	ldtx de, DamageCheckIfTailsNoDamageText
	call TossCoin
	jr nc, .tails_opp
	call SwapTurn
	jr .loop
.tails_turn
	ld a, TRUE
	ld [wIsDamageToSelf], a
	ld b, PLAY_AREA_ARENA
	ld de, 10
	call DealDamageToPlayAreaPokemon
	xor a
	ld [wIsDamageToSelf], a
	ret
.tails_opp
	ld b, PLAY_AREA_ARENA
	ld de, 10
	call DealDamageToPlayAreaPokemon
	call SwapTurn
	ret

RocketImposterOaksRevengeEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, RocketImposterOaksRevengeCheck + $8000
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketImposterOaksRevengeEffect + $8000
	db $00

RocketImposterOaksRevengeCheck:
	ld a, DUELVARS_NUMBER_OF_CARDS_IN_HAND
	call GetTurnDuelistVariable
	cp 2
	ret nc
	ldtx hl, NoCardsInHandText
	scf
	ret

RocketImposterOaksRevengeEffect:
	; discard 1 other card from hand
	call CreateHandCardList
	jr c, .opp_shuffle
	ld a, [wDuelTempList]
	call PutCardInDiscardPile
.opp_shuffle
	call SwapTurn
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
.loop
	ld a, [hl]
	cp CARD_LOCATION_HAND
	jr nz, .next
	ld a, l
	push hl
	call RemoveCardFromHand
	pop hl
	ld [hl], CARD_LOCATION_DECK
.next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop
	farcall ShuffleCardsInDeck
	ld c, 4
.draw_loop
	push bc
	call DrawCardFromDeck
	jr c, .draw_done
	call AddCardToHand
	pop bc
	dec c
	jr nz, .draw_loop
	call SwapTurn
	ret
.draw_done
	pop bc
	call SwapTurn
	ret

RocketNightlyGarbageRunEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, RocketNightlyGarbageRunCheck + $8000
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketNightlyGarbageRunEffect + $8000
	db $00

RocketNightlyGarbageRunCheck:
	ld a, DUELVARS_NUMBER_OF_CARDS_IN_DISCARD_PILE
	call GetTurnDuelistVariable
	or a
	ret nz
	ldtx hl, ThereAreNoCardsInTheDiscardPileText
	scf
	ret

RocketNightlyGarbageRunEffect:
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
	ld b, 3
.loop
	ld a, [hl]
	cp CARD_LOCATION_DISCARD_PILE
	jr nz, .next
	push hl
	push bc
	ld a, l
	call LoadCardDataToBuffer1_FromDeckIndex
	pop bc
	pop hl
	ld a, [wLoadedCard1Type]
	cp TYPE_TRAINER
	jr z, .next
	; Basic/Evo Pokemon or basic Energy (not Double Colorless / Rainbow / Potion / Full Heal)
	bit TYPE_ENERGY_F, a
	jr z, .shuffle_in
	ld a, [wLoadedCard1ID + 1]
	or a
	jr nz, .next
	ld a, [wLoadedCard1ID]
	cp DOUBLE_COLORLESS_ENERGY
	jr z, .next
.shuffle_in
	ld [hl], CARD_LOCATION_DECK
	dec b
	jr z, .done
.next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop
.done
	farcall ShuffleCardsInDeck
	ret

RocketGoopGasAttackEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketGoopGasAttackEffect + $8000
	db $00

RocketGoopGasAttackEffect:
	ld a, 2
	ld [wGoopGasAttackActive], a
	ldtx hl, RocketGoopGasAttackText
	call DrawWideTextBox_WaitForInput
	ret

RocketSleepEffectCommands::
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE, RocketSleepTrainerEffect + $8000
	db $00

RocketSleepTrainerEffect:
	ldtx de, SleepCheckText
	call TossCoin
	ret nc
	farcall SleepEffect
	ret

RocketDarkAlakazamTeleportBlastEffectCommands::
	dbw EFFECTCMDTYPE_REQUIRE_SELECTION, RocketTeleportBlastSelect + $8000
	dbw EFFECTCMDTYPE_AFTER_DAMAGE, RocketTeleportBlastEffect + $8000
	db $00

RocketTeleportBlastSelect:
	xor a
	ldh [hTemp_ffa0], a
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	cp 2
	ret c
	call RocketIsPlayerTurn
	jr nc, .ai
	bank1call HasAlivePokemonInBench
	bank1call OpenPlayAreaScreenForSelection
	jr c, .done
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
.done
	or a
	ret
.ai
	ld a, PLAY_AREA_BENCH_1
	ldh [hTemp_ffa0], a
	ret

RocketTeleportBlastEffect:
	ldh a, [hTemp_ffa0]
	or a
	ret z
	ld e, a
	call SwapArenaWithBenchPokemon
	xor a
	ld [wDuelDisplayedScreen], a
	ret
