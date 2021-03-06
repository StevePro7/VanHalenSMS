; Data from 141F to 1421 (3 bytes)
_screen_scroll_screen_load:
	;.db $21 $62 $C0
	ld hl, $C062

; Data from 1422 to 1423 (2 bytes)
	;.db $36 $00
	ld (hl), $00

; Data from 1424 to 1424 (1 bytes)
	ret

; Data from 1425 to 1425 (1 bytes)
_screen_scroll_screen_update:
	dec sp

; Data from 1426 to 1428 (3 bytes)
	;.db $3A $62 $C0
	ld a, ($C062)

; Data from 1429 to 142A (2 bytes)
	;.db $D6 $20
	sub a, $20

; Data from 142B to 142C (2 bytes)
	;.db $20 $04
	jr nz, $04

; Data from 142D to 142E (2 bytes)
	;.db $3E $01
	ld a, $01

; Data from 142F to 1430 (2 bytes)
	;.db $18 $01
	jr $01

; Data from 1431 to 1431 (1 bytes)
	xor a

; Data from 1432 to 1432 (1 bytes)
	inc sp

; Data from 1433 to 1433 (1 bytes)
	push af

; Data from 1434 to 1434 (1 bytes)
	inc sp

; Data from 1435 to 1438 (4 bytes)
	;.db $FD $21 $62 $C0
	ld iy, $C062

; Data from 1439 to 143B (3 bytes)
	;.db $FD $46 $00
	ld b, (iy + $00)

; Data from 143C to 143E (3 bytes)
	;.db $FD $34 $00
	inc (iy + $00)

; Data from 143F to 143F (1 bytes)
	push bc

; Data from 1440 to 1440 (1 bytes)
	inc sp

; Data from 1441 to 1443 (3 bytes)
	;.db $CD $46 $08
	call _devkit_SMS_setBGScrollY

; Data from 1444 to 1444 (1 bytes)
	inc sp

; Data from 1445 to 1446 (2 bytes)
	;.db $3E $10
	ld a, $10		; input_type_fire1	16

; Data from 1447 to 1447 (1 bytes)
	push af

; Data from 1448 to 1448 (1 bytes)
	inc sp

; Data from 1449 to 144B (3 bytes)
	;.db $CD $D3 $0E
	call _engine_input_manager_hold

; Data from 144C to 144C (1 bytes)
	inc sp

; Data from 144D to 144D (1 bytes)
	;.db $4D
	ld c, l

; Data from 144E to 1450 (3 bytes)
	;.db $21 $03 $00
	ld hl, $0003

; Data from 1451 to 1451 (1 bytes)
	;.db $39
	add hl, sp

; Data from 1452 to 1452 (1 bytes)
	;.db $7E
	ld a, (hl)

; Data from 1453 to 1453 (1 bytes)
	;.db $23
	inc hl

; Data from 1454 to 1454 (1 bytes)
	;.db $66
	ld h, (hl)

; Data from 1455 to 1455 (1 bytes)
	;.db $6F
	ld l, a

; Data from 1456 to 1456 (1 bytes)
	;.db $79
	ld a, c

; Data from 1457 to 1457 (1 bytes)
	or a

; Data from 1458 to 1459 (2 bytes)
	;.db $20 $0C
	jr nz, $0C

; Data from 145A to 145D (4 bytes)
	;.db $FD $21 $00 $00
	ld iy, $0000

; Data from 145E to 145F (2 bytes)
	;.db $FD $39
	add iy, sp

; Data from 1460 to 1462 (3 bytes)
	;.db $FD $7E $00
	ld a, (iy + $00)

; Data from 1463 to 1463 (1 bytes)
	or a

; Data from 1464 to 1465 (2 bytes)
	jr z, $16
	
; Data from 1466 to 1466 (1 bytes)
	push hl

; Data from 1467 to 1468 (2 bytes)
	ld a, $04		; TOP_OFFSET	4

; Data from 1469 to 1469 (1 bytes)
	push af

; Data from 146A to 146A (1 bytes)
	inc sp

; Data from 146B to 146D (3 bytes)
	;.db $CD $CA $10
	call _engine_scroll_manager_load

; Data from 146E to 146E (1 bytes)
	inc sp

; Data from 146F to 1470 (2 bytes)
	;.db $3E $20
	ld a, $20		; TOP_SCROLL	32

; Data from 1471 to 1471 (1 bytes)
	push af

; Data from 1472 to 1472 (1 bytes)
	inc sp

; Data from 1473 to 1475 (3 bytes)
	;.db $CD $46 $08
	call _devkit_SMS_setBGScrollY

; Data from 1476 to 1476 (1 bytes)
	inc sp

; Data from 1477 to 1477 (1 bytes)
	pop hl

; Data from 1478 to 1479 (2 bytes)
	;.db $36 $04
	ld (hl), $04		; screen_type_select	4

; Data from 147A to 147B (2 bytes)
	;.db $18 $02
	jr $02

; Data from 147C to 147D (2 bytes)
	;.db $36 $03
	ld (hl), $03

; Data from 147E to 147E (1 bytes)
	inc sp

; Data from 147F to 147F (1 bytes)
	ret

