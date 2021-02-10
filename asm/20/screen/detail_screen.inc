; Data from 1605 to 1605 (1 bytes)
_screen_detail_screen_load:
	ret

; Data from 1606 to 1606 (1 bytes)
_screen_detail_screen_update:
	pop bc

; Data from 1607 to 1607 (1 bytes)
	pop hl

; Data from 1608 to 1608 (1 bytes)
	push hl

; Data from 1609 to 1609 (1 bytes)
	push bc

; Data from 160A to 160B (2 bytes)
	;.db $36 $06
	ld (hl), $06

; Data from 160C to 160C (1 bytes)
	ret
