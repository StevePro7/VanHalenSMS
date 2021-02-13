; Data from F7D to F7F (3 bytes)
_engine_record_manager_init:
	;.db $21 $2A $C0
	ld hl, $C02A

; Data from F80 to F83 (4 bytes)
	;.db $FD $21 $02 $00
	ld iy, $0002

; Data from F84 to F85 (2 bytes)
	add iy, sp

; Data from F86 to F88 (3 bytes)
	;.db $FD $7E $00
	ld a, (iy + $00)

; Data from F89 to F89 (1 bytes)
	ld (hl), a

; Data from F8A to F8A (1 bytes)
	ret

; Data from F8B to F8C (2 bytes)
_engine_record_manager_load:
	push ix

; Data from F8D to F90 (4 bytes)
	;.db $DD $21 $00 $00
	ld ix, $0000

; Data from F91 to F92 (2 bytes)
	add ix, sp

; Data from F93 to F93 (1 bytes)
	dec sp

; Data from F94 to F96 (3 bytes)
	;.db $3A $2A $C0
	ld a, ($C02A)

; Data from F97 to F99 (3 bytes)
	;.db $DD $77 $FF
	ld (ix - 1), a

; Data from F9A to F9A (1 bytes)
	ld l, a

; Data from F9B to F9C (2 bytes)
	ld h, $00

; Data from F9D to F9D (1 bytes)
	add hl, hl

; Data from F9E to F9E (1 bytes)
	ld c, l

; Data from F9F to F9F (1 bytes)
	ld b, h

; Data from FA0 to FA2 (3 bytes)
	;.db $21 $6E $C1
	ld hl, $C16E

; Data from FA3 to FA3 (1 bytes)
	add hl, bc

; Data from FA4 to FA4 (1 bytes)
	ld e, (hl)

; Data from FA5 to FA5 (1 bytes)
	inc hl

; Data from FA6 to FA6 (1 bytes)
	ld d, (hl)

; Data from FA7 to FA9 (3 bytes)
	;.db $21 $86 $C1
	ld hl, $C186

; Data from FAA to FAA (1 bytes)
	add hl, bc

; Data from FAB to FAB (1 bytes)
	ld c, (hl)

; Data from FAC to FAC (1 bytes)
	inc hl

; Data from FAD to FAD (1 bytes)
	ld b, (hl)

; Data from FAE to FB0 (3 bytes)
	;.db $DD $7E $FF
	ld a, (ix - 1)

; Data from FB1 to FB2 (2 bytes)
	add a, $1F

; Data from FB3 to FB3 (1 bytes)
	ld l, a

; Data from FB4 to FB5 (2 bytes)
	ld a, $00

; Data from FB6 to FB7 (2 bytes)
	adc a, $12

; Data from FB8 to FB8 (1 bytes)
	ld h, a

; Data from FB9 to FB9 (1 bytes)
	ld h, (hl)

; Data from FBA to FBA (1 bytes)
	push bc

; Data from FBB to FBB (1 bytes)
	push de

; Data from FBC to FBC (1 bytes)
	push hl

; Data from FBD to FBD (1 bytes)
	inc sp

; Data from FBE to FC0 (3 bytes)
	;.db $CD $31 $08
	call _devkit_SMS_mapROMBank

; Data from FC1 to FC1 (1 bytes)
	inc sp

; Data from FC2 to FC2 (1 bytes)
	pop de

; Data from FC3 to FC5 (3 bytes)
	;.db $21 $00 $00
	ld hl, $0000

; Data from FC6 to FC6 (1 bytes)
	push hl

; Data from FC7 to FC7 (1 bytes)
	push de

; Data from FC8 to FCA (3 bytes)
	;.db $CD $8E $08
	;call $088E
	call _devkit_SMS_loadPSGaidencompress

; Data from FCB to FCB (1 bytes)
	pop af

; Data from FCC to FCE (3 bytes)
	;.db $21 $00 $00
	ld hl, $0000

; Data from FCF to FCF (1 bytes)
	ex (sp), hl

; Data from FD0 to FD2 (3 bytes)
	;.db $CD $A4 $08
	;call $08A4
	call _devkit_SMS_loadSTMcompressedTil

; Data from FD3 to FD3 (1 bytes)
	pop af

; Data from FD4 to FD4 (1 bytes)
	pop af

; Data from FD5 to FD7 (3 bytes)
	;.db $2A $9E $C1
	ld hl, ($C19E)

; Data from FD8 to FD8 (1 bytes)
	push hl

; Data from FD9 to FDB (3 bytes)
	;.db $CD $C5 $08
	;call $08C5
	call _devkit_SMS_loadBGPalette

; Data from FDC to FDC (1 bytes)
	pop af

; Data from FDD to FDD (1 bytes)
	inc sp

; Data from FDE to FDF (2 bytes)
	;.db $DD $E1
	pop ix

; Data from FE0 to FE0 (1 bytes)
	ret

; Data from FE1 to FE3 (3 bytes)
_engine_record_manager_decrement:
	;.db $01 $2A $C0
	ld bc, $C02A

; Data from FE4 to FE4 (1 bytes)
	;ld a, (bc)
	ld a, (bc)

; Data from FE5 to FE5 (1 bytes)
	or a

; Data from FE6 to FE7 (2 bytes)
	jr nz, $04

; Data from FE8 to FE9 (2 bytes)
	ld a, $0B

; Data from FEA to FEA (1 bytes)
	ld (bc), a

; Data from FEB to FEB (1 bytes)
	ret

; Data from FEC to FED (2 bytes)
	add a, $FF

; Data from FEE to FEE (1 bytes)
	ld (bc), a

; Data from FEF to FEF (1 bytes)
	ret

; Data from FF0 to FF2 (3 bytes)
_engine_record_manager_increment:
	;.db $01 $2A $C0
	ld bc, $C02A

; Data from FF3 to FF3 (1 bytes)
	ld a, (bc)

; Data from FF4 to FF5 (2 bytes)
	cp $0B

; Data from FF6 to FF7 (2 bytes)
	jr nz, $03

; Data from FF8 to FF8 (1 bytes)
	xor a

; Data from FF9 to FF9 (1 bytes)
	ld (bc), a

; Data from FFA to FFA (1 bytes)
	ret

; Data from FFB to FFB (1 bytes)
	inc a

; Data from FFC to FFC (1 bytes)
	ld (bc), a

; Data from FFD to FFD (1 bytes)
	ret
