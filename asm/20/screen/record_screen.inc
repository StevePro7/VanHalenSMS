; Data from 1578 to 157A (3 bytes)
_screen_record_screen_load:
	;.db $CD $BB $10
	call _engine_scroll_manager_reset

; Data from 157B to 157D (3 bytes)
	;.db $C3 $F9 $15
	jp load_record

; Data from 157E to 157F (2 bytes)
_screen_record_screen_update:
	push ix

; Data from 1580 to 1583 (4 bytes)
	;.db $DD $21 $00 $00
	ld ix, $0000

; Data from 1584 to 1585 (2 bytes)
	add ix, sp

; Data from 1586 to 1587 (2 bytes)
	;.db $3E $04
	ld a, $04			; input_type_left

; Data from 1588 to 1588 (1 bytes)
	push af

; Data from 1589 to 1589 (1 bytes)
	inc sp

; Data from 158A to 158C (3 bytes)
	;.db $CD $D3 $0E
	call _engine_input_manager_hold

; Data from 158D to 158D (1 bytes)
	inc sp

; Data from 158E to 158E (1 bytes)
	ld a, l

; Data from 158F to 158F (1 bytes)
	or a

; Data from 1590 to 1591 (2 bytes)
	;.db $28 $06
	jr z, $06

; Data from 1592 to 1594 (3 bytes)
	;.db $CD $E1 $0F
	call _engine_record_manager_decrement

; Data from 1595 to 1597 (3 bytes)
	;.db $CD $F9 $15
	call load_record

; Data from 1598 to 1599 (2 bytes)
	;.db $3E $08
	ld a, $08			; input_type_right

; Data from 159A to 159A (1 bytes)
	push af

; Data from 159B to 159B (1 bytes)
	inc sp

; Data from 159C to 159E (3 bytes)
	;.db $CD $D3 $0E
	call _engine_input_manager_hold

; Data from 159F to 159F (1 bytes)
	inc sp

; Data from 15A0 to 15A0 (1 bytes)
	ld a, l

; Data from 15A1 to 15A1 (1 bytes)
	or a

; Data from 15A2 to 15A3 (2 bytes)
	;.db $28 $06
	jr z, $06

; Data from 15A4 to 15A6 (3 bytes)
	;.db $CD $F0 $0F
	call _engine_record_manager_increment

; Data from 15A7 to 15A9 (3 bytes)
	;.db $CD $F9 $15
	call load_record

; Data from 15AA to 15AB (2 bytes)
	;.db $3E $10
	ld a, $10		; input_type_fire2

; Data from 15AC to 15AC (1 bytes)
	push af

; Data from 15AD to 15AD (1 bytes)
	inc sp

; Data from 15AE to 15B0 (3 bytes)
	;.db $CD $D3 $0E
	call _engine_input_manager_hold

; Data from 15B1 to 15B1 (1 bytes)
	inc sp

; Data from 15B2 to 15B2 (1 bytes)
	;.db $4D
	ld c, l

; Data from 15B3 to 15B3 (1 bytes)
	push bc

; Data from 15B4 to 15B5 (2 bytes)
	;.db $3E $20
	ld a, $20		; input_type_fire2

; Data from 15B6 to 15B6 (1 bytes)
	push af

; Data from 15B7 to 15B7 (1 bytes)
	inc sp

; Data from 15B8 to 15BA (3 bytes)
	;.db $CD $D3 $0E
	call _engine_input_manager_hold

; Data from 15BB to 15BB (1 bytes)
	inc sp

; Data from 15BC to 15BC (1 bytes)
	pop bc

; Data from 15BD to 15BF (3 bytes)
	;.db $DD $5E $04
	ld e, (ix + $04)
	
; Data from 15C0 to 15C2 (3 bytes)
	;.db $DD $56 $05
	ld d, (ix + $05)

; Data from 15C3 to 15C3 (1 bytes)
	ld a, c

; Data from 15C4 to 15C4 (1 bytes)
	or a

; Data from 15C5 to 15C6 (2 bytes)
	;.db $20 $03
	jr nz, $03

; Data from 15C7 to 15C7 (1 bytes)
	or l

; Data from 15C8 to 15C9 (2 bytes)
	;.db $28 $29
	jr z, $29

; Data from 15CA to 15CA (1 bytes)
	push de

; Data from 15CB to 15CB (1 bytes)
	xor a

; Data from 15CC to 15CC (1 bytes)
	push af

; Data from 15CD to 15CD (1 bytes)
	inc sp

; Data from 15CE to 15D0 (3 bytes)
	;.db $CD $46 $08
	call _devkit_SMS_setBGScrollY

; Data from 15D1 to 15D1 (1 bytes)
	inc sp

; Data from 15D2 to 15D2 (1 bytes)
	pop de

; Data from 15D3 to 15D5 (3 bytes)
	;.db $21 $2A $C0
	ld hl, $C02A		; ro->record_album_index

; Data from 15D6 to 15D6 (1 bytes)
	ld b, (hl)

; Data from 15D7 to 15D7 (1 bytes)
	push de

; Data from 15D8 to 15D8 (1 bytes)
	push bc

; Data from 15D9 to 15D9 (1 bytes)
	inc sp

; Data from 15DA to 15DC (3 bytes)
	;.db $CD $7D $0F
	call _engine_record_manager_init

; Data from 15DD to 15DD (1 bytes)
	inc sp

; Data from 15DE to 15DE (1 bytes)
	pop de

; Data from 15DF to 15E1 (3 bytes)
	;.db $21 $2A $C0
	ld hl, $C02A		; ro->record_album_index

; Data from 15E2 to 15E2 (1 bytes)
	ld b, (hl)

; Data from 15E3 to 15E3 (1 bytes)
	push de

; Data from 15E4 to 15E4 (1 bytes)
	push bc

; Data from 15E5 to 15E5 (1 bytes)
	inc sp

; Data from 15E6 to 15E8 (3 bytes)
	;.db $CD $67 $0B
	call _engine_cursor_manager_init

; Data from 15E9 to 15E9 (1 bytes)
	inc sp

; Data from 15EA to 15EC (3 bytes)
	;.db $CD $1A $11
	call _engine_storage_manager_write

; Data from 15ED to 15ED (1 bytes)
	pop de

; Data from 15EE to 15EF (2 bytes)
	;.db $3E $04
	ld a, $04

; Data from 15F0 to 15F0 (1 bytes)
	;ld (de), a
	ld (de), a

; Data from 15F1 to 15F2 (2 bytes)
	;.db $18 $03
	jr $03

; Data from 15F3 to 15F4 (2 bytes)
	;.db $3E $05
	ld a, $05

; Data from 15F5 to 15F5 (1 bytes)
	ld (de), a

; Data from 15F6 to 15F7 (2 bytes)
	;.db $DD $E1
	pop ix

; Data from 15F8 to 15F8 (1 bytes)
	ret

; static void load_record()
load_record:
; Data from 15F9 to 15FB (3 bytes)
	;.db $CD $2B $08
	call _devkit_SMS_displayOff

; Data from 15FC to 15FE (3 bytes)
	;.db $CD $5A $0A
	call _engine_asm_manager_clear_VRAM

; Data from 15FF to 1601 (3 bytes)
	;.db $CD $8B $0F
	call _engine_record_manager_load

; Data from 1602 to 1604 (3 bytes)
	;.db $C3 $25 $08
	jp _devkit_SMS_displayOn