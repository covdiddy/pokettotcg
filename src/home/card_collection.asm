; return, in hl, the total amount of cards owned anywhere, including duplicates
GetAmountOfCardsOwned::
	push de
	push bc
	call EnableSRAM
	ld hl, $0000
	ld de, sDeck1Name
	ld c, NUM_DECKS
.next_deck
	ld a, [de]
	or a
	jr z, .skip_deck ; jump if deck empty
	ld a, c
	ld bc, DECK_SIZE
	add hl, bc
	ld c, a
.skip_deck
	ld a, sDeck2Name - sDeck1Name
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a ; de = sDeck*Name
	dec c
	jr nz, .next_deck
	; hl = DECK_SIZE * (no. of non-empty decks)
	ld de, sCardCollection
.next_card
	ld a, [de]
	bit CARD_NOT_OWNED_F, a
	jr nz, .skip_card
	ld c, a ; card count in sCardCollection
	ld b, $0
	add hl, bc
.skip_card
	inc de
	ld a, d
	cp HIGH(sCardCollection + CARD_COLLECTION_SIZE)
	jr nz, .next_card
	call DisableSRAM
	pop bc
	pop de
	ret

; return carry if the count in sCardCollection plus the count in each deck (sDeck*)
; of the card with id given in a (or de for _DE) is 0 (if card not owned).
; also return the count (total owned amount) in a.
GetCardCountInCollectionAndDecks::
	push de
	ld e, a
	ld d, $0
	call GetCardCountInCollectionAndDecks_DE
	pop de
	ret

GetCardCountInCollectionAndDecks_DE::
	push hl
	push de
	push bc
	call EnableSRAM
	ld b, $0
	ld hl, sDeck1Cards
	ld c, NUM_DECKS
.next_deck
	ld a, [hli]
	or [hl]
	dec hl
	jr z, .deck_done ; jump if deck empty
	push hl
	push bc
	ld c, DECK_SIZE
.next_card
	ld a, [hli]
	cp e
	ld a, [hli]
	jr nz, .no_match
	cp d
	jr nz, .no_match
	inc b ; this deck card matches card de
.no_match
	dec c
	jr nz, .next_card
	ld a, b
	pop bc
	ld b, a
	pop hl
.deck_done
	push de
	ld de, sDeck2Cards - sDeck1Cards
	add hl, de
	pop de
	dec c
	jr nz, .next_deck
	; all decks done
	ld hl, sCardCollection
	add hl, de
	ld a, [hl]
	bit CARD_NOT_OWNED_F, a
	jr nz, .done
	add b ; if card seen, add b to count
.done
	and CARD_COUNT_MASK
	call DisableSRAM
	pop bc
	pop de
	pop hl
	or a
	ret nz
	scf
	ret

; return carry if the count in sCardCollection of the card with id given in a (or de for _DE) is 0.
; also return the count (amount owned outside of decks) in a.
GetCardCountInCollection::
	push de
	ld e, a
	ld d, $0
	call GetCardCountInCollection_DE
	pop de
	ret

GetCardCountInCollection_DE::
	push hl
	call EnableSRAM
	ld hl, sCardCollection
	add hl, de
	ld a, [hl]
	call DisableSRAM
	pop hl
	and CARD_COUNT_MASK
	ret nz
	scf
	ret

; creates a list at wTempCardCollection of every card the player owns and how many
CreateTempCardCollection::
	call EnableSRAM
	ld hl, sCardCollection
	ld de, wTempCardCollection
	ld bc, CARD_COLLECTION_SIZE
	call CopyDataHLtoDE
	ld de, sDeck1Name
	call .AddDeckCards
	ld de, sDeck2Name
	call .AddDeckCards
	ld de, sDeck3Name
	call .AddDeckCards
	ld de, sDeck4Name
	call .AddDeckCards
	call DisableSRAM
	ret

; adds the cards from a deck to wTempCardCollection given de = sDeck*Name
.AddDeckCards:
	ld a, [de]
	or a
	ret z ; return if empty name (empty deck)
	ld hl, sDeck1Cards - sDeck1Name
	add hl, de
	ld e, l
	ld d, h
	ld c, DECK_SIZE
.next_card_loop
	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	inc de
	add HIGH(wTempCardCollection)
	ld h, a
	inc [hl] ; increment count
	dec c
	jr nz, .next_card_loop
	ret

; add card with id given in a (or de for _DE) to sCardCollection, provided that
; the player has less than MAX_AMOUNT_OF_CARD (99) of them
AddCardToCollection::
	push de
	ld e, a
	ld d, $0
	call AddCardToCollection_DE
	pop de
	ret

AddCardToCollection_DE::
	push hl
	push de
	push bc
	push de
	call CreateTempCardCollection
	pop de
	call EnableSRAM
	ld hl, wTempCardCollection
	add hl, de
	ld a, [hl]
	and CARD_COUNT_MASK
	cp MAX_AMOUNT_OF_CARD
	jr nc, .already_max
	ld hl, sCardCollection
	add hl, de
	ld a, [hl]
	and CARD_COUNT_MASK
	inc a
	ld [hl], a
.already_max
	call DisableSRAM
	pop bc
	pop de
	pop hl
	ret

; remove a card with id given in a (or de for _DE) from sCardCollection (decrement its count if non-0)
RemoveCardFromCollection::
	push de
	ld e, a
	ld d, $0
	call RemoveCardFromCollection_DE
	pop de
	ret

RemoveCardFromCollection_DE::
	push hl
	call EnableSRAM
	ld hl, sCardCollection
	add hl, de
	ld a, [hl]
	and CARD_COUNT_MASK
	jr z, .zero
	dec a
	ld [hl], a
.zero
	call DisableSRAM
	pop hl
	ret

; return the amount of different cards that the player has collected in bc
; return NUM_CARDS in de, minus 1 if VENUSAUR_LV64 or MEW_LV15 has not been collected (minus 2 if neither)
GetCardAlbumProgress::
	push hl
	call EnableSRAM
	ld de, NUM_CARDS
	ld hl, sCardCollection + VENUSAUR_LV64
	bit CARD_NOT_OWNED_F, [hl]
	jr z, .next1
	dec de ; if VENUSAUR_LV64 not owned
.next1
	ld hl, sCardCollection + MEW_LV15
	bit CARD_NOT_OWNED_F, [hl]
	jr z, .next2
	dec de ; if MEW_LV15 not owned
.next2
	ld bc, $0000
	ld hl, sCardCollection
.next_card
	bit CARD_NOT_OWNED_F, [hl]
	jr nz, .skip
	inc bc ; if this card owned
.skip
	inc hl
	ld a, h
	cp HIGH(sCardCollection + CARD_COLLECTION_SIZE)
	jr nz, .next_card
	call DisableSRAM
	pop hl
	ret
