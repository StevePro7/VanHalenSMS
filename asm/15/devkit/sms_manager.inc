_UNSAFE_SMS_copySpritestoSAT:	
		ld hl, $7F00
		rst $08	; _LABEL_8_
		ld c, Port_VDPData
		ld hl, SpriteTableY	; SpriteTableY = $C06F
		call _OUTI64
		ld hl, $7F80
		rst $08	; _LABEL_8_
		ld c, Port_VDPData
		ld hl, SpriteTableXN	; SpriteTableXN = $C0AF
		jp _OUTI128
	
; Data from 1BBE to 1BDA (29 bytes)	
_UNSAFE_SMS_VRAMmemcpy32:	
	.db $FD $21 $02 $00 $FD $39 $FD $6E $00 $FD $7E $01 $CB $F7 $67 $CF
	.db $0E $BE $21 $04 $00 $39 $7E $23 $66 $6F $C3 $59 $01
	
; Data from 1BDB to 1BF7 (29 bytes)	
_UNSAFE_SMS_VRAMmemcpy64:	
	.db $FD $21 $02 $00 $FD $39 $FD $6E $00 $FD $7E $01 $CB $F7 $67 $CF
	.db $0E $BE $21 $04 $00 $39 $7E $23 $66 $6F $C3 $19 $01
	
; Data from 1BF8 to 1C14 (29 bytes)	
_UNSAFE_SMS_VRAMmemcpy128:	
	.db $FD $21 $02 $00 $FD $39 $FD $6E $00 $FD $7E $01 $CB $F7 $67 $CF
	.db $0E $BE $21 $04 $00 $39 $7E $23 $66 $6F $C3 $99 $00
	
_SMS_init:	
		ld hl, $0000
		push hl
		call _SMS_setSpritePaletteColor
		pop af
		ld c, $00
-:	
		ld hl, _VDPReg_init	; _VDPReg_init = $1C69
		ld b, $00
		add hl, bc
		ld b, (hl)
		di
		ld a, b
		out (Port_VDPAddress), a
		ld a, c
		set 7, a
		out (Port_VDPAddress), a
		ei
		inc c
		ld a, c
		sub $0B
		jr c, -
		call _SMS_initSprites
		call _SMS_finalizeSprites
		call _SMS_copySpritestoSAT
		call _SMS_resetPauseRequest
-:	
		in a, (Port_VCounter)
		ld b, a
		ld a, $80
		sub b
		jr c, -
-:	
		in a, (Port_VCounter)
		sub $80
		jr c, -
-:	
		in a, (Port_VCounter)
		ld c, a
		in a, (Port_VCounter)
		sub c
		jr nc, -
		ld a, c
		sub $E7
		jr c, +
		ld hl, VDPType	; VDPType = $C06A
		ld (hl), $80
		ret
	
+:	
		ld hl, VDPType	; VDPType = $C06A
		ld (hl), $40
		ret
	
; Data from 1C69 to 1C73 (11 bytes)	
_VDPReg_init:	
	.db $04 $20 $FF $FF $FF $FF $FF $00 $00 $00 $FF
	
; Data from 1C74 to 1C7B (8 bytes)	
_SMS_VDPType:	
	.db $FD $21 $6A $C0 $FD $6E $00 $C9
	
_SMS_VDPturnOnFeature:	
		ld c, l
		ld e, h
		ld d, $00
		ld hl, VDPReg	; VDPReg = $C1B6
		add hl, de
		ld a, (hl)
		or c
		ld c, a
		ld (hl), c
		di
		ld a, c
		out (Port_VDPAddress), a
		ld a, e
		set 7, a
		out (Port_VDPAddress), a
		ei
		ret
	
_SMS_VDPturnOffFeature:	
		ld a, l
		ld e, h
		cpl
		ld b, a
		ld d, $00
		ld hl, VDPReg	; VDPReg = $C1B6
		add hl, de
		ld a, (hl)
		and b
		ld c, a
		ld (hl), c
		di
		ld a, c
		out (Port_VDPAddress), a
		ld a, e
		set 7, a
		out (Port_VDPAddress), a
		ei
		ret
	
; Data from 1CAC to 1CB5 (10 bytes)	
_SMS_setBGScrollX:	
	.db $F3 $7D $D3 $BF $3E $88 $D3 $BF $FB $C9
	
