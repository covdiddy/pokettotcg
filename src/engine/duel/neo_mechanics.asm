; =============================================================================
; Gen 2 (Neo) Core Gameplay Mechanics
; Located in ROMX $55 ("Neo Effects 1")
; 1. Baby Pokemon Rule (coin flip before attacking a Baby Pokemon)
; 2. Neo Special Energies (Darkness Energy & Metal Energy)
; 3. Pokemon Tools (Berry, Gold Berry, Focus Band, Miracle Berry)
; =============================================================================

; -----------------------------------------------------------------------------
; 1. BABY POKEMON RULE
; -----------------------------------------------------------------------------

BabyPokemonCardIDs:
	dw PICHU
	dw CLEFFA
	dw IGGLYBUFF
	dw TOGEPI1
	dw TOGEPI2
	dw ELEKID
	dw MAGBY
	dw TYROGUE
	dw SMOOCHUM
	dw 0

; Check if 16-bit card ID in de is in the null-terminated word table at hl.
; Returns carry if found, nc otherwise. Preserves de.
IsCardIDInWordTable:
	push de
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
	pop de
	scf
	ret
.not_found
	pop de
	or a
	ret

; Returns carry if the non-turn duelist's Active Pokemon is a Baby Pokemon.
IsDefendingPokemonBaby::
	ld a, DUELVARS_ARENA_CARD
	call GetNonTurnDuelistVariable
	cp $ff
	jr z, .not_baby
	call GetCardIDFromDeckIndex
	ld hl, BabyPokemonCardIDs
	jp IsCardIDInWordTable
.not_baby
	or a
	ret

