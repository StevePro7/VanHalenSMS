.BANK 10	
.ORG $0000	
	
	; Data from 28000 to 2BFFF (16384 bytes)
	;.incbin "data/File09_28000_2BFFF.dat"


; Data from 28000 to 2800F (16 bytes)	
_VanHalen1986__palette__bin:	
	.incbin "banks/bank10/VanHalen1986 (palette).bin"
	;.db $00 $00 $00 $04 $01 $05 $15 $10 $16 $1A $1A $2A $2B $3F $2F $19
	
; Data from 28010 to 28086 (119 bytes)	
_VanHalen1986__tilemap__stmcompr:
	.incbin "banks/bank10/VanHalen1986 (tilemap).stmcompr"	
	;.db $FD $00 $85 $00 $5F $01 $15 $00 $5F $1A $15 $00 $5B $33 $04 $32
	;.db $15 $00 $5F $4B $15 $00 $5B $64 $19 $00 $1F $7C $01 $84 $0B $85
	;.db $04 $84 $1B $89 $19 $00 $5B $91 $19 $00 $5B $A9 $19 $00 $5B $C1
	;.db $19 $00 $5B $D9 $19 $00 $5B $F1 $06 $19 $00 $5B $09 $06 $19 $00
	;.db $5B $21 $06 $19 $00 $5B $39 $06 $19 $00 $5F $51 $06 $15 $00 $03
	;.db $6A $06 $04 $00 $53 $6C $06 $19 $00 $57 $82 $06 $1D $00 $33 $99
	;.db $06 $04 $00 $04 $84 $0B $A7 $06 $01 $00 $04 $AB $06 $25 $00 $17
	;.db $AC $02 $FD $00 $3D $00 $00
	
; Data from 28087 to 2BFFF (16249 bytes)	
_VanHalen1986__tiles__psgcompr:	
	.incbin "banks/bank10/VanHalen1986 (tiles).psgcompr"
	;.incbin ...
    
.BANK 11	
.ORG $0000	
	
	; Data from 2C000 to 2FFFF (16384 bytes)
	;.incbin "data/File10_2C000_2FFFF.dat"


; Data from 2C000 to 2C00F (16 bytes)	
_VanHalen1988__palette__bin:	
	.incbin "banks/bank11/VanHalen1988 (palette).bin"
	;.db $00 $00 $00 $00 $15 $15 $15 $15 $2A $2A $2A $3F $3F $3F $3F $2A
	
; Data from 2C010 to 2C066 (87 bytes)	
_VanHalen1988__tilemap__stmcompr:
	.incbin "banks/bank11/VanHalen1988 (tilemap).stmcompr"	
	;.db $FD $00 $85 $00 $53 $01 $21 $00 $53 $17 $21 $00 $57 $2D $1D $00
	;.db $5B $44 $19 $00 $5B $5C $19 $00 $5B $74 $19 $00 $5B $8C $19 $00
	;.db $5B $A4 $19 $00 $5B $BC $19 $00 $5B $D4 $19 $00 $5B $EC $06 $19
	;.db $00 $5B $04 $06 $19 $00 $5B $1C $06 $19 $00 $5B $34 $06 $19 $00
	;.db $5B $4C $06 $19 $00 $5B $64 $06 $19 $00 $57 $7C $06 $1D $00 $57
	;.db $93 $02 $FD $00 $89 $00 $00
	
; Data from 2C067 to 2FFFF (16281 bytes)	
_VanHalen1988__tiles__psgcompr:	
	.incbin "banks/bank11/VanHalen1988 (tiles).psgcompr"
	;.incbin ...
    
    
.BANK 12	
.ORG $0000	
	
	; Data from 30000 to 33FFF (16384 bytes)
	;.incbin "data/File11_30000_33FFF.dat"

; Data from 30000 to 3000F (16 bytes)	
_VanHalen1991__palette__bin:	
	.incbin "banks/bank12/VanHalen1991 (palette).bin"
	;.db $00 $00 $01 $01 $01 $01 $01 $01 $01 $01 $15 $15 $16 $16 $2B $2A
	
; Data from 30010 to 30066 (87 bytes)	
_VanHalen1991__tilemap__stmcompr:
	.incbin "banks/bank12/VanHalen1991 (tilemap).stmcompr"	
	;.db $FD $00 $85 $00 $5B $01 $19 $00 $5B $19 $19 $00 $5B $31 $19 $00
	;.db $5B $49 $19 $00 $5B $61 $19 $00 $5B $79 $19 $00 $5B $91 $19 $00
	;.db $5B $A9 $19 $00 $5B $C1 $19 $00 $5B $D9 $15 $00 $5F $F1 $06 $19
	;.db $00 $5B $0A $06 $19 $00 $5B $22 $06 $19 $00 $5B $3A $06 $19 $00
	;.db $5B $52 $06 $19 $00 $5B $6A $06 $19 $00 $5B $82 $06 $19 $00 $5B
	;.db $9A $02 $FD $00 $85 $00 $00
	
; Data from 30067 to 33FFF (16281 bytes)	
_VanHalen1991__tiles__psgcompr:	
	.incbin "banks/bank12/VanHalen1991 (tiles).psgcompr"
	;.incbin ...


.BANK 13	
.ORG $0000	
	
	; Data from 34000 to 37FFF (16384 bytes)
	;.incbin "data/File12_34000_37FFF.dat"


; Data from 34000 to 3400F (16 bytes)	
_VanHalen1995__palette__bin:	
	.incbin "banks/bank13/VanHalen1995 (palette).bin"
	;.db $00 $00 $00 $01 $01 $01 $15 $15 $06 $16 $16 $1B $1B $2F $3F $2B
	
; Data from 34010 to 3409E (143 bytes)	
_VanHalen1995__tilemap__stmcompr:	
	.incbin "banks/bank13/VanHalen1995 (tilemap).stmcompr"
	;.db $FD $00 $29 $00 $04 $01 $05 $00 $08 $01 $00 $01 $02 $16 $04 $02
	;.db $31 $00 $5B $03 $19 $00 $5F $1B $15 $00 $5F $34 $11 $00 $63 $4D
	;.db $11 $00 $5F $67 $19 $00 $5B $80 $19 $00 $5B $98 $19 $00 $2F $B0
	;.db $04 $A2 $23 $BD $19 $00 $5B $C7 $15 $00 $5F $DF $15 $00 $36 $04
	;.db $33 $5B $F8 $02 $04 $33 $15 $00 $0A $5B $10 $02 $04 $4C $15 $00
	;.db $0A $5B $28 $06 $19 $00 $5F $40 $02 $11 $00 $12 $04 $33 $0A $5F
	;.db $59 $06 $11 $00 $5F $72 $02 $04 $66 $11 $00 $0A $63 $8B $06 $15
	;.db $00 $5F $A5 $06 $1D $00 $04 $BE $06 $11 $00 $07 $BF $06 $01 $00
	;.db $04 $C2 $06 $05 $00 $03 $C3 $0B $C4 $02 $FD $00 $05 $00 $00
	
; Data from 3409F to 37FFF (16225 bytes)	
_VanHalen1995__tiles__psgcompr:	
	.incbin "banks/bank13/VanHalen1995 (tiles).psgcompr"
	;.incbin ...
	


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