_SMS_setBGScrollY:	
		di
		ld a, l
		out (Port_VDPAddress), a
		ld a, $89
		out (Port_VDPAddress), a
		ei
		ret
	
; Data from 1CC0 to 1CC9 (10 bytes)
_SMS_setBackdropColor:	
	.db $F3 $7D $D3 $BF $3E $87 $D3 $BF $FB $C9
	
_SMS_useFirstHalfTilesforSprites:	
		bit 0, l
		jr z, +
		ld c, $FB
		jr ++
	
+:	
		ld c, $FF
++:	
		di
		ld a, c
		out (Port_VDPAddress), a
		ld a, $86
		out (Port_VDPAddress), a
		ei
		ret
	
_SMS_setSpriteMode:	
		ld c, l
		bit 0, c
		jr z, +
		push bc
		ld hl, $0102
		call _SMS_VDPturnOnFeature
		pop bc
		ld hl, spritesHeight		; spritesHeight = $C1B8
		ld (hl), $10
		jr ++
	
+:	
		push bc
		ld hl, $0102
		call _SMS_VDPturnOffFeature
		pop bc
		ld hl, spritesHeight		; spritesHeight = $C1B8
		ld (hl), $08
++:	
		bit 1, c
		jr z, +
		ld hl, $0101
		call _SMS_VDPturnOnFeature
		ld hl, spritesWidth		; spritesWidth = $C1B9
		ld (hl), $10
		ld iy, spritesHeight	; spritesHeight = $C1B8
		sla (iy+0)
		ret
	
+:	
		ld hl, $0101
		call _SMS_VDPturnOffFeature
		ld hl, spritesWidth	; spritesWidth = $C1B9
		ld (hl), $08
		ret
	
; Data from 1D23 to 1D36 (20 bytes)
_SMS_setBGPaletteColor:	
	.db $21 $02 $00 $39 $4E $06 $00 $21 $00 $C0 $09 $CF $21 $03 $00 $39
	.db $7E $D3 $BE $C9
	
_SMS_setSpritePaletteColor:	
		ld hl, $0002
		add hl, sp
		ld c, (hl)
		ld b, $00
		ld hl, PSGChan1Volume		; PSGChan1Volume = $C010
		add hl, bc
		rst $08	; _LABEL_8_
		ld hl, _SMS_crt0_RST08 - 3	; _SMS_crt0_RST08 - 3 = $0003
		add hl, sp
		ld a, (hl)
		out (Port_VDPData), a
		ret
	
_SMS_loadBGPalette:	
		ld de, Lmain.main$global_pause$1$55	; Lmain.main$global_pause$1$55 = $C000
		ld c, Port_VDPAddress
		di
		out (c), e
		out (c), d
		ei
		ld b, $10
		ld c, Port_VDPData
-:	
		outi
		jr nz, -
		ret
	
_SMS_loadSpritePalette:	
		ld de, PSGChan1Volume		; PSGChan1Volume = $C010
		ld c, Port_VDPAddress
		di
		out (c), e
		out (c), d
		ei
		ld b, $10
		ld c, Port_VDPData
-:	
		outi
		jr nz, -
		ret
	
; Data from 1D73 to 1D76 (4 bytes)	
_SMS_setColor:	
	.db $7D $D3 $BE $C9
	
_SMS_initSprites:	
		ld hl, SpriteNextFree	; SpriteNextFree = $C12F
		ld (hl), $00
		ret
	
; Data from 1D7D to 1DD1 (85 bytes)	
_SMS_addSprite:	
	.db $3A $2F $C1 $D6 $40 $30 $4B $FD $21 $03 $00 $FD $39 $FD $7E $00
	.db $D6 $D1 $28 $3E $3E $6F $21 $2F $C1 $86 $4F $3E $C0 $CE $00 $47
	.db $FD $5E $00 $1D $7B $02 $3A $2F $C1 $87 $4F $21 $AF $C0 $06 $00
	.db $09 $FD $21 $02 $00 $FD $39 $FD $7E $00 $77 $23 $FD $21 $04 $00
	.db $FD $39 $FD $7E $00 $77 $FD $21 $2F $C1 $FD $4E $00 $FD $34 $00
	.db $69 $C9 $2E $FF $C9
	
