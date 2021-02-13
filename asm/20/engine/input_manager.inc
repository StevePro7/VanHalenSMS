_engine_input_manager_update:
		ld hl, (Finput_manager$curr_joypad1$0$0)	; Finput_manager$curr_joypad1$0$0 = $C152
		ld (Finput_manager$prev_joypad1$0$0), hl	; Finput_manager$prev_joypad1$0$0 = $C154
		call A$_sms_manager$874
		ld (Finput_manager$curr_joypad1$0$0), hl	; Finput_manager$curr_joypad1$0$0 = $C152
		ret

; Data from ED3 to ED5 (3 bytes)
_engine_input_manager_hold:
	;.db $21 $02 $00
	ld hl, $0002

; Data from ED6 to ED6 (1 bytes)
	add hl, sp

; Data from ED7 to ED7 (1 bytes)
	ld c, (hl)

; Data from ED8 to ED9 (2 bytes)
	;.db $06 $00
	ld b, $00

; Data from EDA to EDD (4 bytes)
	;.db $FD $21 $52 $C1
	ld iy, $C152

; Data from EDE to EE0 (3 bytes)
	;.db $FD $7E $00
	ld a, (iy + $00)

; Data from EE1 to EE1 (1 bytes)
	and c

; Data from EE2 to EE2 (1 bytes)
	ld e, a

; Data from EE3 to EE5 (3 bytes)
	;.db $FD $7E $01
	ld a, (iy + $01)

; Data from EE6 to EE6 (1 bytes)
	and b

; Data from EE7 to EE7 (1 bytes)
	or e

; Data from EE8 to EE9 (2 bytes)
	jr z, $10

; Data from EEA to EEA (1 bytes)
	ld a, c

; Data from EEB to EEE (4 bytes)
	;.db $FD $21 $54 $C1
	ld iy, $C154

; Data from EEF to EF1 (3 bytes)
	;.db $FD $A6 $00
	and (iy + $00)

; Data from EF2 to EF2 (1 bytes)
	ld c, a

; Data from EF3 to EF3 (1 bytes)
	ld a, b

; Data from EF4 to EF6 (3 bytes)
	;.db $FD $A6 $01
	and (iy + $01)

; Data from EF7 to EF7 (1 bytes)
	or c

; Data from EF8 to EF9 (2 bytes)
	jr z, $03

; Data from EFA to EFB (2 bytes)
	ld l, $00

; Data from EFC to EFC (1 bytes)
	ret

; Data from EFD to EFE (2 bytes)
	ld l, $01

; Data from EFF to EFF (1 bytes)
	ret

; Data from F00 to F02 (3 bytes)
_engine_input_manager_move:
	;.db $21 $02 $00
	ld hl, $0002

; Data from F03 to F03 (1 bytes)
	add hl, sp

; Data from F04 to F04 (1 bytes)
	ld c, (hl)

; Data from F05 to F07 (3 bytes)
	;.db $3A $52 $C1
	ld a, ($C152)

; Data from F08 to F08 (1 bytes)
	and c

; Data from F09 to F09 (1 bytes)
	ld l, a

; Data from F0A to F0A (1 bytes)
	ret

; Data from F0B to F0C (2 bytes)
_engine_input_manager_direction:
	ld c, $00

; Data from F0D to F0D (1 bytes)
	push bc

; Data from F0E to F0F (2 bytes)
	;ld a, $01
	ld a, $01

; Data from F10 to F10 (1 bytes)
	push af

; Data from F11 to F11 (1 bytes)
	inc sp

; Data from F12 to F14 (3 bytes)
	;.db $CD $00 $0F
	call _engine_input_manager_move

; Data from F15 to F15 (1 bytes)
	inc sp

; Data from F16 to F16 (1 bytes)
	pop bc

; Data from F17 to F17 (1 bytes)
	ld b, l

; Data from F18 to F18 (1 bytes)
	push bc

; Data from F19 to F1A (2 bytes)
	;ld a, $02
	ld a, $02

; Data from F1B to F1B (1 bytes)
	push af

; Data from F1C to F1C (1 bytes)
	inc sp

; Data from F1D to F1F (3 bytes)
	;.db $CD $00 $0F
	call _engine_input_manager_move

; Data from F20 to F20 (1 bytes)
	inc sp

