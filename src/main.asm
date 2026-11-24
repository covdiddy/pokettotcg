INCLUDE "macros.asm"
INCLUDE "constants.asm"

SECTION "Game Loop", ROMX
INCLUDE "engine/game_loop.asm"

SECTION "Duel Core", ROMX
INCLUDE "engine/duel/core.asm"

SECTION "Menus Common", ROMX
INCLUDE "engine/menus/common.asm"

SECTION "Menus 1", ROMX
INCLUDE "engine/menus/duel.asm"
INCLUDE "engine/menus/deck_selection.asm"
INCLUDE "engine/menus/deck_check.asm"
INCLUDE "engine/menus/deck_configuration.asm"
INCLUDE "engine/menus/card_album.asm"
INCLUDE "engine/menus/printer.asm"
INCLUDE "engine/menus/deck_machine.asm"

SECTION "Overworld Scripting", ROMX
INCLUDE "engine/overworld/overworld.asm"
INCLUDE "engine/overworld/scripting.asm"

SECTION "Menus 2", ROMX
INCLUDE "engine/menus/init_menu.asm"
INCLUDE "engine/menus/status.asm"
INCLUDE "engine/menus/diary.asm"
INCLUDE "engine/menus/print_stats.asm"
INCLUDE "engine/menus/medal.asm"
INCLUDE "engine/menus/give_booster_pack.asm"
INCLUDE "engine/menus/duel_init.asm"
INCLUDE "engine/menus/pc_glossary.asm"
INCLUDE "engine/menus/config.asm"
INCLUDE "engine/menus/mail.asm"

SECTION "Color", ROMX
INCLUDE "engine/gfx/color.asm"

SECTION "Gift Center Menu", ROMX
INCLUDE "engine/menus/gift_center.asm"

SECTION "Overworld Map", ROMX
INCLUDE "engine/overworld_map.asm"
INCLUDE "engine/menus/labels.asm"

SECTION "Save", ROMX
INCLUDE "engine/save.asm"

SECTION "Map Scripts", ROMX
INCLUDE "data/map_scripts.asm"
INCLUDE "engine/overworld/npc_data.asm"
INCLUDE "data/duel/duel_configurations.asm"
INCLUDE "data/script_table.asm"
INCLUDE "data/multichoice.asm"
INCLUDE "data/overworld_map/player_movement_paths.asm"

SECTION "Menus 3", ROMX
INCLUDE "engine/menus/debug_main.asm"
INCLUDE "engine/menus/main_menu.asm"
INCLUDE "engine/menus/debug.asm"
INCLUDE "engine/menus/wait_keys.asm"
INCLUDE "engine/gfx/default_palettes.asm"
INCLUDE "engine/menus/naming.asm"

SECTION "Sprite Animations", ROMX
INCLUDE "engine/gfx/sprite_animations.asm"

SECTION "Scenes", ROMX
INCLUDE "engine/scenes.asm"

SECTION "Challenge Machine", ROMX
INCLUDE "engine/challenge_machine.asm"

SECTION "Map Objects", ROMX
INCLUDE "data/npc_map_data.asm"
INCLUDE "data/map_objects.asm"

SECTION "AI Logic 1", ROMX
INCLUDE "data/deck_ai_pointers.asm"
INCLUDE "engine/duel/ai/core.asm"

SECTION "Menus 4", ROMX
INCLUDE "engine/copy_card_name.asm"
INCLUDE "engine/menus/play_area.asm"
INCLUDE "engine/menus/glossary.asm"
INCLUDE "engine/menus/unknown.asm"

SECTION "Effect Commands", ROMX
INCLUDE "engine/duel/effect_commands.asm"

SECTION "Animation Commands", ROMX
INCLUDE "engine/duel/animations/commands.asm"

SECTION "IR Communications Core", ROMX
INCLUDE "engine/link/ir_core.asm"

SECTION "Sprite Animations VBlank", ROMX
INCLUDE "engine/gfx/sprite_vblank.asm"

SECTION "Starter Deck", ROMX
INCLUDE "engine/starter_deck.asm"

SECTION "Link Functions", ROMX
INCLUDE "engine/link/ir_functions.asm"
INCLUDE "engine/link/card_pop.asm"
INCLUDE "engine/link/printer.asm"
INCLUDE "engine/link/link_duel.asm"

SECTION "Promotional Card", ROMX
INCLUDE "engine/promotional_card.asm"