_SMS_finalizeSprites:	
		ld a, (SpriteNextFree)	; SpriteNextFree = $C12F
		sub $40
		ret nc
		ld bc, SpriteTableY	; SpriteTableY = $C06F
		ld hl, (SpriteNextFree)	; SpriteNextFree = $C12F
		ld h, $00
		add hl, bc
		ld (hl), $D0
		ret
	
_SMS_copySpritestoSAT:	
		ld hl, $7F00
		rst $08	; _LABEL_8_
		ld bc, SpriteTableY	; SpriteTableY = $C06F
		ld e, $40
-:	
		ld a, (bc)
		out (Port_VDPData), a
		inc bc
		ld d, e
		dec d
		ld a, d
		ld e, a
		or a
		jr nz, -
		ld hl, $7F80
		rst $08	; _LABEL_8_
		ld bc, SpriteTableXN	; SpriteTableXN = $C0AF
		ld e, $80
-:	
		ld a, (bc)
		out (Port_VDPData), a
		inc bc
		ld d, e
		dec d
		ld a, d
		ld e, a
		or a
		jr nz, -
		ret
	
_SMS_waitForVBlank:	
		ld hl, VDPBlank	; VDPBlank = $C067
		ld (hl), $00
-:	
		ld hl, VDPBlank	; VDPBlank = $C067
		bit 0, (hl)
		jr z, -
		ret
	
_SMS_getKeysStatus:	
		ld hl, (KeysStatus)	; KeysStatus = $C06B
		ret
	
; Data from 1E1E to 1E3A (29 bytes)	
_SMS_getKeysPressed:	
	.db $FD $21 $6D $C0 $FD $7E $00 $2F $4F $FD $7E $01 $2F $47 $FD $21
	.db $6B $C0 $FD $7E $00 $A1 $6F $FD $7E $01 $A0 $67 $C9
	
; Data from 1E3B to 1E51 (23 bytes)	
_SMS_getKeysHeld:	
	.db $3A $6B $C0 $FD $21 $6D $C0 $FD $A6 $00 $6F $3A $6C $C0 $FD $21
	.db $6D $C0 $FD $A6 $01 $67 $C9
	
; Data from 1E52 to 1E6E (29 bytes)	
_SMS_getKeysReleased:	
	.db $FD $21 $6B $C0 $FD $7E $00 $2F $4F $FD $7E $01 $2F $47 $79 $FD
	.db $21 $6D $C0 $FD $A6 $00 $6F $78 $FD $A6 $01 $67 $C9
	
_SMS_queryPauseRequested:	
		ld iy, PauseRequested	; PauseRequested = $C069
		ld l, (iy+0)
		ret
	
_SMS_resetPauseRequest:	
		ld hl, PauseRequested	; PauseRequested = $C069
		ld (hl), $00
		ret
	
; Data from 1E7D to 1E8D (17 bytes)	
_SMS_setLineInterruptHandler:	
	.db $21 $02 $00 $39 $7E $32 $30 $C1 $21 $03 $00 $39 $7E $32 $31 $C1
	.db $C9
	
; Data from 1E8E to 1E9C (15 bytes)	
_SMS_setLineCounter:	
	.db $21 $02 $00 $39 $4E $F3 $79 $D3 $BF $3E $8A $D3 $BF $FB $C9
	
; Data from 1E9D to 1EA0 (4 bytes)	
_SMS_getVCount:	
	.db $DB $7E $6F $C9
	
; Data from 1EA1 to 1EA4 (4 bytes)	
_SMS_getHCount:	
	.db $DB $7F $6F $C9
	
_SMS_isr:	
		push af
		push hl
		in a, (Port_VDPStatus)
		ld (SMS_VDPFlags), a	; SMS_VDPFlags = $C068
		rlca
		jr nc, +
		ld hl, VDPBlank	; VDPBlank = $C067
		ld (hl), $01
		ld hl, (KeysStatus)	; KeysStatus = $C06B
		ld (PreviousKeysStatus), hl	; PreviousKeysStatus = $C06D
		in a, (Port_IOPort1)
		cpl
		ld hl, KeysStatus		; KeysStatus = $C06B
		ld (hl), a
		in a, (Port_IOPort2)
		cpl
		inc hl
		ld (hl), a
		jr ++
	