; Data from F21 to F21 (1 bytes)
	ld e, l

; Data from F22 to F22 (1 bytes)
	push de

; Data from F23 to F24 (2 bytes)
	;ld a, $04
	ld a, $04

; Data from F25 to F25 (1 bytes)
	push af

; Data from F26 to F26 (1 bytes)
	inc sp

; Data from F27 to F29 (3 bytes)
	;.db $CD $00 $0F
	call _engine_input_manager_move

; Data from F2A to F2A (1 bytes)
	inc sp

; Data from F2B to F2B (1 bytes)
	pop de

; Data from F2C to F2C (1 bytes)
	pop bc

; Data from F2D to F2D (1 bytes)
	ld d, l

; Data from F2E to F2E (1 bytes)
	push bc

; Data from F2F to F2F (1 bytes)
	push de

; Data from F30 to F31 (2 bytes)
	ld a, $08

; Data from F32 to F32 (1 bytes)
	push af

; Data from F33 to F33 (1 bytes)
	inc sp

; Data from F34 to F36 (3 bytes)
	;.db $CD $00 $0F
	call _engine_input_manager_move

; Data from F37 to F37 (1 bytes)
	inc sp

; Data from F38 to F38 (1 bytes)
	pop de

; Data from F39 to F39 (1 bytes)
	pop bc

; Data from F3A to F3A (1 bytes)
	ld a, b

; Data from F3B to F3B (1 bytes)
	or a

; Data from F3C to F3D (2 bytes)
	jr z, $04

; Data from F3E to F3E (1 bytes)
	ld a, d

; Data from F3F to F3F (1 bytes)
	or a

; Data from F40 to F41 (2 bytes)
	jr nz, $18

; Data from F42 to F42 (1 bytes)
	ld a, e

; Data from F43 to F43 (1 bytes)
	or a

; Data from F44 to F45 (2 bytes)
	jr z, $04

; Data from F46 to F46 (1 bytes)
	ld a, d

; Data from F47 to F47 (1 bytes)
	or a

; Data from F48 to F49 (2 bytes)
	jr nz, $10

; Data from F4A to F4A (1 bytes)
	ld a, b

; Data from F4B to F4B (1 bytes)
	or a

; Data from F4C to F4D (2 bytes)
	jr z, $04

; Data from F4E to F4E (1 bytes)
	ld a, l

; Data from F4F to F4F (1 bytes)
	or a

; Data from F50 to F51 (2 bytes)
	jr nz, $08

; Data from F52 to F52 (1 bytes)
	ld a, e

; Data from F53 to F53 (1 bytes)
	or a

; Data from F54 to F55 (2 bytes)
	jr z, $07

; Data from F56 to F56 (1 bytes)
	ld a, l

; Data from F57 to F57 (1 bytes)
	or a

; Data from F58 to F59 (2 bytes)
	jr z, $03

; Data from F5A to F5B (2 bytes)
	ld l, $00

; Data from F5C to F5C (1 bytes)
	ret

; Data from F5D to F5D (1 bytes)
	ld a, b

; Data from F5E to F5E (1 bytes)
	or a

; Data from F5F to F60 (2 bytes)
	jr z, $04

; Data from F61 to F62 (2 bytes)
	ld c, $01

; Data from F63 to F64 (2 bytes)
	jr $16

; Data from F65 to F65 (1 bytes)
	ld a, e

; Data from F66 to F66 (1 bytes)
	or a

; Data from F67 to F68 (2 bytes)
	jr z, $04

; Data from F69 to F6A (2 bytes)
	ld c, $02

; Data from F6B to F6C (2 bytes)
	jr $0E

; Data from F6D to F6D (1 bytes)
	ld a, d

; Data from F6E to F6E (1 bytes)
	or a

; Data from F6F to F70 (2 bytes)
	jr z, $04

; Data from F71 to F72 (2 bytes)
	ld c, $04

; Data from F73 to F74 (2 bytes)
	jr $06

; Data from F75 to F75 (1 bytes)
	ld a, l

; Data from F76 to F76 (1 bytes)
	or a

; Data from F77 to F78 (2 bytes)
	jr z, $02

; Data from F79 to F7A (2 bytes)
	ld c, $08

; Data from F7B to F7B (1 bytes)
	ld l, c

; Data from F7C to F7C (1 bytes)
	ret