SECTION "Booster Pack Menu", ROMX
INCLUDE "engine/menus/booster_pack.asm"

SECTION "Unused Save Validation", ROMX
INCLUDE "engine/unused_save_validation.asm"

SECTION "Input Name", ROMX
INCLUDE "engine/input_name.asm"

SECTION "Auto Deck Machines", ROMX
INCLUDE "engine/auto_deck_machines.asm"

SECTION "Bank 7", ROMX
INCLUDE "engine/overworld/debug_player_coordinates.asm"
INCLUDE "engine/overworld/warp.asm"
INCLUDE "engine/overworld/load_map_header.asm"
INCLUDE "engine/overworld/npc_core.asm"
INCLUDE "engine/masters_beaten_list.asm"
INCLUDE "engine/debug_sprites.asm"

SECTION "Duel Animations", ROMX
INCLUDE "engine/duel/animations/core.asm"
INCLUDE "engine/duel/animations/screen_effects.asm"
INCLUDE "data/duel/animations/duel_animations.asm"

SECTION "Start Menu", ROMX
INCLUDE "engine/menus/start.asm"

SECTION "Intro Sequence", ROMX
INCLUDE "engine/intro.asm"
INCLUDE "engine/sequences/intro_sequence_commands.asm"

SECTION "Unused Copyright", ROMX
INCLUDE "engine/unused_copyright.asm"

SECTION "Credits Sequence", ROMX
INCLUDE "engine/credits.asm"
INCLUDE "engine/sequences/credits_sequence_commands.asm"
INCLUDE "data/sequences/credits.asm"

SECTION "Booster Packs", ROMX
INCLUDE "engine/booster_packs.asm"

SECTION "AI Logic 2", ROMX
INCLUDE "engine/duel/ai/trainer_cards.asm"
INCLUDE "engine/duel/ai/pkmn_powers.asm"
INCLUDE "engine/duel/ai/common.asm"

SECTION "Effect Functions", ROMX
INCLUDE "engine/duel/effect_functions.asm"

SECTION "Decks", ROMX
INCLUDE "data/decks.asm"

SECTION "Cards", ROMX
INCLUDE "data/cards.asm"

SECTION "Cards 2", ROMX
Cards2Start::

_SaveDuelStateToSRAM::
	ld a, BANK(sBackupCurrentDuel)
	call BankswitchSRAM
; save duel data to sBackupCurrentDuel
	bank1call SaveDuelData
	xor a ; BANK("SRAM0")
	call BankswitchSRAM
; get hl = sDuelBufferN for N = [s0a008] & $3
	call EnableSRAM
	ld hl, s0a008
	ld a, [hl]
	inc [hl]
	call DisableSRAM
	and $3
	add HIGH(sDuelBuffer0) / 4
	ld l, 0
	ld h, a
	add hl, hl
	add hl, hl
	ld a, BANK(sDuelBuffer0)
	call BankswitchSRAM
; save wDuelTurns, non-turn holder's arena card ID, turn holder's arena card ID
	push hl
	ld a, DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	call GetCardIDFromDeckIndex
	ld a, e
	ld [wTempTurnDuelistCardID], a
	ld a, d
	ld [wTempTurnDuelistCardID + 1], a
	call SwapTurn
	ld a, DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	call GetCardIDFromDeckIndex
	ld a, e
	ld [wTempNonTurnDuelistCardID], a
	ld a, d
	ld [wTempNonTurnDuelistCardID + 1], a
	call SwapTurn
	pop hl
	push hl
	call EnableSRAM
	ld a, [wDuelTurns]
	ld [hli], a
	ld a, [wTempNonTurnDuelistCardID]
	ld [hli], a
	ld a, [wTempNonTurnDuelistCardID + 1]
	ld [hli], a
	ld a, [wTempTurnDuelistCardID]
	ld [hli], a
	ld a, [wTempTurnDuelistCardID + 1]
	ld [hli], a
	pop hl
; save duel data to sDuelBufferN + $10
	ld de, $10
	add hl, de
	ld e, l
	ld d, h
	call DisableSRAM
	bank1call SaveDuelDataToDE
	xor a
	call BankswitchSRAM
	ret

_ApplyDamageModifiers_DamageToTarget::
	xor a
	ld [wDamageEffectiveness], a
	ld hl, wDamage
	ld a, [hli]
	or [hl]
	jr nz, .non_zero_damage
	ld de, 0
	ret
