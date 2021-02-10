; Data from 122B to 122B (1 bytes)	
_screen_none_screen_load:	
	ret
	
; Data from 122C to 1232 (7 bytes)
_screen_none_screen_update:	
	;.db $D1
	pop de
	
	;.db $C1
	pop bc
	
	;.db $C5
	push bc
	
	;.db $D5
	push de
	
	;.db $AF
	xor a

	;.db $02
	ld (bc), a
	
	ret