.BANK 14	
.ORG $0000	
	
	; Data from 38000 to 3BFFF (16384 bytes)
	;.incbin "data/File13_38000_3BFFF.dat"


; Data from 38000 to 3800F (16 bytes)	
_VanHalen1998__palette__bin:	
	.incbin "banks/bank14/VanHalen1998 (palette).bin"
	;.db $00 $00 $00 $00 $01 $05 $15 $16 $1A $2B $2F $3F $3F $3F $2B $2A
	
; Data from 38010 to 380C6 (183 bytes)	
_VanHalen1998__tilemap__stmcompr:
	.incbin "banks/bank14/VanHalen1998 (tilemap).stmcompr"
	;.db $FD $00 $85 $00 $03 $01 $0D $00 $07 $03 $29 $00 $04 $01 $1D $00
	;.db $0B $06 $04 $00 $0F $0A $29 $00 $04 $0F $1D $00 $33 $10 $04 $00
	;.db $1F $1E $19 $00 $5B $27 $19 $00 $03 $3F $53 $40 $19 $00 $01 $40
	;.db $53 $56 $19 $00 $5B $6C $19 $00 $5B $84 $19 $00 $2B $9C $04 $00
	;.db $27 $A8 $19 $00 $1B $B3 $08 $00 $1E $03 $BB $04 $00 $27 $BD $19
	;.db $00 $37 $C8 $16 $04 $1E $01 $00 $13 $D7 $19 $00 $43 $DD $16 $04
	;.db $01 $2D $00 $5B $EF $06 $19 $00 $53 $07 $1A $04 $06 $02 $1D $00
	;.db $0A $4F $1D $02 $04 $01 $16 $04 $1E $1D $00 $0A $0B $32 $06 $04
	;.db $00 $37 $36 $06 $04 $00 $04 $45 $06 $04 $00 $04 $46 $06 $19 $00
	;.db $0B $47 $06 $04 $00 $04 $4B $36 $04 $90 $2B $4C $1E $04 $06 $04
	;.db $58 $06 $25 $00 $3B $59 $2A $04 $46 $22 $04 $01 $02 $35 $00 $0E
	;.db $04 $69 $FD $00 $5D $00 $00
	
; Data from 380C7 to 3BFFF (16185 bytes)	
_VanHalen1998__tiles__psgcompr:	
	.incbin "banks/bank14/VanHalen1998 (tiles).psgcompr"
	;.incbin ...


.BANK 15	
.ORG $0000	
	
	; Data from 3C000 to 3FFFF (16384 bytes)
	;.incbin "data/File14_3C000_3FFFF.dat"
	
; Data from 3C000 to 3C00F (16 bytes)	
_VanHalen2012__palette__bin:
	.incbin "banks/bank15/VanHalen2012 (palette).bin"
	;.db $00 $00 $01 $15 $15 $1A $02 $03 $2A $2B $2A $2A $2F $2F $3F $2A
	
; Data from 3C010 to 3C079 (106 bytes)	
_VanHalen2012__tilemap__stmcompr:
	.incbin "banks/bank15/VanHalen2012 (tilemap).stmcompr"
	;.db $FD $00 $85 $00 $5B $01 $19 $00 $5B $19 $19 $00 $5B $31 $19 $00
	;.db $5B $49 $19 $00 $5B $61 $19 $00 $5B $79 $19 $00 $5B $91 $19 $00
	;.db $5B $A9 $19 $00 $5B $C1 $19 $00 $5B $D9 $19 $00 $07 $F1 $04 $00
	;.db $4B $F4 $06 $19 $00 $5B $08 $06 $19 $00 $5B $20 $06 $19 $00 $5B
	;.db $38 $06 $19 $00 $5B $50 $06 $19 $00 $5B $68 $06 $19 $00 $5B $80
	;.db $06 $15 $00 $5F $98 $06 $19 $00 $1F $B1 $02 $29 $00 $1E $04 $B7
	;.db $04 $00 $0E $04 $BA $FD $00 $05 $00 $00
	
; Data from 3C07A to 3FFFF (16262 bytes)	
_VanHalen2012__tiles__psgcompr:	
	.incbin "banks/bank15/VanHalen2012 (tiles).psgcompr"
	;.incbin ...