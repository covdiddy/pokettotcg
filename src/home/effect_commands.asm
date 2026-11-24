; Checks if the command type at a is one of the commands of the attack or
; card effect currently in use, and executes its associated function if so.
; input:
   ; a = command type to check
   ; [wLoadedAttackEffectCommands] = pointer to list of commands of current attack or trainer card
TryExecuteEffectCommandFunction::
	push af
	; grab pointer to command list from wLoadedAttackEffectCommands
	ld hl, wLoadedAttackEffectCommands
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	call CheckMatchingCommand
	jr nc, .execute_function
	; return if no matching command was found
	or a
	ret

.execute_function
	; execute the function at [wEffectFunctionsBank]:hl
	ldh a, [hBankROM]
	push af
	ld a, [wEffectFunctionsBank]
	call BankswitchROM
	or a
	call CallHL
	push af
	; restore original bank and return
	pop bc
	pop af
	call BankswitchROM
	push bc
	pop af
	ret

; input:
  ; a = command type to check
  ; hl = list of commands of current attack or trainer card
; return nc if command type matching a is found, carry otherwise
CheckMatchingCommand::
	ld c, a
	ld a, l
	or h
	jr nz, .not_null_pointer
	; return carry if pointer is NULL
	scf
	ret

.not_null_pointer
	ldh a, [hBankROM]
	push af
	ld a, h
	and $c0
	cp $40
	jr z, .std_commands_bank
	cp $c0
	jr z, .rocket_commands_bank
	cp $80
	jr z, .neo1_commands_bank
	; $00: Neo Effects 2
	set 6, h
	ld a, BANK("Neo Effects 2")
	jr .got_commands_bank
.neo1_commands_bank
	res 7, h
	set 6, h
	ld a, BANK("Neo Effects 1")
	jr .got_commands_bank
.rocket_commands_bank
	res 7, h
	ld a, BANK("Cards 2")
	jr .got_commands_bank
.std_commands_bank
	ld a, BANK(EffectCommands)
.got_commands_bank
	call BankswitchROM
	; store the bank number of command functions ($b) in wEffectFunctionsBank
	ld a, BANK("Effect Functions")
	ld [wEffectFunctionsBank], a
.check_command_loop
	ld a, [hli]
	or a
	jr z, .no_more_commands
	cp c
	jr z, .matching_command_found
	; skip function pointer for this command and move to the next one
	inc hl
	inc hl
	jr .check_command_loop

.matching_command_found
	; load function pointer for this command
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, h
	and $c0
	cp $40
	jr z, .got_func_bank
	cp $c0
	jr z, .rocket_func_bank
	cp $80
	jr z, .neo1_func_bank
	; $00: Neo Effects 2
	set 6, h
	ld a, BANK("Neo Effects 2")
	ld [wEffectFunctionsBank], a
	jr .got_func_bank
.neo1_func_bank
	res 7, h
	set 6, h
	ld a, BANK("Neo Effects 1")
	ld [wEffectFunctionsBank], a
	jr .got_func_bank
.rocket_func_bank
	res 7, h
	ld a, BANK("Cards 2")
	ld [wEffectFunctionsBank], a
.got_func_bank
	; restore bank and return nc
	pop af
	call BankswitchROM
	or a
	ret

.no_more_commands
	; restore bank and return c
	pop af
	call BankswitchROM
	scf
	ret
