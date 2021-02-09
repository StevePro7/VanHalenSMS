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