+:	
		push bc
		push de
		push iy
		ld hl, (SMS_theLineInterruptHandler)		; SMS_theLineInterruptHandler = $C130
		call ___sdcc_call_hl
		pop iy
		pop de
		pop bc
++:	
		pop hl
		pop af
		ei
		reti
	
_SMS_nmi_isr:	
		push af
		push bc
		push de
		push hl
		push iy
		ld hl, PauseRequested		; PauseRequested = $C069
		ld (hl), $01
		pop iy
		pop hl
		pop de
		pop bc
		pop af
		retn
	
; Data from 1EEE to 1EF9 (12 bytes)	
__moduchar:	
	.db $21 $03 $00 $39 $5E $2B $6E $CD $74 $1B $EB $C9
	
; Data from 1EFA to 1F04 (11 bytes)	
__moduint:	
	.db $F1 $E1 $D1 $D5 $E5 $F5 $CD $77 $1B $EB $C9
	
; Data from 1F05 to 20E5 (481 bytes)	
_SMS_loadSTMcompressedTileMapAre:	
	.db $DD $E5 $DD $21 $00 $00 $DD $39 $21 $F0 $FF $39 $F9 $DD $36 $FE
	.db $00 $DD $36 $FF $00 $DD $36 $F3 $00 $DD $36 $F4 $00 $DD $6E $05
	.db $26 $00 $29 $29 $29 $29 $29 $29 $DD $75 $FC $7C $F6 $78 $DD $77
	.db $FD $DD $7E $04 $DD $77 $FA $DD $36 $FB $00 $DD $CB $FA $26 $DD
	.db $CB $FB $16 $DD $7E $FC $DD $B6 $FA $5F $DD $7E $FD $DD $B6 $FB
	.db $57 $DD $7E $08 $DD $77 $FA $DD $77 $F1 $DD $36 $F0 $00 $6B $62
	.db $CF $DD $6E $06 $DD $66 $07 $7E $DD $77 $F2 $23 $DD $75 $06 $DD
	.db $74 $07 $DD $7E $06 $DD $77 $FC $DD $7E $07 $DD $77 $FD $DD $7E
	.db $F2 $E6 $02 $DD $77 $F9 $DD $7E $F2 $0F $0F $E6 $3F $DD $77 $F8
	.db $DD $CB $F2 $46 $CA $3E $20 $DD $36 $F6 $00 $DD $7E $FF $DD $77
	.db $F7 $DD $4E $FC $DD $46 $FD $03 $DD $6E $FC $DD $66 $FD $6E $DD
	.db $7E $F8 $C6 $02 $DD $77 $F5 $26 $00 $7D $DD $B6 $F6 $6F $7C $DD
	.db $B6 $F7 $67 $DD $7E $F9 $B7 $28 $3C $DD $71 $06 $DD $70 $07 $4D
	.db $44 $DD $6E $F5 $7D $B7 $CA $B7 $20 $E5 $69 $60 $DF $E1 $DD $35
	.db $F1 $DD $7E $F1 $B7 $20 $15 $7B $C6 $40 $5F $7A $CE $00 $57 $E5
	.db $C5 $6B $62 $CF $C1 $E1 $DD $7E $FA $DD $77 $F1 $3E $01 $95 $30
	.db $01 $03 $2D $18 $CF $DD $71 $06 $DD $70 $07 $DD $75 $FE $DD $74
	.db $FF $DD $46 $F5 $78 $B7 $CA $C7 $20 $DD $6E $FE $DD $66 $FF $DF
	.db $DD $35 $F1 $DD $7E $F1 $B7 $20 $0D $21 $40 $00 $19 $5D $54 $CF
	.db $DD $7E $FA $DD $77 $F1 $05 $18 $DB $DD $7E $F9 $B7 $28 $29 $DD
	.db $CB $F2 $56 $28 $10 $DD $7E $FE $DD $77 $F3 $DD $7E $FF $DD $77
	.db $F4 $DD $36 $F0 $01 $DD $4E $F2 $CB $39 $CB $39 $CB $39 $DD $71
	.db $FF $DD $36 $FE $00 $C3 $66 $1F $DD $6E $F8 $7D $B7 $28 $6D $DD
	.db $7E $FF $DD $77 $F6 $DD $36 $F7 $00 $DD $4E $FC $DD $46 $FD $DD
	.db $75 $F5 $DD $7E $F5 $B7 $28 $34 $0A $D3 $BE $03 $00 $00 $00 $DD
	.db $7E $F6 $D3 $BE $DD $35 $F1 $DD $7E $F1 $B7 $20 $10 $21 $40 $00
	.db $19 $EB $C5 $6B $62 $CF $C1 $DD $7E $FA $DD $77 $F1 $DD $35 $F5
	.db $18 $D0 $DD $71 $FE $DD $70 $FF $18 $08 $18 $06 $DD $71 $06 $DD
	.db $70 $07 $DD $CB $F0 $46 $CA $66 $1F $DD $7E $F3 $DD $77 $FE $DD
	.db $7E $F4 $DD $77 $FF $DD $36 $F0 $00 $C3 $66 $1F $DD $F9 $DD $E1
	.db $C9
	