.non_zero_damage
	xor a ; PLAY_AREA_ARENA
	ldh [hTempPlayAreaLocation_ff9d], a
	ld d, [hl]
	dec hl
	ld e, [hl]
	call ApplyDarkPrimeapeFrenzy
	bit UNAFFECTED_BY_WEAKNESS_RESISTANCE_F, d
	jr z, .affected_by_wr
	res UNAFFECTED_BY_WEAKNESS_RESISTANCE_F, d
	xor a
	ld [wDamageEffectiveness], a
	call HandleDoubleDamageSubstatus
	jr .check_pluspower_and_defender
.affected_by_wr
	call HandleDoubleDamageSubstatus
	ld a, e
	or d
	ret z
	ldh a, [hTempPlayAreaLocation_ff9d]
	call GetPlayAreaCardColor
	call TranslateColorToWR
	ld b, a
	call SwapTurn
	call GetArenaCardWeakness
	call SwapTurn
	and b
	jr z, .not_weak
	sla e
	rl d
	ld hl, wDamageEffectiveness
	set WEAKNESS, [hl]
.not_weak
	call SwapTurn
	call GetArenaCardResistance
	call SwapTurn
	and b
	jr z, .check_pluspower_and_defender ; jump if not resistant
	ld hl, -30
	add hl, de
	ld e, l
	ld d, h
	ld hl, wDamageEffectiveness
	set RESISTANCE, [hl]
.check_pluspower_and_defender
	ld b, CARD_LOCATION_ARENA
	call ApplyAttachedPlusPower
	farcall ApplyAttachedDarknessEnergyDamage
	call SwapTurn
	ld b, CARD_LOCATION_ARENA
	call ApplyAttachedDefender
	farcall ApplyAttachedMetalEnergyReduction
	call HandleDamageReduction
	bit 7, d
	jr z, .no_underflow
	ld de, 0
.no_underflow
	call SwapTurn
	ret

_ApplyDamageModifiers_DamageToSelf::
	xor a
	ld [wDamageEffectiveness], a
	ld hl, wDamage
	ld a, [hli]
	or [hl]
	or a
	jr z, .no_damage
	ld d, [hl]
	dec hl
	ld e, [hl]
	ld a, [wConfusionAttackCheckWasUnsuccessful]
	or a
	call nz, ApplyDarkPrimeapeFrenzy
	call GetArenaCardColor
	call TranslateColorToWR
	ld b, a
	call GetArenaCardWeakness
	and b
	jr z, .not_weak
	sla e
	rl d
	ld hl, wDamageEffectiveness
	set WEAKNESS, [hl]
.not_weak
	call GetArenaCardResistance
	and b
	jr z, .not_resistant
	ld hl, -30
	add hl, de
	ld e, l
	ld d, h
	ld hl, wDamageEffectiveness
	set RESISTANCE, [hl]
.not_resistant
	ld b, CARD_LOCATION_ARENA
	call ApplyAttachedPlusPower
	ld b, CARD_LOCATION_ARENA
	call ApplyAttachedDefender
	bit 7, d ; test for underflow
	ret z
.no_damage
	ld de, 0
	ret

; Dark Primeape's Frenzy: +30 damage if turn holder's Arena card is Dark Primeape,
; is Confused, and Toxic Gas (Muk) is not active.
; Preserves de (adding 30 if active) and bc.
ApplyDarkPrimeapeFrenzy:
	push bc
	push de
	ld a, DUELVARS_ARENA_CARD_STATUS
	call GetTurnDuelistVariable
	and CNF_SLP_PRZ
	cp CONFUSED
	jr nz, .done
	ld a, DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	call GetCardIDFromDeckIndex
	ld a, d
	cp HIGH(DARK_PRIMEAPE)
	jr nz, .done
	ld a, e
	cp LOW(DARK_PRIMEAPE)
	jr nz, .done
	ld a, MUK
	call CountPokemonWithActivePkmnPowerInBothPlayAreas
	jr c, .done
	pop de
	ld hl, 30
	add hl, de
	ld e, l
	ld d, h
	pop bc
	ret
.done
	pop de
	pop bc
	ret