; Called before an attack executes (for both Player and AI).
; If the defending Active Pokemon is a Baby Pokemon, flip a coin.
; Returns carry if tails (attack is cancelled and attacker's turn ends).
; Returns nc if not a Baby Pokemon or if heads.
HandleBabyPokemonRule::
	call IsDefendingPokemonBaby
	ret nc
	ldtx de, BabyRuleCoinCheckText
	call TossCoin
	ccf
	ret nc ; heads -> attack succeeds
	ldtx hl, AttackUnsuccessfulText
	call DrawWideTextBox_WaitForInput
	scf
	ret

; -----------------------------------------------------------------------------
; 2. NEO SPECIAL ENERGIES (DARKNESS ENERGY & METAL ENERGY)
; -----------------------------------------------------------------------------

DarknessPokemonCardIDs:
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
	dw UMBREON
	dw MURKROW
	dw SNEASEL
	dw HOUNDOUR1
	dw HOUNDOUR2
	dw HOUNDOOM
	dw TYRANITAR
	dw TYRANITAR_S
	dw SHADOW_LUGIA
	dw 0

; Count how many cards with 16-bit ID in de are attached to play area
; location b (CARD_LOCATION_ARENA or CARD_LOCATION_PLAY_AREA | slot)
; for the current turn duelist.
; Returns count in a. Preserves bc and de.
CountAttachedCardIDAtLocation:
	push bc
	push de
	push hl
	ld c, 0 ; counter
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
.loop
	ld a, [hl]
	cp b
	jr nz, .next
	push bc
	push de
	push hl
	ld a, l
	call GetCardIDFromDeckIndex ; returns 16-bit ID in de
	ld a, e
	ld b, a
	ld a, d
	pop hl
	pop de ; target ID
	cp d
	jr nz, .no_match
	ld a, b
	cp e
	jr nz, .no_match
	pop bc
	inc c
	jr .next
.no_match
	pop bc
.next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop
	ld a, c
	pop hl
	pop de
	pop bc
	ret

; Add +10 damage to de per Darkness Energy attached to turn holder's Arena card.
; Input: de = current damage (> 0), turn = attacker.
; Output: de = modified damage. Preserves bc.
ApplyAttachedDarknessEnergyDamage::
	push bc
	push hl
	push de
	ld b, CARD_LOCATION_ARENA
	ld de, DARKNESS_ENERGY
	call CountAttachedCardIDAtLocation
	pop de
	or a
	jr z, .done
	ld c, a
	ld l, e
	ld h, d
	ld de, 10
.add_loop
	add hl, de
	dec c
	jr nz, .add_loop
	ld e, l
	ld d, h
.done
	pop hl
	pop bc
	ret

; Subtract 10 damage from de per Metal Energy attached to turn holder's card
; at CARD_LOCATION_PLAY_AREA | slot (passed in b).
; Input: de = current damage, b = CARD_LOCATION_ARENA or CARD_LOCATION_PLAY_AREA | slot.
; Output: de = modified damage (may be negative, clamped to 0 by caller and here).
; Preserves bc.
ApplyAttachedMetalEnergyReduction::
	push bc
	push hl
	push de
	ld de, METAL_ENERGY
	call CountAttachedCardIDAtLocation
	pop de
	or a
	jr z, .done
	ld c, a
	ld l, e
	ld h, d
	ld de, -10
.sub_loop
	add hl, de
	dec c
	jr nz, .sub_loop
	bit 7, h
	jr z, .no_underflow
	ld hl, 0
.no_underflow
	ld e, l
	ld d, h
.done
	pop hl
	pop bc
	ret

; Called in HandleAfterDamageEffects (turn = attacker).
; If attacker has >= 1 Darkness Energy attached and is NOT a Darkness / Dark Pokemon,
; deal 10 damage to itself per Darkness Energy attached.
HandleDarknessEnergySelfRecoil::
	ld a, DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	or a
	ret z ; already KO'd
	ld b, CARD_LOCATION_ARENA
	ld de, DARKNESS_ENERGY
	call CountAttachedCardIDAtLocation
	or a
	ret z
	push af ; save Darkness Energy count
	ld a, DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	call GetCardIDFromDeckIndex
	ld hl, DarknessPokemonCardIDs
	call IsCardIDInWordTable
	jr c, .is_darkness_pkmn
	pop af ; count
	ld c, a
	ld hl, 0
	ld de, 10
.mul_loop
	add hl, de
	dec c
	jr nz, .mul_loop
	ld e, l
	ld d, h
	ld a, DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	call SubtractHP
	xor a ; PLAY_AREA_ARENA
	call PrintPlayAreaCardKnockedOutIfNoHP
	bank1call DrawDuelHUDs
	ret
.is_darkness_pkmn
	pop af
	ret

; -----------------------------------------------------------------------------
; 3. POKEMON TOOLS (BERRY, GOLD BERRY, FOCUS BAND, MIRACLE BERRY)
; -----------------------------------------------------------------------------

; Returns hl = wPlayerAttachedTools or wOpponentAttachedTools based on hWhoseTurn.
GetAttachedToolsBase:
	ldh a, [hWhoseTurn]
	cp PLAYER_TURN
	ld hl, wPlayerAttachedTools
	ret z
	ld hl, wOpponentAttachedTools
	ret

; Input: a = play area slot (0..5)
; Output: hl = pointer to 2-byte tool ID entry, de = 16-bit tool ID, z flag set if 0.
GetAttachedToolForSlot::
	push bc
	add a ; slot * 2
	ld c, a
	ld b, 0
	call GetAttachedToolsBase
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	dec hl
	ld a, e
	or d
	pop bc
	ret

; Input: a = play area slot (0..5), de = 16-bit tool ID
SetAttachedToolForSlot::
	push hl
	push bc
	add a
	ld c, a
	ld b, 0
	call GetAttachedToolsBase
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	pop bc
	pop hl
	ret

; Clear attached tool slot e (0..5) for turn holder. Preserves all registers.
ClearAttachedToolForSlot::
	push af
	push bc
	push de
	push hl
	ld a, e
	ld de, 0
	call SetAttachedToolForSlot
	pop hl
	pop de
	pop bc
	pop af
	ret

; Swap attached tool slots d and e (0..5) for turn holder. Preserves all registers.
SwapAttachedToolsForSlots::
	push af
	push bc
	push de
	push hl
	ld a, d
	cp e
	jr z, .done
	push de ; save d, e
	ld a, d
	call GetAttachedToolForSlot ; de = tool[d]
	ld b, d
	ld c, e ; bc = tool[d]
	pop de
	push de
	push bc
	ld a, e
	call GetAttachedToolForSlot ; de = tool[e]
	pop bc
	pop hl ; h = slot d, l = slot e
	push hl
	push bc
	ld a, h
	call SetAttachedToolForSlot ; tool[d] = tool[e]
	pop de ; tool[d]
	pop hl
	ld a, l
	call SetAttachedToolForSlot ; tool[e] = old tool[d]
.done
	pop hl
	pop de
	pop bc
	pop af
	ret

; Zero both wPlayerAttachedTools and wOpponentAttachedTools at duel start.
ClearAllAttachedTools::
	push af
	push bc
	push hl
	xor a
	ld hl, wPlayerAttachedTools
	ld c, MAX_PLAY_AREA_POKEMON * 2
.loop1
	ld [hli], a
	dec c
	jr nz, .loop1
	ld hl, wOpponentAttachedTools
	ld c, MAX_PLAY_AREA_POKEMON * 2
.loop2
	ld [hli], a
	dec c
	jr nz, .loop2
	pop hl
	pop bc
	pop af
	ret

; Clear attached tool slot a (0..5) and discard the matching Tool card (16-bit ID de)
; from CARD_LOCATION_PLAY_AREA | a into the discard pile.
DiscardAttachedToolCard:
	push af
	push bc
	push de
	push hl
	push af
	push de
	ld de, 0
	call SetAttachedToolForSlot
	pop de ; target 16-bit card ID
	pop af ; slot
	or CARD_LOCATION_PLAY_AREA
	ld b, a
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
.loop
	ld a, [hl]
	cp b
	jr nz, .next
	push bc
	push de
	push hl
	ld a, l
	call GetCardIDFromDeckIndex ; de = card ID
	ld a, e
	ld b, a
	ld a, d
	pop hl
	pop de ; target ID
	cp d
	jr nz, .no_match
	ld a, b
	cp e
	jr nz, .no_match
	pop bc
	ld a, l
	call PutCardInDiscardPile
	jr .done
.no_match
	pop bc
.next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop
.done
	pop hl
	pop de
	pop bc
	pop af
	ret

; Trainer EffectCommands for all Pokemon Tool cards (Berry, Gold Berry, Focus Band, Miracle Berry)
PokemonToolEffectCommands::
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_1, PokemonTool_InitialEffect1 + $4000
	dbw EFFECTCMDTYPE_INITIAL_EFFECT_2, PokemonTool_SelectPokemon + $4000
	dbw EFFECTCMDTYPE_BEFORE_DAMAGE,    PokemonTool_AttachEffect + $4000
	dbw EFFECTCMDTYPE_AI_SELECTION,     PokemonTool_AISelectPokemon + $4000
	db  $00

; Check that at least one Pokemon in turn holder's play area has no Tool attached.
PokemonTool_InitialEffect1:
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ld c, a
	ld b, 0
.loop
	ld a, b
	call GetAttachedToolForSlot
	jr z, .found_empty
	inc b
	dec c
	jr nz, .loop
	ldtx hl, NoPokemonWithoutToolText
	scf
	ret
.found_empty
	or a
	ret

; Let player select a Pokemon in play that has no Tool attached.
PokemonTool_SelectPokemon:
	ldtx hl, ChoosePokemonForToolText
	call DrawWideTextBox_WaitForInput
.select_loop
	bank1call HasAlivePokemonInPlayArea
	bank1call OpenPlayAreaScreenForSelection
	ret c ; cancelled with B
	ldh a, [hTempPlayAreaLocation_ff9d]
	call GetAttachedToolForSlot
	jr z, .valid
	ldtx hl, NoPokemonWithoutToolText
	call DrawWideTextBox_WaitForInput
	jr .select_loop
.valid
	ldh a, [hTempPlayAreaLocation_ff9d]
	ldh [hTemp_ffa0], a
	or a
	ret

; AI selects the first Pokemon in play without a Tool attached.
PokemonTool_AISelectPokemon:
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	ld c, a
	ld b, 0
.loop
	ld a, b
	call GetAttachedToolForSlot
	jr z, .found
	inc b
	dec c
	jr nz, .loop
	xor a
	ldh [hTemp_ffa0], a
	ret
.found
	ld a, b
	ldh [hTemp_ffa0], a
	ret

; Attach the played Pokemon Tool card to the chosen slot (hTemp_ffa0)
; instead of letting PlayTrainerCard discard it.
PokemonTool_AttachEffect:
	ldh a, [hTempCardIndex_ff9f]
	call GetCardIDFromDeckIndex ; de = 16-bit Tool card ID
	ldh a, [hTemp_ffa0]
	call SetAttachedToolForSlot
	ldh a, [hTemp_ffa0]
	ld e, a
	ldh a, [hTempCardIndex_ff9f]
	call PutHandCardInPlayArea
	call IsPlayerTurn
	ret c
	ldh a, [hTemp_ffa0]
	farcall DrawPlayAreaScreenToShowChanges
	ret

; Called between turns (HandleBetweenTurnsEvents) to trigger Berry, Gold Berry,
; and Miracle Berry for both players' Pokemon in play.
HandleBetweenTurnsPokemonTools::
	call .check_current_turn_tools
	call SwapTurn
	call .check_current_turn_tools
	call SwapTurn
	ret

.check_current_turn_tools
	ld a, DUELVARS_NUMBER_OF_POKEMON_IN_PLAY_AREA
	call GetTurnDuelistVariable
	or a
	ret z
	ld c, a
	ld b, 0 ; current slot
.slot_loop
	push bc
	ld a, b
	call GetAttachedToolForSlot
	jr z, .next_slot
	; Check BERRY
	ld a, d
	cp HIGH(BERRY)
	jr nz, .check_gold_berry
	ld a, e
	cp LOW(BERRY)
	jr nz, .check_gold_berry
	; Trigger Berry if damage >= 20 -> heal 20 HP
	ld a, b
	ld c, 20 ; threshold
	ld l, 20 ; heal amount
	call .try_heal_berry
	jr .next_slot

.check_gold_berry
	ld a, d
	cp HIGH(GOLD_BERRY)
	jr nz, .check_miracle_berry
	ld a, e
	cp LOW(GOLD_BERRY)
	jr nz, .check_miracle_berry
	; Trigger Gold Berry if damage >= 30 -> heal 40 HP
	ld a, b
	ld c, 30 ; threshold
	ld l, 40 ; heal amount
	call .try_heal_berry
	jr .next_slot

.check_miracle_berry
	ld a, d
	cp HIGH(MIRACLE_BERRY)
	jr nz, .next_slot
	ld a, e
	cp LOW(MIRACLE_BERRY)
	jr nz, .next_slot
	; Trigger Miracle Berry on Active Pokemon if it has any Special Condition
	ld a, b
	or a ; PLAY_AREA_ARENA
	jr nz, .next_slot
	ld a, DUELVARS_ARENA_CARD_STATUS
	call GetTurnDuelistVariable
	ld a, [hl]
	or a
	jr z, .next_slot
	ld [hl], NO_STATUS
	xor a ; slot 0
	call DiscardAttachedToolCard
	bank1call DrawDuelHUDs

.next_slot
	pop bc
	inc b
	dec c
	jr nz, .slot_loop
	ret

; Input: a = slot, de = tool ID, c = min damage threshold, l = heal amount
.try_heal_berry
	push de
	push bc
	push hl
	ld b, a ; slot
	add DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	call LoadCardDataToBuffer1_FromDeckIndex
	ld a, [wLoadedCard1HP]
	ld d, a ; MaxHP
	ld a, b
	add DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	ld e, [hl] ; CurrentHP
	ld a, e
	or a
	jr z, .no_heal ; already KO'd
	ld a, d
	sub e ; a = damage taken = MaxHP - CurrentHP
	jr c, .no_heal
	cp c ; damage >= threshold?
	jr c, .no_heal
	; Heal by l (clamped to MaxHP in d)
	pop bc ; original hl -> c = heal amount
	push bc
	ld a, e
	add c
	cp d
	jr c, .store_healed_hp
	ld a, d
.store_healed_hp
	ld [hl], a
	pop hl
	pop bc
	pop de
	ld a, b ; slot
	call DiscardAttachedToolCard
	bank1call DrawDuelHUDs
	ret
.no_heal
	pop hl
	pop bc
	pop de
	ret

; Called when a Pokemon's HP reaches 0 due to attack damage.
; Input: b = play area slot (0..5) of the damaged Pokemon,
;        hl = pointer to its DUELVARS_ARENA_CARD_HP + slot,
;        hWhoseTurn = the owner of the damaged Pokemon!
; Output: carry set if Focus Band saved the Pokemon at 10 HP, nc otherwise.
; Preserves hl and bc.
HandleFocusBandOnKO::
	ld a, [hl]
	or a
	ret nz ; not at 0 HP
	push bc
	push de
	push hl
	ld a, b
	call GetAttachedToolForSlot
	jr z, .not_saved
	ld a, d
	cp HIGH(FOCUS_BAND)
	jr nz, .not_saved
	ld a, e
	cp LOW(FOCUS_BAND)
	jr nz, .not_saved
	push bc
	push de
	ldtx de, FocusBandCoinCheckText
	call TossCoin
	pop de
	pop bc
	jr nc, .not_saved ; tails -> KO proceeds
	; Heads! Restore HP to 10 and discard Focus Band
	pop hl
	ld [hl], 10
	push hl
	ld a, b
	call DiscardAttachedToolCard
	ldtx hl, FocusBandSavedText
	call DrawWideTextBox_WaitForInput
	bank1call DrawDuelHUDs
	pop hl
	pop de
	pop bc
	scf
	ret
.not_saved
	pop hl
	pop de
	pop bc
	or a
	ret