___sdcc_call_hl:	
		jp (hl)
	
_SMS_loadPSGaidencompressedTiles:	
		ld iy, _SMS_crt0_RST08 - 2	; _SMS_crt0_RST08 - 2 = $0004
		add iy, sp
		ld l, (iy+0)
		ld h, (iy+1)
		add hl, hl
		add hl, hl
		add hl, hl
		add hl, hl
		add hl, hl
		set 6, h
		rst $08	; _LABEL_8_
		pop bc
		pop ix
		push ix
		push bc
		ld c, (ix+0)
		inc ix
		ld b, (ix+0)
		inc ix
_LABEL_210B_:	
		push bc
		ld b, $04
		ld de, decompBuffer	; decompBuffer = $C132
		ld c, (ix+0)
		inc ix
_LABEL_2116_:	
		rlc c
		jr nc, _LABEL_215D_
		rlc c
		jr c, ++
		ld a, (ix+0)
		inc ix
		ex de, hl
		ld d, a
		and $03
		add a, a
		add a, a
		add a, a
		ld e, a
		ld a, d
		ld d, $00
		ld iy, decompBuffer	; decompBuffer = $C132
		add iy, de
		ex de, hl
		cp $03
		jr c, _LABEL_2177_
		cp $10
		jr c, +
		cp $13
		jr c, ++++
		cp $20
		jr c, +
		cp $23
		jr c, +++++
		cp $40
		jr c, +
		cp $43
		jr c, ++++++
+:	
		ld h, a
		ld l, (ix+0)
		inc ix
		jr +++
	
++:	
		ld h, $00
		jr +++
	
_LABEL_215D_:	
		rlc c
		sbc a, a
		ld l, a
		ld h, $FF
+++:	
		push bc
		ld b, $08
-:	
		ld a, l
		rlc h
		jr c, +
		ld a, (ix+0)
		inc ix
+:	
		ld (de), a
		inc de
		djnz -
		pop bc
		jr ++++++++
	
_LABEL_2177_:	
		ld hl, $FF00
		jr +++++++
	
++++:	
		ld hl, $FFFF
		jr +++++++
	
+++++:	
		ld h, (ix+0)
		ld l, $00
		inc ix
		jr +++++++
	
++++++:	
		ld h, (ix+0)
		ld l, $FF
		inc ix
+++++++:	
		push bc
		ld b, $08
-:	
		ld a, (iy+0)
		inc iy
		xor l
		rlc h
		jr c, +
		ld a, (ix+0)
		inc ix
+:	
		ld (de), a
		inc de
		djnz -
		pop bc
++++++++:	
		dec b
		jp nz, _LABEL_2116_
		ld de, _SMS_crt0_RST08 + 2	; _SMS_crt0_RST08 + 2 = $0008
		ld c, e
		ld hl, decompBuffer	; decompBuffer = $C132
--:	
		ld b, $04
		push hl
-:	
		ld a, (hl)
		out (Port_VDPData), a
		add hl, de
		djnz -
		pop hl
		inc hl
		dec c
		jr nz, --
		pop bc
		dec bc
		ld a, b
		or c
		jp nz, _LABEL_210B_
		ret