_GetLoadedCard1RetreatCost::
	ld a, [wLoadedCard1RetreatCost]
	ld c, a
	ld a, MUK
	call CountPokemonWithActivePkmnPowerInBothPlayAreas
	jr c, .done
	ldh a, [hTempPlayAreaLocation_ff9d]
	or a ; cp PLAY_AREA_ARENA
	jr nz, .check_dodrio
	call SwapTurn
	ld a, DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	call GetCardIDFromDeckIndex
	ld a, d
	cp HIGH(DARK_MUK)
	jr nz, .not_dark_muk
	ld a, e
	cp LOW(DARK_MUK)
	jr nz, .not_dark_muk
	call CheckIsIncapableOfUsingPkmnPower_ArenaCard
	jr c, .not_dark_muk
	inc c
	inc c
.not_dark_muk
	call SwapTurn
.check_dodrio
	ld a, DODRIO
	call CountTurnDuelistPokemonWithActivePkmnPower
	ld b, a
	ld a, c
	sub b
	jr nc, .ret_a
	xor a
.ret_a
	ret
.done
	ld a, c
	ret

_CheckCantUseTrainerDueToEffect::
	ld a, DUELVARS_ARENA_CARD_SUBSTATUS3
	call GetTurnDuelistVariable
	bit SUBSTATUS3_HEADACHE_F, [hl]
	jr nz, .cant_use
	ld de, DARK_VILEPLUME
	call CountPokemonWithActivePkmnPowerInBothPlayAreas_DE
	jr nc, .can_use
	ld a, MUK
	call CountPokemonWithActivePkmnPowerInBothPlayAreas
	jr c, .can_use
.cant_use
	ldtx hl, UnableToUseTrainerDueToHeadacheText
	scf
	ret
.can_use
	or a
	ret

_HandleDestinyBondAndFinalBeam::
	ld a, DUELVARS_ARENA_CARD_HP
	call GetNonTurnDuelistVariable
	or a
	ret nz
	ld a, DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	or a
	ret z

	ld a, DUELVARS_ARENA_CARD_SUBSTATUS1
	call GetNonTurnDuelistVariable
	cp SUBSTATUS1_DESTINY_BOND
	jr nz, .check_final_beam

	ld a, DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	ld [hl], 0
	ld a, DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	call LoadCardDataToBuffer1_FromDeckIndex
	ld hl, wLoadedCard1Name
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call LoadTxRam2
	ldtx hl, KnockedOutDueToDestinyBondText
	call DrawWideTextBox_WaitForInput
	bank1call DrawDuelHUDs
	ret

.check_final_beam
	ld a, DUELVARS_ARENA_CARD
	call GetNonTurnDuelistVariable
	call GetCardIDFromDeckIndex
	ld a, d
	cp HIGH(DARK_GYARADOS)
	ret nz
	ld a, e
	cp LOW(DARK_GYARADOS)
	ret nz
	call SwapTurn
	call CheckIsIncapableOfUsingPkmnPower_ArenaCard
	call SwapTurn
	ret c
	ldtx de, DamageCheckIfHeadsXDamageText
	call TossCoin
	ret nc
	call SwapTurn
	ld e, PLAY_AREA_ARENA
	call GetPlayAreaCardAttachedEnergies
	ld a, [wAttachedEnergies + WATER]
	call SwapTurn
	or a
	ret z
	ld l, a
	ld h, 0
	; multiply by 20: hl * 20 = (hl * 5) * 4
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	add hl, hl
	add hl, hl
	ld e, l
	ld d, h
	ld a, DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	call SubtractHP
	xor a ; PLAY_AREA_ARENA
	call PrintPlayAreaCardKnockedOutIfNoHP
	bank1call DrawDuelHUDs
	ret

_GetPlayAreaCardAttachedEnergies::
	push hl
	push bc
	ld hl, wAttachedEnergies
	ld c, NUM_TYPES
	xor a
.zero_loop
	ld [hli], a
	dec c
	jr nz, .zero_loop
	ld [wTotalAttachedEnergies], a

	ld a, e
	add CARD_LOCATION_ARENA
	ld b, a
	ld a, DUELVARS_CARD_LOCATIONS
	call GetTurnDuelistVariable
.loop
	ld a, [hl]
	cp b
	jr nz, .next
	push hl
	push bc
	ld a, l
	call LoadCardDataToBuffer1_FromDeckIndex
	ld a, [wLoadedCard1Type]
	bit TYPE_ENERGY_F, a
	jr z, .done_card

	ld hl, wLoadedCard1ID
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, d
	cp HIGH(RAINBOW_ENERGY)
	jr nz, .check_dce
	ld a, e
	cp LOW(RAINBOW_ENERGY)
	jr nz, .check_dce
	ld hl, wAttachedEnergies
	ld c, COLORLESS
.rainbow_loop
	inc [hl]
	inc hl
	dec c
	jr nz, .rainbow_loop
	ld hl, wTotalAttachedEnergies
	inc [hl]
	jr .done_card

.check_dce
	ld a, d
	cp HIGH(DOUBLE_COLORLESS_ENERGY)
	jr nz, .basic_energy
	ld a, e
	cp LOW(DOUBLE_COLORLESS_ENERGY)
	jr nz, .basic_energy
	ld hl, wAttachedEnergies + COLORLESS
	inc [hl]
	inc [hl]
	ld hl, wTotalAttachedEnergies
	inc [hl]
	inc [hl]
	jr .done_card

.basic_energy
	ld a, [wLoadedCard1Type]
	and $07
	ld e, a
	ld d, 0
	ld hl, wAttachedEnergies
	add hl, de
	inc [hl]
	ld hl, wTotalAttachedEnergies
	inc [hl]

.done_card
	pop bc
	pop hl
.next
	inc l
	ld a, l
	cp DECK_SIZE
	jr c, .loop
	pop bc
	pop hl
	ret

HandleSpecialEnergyAttachment::
	ldh a, [hTempCardIndex_ff98]
	call GetCardIDFromDeckIndex
	ld a, d
	cp HIGH(RAINBOW_ENERGY)
	jr nz, .check_potion
	ld a, e
	cp LOW(RAINBOW_ENERGY)
	jr nz, .check_potion
	ldh a, [hTempPlayAreaLocation_ff9d]
	add DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	ld de, 10
	call SubtractHP
	ldh a, [hTempPlayAreaLocation_ff9d]
	call PrintPlayAreaCardKnockedOutIfNoHP
	jr nc, .draw_huds
	bank1call HandleDestinyBondAndBetweenTurnKnockOuts
	ld a, [wDuelFinished]
	or a
	ret nz
.draw_huds
	bank1call DrawDuelHUDs
	ret

.check_potion
	ld a, d
	cp HIGH(POTION_ENERGY)
	jr nz, .check_full_heal
	ld a, e
	cp LOW(POTION_ENERGY)
	jr nz, .check_full_heal
	ldh a, [hTempPlayAreaLocation_ff9d]
	add DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	call LoadCardDataToBuffer1_FromDeckIndex
	ld a, [wLoadedCard1HP]
	ld b, a
	ldh a, [hTempPlayAreaLocation_ff9d]
	add DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	ld a, [hl]
	add 10
	cp b
	jr c, .store_hp
	ld a, b
.store_hp
	ld [hl], a
	bank1call DrawDuelHUDs
	ret

.check_full_heal
	ld a, d
	cp HIGH(FULL_HEAL_ENERGY)
	ret nz
	ld a, e
	cp LOW(FULL_HEAL_ENERGY)
	ret nz
	ldh a, [hTempPlayAreaLocation_ff9d]
	or a ; cp PLAY_AREA_ARENA
	ret nz
	ld a, DUELVARS_ARENA_CARD_STATUS
	call GetTurnDuelistVariable
	ld [hl], NO_STATUS
	bank1call DrawDuelHUDs
	ret

CheckDarkDugtrioSinkhole::
	call SwapTurn
	ld de, DARK_DUGTRIO
	call CountTurnDuelistPokemonWithActivePkmnPower_DE
	push af
	ld a, MUK
	call CountPokemonWithActivePkmnPowerInBothPlayAreas
	pop bc
	jr nc, .no_toxic
	ld b, 0
.no_toxic
	call SwapTurn
	ld a, b
	or a
	ret z
	ldtx de, DamageCheckIfTailsNoDamageText
	call TossCoin
	ret c
	ldh a, [hTempPlayAreaLocation_ffa1]
	add DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	ld de, 20
	call SubtractHP
	ldh a, [hTempPlayAreaLocation_ffa1]
	call PrintPlayAreaCardKnockedOutIfNoHP
	bank1call DrawDuelHUDs
	ret

_DealDamageToPlayAreaPokemon::
	ld a, b
	ld [wTempPlayAreaLocation_cceb], a
	or a ; cp PLAY_AREA_ARENA
	jr nz, .skip_no_damage_or_effect_check
	ld a, [wNoDamageOrEffect]
	or a
	ret nz
.skip_no_damage_or_effect_check
	push hl
	push de
	push bc
	xor a
	ld [wNoDamageOrEffect], a
	push de
	ld a, [wTempPlayAreaLocation_cceb]
	add DUELVARS_ARENA_CARD
	call GetTurnDuelistVariable
	call GetCardIDFromDeckIndex
	ld a, e
	ld [wTempNonTurnDuelistCardID], a
	ld a, d
	ld [wTempNonTurnDuelistCardID + 1], a
	pop de
	ld a, [wTempPlayAreaLocation_cceb]
	or a ; cp PLAY_AREA_ARENA
	jr nz, .next
	ld a, [wIsDamageToSelf]
	or a
	jr z, .turn_swapped
	ld b, CARD_LOCATION_ARENA
	call ApplyAttachedPlusPower
	jr .next
.turn_swapped
	call SwapTurn
	ld b, CARD_LOCATION_ARENA
	call ApplyAttachedPlusPower
	call SwapTurn
.next
	ld a, [wLoadedAttackCategory]
	cp POKEMON_POWER
	jr z, .skip_defender
	ld a, [wTempPlayAreaLocation_cceb]
	or CARD_LOCATION_PLAY_AREA
	ld b, a
	call ApplyAttachedDefender
	farcall ApplyAttachedMetalEnergyReduction
.skip_defender
	ld a, [wTempPlayAreaLocation_cceb]
	or a ; cp PLAY_AREA_ARENA
	jr nz, .in_bench
	push de
	call HandleNoDamageOrEffectSubstatus
	pop de
	call HandleDamageReduction
.in_bench
	bit 7, d
	jr z, .no_underflow
	ld de, 0
.no_underflow
	call HandleDamageReductionOrNoDamageFromPkmnPowerEffects
	ld a, [wTempPlayAreaLocation_cceb]
	ld b, a
	or a ; cp PLAY_AREA_ARENA
	jr nz, .benched
	; if arena Pokemon, add damage at de to [wDealtDamage]
	ld hl, wDealtDamage
	ld a, e
	add [hl]
	ld [hli], a
	ld a, d
	adc [hl]
	ld [hl], a
.benched
	ld c, $00
	add DUELVARS_ARENA_CARD_HP
	call GetTurnDuelistVariable
	push af
	bank1call PlayAttackAnimation_DealAttackDamageSimple
	pop af
	or a
	jr z, .skip_knocked_out
	push de
	ld a, [wTempPlayAreaLocation_cceb]
	ld b, a
	farcall HandleFocusBandOnKO
	call PrintKnockedOutIfHLZero
	pop de
.skip_knocked_out
	call HandleStrikesBack_AgainstDamagingAttack
	pop bc
	pop de
	pop hl
	ret

INCLUDE "data/cards_rocket.asm"
INCLUDE "engine/duel/rocket_effects.asm"

SECTION "SGB", ROMX
INCLUDE "engine/sgb.asm"

SECTION "Load Gfx", ROMX
INCLUDE "engine/overworld/load_overworld.asm"
INCLUDE "engine/gfx/load_gfx.asm"
INCLUDE "engine/overworld/animation.asm"
INCLUDE "engine/overworld/map_events.asm"
INCLUDE "engine/gfx/debug.asm"
INCLUDE "engine/gfx/sprite_null_animation.asm"

SECTION "Gfx", ROMX
INCLUDE "engine/gfx/gfx_table_pointers.asm"
INCLUDE "engine/gfx/tilemaps.asm"
INCLUDE "engine/gfx/tilesets.asm"
INCLUDE "engine/gfx/sprites.asm"
INCLUDE "data/sprite_animation_pointers.asm"
INCLUDE "data/palette_pointers.asm"
INCLUDE "data/maps/tilemaps.asm"

SECTION "Cards Neo 1", ROMX
INCLUDE "data/cards_neo_1.asm"

SECTION "Cards Neo 2", ROMX
INCLUDE "data/cards_neo_2.asm"

SECTION "Neo Effects 1", ROMX
INCLUDE "engine/duel/neo_mechanics.asm"
INCLUDE "engine/duel/neo_effect_commands.asm"

SECTION "Neo Effects 2", ROMX
INCLUDE "engine/duel/neo_effect_functions.asm"
