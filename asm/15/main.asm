.include "bank_manager.inc"
.include "enum_manager.inc"
.include "define_manager.inc"


; This disassembly was created using Emulicious (http://www.emulicious.net)	

.BANK 0 SLOT 0	
.ORG $0000	

_LABEL_0_:	
		di
		im 1
		jp _LABEL_70_
	
	; Data from 6 to 7 (2 bytes)
_SMS_crt0_RST08:
	.db $00 $00

_LABEL_8_:	
		ld c, Port_VDPAddress
		di
		out (c), l
		out (c), h
		ei
		ret

	; Data from 11 to 37 (39 bytes)
_SMS_crt0_RST18:	
	.db $00 $00 $00 $00 $00 $00 $00 $7D $D3 $BE $7C $D6 $00 $00 $D3 $BE
	.db $C9
	.dsb 22, $00
	
_LABEL_38_:	
		jp _SMS_isr
	
	; Data from 3B to 65 (43 bytes)
	.dsb 43, $00
	
_LABEL_66_:	
		jp _SMS_nmi_isr
	
	; Data from 69 to 6F (7 bytes)
	.db $00 $00 $00 $00 $00 $00 $00
	
_LABEL_70_:	
		ld sp, $DFF0
		ld de, _RAM_FFFC_
		xor a
		ld (de), a
		ld b, $03
-:	
		inc de
		ld (de), a
		inc a
		djnz -
		xor a
		ld hl, Lmain.main$global_pause$1$55 	; Lmain.main$global_pause$1$55 = $C000
		ld (hl), a
		ld de, PSGMusicStatus	; PSGMusicStatus = $C001
		ld bc, $1FF0
		ldir
		call gsinit
		call _SMS_init
		ei
		call A$main$83
		jp _exit
	
_OUTI128:
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
_OUTI64:	
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		outi
		ret
	
	; Data from 19A to 1FF (102 bytes)
	.dsb 102, $00
	
; Data from 200 to 203 (4 bytes)	
__clock:	
	.db $3E $02 $CF $C9
	
_exit:
		ld a, $00
		rst $08	; _LABEL_8_
-:	
		halt
		jr -
	
A$main$83:	
C$main.c$3$0$0:	
C$main.c$9$1$55:	
G$main$0$0:	
_main:
		call A$asm_manager$59
		call A$_sms_manager$132
		call A$_sms_manager$163
		call A$_sms_manager$887
		ld b, l
		push bc
		inc sp
		call A$_sms_manager$323
		inc sp
		call A$_sms_manager$343
		call A$_sms_manager$905
		push hl
		call A$_sms_manager$379
		pop af
		call A$content_manager$65
		call A$content_manager$263
		call A$scroll_manager$61
		ld a, $01
		push af
		inc sp
		call A$screen_manager$86
		inc sp
		call A$_sms_manager$145
A$main$140:
C$main.c$34$3$57:	
		call A$_sms_manager$820
		ld a, l
		or a
		jr z, A$main$174
		call A$_sms_manager$837
		ld iy, Lmain.main$global_pause$1$55	; Lmain.main$global_pause$1$55 = $C000
		ld a, (iy+0)
		xor $01
		ld (iy+0), a
		bit 0, (iy+0)
		jr z, A$main$169
		call _devkit_PSGSilenceChannels
		jr A$main$174
	
A$main$169:	
C$main.c$44$5$60:	
		call _devkit_PSGRestoreVolumes
A$main$174:	
C$main.c$48$3$57:
		ld hl, Lmain.main$global_pause$1$55	; Lmain.main$global_pause$1$55 = $C000
		bit 0, (hl)
		jr nz, A$main$140
		call A$_sms_manager$735
		call A$input_manager$65
		call A$screen_manager$202
		call A$_sms_manager$752
		call A$_sms_manager$769
		call A$_sms_manager$786
		call _devkit_PSGFrame
		call _devkit_PSGSFXFrame
		jr A$main$140
	
_PSGStop:	
		ld a, (PSGMusicStatus)		; PSGMusicStatus = $C001
		or a
		ret z
		ld a, $9F
		out (Port_PSG), a
		ld a, $BF
		out (Port_PSG), a
		ld a, (PSGChannel2SFX)		; PSGChannel2SFX = $C016
		or a
		jr nz, +
		ld a, $DF
		out (Port_PSG), a
+:	
		ld a, (PSGChannel3SFX)		; PSGChannel3SFX = $C017
		or a
		jr nz, +
		ld a, $FF
		out (Port_PSG), a
+:	
		ld hl, PSGMusicStatus		; PSGMusicStatus = $C001
		ld (hl), $00
		ret
	
; Data from 2A8 to 2F3 (76 bytes)	
_PSGResume:	
	.db $3A $01 $C0 $B7 $C0 $3A $0F $C0 $F6 $90 $D3 $7F $3A $10 $C0 $F6
	.db $B0 $D3 $7F $3A $16 $C0 $B7 $20 $17 $3A $13 $C0 $E6 $0F $F6 $C0
	.db $D3 $7F $3A $14 $C0 $E6 $3F $D3 $7F $3A $11 $C0 $F6 $D0 $D3 $7F
	.db $3A $17 $C0 $B7 $20 $10 $3A $15 $C0 $E6 $0F $F6 $E0 $D3 $7F $3A
	.db $12 $C0 $F6 $F0 $D3 $7F $21 $01 $C0 $36 $01 $C9
	
; Data from 2F4 to 320 (45 bytes)	
_PSGPlay:	
	.db $CD $81 $02 $21 $09 $C0 $36 $01 $D1 $C1 $C5 $D5 $ED $43 $02 $C0
	.db $ED $43 $04 $C0 $ED $43 $06 $C0 $21 $08 $C0 $36 $00 $21 $0C $C0
	.db $36 $00 $21 $0A $C0 $36 $9F $21 $01 $C0 $36 $01 $C9
	
; Data from 321 to 326 (6 bytes)	
_PSGCancelLoop:	
	.db $21 $09 $C0 $36 $00 $C9
	
; Data from 327 to 335 (15 bytes)	
_PSGPlayNoRepeat:	
	.db $C1 $E1 $E5 $C5 $E5 $CD $F4 $02 $F1 $21 $09 $C0 $36 $00 $C9
	
; Data from 336 to 33D (8 bytes)	
_PSGGetStatus:	
	.db $FD $21 $01 $C0 $FD $6E $00 $C9
	
_PSGSilenceChannels:	
		ld a, $9F
		out (Port_PSG), a
		ld a, $BF
		out (Port_PSG), a
		ld a, $DF
		out (Port_PSG), a
		ld a, $FF
		out (Port_PSG), a
		ret
	
_PSGRestoreVolumes:	
		push ix
		ld ix, $0000
		add ix, sp
		push af
		ld iy, PSGMusicVolumeAttenuation		; PSGMusicVolumeAttenuation = $C00B
		ld a, (iy+0)
		ld (ix-2), a
		xor a
		ld (ix-1), a
		ld c, (iy+0)
		ld a, (PSGMusicStatus)		; PSGMusicStatus = $C001
		or a
		jr z, _LABEL_3C7_
		ld a, (PSGChan0Volume)		; PSGChan0Volume = $C00F
		and $0F
		ld e, a
		ld d, $00
		pop hl
		push hl
		add hl, de
		ld a, $0F
		cp l
		ld a, $00
		sbc a, h
		jp po, +
		xor $80
+:	
		jp p, +
		ld de, _SMS_crt0_RST18 - 2	; _SMS_crt0_RST18 - 2 = $000F
		jr ++
	
+:	
		ld a, (PSGChan0Volume)		; PSGChan0Volume = $C00F
		and $0F
		add a, c
		ld e, a
		rla
		sbc a, a
++:	
		ld a, e
		or $90
		out (Port_PSG), a
		ld a, (PSGChan1Volume)		; PSGChan1Volume = $C010
		and $0F
		ld e, a
		ld d, $00
		pop hl
		push hl
		add hl, de
		ld a, $0F
		cp l
		ld a, $00
		sbc a, h
		jp po, +
		xor $80
+:	
		jp p, +
		ld de, _SMS_crt0_RST18 - 2	; _SMS_crt0_RST18 - 2 = $000F
		jr ++
	
+:	
		ld a, (PSGChan1Volume)	; PSGChan1Volume = $C010
		and $0F
		add a, c
		ld e, a
		rla
		sbc a, a
++:	
		ld a, e
		or $B0
		out (Port_PSG), a
_LABEL_3C7_:	
		ld a, (PSGChannel2SFX)		; PSGChannel2SFX = $C016
		or a
		jr z, +
		ld a, (PSGSFXChan2Volume)		; PSGSFXChan2Volume = $C018
		or $D0
		out (Port_PSG), a
		jr +++
	
+:	
		ld a, (PSGMusicStatus)		; PSGMusicStatus = $C001
		or a
		jr z, +++
		ld a, (PSGChan2Volume)		; PSGChan2Volume = $C011
		and $0F
		ld e, a
		ld d, $00
		pop hl
		push hl
		add hl, de
		ld a, $0F
		cp l
		ld a, $00
		sbc a, h
		jp po, +
		xor $80
+:	
		jp p, +
		ld de, _SMS_crt0_RST18 - 2	; _SMS_crt0_RST18 - 2 = $000F
		jr ++
	
+:	
		ld a, (PSGChan2Volume)		; PSGChan2Volume = $C011
		and $0F
		add a, c
		ld e, a
		rla
		sbc a, a
++:	
		ld a, e
		or $D0
		out (Port_PSG), a
+++:	
		ld a, (PSGChannel3SFX)		; PSGChannel3SFX = $C017
		or a
		jr z, +
		ld a, (PSGSFXChan3Volume)		; PSGSFXChan3Volume = $C019
		or $F0
		out (Port_PSG), a
		jr +++
	
+:	
		ld a, (PSGMusicStatus)		; PSGMusicStatus = $C001
		or a
		jr z, +++
		ld a, (PSGChan3Volume)		; PSGChan3Volume = $C012
		and $0F
		ld l, a
		ld h, $00
		pop de
		push de
		add hl, de
		ld a, $0F
		cp l
		ld a, $00
		sbc a, h
		jp po, +
		xor $80
+:	
		jp p, +
		ld bc, _SMS_crt0_RST18 - 2	; _SMS_crt0_RST18 - 2 = $000F
		jr ++
	
+:	
		ld a, (PSGChan3Volume)		; PSGChan3Volume = $C012
		and $0F
		add a, c
		ld c, a
		rla
		sbc a, a
++:	
		ld a, c
		or $F0
		out (Port_PSG), a
+++:	
		ld sp, ix
		pop ix
		ret
	
	; Data from 44E to 53C (239 bytes)
_PSGSetMusicVolumeAttenuation:
	.db $DD $E5 $DD $21 $00 $00 $DD $39 $F5 $DD $7E $04 $32 $0B $C0 $3A
	.db $01 $C0 $B7 $CA $38 $05 $3A $0F $C0 $E6 $0F $4F $1E $00 $FD $21
	.db $0B $C0 $FD $7E $00 $DD $77 $FE $AF $DD $77 $FF $79 $DD $86 $FE
	.db $47 $7B $DD $8E $FF $5F $FD $4E $00 $3E $0F $B8 $3E $00 $9B $E2
	.db $92 $04 $EE $80 $F2 $9A $04 $11 $0F $00 $18 $09 $3A $0F $C0 $E6
	.db $0F $81 $5F $17 $9F $7B $F6 $90 $D3 $7F $3A $10 $C0 $E6 $0F $5F
	.db $16 $00 $E1 $E5 $19 $3E $0F $BD $3E $00 $9C $E2 $BE $04 $EE $80
	.db $F2 $C6 $04 $11 $0F $00 $18 $09 $3A $10 $C0 $E6 $0F $81 $5F $17
	.db $9F $7B $F6 $B0 $D3 $7F $3A $16 $C0 $B7 $20 $2C $3A $11 $C0 $E6
	.db $0F $6F $26 $00 $D1 $D5 $19 $3E $0F $BD $3E $00 $9C $E2 $F0 $04
	.db $EE $80 $F2 $F8 $04 $11 $0F $00 $18 $09 $3A $11 $C0 $E6 $0F $81
	.db $5F $17 $9F $7B $F6 $D0 $D3 $7F $3A $17 $C0 $B7 $20 $2C $3A $12
	.db $C0 $E6 $0F $6F $26 $00 $D1 $D5 $19 $3E $0F $BD $3E $00 $9C $E2
	.db $22 $05 $EE $80 $F2 $2A $05 $01 $0F $00 $18 $09 $3A $12 $C0 $E6
	.db $0F $81 $4F $17 $9F $79 $F6 $F0 $D3 $7F $DD $F9 $DD $E1 $C9
	
_PSGSFXStop:	
		push ix
		ld ix, $0000
		add ix, sp
		push af
		ld a, (PSGSFXStatus)	; PSGSFXStatus = $C01A
		or a
		jp z, _LABEL_602_
		ld iy, PSGMusicVolumeAttenuation		; PSGMusicVolumeAttenuation = $C00B
		ld a, (iy+0)
		ld (ix-2), a
		xor a
		ld (ix-1), a
		ld c, (iy+0)
		ld a, (PSGChannel2SFX)		; PSGChannel2SFX = $C016
		or a
		jr z, _LABEL_5B1_
		ld a, (PSGMusicStatus)		; PSGMusicStatus = $C001
		or a
		jr z, _LABEL_5A8_
		ld a, (PSGChan2LowTone)		; PSGChan2LowTone = $C013
		and $0F
		or $C0
		out (Port_PSG), a
		ld a, (PSGChan2HighTone)		; PSGChan2HighTone = $C014
		and $3F
		out (Port_PSG), a
		ld a, (PSGChan2Volume)		; PSGChan2Volume = $C011
		and $0F
		ld e, a
		ld d, $00
		pop hl
		push hl
		add hl, de
		ld a, $0F
		cp l
		ld a, $00
		sbc a, h
		jp po, +
		xor $80
+:	
		jp p, +
		ld de, _SMS_crt0_RST18 - 2	; _SMS_crt0_RST18 - 2 = $000F
		jr ++
	
+:	
		ld a, (PSGChan2Volume)		; PSGChan2Volume = $C011
		and $0F
		add a, c
		ld e, a
		rla
		sbc a, a
++:	
		ld a, e
		or $D0
		out (Port_PSG), a
		jr +
	
_LABEL_5A8_:	
		ld a, $DF
		out (Port_PSG), a
+:	
		ld hl, PSGChannel2SFX		; PSGChannel2SFX = $C016
		ld (hl), $00
_LABEL_5B1_:	
		ld a, (PSGChannel3SFX)		; PSGChannel3SFX = $C017
		or a
		jr z, _LABEL_5FD_
		ld a, (PSGMusicStatus)		; PSGMusicStatus = $C001
		or a
		jr z, +++
		ld a, (PSGChan3LowTone)		; PSGChan3LowTone = $C015
		and $0F
		or $E0
		out (Port_PSG), a
		ld a, (PSGChan3Volume)		; PSGChan3Volume = $C012
		and $0F
		ld l, a
		ld h, $00
		pop de
		push de
		add hl, de
		ld a, $0F
		cp l
		ld a, $00
		sbc a, h
		jp po, +
		xor $80
+:	
		jp p, +
		ld bc, _SMS_crt0_RST18 - 2	; _SMS_crt0_RST18 - 2 = $000F
		jr ++
	
+:	
		ld a, (PSGChan3Volume)		; PSGChan3Volume = $C012
		and $0F
		add a, c
		ld c, a
		rla
		sbc a, a
++:	
		ld a, c
		or $F0
		out (Port_PSG), a
		jr ++++
	
+++:	
		ld a, $FF
		out (Port_PSG), a
++++:	
		ld hl, PSGChannel3SFX		; PSGChannel3SFX = $C017
		ld (hl), $00
_LABEL_5FD_:	
		ld hl, PSGSFXStatus			; PSGSFXStatus = $C01A
		ld (hl), $00
_LABEL_602_:	
		ld sp, ix
		pop ix
		ret
	
; Data from 607 to 653 (77 bytes)	
_PSGSFXPlay:	
	.db $CD $3D $05 $21 $22 $C0 $36 $00 $D1 $C1 $C5 $D5 $ED $43 $1B $C0
	.db $ED $43 $1D $C0 $ED $43 $1F $C0 $21 $21 $C0 $36 $00 $21 $23 $C0
	.db $36 $00 $21 $04 $00 $39 $4E $CB $41 $28 $05 $11 $01 $00 $18 $03
	.db $11 $00 $00 $21 $16 $C0 $73 $CB $49 $28 $05 $01 $01 $00 $18 $03
	.db $01 $00 $00 $21 $17 $C0 $71 $21 $1A $C0 $36 $01 $C9
	
; Data from 654 to 659 (6 bytes)	
_PSGSFXCancelLoop:	
	.db $21 $22 $C0 $36 $00 $C9
	
; Data from 65A to 661 (8 bytes)	
_PSGSFXGetStatus:	
	.db $FD $21 $1A $C0 $FD $6E $00 $C9
	
; Data from 662 to 682 (33 bytes)	
_PSGSFXPlayLoop:	
	.db $FD $21 $04 $00 $FD $39 $FD $7E $00 $F5 $33 $FD $2B $FD $2B $FD
	.db $6E $00 $FD $66 $01 $E5 $CD $07 $06 $F1 $33 $21 $22 $C0 $36 $01
	.db $C9
	
_PSGFrame:	
		ld a, (PSGMusicStatus)		; PSGMusicStatus = $C001
		or a
		ret z
		ld a, (PSGMusicSkipFrames)		; PSGMusicSkipFrames = $C008
		or a
		jp nz, _LABEL_717_
		ld hl, (PSGMusicPointer)		; PSGMusicPointer = $C004
_LABEL_692_:	
		ld b, (hl)
		inc hl
		ld a, (PSGMusicSubstringLen)		; PSGMusicSubstringLen = $C00C
		or a
		jr z, +
		dec a
		ld (PSGMusicSubstringLen), a		; PSGMusicSubstringLen = $C00C
		jr nz, +
		ld hl, (PSGMusicSubstringRetAddr)		; PSGMusicSubstringRetAddr = $C00D
+:	
		ld a, b
		cp $80
		jr c, _LABEL_71C_
		ld (PSGMusicLastLatch), a			; PSGMusicLastLatch = $C00A
		bit 4, a
		jr nz, ++
		bit 6, a
		jp z, _LABEL_743_
		bit 5, a
		jr z, +
		ld (PSGChan3LowTone), a			; PSGChan3LowTone = $C015
		ld a, (PSGChannel3SFX)			; PSGChannel3SFX = $C017
		or a
		jp nz, _LABEL_692_
		ld a, (PSGChan3LowTone)		; PSGChan3LowTone = $C015
		and $03
		cp $03
		jr nz, _LABEL_742_
		ld a, (PSGSFXStatus)		; PSGSFXStatus = $C01A
		or a
		jr z, _LABEL_742_
		ld (PSGChannel3SFX), a		; PSGChannel3SFX = $C017
		ld a, $FF
		out (Port_PSG), a
		jp _LABEL_692_
	
+:	
		ld (PSGChan2LowTone), a		; PSGChan2LowTone = $C013
		ld a, (PSGChannel2SFX)		; PSGChannel2SFX = $C016
		or a
		jr z, _LABEL_742_
		jp _LABEL_692_
	
++:	
		bit 6, a
		jr nz, ++
		bit 5, a
		jr z, +
		ld (PSGChan1Volume), a	; PSGChan1Volume = $C010
		jp _LABEL_749_
	
+:	
		ld (PSGChan0Volume), a		; PSGChan0Volume = $C00F
		jp _LABEL_749_
	
++:	
		bit 5, a
		jr z, +
		ld (PSGChan3Volume), a		; PSGChan3Volume = $C012
		ld a, (PSGChannel3SFX)		; PSGChannel3SFX = $C017
		or a
		jr z, _LABEL_748_
		jp _LABEL_692_
	
+:	
		ld (PSGChan2Volume), a		; PSGChan2Volume = $C011
		ld a, (PSGChannel2SFX)		; PSGChannel2SFX = $C016
		or a
		jr z, _LABEL_748_
		jp _LABEL_692_
	
_LABEL_717_:	
		dec a
		ld (PSGMusicSkipFrames), a		; PSGMusicSkipFrames = $C008
		ret
	
_LABEL_71C_:	
		cp $40
		jr c, +
		ld a, (PSGMusicLastLatch)		; PSGMusicLastLatch = $C00A
		jp +++
	
+:	
		cp $38
		jr z, +
		jr c, ++
		and $07
		ld (PSGMusicSkipFrames), a		; PSGMusicSkipFrames = $C008
+:	
		ld (PSGMusicPointer), hl		; PSGMusicPointer = $C004
		ret
	
++:	
		cp $08
		jr nc, _LABEL_77B_
		cp $00
		jr z, +++++
		cp $01
		jr z, ++++
		ret
	
_LABEL_742_:	
		ld a, b
_LABEL_743_:	
		out (Port_PSG), a
		jp _LABEL_692_
	
_LABEL_748_:	
		ld a, b
_LABEL_749_:	
		ld c, a
		and $0F
		ld b, a
		ld a, (PSGMusicVolumeAttenuation)		; PSGMusicVolumeAttenuation = $C00B
		add a, b
		cp $0F
		jr c, +
		ld a, $0F
+:	
		ld b, a
		ld a, c
		and $F0
		or b
		out (Port_PSG), a
		jp _LABEL_692_
	
+++:	
		bit 6, a
		jr nz, ++++++
		jp _LABEL_742_
	
++++:	
		ld (PSGMusicLoopPoint), hl		; PSGMusicLoopPoint = $C006
		jp _LABEL_692_
	
+++++:	
		ld a, (PSGLoopFlag)		; PSGLoopFlag = $C009
		or a
		jp z, _PSGStop
		ld hl, (PSGMusicLoopPoint)		; PSGMusicLoopPoint = $C006
		jp _LABEL_692_
	
_LABEL_77B_:	
		sub $04
		ld (PSGMusicSubstringLen), a		; PSGMusicSubstringLen = $C00C
		ld c, (hl)
		inc hl
		ld b, (hl)
		inc hl
		ld (PSGMusicSubstringRetAddr), hl		; PSGMusicSubstringRetAddr = $C00D
		ld hl, (PSGMusicStart)			; PSGMusicStart = $C002
		add hl, bc
		jp _LABEL_692_
	
++++++:	
		ld a, b
		ld (PSGChan2HighTone), a	; PSGChan2HighTone = $C014
		ld a, (PSGChannel2SFX)	; PSGChannel2SFX = $C016
		or a
		jr z, _LABEL_742_
		jp _LABEL_692_
	
	; Data from 79B to 79B (1 bytes)
	.db $C9
	
_PSGSFXFrame:	
		ld a, (PSGSFXStatus)		; PSGSFXStatus = $C01A
		or a
		ret z
		ld a, (PSGSFXSkipFrames)		; PSGSFXSkipFrames = $C021
		or a
		jp nz, +++
		ld hl, (PSGSFXPointer)		; PSGSFXPointer = $C01D
_LABEL_7AB_:	
		ld b, (hl)
		inc hl
		ld a, (PSGSFXSubstringLen)		; PSGSFXSubstringLen = $C023
		or a
		jr z, +
		dec a
		ld (PSGSFXSubstringLen), a		; PSGSFXSubstringLen = $C023
		jr nz, +
		ld hl, (PSGSFXSubstringRetAddr)		; PSGSFXSubstringRetAddr = $C024
+:	
		ld a, b
		cp $40
		jp c, ++++
		bit 4, a
		jr z, ++
		bit 5, a
		jr nz, +
		ld (PSGSFXChan2Volume), a		; PSGSFXChan2Volume = $C018
		jr ++
	
+:	
		ld (PSGSFXChan3Volume), a		; PSGSFXChan3Volume = $C019
++:	
		out (Port_PSG), a
		jp _LABEL_7AB_
	
+++:	
		dec a
		ld (PSGSFXSkipFrames), a		; PSGSFXSkipFrames = $C021
		ret
	
++++:	
		cp $38
		jr z, +
		jr c, ++
		and $07
		ld (PSGSFXSkipFrames), a		; PSGSFXSkipFrames = $C021
+:	
		ld (PSGSFXPointer), hl		; PSGSFXPointer = $C01D
		ret
	
++:	
		cp $08
		jr nc, +++
		cp $00
		jr z, ++
		cp $01
		jr z, +
		ret
	
+:	
		ld (PSGSFXLoopPoint), hl		; PSGSFXLoopPoint = $C01F
		jp _LABEL_7AB_
	
++:	
		ld a, (PSGSFXLoopFlag)		; PSGSFXLoopFlag = $C022
		or a
		jp z, _PSGSFXStop
		ld hl, (PSGSFXLoopPoint)		; PSGSFXLoopPoint = $C01F
		ld (PSGSFXPointer), hl		; PSGSFXPointer = $C01D
		jp _LABEL_7AB_
	
+++:	
		sub $04
		ld (PSGSFXSubstringLen), a		; PSGSFXSubstringLen = $C023
		ld c, (hl)
		inc hl
		ld b, (hl)
		inc hl
		ld (PSGSFXSubstringRetAddr), hl		; PSGSFXSubstringRetAddr = $C024
		ld hl, (PSGSFXStart)		; PSGSFXStart = $C01B
		add hl, bc
		jp _LABEL_7AB_
	
	; Data from 821 to 821 (1 bytes)
	.db $C9
	
A$_sms_manager$132:	
C$_sms_manager.c$11$0$0:	
C$_sms_manager.c$13$1$74:	
C$_sms_manager.c$14$1$74:	
G$devkit_SMS_init$0$0:	
XG$devkit_SMS_init$0$0:	
_devkit_SMS_init:	
		jp _SMS_init
	
A$_sms_manager$145:	
C$_sms_manager.c$15$1$74:	
C$_sms_manager.c$17$1$75:	
G$devkit_SMS_displayOn$0$0:	
_devkit_SMS_displayOn:	
		ld hl, $0140
		jp _SMS_VDPturnOnFeature
	
A$_sms_manager$163:	
C$_sms_manager.c$19$1$75:	
C$_sms_manager.c$21$1$76:	
G$devkit_SMS_displayOff$0$0:	
_devkit_SMS_displayOff:	
		ld hl, $0140
		jp _SMS_VDPturnOffFeature
	
; Data from 831 to 833 (3 bytes)	
A$_sms_manager$181:	
C$_sms_manager.c$23$1$76:	
C$_sms_manager.c$25$1$78:	
G$devkit_SMS_mapROMBank$0$0:	
_devkit_SMS_mapROMBank:	
	.db $21 $02 $00
	
; Data from 834 to 834 (1 bytes)	
A$_sms_manager$182:	
	.db $39
	
; Data from 835 to 835 (1 bytes)	
A$_sms_manager$183:	
	.db $7E
	
; Data from 836 to 838 (3 bytes)	
A$_sms_manager$184:	
	.db $32 $FF $FF
	
; Data from 839 to 839 (1 bytes)	
A$_sms_manager$189:	
C$_sms_manager.c$26$1$78:	
XG$devkit_SMS_mapROMBank$0$0:	
	.db $C9
	
; Data from 83A to 83D (4 bytes)	
A$_sms_manager$202:	
C$_sms_manager.c$28$1$78:	
C$_sms_manager.c$30$1$80:	
G$devkit_SMS_setBGScrollX$0$0:	
_devkit_SMS_setBGScrollX:	
	.db $FD $21 $02 $00
	
; Data from 83E to 83F (2 bytes)	
A$_sms_manager$203:	
	.db $FD $39
	
; Data from 840 to 842 (3 bytes)	
A$_sms_manager$204:	
	.db $FD $6E $00
	
; Data from 843 to 845 (3 bytes)	
A$_sms_manager$209:	
C$_sms_manager.c$31$1$80:	
XG$devkit_SMS_setBGScrollX$0$0:	
	.db $C3 $AC $1C
	
A$_sms_manager$222:
C$_sms_manager.c$32$1$80:	
C$_sms_manager.c$34$1$82:	
G$devkit_SMS_setBGScrollY$0$0:	
_devkit_SMS_setBGScrollY:
		ld iy, $0002
		add iy, sp
		ld l, (iy+0)
		jp _SMS_setBGScrollY
	
; Data from 852 to 854 (3 bytes)	
A$_sms_manager$242:	
C$_sms_manager.c$37$1$82:	
C$_sms_manager.c$39$1$83:	
G$devkit_SMS_enableSRAM$0$0:	
_devkit_SMS_enableSRAM:	
	.db $21 $FC $FF
	
; Data from 855 to 856 (2 bytes)	
A$_sms_manager$243:	
	.db $36 $08
	
; Data from 857 to 857 (1 bytes)	
A$_sms_manager$248:	
C$_sms_manager.c$40$1$83:	
XG$devkit_SMS_enableSRAM$0$0:	
	.db $C9
	
; Data from 858 to 85A (3 bytes)	
A$_sms_manager$261:	
C$_sms_manager.c$41$1$83:	
C$_sms_manager.c$43$1$85:	
G$devkit_SMS_enableSRAMBank$0$0:	
_devkit_SMS_enableSRAMBank:	
	.db $21 $02 $00
	
; Data from 85B to 85B (1 bytes)	
A$_sms_manager$262:	
	.db $39
	
; Data from 85C to 85C (1 bytes)	
A$_sms_manager$263:	
	.db $7E
	
; Data from 85D to 85D (1 bytes)	
A$_sms_manager$264:	
	.db $87
	
; Data from 85E to 85E (1 bytes)	
A$_sms_manager$265:	
	.db $87
	
; Data from 85F to 860 (2 bytes)	
A$_sms_manager$266:	
	.db $CB $DF
	
; Data from 861 to 862 (2 bytes)	
A$_sms_manager$267:	
	.db $E6 $0C
	
; Data from 863 to 865 (3 bytes)	
A$_sms_manager$268:	
	.db $32 $FC $FF
	
; Data from 866 to 866 (1 bytes)	
A$_sms_manager$273:	
C$_sms_manager.c$44$1$85:	
XG$devkit_SMS_enableSRAMBank$0$0:	
	.db $C9
	
; Data from 867 to 869 (3 bytes)	
A$_sms_manager$286:	
C$_sms_manager.c$45$1$85:	
C$_sms_manager.c$47$1$86:	
G$devkit_SMS_disableSRAM$0$0:	
_devkit_SMS_disableSRAM:	
	.db $21 $FC $FF
	
; Data from 86A to 86B (2 bytes)	
A$_sms_manager$287:	
	.db $36 $00
	
; Data from 86C to 86C (1 bytes)	
A$_sms_manager$292:	
C$_sms_manager.c$48$1$86:	
XG$devkit_SMS_disableSRAM$0$0:	
	.db $C9
	
; Data from 86D to 86F (3 bytes)	
A$_sms_manager$305:	
C$_sms_manager.c$49$1$86:	
C$_sms_manager.c$51$1$87:	
G$devkit_SMS_SRAM$0$0:	
_devkit_SMS_SRAM:	
	.db $21 $00 $80
	
; Data from 870 to 870 (1 bytes)	
A$_sms_manager$310:	
C$_sms_manager.c$52$1$87:	
XG$devkit_SMS_SRAM$0$0:	
	.db $C9
	
A$_sms_manager$323:	
C$_sms_manager.c$55$1$87:	
C$_sms_manager.c$57$1$89:	
G$devkit_SMS_setSpriteMode$0$0:	
_devkit_SMS_setSpriteMode:
		ld iy, $0002
		add iy, sp
		ld l, (iy+0)
		jp _SMS_setSpriteMode
	
A$_sms_manager$343:	
C$_sms_manager.c$59$1$89:	
C$_sms_manager.c$61$1$90:	
G$devkit_SMS_useFirstHalfTilesfo:	
_devkit_SMS_useFirstHalfTilesfor:
		ld l, $00
		jp _SMS_useFirstHalfTilesforSprites
	
; Data from 882 to 883 (2 bytes)	
A$_sms_manager$361:	
C$_sms_manager.c$63$1$90:	
C$_sms_manager.c$65$1$91:	
H$devkit_SMS_useFirstHalfTilesfo:	
_eevkit_SMS_useFirstHalfTilesfor:	
	.db $2E $01
	
; Data from 884 to 886 (3 bytes)	
A$_sms_manager$366:	
C$_sms_manager.c$66$1$91:	
XG$devkit_SMS_useFirstHalfTilesf:	
	.db $C3 $CA $1C
	
A$_sms_manager$379:	
C$_sms_manager.c$67$1$91:	
C$_sms_manager.c$69$1$93:	
G$devkit_SMS_VDPturnOnFeature$0$:	
_devkit_SMS_VDPturnOnFeature:
		pop bc
		pop hl
		push hl
		push bc
		jp _SMS_VDPturnOnFeature
	
A$_sms_manager$400:	
C$_sms_manager.c$72$1$93:	
C$_sms_manager.c$74$1$95:	
G$devkit_SMS_loadPSGaidencompres:	
_devkit_SMS_loadPSGaidencompress:
		ld hl, _SMS_crt0_RST08 - 2	; _SMS_crt0_RST08 - 2 = $0004
		add hl, sp
		ld c, (hl)
		inc hl
		ld b, (hl)
		push bc
		ld hl, _SMS_crt0_RST08 - 2	; _SMS_crt0_RST08 - 2 = $0004
		add hl, sp
		ld c, (hl)
		inc hl
		ld b, (hl)
		push bc
		call _SMS_loadPSGaidencompressedTiles
		pop af
		pop af
		ret
	
; Data from 8A4 to 8A5 (2 bytes)	
A$_sms_manager$432:	
C$_sms_manager.c$76$1$95:	
C$_sms_manager.c$78$1$97:	
G$devkit_SMS_loadSTMcompressedTi:	
_devkit_SMS_loadSTMcompressedTil:	
	.db $3E $20
	
; Data from 8A6 to 8A6 (1 bytes)	
A$_sms_manager$433:	
	.db $F5
	
; Data from 8A7 to 8A7 (1 bytes)	
A$_sms_manager$434:	
	.db $33
	
; Data from 8A8 to 8AA (3 bytes)	
A$_sms_manager$435:	
	.db $21 $05 $00
	
; Data from 8AB to 8AB (1 bytes)	
A$_sms_manager$436:	
	.db $39
	
; Data from 8AC to 8AC (1 bytes)	
A$_sms_manager$437:	
	.db $4E
	
; Data from 8AD to 8AD (1 bytes)	
A$_sms_manager$438:	
	.db $23
	
; Data from 8AE to 8AE (1 bytes)	
A$_sms_manager$439:	
	.db $46
	
; Data from 8AF to 8AF (1 bytes)	
A$_sms_manager$440:	
	.db $C5
	
; Data from 8B0 to 8B2 (3 bytes)	
A$_sms_manager$441:	
	.db $21 $06 $00
	
; Data from 8B3 to 8B3 (1 bytes)	
A$_sms_manager$442:	
	.db $39
	
; Data from 8B4 to 8B4 (1 bytes)	
A$_sms_manager$443:	
	.db $7E
	
; Data from 8B5 to 8B5 (1 bytes)	
A$_sms_manager$444:	
	.db $F5
	
; Data from 8B6 to 8B6 (1 bytes)	
A$_sms_manager$445:	
	.db $33
	
; Data from 8B7 to 8B9 (3 bytes)	
A$_sms_manager$446:	
	.db $21 $06 $00
	
; Data from 8BA to 8BA (1 bytes)	
A$_sms_manager$447:	
	.db $39
	
; Data from 8BB to 8BB (1 bytes)	
A$_sms_manager$448:	
	.db $7E
	
; Data from 8BC to 8BC (1 bytes)	
A$_sms_manager$449:	
	.db $F5
	
; Data from 8BD to 8BD (1 bytes)	
A$_sms_manager$450:	
	.db $33
	
; Data from 8BE to 8C0 (3 bytes)	
A$_sms_manager$451:	
	.db $CD $05 $1F
	
; Data from 8C1 to 8C1 (1 bytes)	
A$_sms_manager$452:	
	.db $F1
	
; Data from 8C2 to 8C2 (1 bytes)	
A$_sms_manager$453:	
	.db $F1
	
; Data from 8C3 to 8C3 (1 bytes)	
A$_sms_manager$454:	
	.db $33
	
; Data from 8C4 to 8C4 (1 bytes)	
A$_sms_manager$459:	
C$_sms_manager.c$79$1$97:	
XG$devkit_SMS_loadSTMcompressedT:	
	.db $C9
	
A$_sms_manager$472:	
C$_sms_manager.c$81$1$97:	
C$_sms_manager.c$83$1$99:	
G$devkit_SMS_loadBGPalette$0$0:	
_devkit_SMS_loadBGPalette:	
		pop bc
		pop hl
		push hl
		push bc
		jp _SMS_loadBGPalette
	
A$_sms_manager$493:	
C$_sms_manager.c$85$1$99:	
C$_sms_manager.c$87$1$101:	
G$devkit_SMS_loadSpritePalette$0:	
_devkit_SMS_loadSpritePalette:	
		pop bc
		pop hl
		push hl
		push bc
		jp _SMS_loadSpritePalette
	
; Data from 8D3 to 8D5 (3 bytes)	
A$_sms_manager$514:	
C$_sms_manager.c$89$1$101:	
C$_sms_manager.c$91$1$103:	
G$devkit_SMS_setBGPaletteColor$0:	
_devkit_SMS_setBGPaletteColor:	
	.db $21 $04 $00
	
; Data from 8D6 to 8D6 (1 bytes)	
A$_sms_manager$515:	
	.db $39
	
; Data from 8D7 to 8D7 (1 bytes)	
A$_sms_manager$516:	
	.db $7E
	
; Data from 8D8 to 8D8 (1 bytes)	
A$_sms_manager$517:	
	.db $87
	
; Data from 8D9 to 8D9 (1 bytes)	
A$_sms_manager$518:	
	.db $87
	
; Data from 8DA to 8DC (3 bytes)	
A$_sms_manager$519:	
	.db $21 $03 $00
	
; Data from 8DD to 8DD (1 bytes)	
A$_sms_manager$520:	
	.db $39
	
; Data from 8DE to 8DE (1 bytes)	
A$_sms_manager$521:	
	.db $B6
	
; Data from 8DF to 8DF (1 bytes)	
A$_sms_manager$522:	
	.db $4F
	
; Data from 8E0 to 8E2 (3 bytes)	
A$_sms_manager$523:	
	.db $21 $05 $00
	
; Data from 8E3 to 8E3 (1 bytes)	
A$_sms_manager$524:	
	.db $39
	
; Data from 8E4 to 8E4 (1 bytes)	
A$_sms_manager$525:	
	.db $7E
	
; Data from 8E5 to 8E5 (1 bytes)	
A$_sms_manager$526:	
	.db $07
	
; Data from 8E6 to 8E6 (1 bytes)	
A$_sms_manager$527:	
	.db $07
	
; Data from 8E7 to 8E7 (1 bytes)	
A$_sms_manager$528:	
	.db $07
	
; Data from 8E8 to 8E8 (1 bytes)	
A$_sms_manager$529:	
	.db $07
	
; Data from 8E9 to 8EA (2 bytes)	
A$_sms_manager$530:	
	.db $E6 $F0
	
; Data from 8EB to 8EB (1 bytes)	
A$_sms_manager$531:	
	.db $B1
	
; Data from 8EC to 8EC (1 bytes)	
A$_sms_manager$532:	
	.db $47
	
; Data from 8ED to 8ED (1 bytes)	
A$_sms_manager$536:	
C$_sms_manager.c$92$1$103:	
	.db $C5
	
; Data from 8EE to 8EE (1 bytes)	
A$_sms_manager$537:	
	.db $33
	
; Data from 8EF to 8F1 (3 bytes)	
A$_sms_manager$538:	
	.db $21 $03 $00
	
; Data from 8F2 to 8F2 (1 bytes)	
A$_sms_manager$539:	
	.db $39
	
; Data from 8F3 to 8F3 (1 bytes)	
A$_sms_manager$540:	
	.db $7E
	
; Data from 8F4 to 8F4 (1 bytes)	
A$_sms_manager$541:	
	.db $F5
	
; Data from 8F5 to 8F5 (1 bytes)	
A$_sms_manager$542:	
	.db $33
	
; Data from 8F6 to 8F8 (3 bytes)	
A$_sms_manager$543:	
	.db $CD $23 $1D
	
; Data from 8F9 to 8F9 (1 bytes)	
A$_sms_manager$544:	
	.db $F1
	
; Data from 8FA to 8FA (1 bytes)	
A$_sms_manager$549:	
C$_sms_manager.c$93$1$103:	
XG$devkit_SMS_setBGPaletteColor$:	
	.db $C9
	
; Data from 8FB to 8FD (3 bytes)	
A$_sms_manager$562:	
C$_sms_manager.c$94$1$103:	
C$_sms_manager.c$96$1$105:	
G$devkit_SMS_setSpritePaletteCol:	
_devkit_SMS_setSpritePaletteColo:	
	.db $21 $04 $00
	
; Data from 8FE to 8FE (1 bytes)	
A$_sms_manager$563:	
	.db $39
	
; Data from 8FF to 8FF (1 bytes)	
A$_sms_manager$564:	
	.db $7E
	
; Data from 900 to 900 (1 bytes)	
A$_sms_manager$565:	
	.db $87
	
; Data from 901 to 901 (1 bytes)	
A$_sms_manager$566:	
	.db $87
	
; Data from 902 to 904 (3 bytes)	
A$_sms_manager$567:	
	.db $21 $03 $00
	
; Data from 905 to 905 (1 bytes)	
A$_sms_manager$568:	
	.db $39
	
; Data from 906 to 906 (1 bytes)	
A$_sms_manager$569:	
	.db $B6
	
; Data from 907 to 907 (1 bytes)	
A$_sms_manager$570:	
	.db $4F
	
; Data from 908 to 90A (3 bytes)	
A$_sms_manager$571:	
	.db $21 $05 $00
	
; Data from 90B to 90B (1 bytes)	
A$_sms_manager$572:	
	.db $39
	
; Data from 90C to 90C (1 bytes)	
A$_sms_manager$573:	
	.db $7E
	
; Data from 90D to 90D (1 bytes)	
A$_sms_manager$574:	
	.db $07
	
; Data from 90E to 90E (1 bytes)	
A$_sms_manager$575:	
	.db $07
	
; Data from 90F to 90F (1 bytes)	
A$_sms_manager$576:	
	.db $07
	
; Data from 910 to 910 (1 bytes)	
A$_sms_manager$577:	
	.db $07
	
; Data from 911 to 912 (2 bytes)	
A$_sms_manager$578:	
	.db $E6 $F0
	
; Data from 913 to 913 (1 bytes)	
A$_sms_manager$579:	
	.db $B1
	
; Data from 914 to 914 (1 bytes)	
A$_sms_manager$580:	
	.db $47
	
; Data from 915 to 915 (1 bytes)	
A$_sms_manager$584:	
C$_sms_manager.c$97$1$105:	
	.db $C5
	
; Data from 916 to 916 (1 bytes)	
A$_sms_manager$585:	
	.db $33
	
; Data from 917 to 919 (3 bytes)	
A$_sms_manager$586:	
	.db $21 $03 $00
	
; Data from 91A to 91A (1 bytes)	
A$_sms_manager$587:	
	.db $39
	
; Data from 91B to 91B (1 bytes)	
A$_sms_manager$588:	
	.db $7E
	
; Data from 91C to 91C (1 bytes)	
A$_sms_manager$589:	
	.db $F5
	
; Data from 91D to 91D (1 bytes)	
A$_sms_manager$590:	
	.db $33
	
; Data from 91E to 920 (3 bytes)	
A$_sms_manager$591:	
	.db $CD $37 $1D
	
; Data from 921 to 921 (1 bytes)	
A$_sms_manager$592:	
	.db $F1
	
; Data from 922 to 922 (1 bytes)	
A$_sms_manager$597:	
C$_sms_manager.c$98$1$105:	
XG$devkit_SMS_setSpritePaletteCo:	
	.db $C9
	
; Data from 923 to 924 (2 bytes)	
A$_sms_manager$607:	
C$_sms_manager.c$100$1$105:	
G$devkit_SMS_setNextTileatXY$0$0:	
_devkit_SMS_setNextTileatXY:	
	.db $DD $E5
	
; Data from 925 to 928 (4 bytes)	
A$_sms_manager$608:	
	.db $DD $21 $00 $00
	
; Data from 929 to 92A (2 bytes)	
A$_sms_manager$609:	
	.db $DD $39
	
; Data from 92B to 92D (3 bytes)	
A$_sms_manager$613:	
C$_sms_manager.c$102$1$107:	
	.db $DD $6E $05
	
; Data from 92E to 92F (2 bytes)	
A$_sms_manager$614:	
	.db $26 $00
	
; Data from 930 to 930 (1 bytes)	
A$_sms_manager$615:	
	.db $29
	
; Data from 931 to 931 (1 bytes)	
A$_sms_manager$616:	
	.db $29
	
; Data from 932 to 932 (1 bytes)	
A$_sms_manager$617:	
	.db $29
	
; Data from 933 to 933 (1 bytes)	
A$_sms_manager$618:	
	.db $29
	
; Data from 934 to 934 (1 bytes)	
A$_sms_manager$619:	
	.db $29
	
; Data from 935 to 935 (1 bytes)	
A$_sms_manager$620:	
	.db $29
	
; Data from 936 to 936 (1 bytes)	
A$_sms_manager$621:	
	.db $4D
	
; Data from 937 to 937 (1 bytes)	
A$_sms_manager$622:	
	.db $7C
	
; Data from 938 to 939 (2 bytes)	
A$_sms_manager$623:	
	.db $F6 $78
	
; Data from 93A to 93A (1 bytes)	
A$_sms_manager$624:	
	.db $47
	
; Data from 93B to 93D (3 bytes)	
A$_sms_manager$625:	
	.db $DD $6E $04
	
; Data from 93E to 93F (2 bytes)	
A$_sms_manager$626:	
	.db $26 $00
	
; Data from 940 to 940 (1 bytes)	
A$_sms_manager$627:	
	.db $29
	
; Data from 941 to 941 (1 bytes)	
A$_sms_manager$628:	
	.db $7D
	
; Data from 942 to 942 (1 bytes)	
A$_sms_manager$629:	
	.db $B1
	
; Data from 943 to 943 (1 bytes)	
A$_sms_manager$630:	
	.db $6F
	
; Data from 944 to 944 (1 bytes)	
A$_sms_manager$631:	
	.db $7C
	
; Data from 945 to 945 (1 bytes)	
A$_sms_manager$632:	
	.db $B0
	
; Data from 946 to 946 (1 bytes)	
A$_sms_manager$633:	
	.db $67
	
; Data from 947 to 948 (2 bytes)	
A$_sms_manager$638:	
C$_sms_manager.c$103$1$107:	
XG$devkit_SMS_setNextTileatXY$0$:	
	.db $DD $E1
	
; Data from 949 to 94B (3 bytes)	
A$_sms_manager$639:	
	.db $C3 $06 $00
	
; Data from 94C to 94C (1 bytes)	
A$_sms_manager$652:	
C$_sms_manager.c$104$1$107:	
C$_sms_manager.c$106$1$109:	
G$devkit_SMS_setTile$0$0:	
_devkit_SMS_setTile:	
	.db $C1
	
; Data from 94D to 94D (1 bytes)	
A$_sms_manager$653:	
	.db $E1
	
; Data from 94E to 94E (1 bytes)	
A$_sms_manager$654:	
	.db $E5
	
; Data from 94F to 94F (1 bytes)	
A$_sms_manager$655:	
	.db $C5
	
; Data from 950 to 952 (3 bytes)	
A$_sms_manager$660:	
C$_sms_manager.c$107$1$109:	
XG$devkit_SMS_setTile$0$0:	
	.db $C3 $11 $00
	
; Data from 953 to 956 (4 bytes)	
A$_sms_manager$673:	
C$_sms_manager.c$108$1$109:	
C$_sms_manager.c$110$1$111:	
G$devkit_SMS_setTilePriority$0$0:	
_devkit_SMS_setTilePriority:	
	.db $FD $21 $02 $00
	
; Data from 957 to 958 (2 bytes)	
A$_sms_manager$674:	
	.db $FD $39
	
; Data from 959 to 95B (3 bytes)	
A$_sms_manager$675:	
	.db $FD $6E $00
	
; Data from 95C to 95D (2 bytes)	
A$_sms_manager$676:	
	.db $3E $00
	
; Data from 95E to 95F (2 bytes)	
A$_sms_manager$677:	
	.db $F6 $18
	
; Data from 960 to 960 (1 bytes)	
A$_sms_manager$678:	
	.db $67
	
; Data from 961 to 963 (3 bytes)	
A$_sms_manager$683:	
C$_sms_manager.c$111$1$111:	
XG$devkit_SMS_setTilePriority$0$:	
	.db $C3 $11 $00
	
; Data from 964 to 966 (3 bytes)	
A$_sms_manager$696:	
C$_sms_manager.c$113$1$111:	
C$_sms_manager.c$115$1$113:	
G$devkit_SMS_addSprite$0$0:	
_devkit_SMS_addSprite:	
	.db $21 $04 $00
	
; Data from 967 to 967 (1 bytes)	
A$_sms_manager$697:	
	.db $39
	
; Data from 968 to 968 (1 bytes)	
A$_sms_manager$698:	
	.db $46
	
; Data from 969 to 969 (1 bytes)	
A$_sms_manager$699:	
	.db $C5
	
; Data from 96A to 96A (1 bytes)	
A$_sms_manager$700:	
	.db $33
	
; Data from 96B to 96D (3 bytes)	
A$_sms_manager$701:	
	.db $21 $04 $00
	
; Data from 96E to 96E (1 bytes)	
A$_sms_manager$702:	
	.db $39
	
; Data from 96F to 96F (1 bytes)	
A$_sms_manager$703:	
	.db $7E
	
; Data from 970 to 970 (1 bytes)	
A$_sms_manager$704:	
	.db $F5
	
; Data from 971 to 971 (1 bytes)	
A$_sms_manager$705:	
	.db $33
	
; Data from 972 to 974 (3 bytes)	
A$_sms_manager$706:	
	.db $21 $04 $00
	
; Data from 975 to 975 (1 bytes)	
A$_sms_manager$707:	
	.db $39
	
; Data from 976 to 976 (1 bytes)	
A$_sms_manager$708:	
	.db $7E
	
; Data from 977 to 977 (1 bytes)	
A$_sms_manager$709:	
	.db $F5
	
; Data from 978 to 978 (1 bytes)	
A$_sms_manager$710:	
	.db $33
	
; Data from 979 to 97B (3 bytes)	
A$_sms_manager$711:	
	.db $CD $7D $1D
	
; Data from 97C to 97C (1 bytes)	
A$_sms_manager$712:	
	.db $F1
	
; Data from 97D to 97D (1 bytes)	
A$_sms_manager$713:	
	.db $33
	
; Data from 97E to 97E (1 bytes)	
A$_sms_manager$718:	
C$_sms_manager.c$116$1$113:	
XG$devkit_SMS_addSprite$0$0:	
	.db $C9
	
A$_sms_manager$735:	
C$_sms_manager.c$117$1$113:	
C$_sms_manager.c$119$1$114:	
C$_sms_manager.c$120$1$114:	
G$devkit_SMS_initSprites$0$0:	
XG$devkit_SMS_initSprites$0$0:	
_devkit_SMS_initSprites:	
		jp _SMS_initSprites
	
A$_sms_manager$752:	
C$_sms_manager.c$121$1$114:	
C$_sms_manager.c$123$1$115:	
C$_sms_manager.c$124$1$115:	
G$devkit_SMS_finalizeSprites$0$0:	
XG$devkit_SMS_finalizeSprites$0$:	
_devkit_SMS_finalizeSprites:
		jp _SMS_finalizeSprites
	
A$_sms_manager$769:	
C$_sms_manager.c$125$1$115:	
C$_sms_manager.c$127$1$116:	
C$_sms_manager.c$128$1$116:	
G$devkit_SMS_waitForVBlank$0$0:	
XG$devkit_SMS_waitForVBlank$0$0:	
_devkit_SMS_waitForVBlank:
		jp _SMS_waitForVBlank
	
A$_sms_manager$786:	
C$_sms_manager.c$129$1$116:	
C$_sms_manager.c$131$1$117:	
C$_sms_manager.c$132$1$117:	
G$devkit_SMS_copySpritestoSAT$0$:	
XG$devkit_SMS_copySpritestoSAT$0:	
_devkit_SMS_copySpritestoSAT:
		jp _UNSAFE_SMS_copySpritestoSAT
	
	; Data from 98B to 98D (3 bytes)
A$_sms_manager$803:	
C$_sms_manager.c$133$1$117:	
C$_sms_manager.c$135$1$118:	
C$_sms_manager.c$136$1$118:	
G$devkit_UNSAFE_SMS_copySpritest:	
XG$devkit_UNSAFE_SMS_copySprites:	
_devkit_UNSAFE_SMS_copySpritesto:	
	.db $C3 $A6 $1B
	
A$_sms_manager$820:	
C$_sms_manager.c$138$1$118:	
C$_sms_manager.c$140$1$119:	
C$_sms_manager.c$141$1$119:	
G$devkit_SMS_queryPauseRequested:	
XG$devkit_SMS_queryPauseRequeste:	
_devkit_SMS_queryPauseRequested:
		jp _SMS_queryPauseRequested
	
A$_sms_manager$837:	
C$_sms_manager.c$142$1$119:	
C$_sms_manager.c$144$1$120:	
C$_sms_manager.c$145$1$120:	
G$devkit_SMS_resetPauseRequest$0:	
XG$devkit_SMS_resetPauseRequest$:	
_devkit_SMS_resetPauseRequest:
		jp _SMS_resetPauseRequest
	
; Data from 994 to 996 (3 bytes)	
A$_sms_manager$850:	
C$_sms_manager.c$148$1$120:	
C$_sms_manager.c$150$1$121:	
G$devkit_isCollisionDetected$0$0:	
_devkit_isCollisionDetected:	
	.db $3A $68 $C0
	
; Data from 997 to 998 (2 bytes)	
A$_sms_manager$851:	
	.db $E6 $20
	
; Data from 999 to 999 (1 bytes)	
A$_sms_manager$852:	
	.db $6F
	
; Data from 99A to 99A (1 bytes)	
A$_sms_manager$857:	
C$_sms_manager.c$151$1$121:	
XG$devkit_isCollisionDetected$0$:	
	.db $C9
	
A$_sms_manager$874:	
C$_sms_manager.c$154$1$121:	
C$_sms_manager.c$156$1$122:	
C$_sms_manager.c$157$1$122:	
G$devkit_SMS_getKeysStatus$0$0:	
XG$devkit_SMS_getKeysStatus$0$0:	
_devkit_SMS_getKeysStatus:	
		jp _SMS_getKeysStatus
	
A$_sms_manager$887:	
C$_sms_manager.c$160$1$122:	
C$_sms_manager.c$162$1$123:	
G$devkit_SPRITEMODE_NORMAL$0$0:	
_devkit_SPRITEMODE_NORMAL:	
		ld l, $00
		ret
	
A$_sms_manager$905:	
C$_sms_manager.c$164$1$123:	
C$_sms_manager.c$166$1$124:	
G$devkit_VDPFEATURE_HIDEFIRSTCOL:	
_devkit_VDPFEATURE_HIDEFIRSTCOL:	
		ld hl, $0020
		ret
	
; Data from 9A5 to 9A7 (3 bytes)	
A$_sms_manager$923:	
C$_sms_manager.c$168$1$124:	
C$_sms_manager.c$170$1$125:	
G$devkit_TILE_PRIORITY$0$0:	
_devkit_TILE_PRIORITY:	
	.db $21 $00 $10
	
; Data from 9A8 to 9A8 (1 bytes)	
A$_sms_manager$928:	
C$_sms_manager.c$171$1$125:	
XG$devkit_TILE_PRIORITY$0$0:	
	.db $C9
	
; Data from 9A9 to 9AB (3 bytes)	
A$_sms_manager$941:	
C$_sms_manager.c$172$1$125:	
C$_sms_manager.c$174$1$126:	
G$devkit_TILE_USE_SPRITE_PALETTE:	
_devkit_TILE_USE_SPRITE_PALETTE:	
	.db $21 $00 $08
	
; Data from 9AC to 9AC (1 bytes)	
A$_sms_manager$946:	
C$_sms_manager.c$175$1$126:	
XG$devkit_TILE_USE_SPRITE_PALETT:	
	.db $C9
	
; Data from 9AD to 9BA (14 bytes)	
F_sms_manager$__str_0$0$0:	
	.db $53 $74 $65 $76 $65 $6E $20 $42 $6F $6C $61 $6E $64 $00
	
; Data from 9BB to 9C4 (10 bytes)	
F_sms_manager$__str_1$0$0:	
	.db $56 $61 $6E $20 $48 $61 $6C $65 $6E $00
	
; Data from 9C5 to A00 (60 bytes)	
F_sms_manager$__str_2$0$0:	
	.db $56 $61 $6E $20 $48 $61 $6C $65 $6E $20 $52 $65 $63 $6F $72 $64
	.db $20 $43 $6F $76 $65 $72 $73 $20 $66 $6F $72 $20 $74 $68 $65 $20
	.db $53 $4D $53 $20 $50 $6F $77 $65 $72 $21 $20 $32 $30 $32 $31 $20
	.db $43 $6F $6D $70 $65 $74 $69 $74 $69 $6F $6E $00
	
; Data from A01 to A0A (10 bytes)	
_devkit_PSGPlay:	
	.db $C1 $E1 $E5 $C5 $E5 $CD $F4 $02 $F1 $C9
	
; Data from A0B to A14 (10 bytes)	
_devkit_PSGPlayNoRepeat:	
	.db $C1 $E1 $E5 $C5 $E5 $CD $27 $03 $F1 $C9
	
; Data from A15 to A17 (3 bytes)	
_devkit_PSGStop:	
	.db $C3 $81 $02
	
; Data from A18 to A1A (3 bytes)	
_devkit_PSGResume:	
	.db $C3 $A8 $02
	
; Data from A1B to A1D (3 bytes)	
_devkit_PSGGetStatus:	
	.db $C3 $36 $03
	
; Data from A1E to A29 (12 bytes)	
_devkit_PSGSetMusicVolumeAttenua:	
	.db $21 $02 $00 $39 $7E $F5 $33 $CD $4E $04 $33 $C9
	
; Data from A2A to A3E (21 bytes)	
_devkit_PSGSFXPlay:	
	.db $21 $04 $00 $39 $7E $F5 $33 $21 $03 $00 $39 $4E $23 $46 $C5 $CD
	.db $07 $06 $F1 $33 $C9
	
; Data from A3F to A41 (3 bytes)	
_devkit_PSGSFXStop:	
	.db $C3 $3D $05
	
; Data from A42 to A44 (3 bytes)	
_devkit_PSGSFXGetStatus:	
	.db $C3 $5A $06
	
_devkit_PSGSilenceChannels:	
		jp _PSGSilenceChannels
	
_devkit_PSGRestoreVolumes:	
		jp _PSGRestoreVolumes
	
_devkit_PSGFrame:	
		jp _PSGFrame
	
_devkit_PSGSFXFrame:	
		jp _PSGSFXFrame
	
; Data from A51 to A53 (3 bytes)	
_devkit_SFX_CHANNEL2:	
	.db $2E $01 $C9
	
; Data from A54 to A56 (3 bytes)	
_devkit_SFX_CHANNEL3:	
	.db $2E $02 $C9
	
; Data from A57 to A59 (3 bytes)	
_devkit_SFX_CHANNELS2AND3:	
	.db $2E $03 $C9
	
A$asm_manager$59:
C$asm_manager.c$11$0$0:	
C$asm_manager.c$30$1$1:	
G$engine_asm_manager_clear_VRAM$:	
_engine_asm_manager_clear_VRAM:
		ld a, $00
		out (Port_VDPAddress), a
		ld a, $40
		out (Port_VDPAddress), a
		ld bc, $4000
A$asm_manager$65:	
		ld a, $00
		out (Port_VDPData), a
		dec bc
		ld a, b
		or c
		jp nz, A$asm_manager$65
		ret
	
; Data from A70 to A72 (3 bytes)	
A$audio_manager$60:	
C$audio_manager.c$18$0$0:	
C$audio_manager.c$20$1$15:	
G$engine_audio_manager_sfx_right:	
_engine_audio_manager_sfx_right:	
	.db $21 $22 $1B
	
; Data from A73 to A73 (1 bytes)	
A$audio_manager$61:	
	.db $E5
	
; Data from A74 to A76 (3 bytes)	
A$audio_manager$62:	
	.db $CD $8B $0A
	
; Data from A77 to A77 (1 bytes)	
A$audio_manager$63:	
	.db $F1
	
; Data from A78 to A78 (1 bytes)	
A$audio_manager$68:	
C$audio_manager.c$21$1$15:	
XG$engine_audio_manager_sfx_righ:	
	.db $C9
	
; Data from A79 to A7B (3 bytes)	
A$audio_manager$81:	
C$audio_manager.c$22$1$15:	
C$audio_manager.c$24$1$16:	
G$engine_audio_manager_sfx_wrong:	
_engine_audio_manager_sfx_wrong:	
	.db $21 $42 $1B
	
; Data from A7C to A7C (1 bytes)	
A$audio_manager$82:	
	.db $E5
	
; Data from A7D to A7F (3 bytes)	
A$audio_manager$83:	
	.db $CD $8B $0A
	
; Data from A80 to A80 (1 bytes)	
A$audio_manager$84:	
	.db $F1
	
; Data from A81 to A81 (1 bytes)	
A$audio_manager$89:	
C$audio_manager.c$25$1$16:	
XG$engine_audio_manager_sfx_wron:	
	.db $C9
	
; Data from A82 to A84 (3 bytes)	
A$audio_manager$102:	
C$audio_manager.c$26$1$16:	
C$audio_manager.c$28$1$17:	
G$engine_audio_manager_sfx_cheat:	
_engine_audio_manager_sfx_cheat:	
	.db $21 $FF $1A
	
; Data from A85 to A85 (1 bytes)	
A$audio_manager$103:	
	.db $E5
	
; Data from A86 to A88 (3 bytes)	
A$audio_manager$104:	
	.db $CD $8B $0A
	
; Data from A89 to A89 (1 bytes)	
A$audio_manager$105:	
	.db $F1
	
; Data from A8A to A8A (1 bytes)	
A$audio_manager$110:	
C$audio_manager.c$29$1$17:	
XG$engine_audio_manager_sfx_chea:	
	.db $C9
	
; Data from A8B to A8D (3 bytes)	
A$audio_manager$123:	
C$audio_manager.c$31$1$17:	
C$audio_manager.c$36$1$19:	
Faudio_manager$play_sfx$0$0:	
	.db $CD $42 $0A
	
; Data from A8E to A8E (1 bytes)	
A$audio_manager$127:	
C$audio_manager.c$37$1$19:	
	.db $7D
	
; Data from A8F to A8F (1 bytes)	
A$audio_manager$128:	
	.db $B7
	
; Data from A90 to A90 (1 bytes)	
A$audio_manager$132:	
C$audio_manager.c$39$2$20:	
	.db $C0
	
; Data from A91 to A93 (3 bytes)	
A$audio_manager$136:	
C$audio_manager.c$42$1$19:	
	.db $CD $51 $0A
	
; Data from A94 to A94 (1 bytes)	
A$audio_manager$137:	
	.db $65
	
; Data from A95 to A95 (1 bytes)	
A$audio_manager$138:	
	.db $D1
	
; Data from A96 to A96 (1 bytes)	
A$audio_manager$139:	
	.db $C1
	
; Data from A97 to A97 (1 bytes)	
A$audio_manager$140:	
	.db $C5
	
; Data from A98 to A98 (1 bytes)	
A$audio_manager$141:	
	.db $D5
	
; Data from A99 to A99 (1 bytes)	
A$audio_manager$142:	
	.db $E5
	
; Data from A9A to A9A (1 bytes)	
A$audio_manager$143:	
	.db $33
	
; Data from A9B to A9B (1 bytes)	
A$audio_manager$144:	
	.db $C5
	
; Data from A9C to A9E (3 bytes)	
A$audio_manager$145:	
	.db $CD $2A $0A
	
; Data from A9F to A9F (1 bytes)	
A$audio_manager$146:	
	.db $F1
	
; Data from AA0 to AA0 (1 bytes)	
A$audio_manager$147:	
	.db $33
	
; Data from AA1 to AA1 (1 bytes)	
A$audio_manager$152:	
C$audio_manager.c$43$1$19:	
XFaudio_manager$play_sfx$0$0:	
	.db $C9
	
A$content_manager$65:	
C$content_manager.c$14$0$0:	
C$content_manager.c$16$1$17:	
G$engine_content_manager_load_ti:	
_engine_content_manager_load_til:
		ld hl, $0000
		push hl
		;ld hl, _font__tiles__psgcompr	; _font__tiles__psgcompr = $1838
		ld hl, $1838
		push hl
		call A$_sms_manager$400
		pop af
		pop af
		ld bc, _font__palette__bin	; _font__palette__bin = $17A8
		;ld bc, _DATA_17A8_
		push bc
		call A$_sms_manager$472
		pop af
		ret
	
; Data from AB8 to AB9 (2 bytes)	
A$content_manager$96:	
C$content_manager.c$20$1$17:	
C$content_manager.c$22$1$18:	
H$engine_content_manager_load_sp:	
_engine_content_manager_load_spl:	
	.db $3E $02
	
; Data from ABA to ABA (1 bytes)	
A$content_manager$97:	
	.db $F5
	
; Data from ABB to ABB (1 bytes)	
A$content_manager$98:	
	.db $33
	
; Data from ABC to ABE (3 bytes)	
A$content_manager$99:	
	.db $CD $31 $08
	
; Data from ABF to ABF (1 bytes)	
A$content_manager$100:	
	.db $33
	
; Data from AC0 to AC2 (3 bytes)	
A$content_manager$104:	
C$content_manager.c$23$1$18:	
	.db $21 $40 $00
	
; Data from AC3 to AC3 (1 bytes)	
A$content_manager$105:	
	.db $E5
	
; Data from AC4 to AC6 (3 bytes)	
A$content_manager$106:	
	.db $21 $57 $80
	
; Data from AC7 to AC7 (1 bytes)	
A$content_manager$107:	
	.db $E5
	
; Data from AC8 to ACA (3 bytes)	
A$content_manager$108:	
	.db $CD $8E $08
	
; Data from ACB to ACB (1 bytes)	
A$content_manager$109:	
	.db $F1
	
; Data from ACC to ACC (1 bytes)	
A$content_manager$110:	
	.db $F1
	
; Data from ACD to ACF (3 bytes)	
A$content_manager$114:	
C$content_manager.c$24$1$18:	
	.db $01 $10 $80
	
; Data from AD0 to AD0 (1 bytes)	
A$content_manager$115:	
	.db $C5
	
; Data from AD1 to AD3 (3 bytes)	
A$content_manager$116:	
	.db $21 $00 $00
	
; Data from AD4 to AD4 (1 bytes)	
A$content_manager$117:	
	.db $E5
	
; Data from AD5 to AD7 (3 bytes)	
A$content_manager$118:	
	.db $CD $A4 $08
	
; Data from AD8 to AD8 (1 bytes)	
A$content_manager$119:	
	.db $F1
	
; Data from AD9 to AD9 (1 bytes)	
A$content_manager$120:	
	.db $F1
	
; Data from ADA to ADC (3 bytes)	
A$content_manager$124:	
C$content_manager.c$25$1$18:	
	.db $01 $00 $80
	
; Data from ADD to ADD (1 bytes)	
A$content_manager$125:	
	.db $C5
	
; Data from ADE to AE0 (3 bytes)	
A$content_manager$126:	
	.db $CD $C5 $08
	
; Data from AE1 to AE1 (1 bytes)	
A$content_manager$127:	
	.db $F1
	
; Data from AE2 to AE2 (1 bytes)	
A$content_manager$132:	
C$content_manager.c$26$1$18:	
XG$engine_content_manager_load_s:	
	.db $C9
	
; Data from AE3 to AE4 (2 bytes)	
A$content_manager$145:	
C$content_manager.c$38$1$18:	
C$content_manager.c$40$1$19:	
H$engine_content_manager_load_ti:	
_engine_content_manager_load_tit:	
	.db $3E $03
	
; Data from AE5 to AE5 (1 bytes)	
A$content_manager$146:	
	.db $F5
	
; Data from AE6 to AE6 (1 bytes)	
A$content_manager$147:	
	.db $33
	
; Data from AE7 to AE9 (3 bytes)	
A$content_manager$148:	
	.db $CD $31 $08
	
; Data from AEA to AEA (1 bytes)	
A$content_manager$149:	
	.db $33
	
; Data from AEB to AED (3 bytes)	
A$content_manager$153:	
C$content_manager.c$41$1$19:	
	.db $21 $40 $00
	
; Data from AEE to AEE (1 bytes)	
A$content_manager$154:	
	.db $E5
	
; Data from AEF to AF1 (3 bytes)	
A$content_manager$155:	
	.db $21 $77 $80
	
; Data from AF2 to AF2 (1 bytes)	
A$content_manager$156:	
	.db $E5
	
; Data from AF3 to AF5 (3 bytes)	
A$content_manager$157:	
	.db $CD $8E $08
	
; Data from AF6 to AF6 (1 bytes)	
A$content_manager$158:	
	.db $F1
	
; Data from AF7 to AF7 (1 bytes)	
A$content_manager$159:	
	.db $F1
	
; Data from AF8 to AFA (3 bytes)	
A$content_manager$163:	
C$content_manager.c$42$1$19:	
	.db $01 $10 $80
	
; Data from AFB to AFB (1 bytes)	
A$content_manager$164:	
	.db $C5
	
; Data from AFC to AFE (3 bytes)	
A$content_manager$165:	
	.db $21 $00 $00
	
; Data from AFF to AFF (1 bytes)	
A$content_manager$166:	
	.db $E5
	
; Data from B00 to B02 (3 bytes)	
A$content_manager$167:	
	.db $CD $A4 $08
	
; Data from B03 to B03 (1 bytes)	
A$content_manager$168:	
	.db $F1
	
; Data from B04 to B04 (1 bytes)	
A$content_manager$169:	
	.db $F1
	
; Data from B05 to B07 (3 bytes)	
A$content_manager$173:	
C$content_manager.c$43$1$19:	
	.db $01 $00 $80
	
; Data from B08 to B08 (1 bytes)	
A$content_manager$174:	
	.db $C5
	
; Data from B09 to B0B (3 bytes)	
A$content_manager$175:	
	.db $CD $C5 $08
	
; Data from B0C to B0C (1 bytes)	
A$content_manager$176:	
	.db $F1
	
; Data from B0D to B0F (3 bytes)	
A$content_manager$180:	
C$content_manager.c$46$1$19:	
	.db $21 $03 $03
	
; Data from B10 to B10 (1 bytes)	
A$content_manager$181:	
	.db $E5
	
; Data from B11 to B12 (2 bytes)	
A$content_manager$182:	
	.db $2E $0F
	
; Data from B13 to B13 (1 bytes)	
A$content_manager$183:	
	.db $E5
	
; Data from B14 to B16 (3 bytes)	
A$content_manager$184:	
	.db $CD $D3 $08
	
; Data from B17 to B17 (1 bytes)	
A$content_manager$185:	
	.db $F1
	
; Data from B18 to B18 (1 bytes)	
A$content_manager$186:	
	.db $F1
	
; Data from B19 to B19 (1 bytes)	
A$content_manager$191:	
C$content_manager.c$47$1$19:	
XG$engine_content_manager_load_t:	
	.db $C9
	
; Data from B1A to B1B (2 bytes)	
A$content_manager$204:	
C$content_manager.c$48$1$19:	
C$content_manager.c$50$1$20:	
I$engine_content_manager_load_ti:	
_fngine_content_manager_load_tit:	
	.db $3E $03
	
; Data from B1C to B1C (1 bytes)	
A$content_manager$205:	
	.db $F5
	
; Data from B1D to B1D (1 bytes)	
A$content_manager$206:	
	.db $33
	
; Data from B1E to B20 (3 bytes)	
A$content_manager$207:	
	.db $CD $31 $08
	
; Data from B21 to B21 (1 bytes)	
A$content_manager$208:	
	.db $33
	
; Data from B22 to B24 (3 bytes)	
A$content_manager$212:	
C$content_manager.c$51$1$20:	
	.db $21 $40 $00
	
; Data from B25 to B25 (1 bytes)	
A$content_manager$213:	
	.db $E5
	
; Data from B26 to B28 (3 bytes)	
A$content_manager$214:	
	.db $21 $45 $93
	
; Data from B29 to B29 (1 bytes)	
A$content_manager$215:	
	.db $E5
	
; Data from B2A to B2C (3 bytes)	
A$content_manager$216:	
	.db $CD $8E $08
	
; Data from B2D to B2D (1 bytes)	
A$content_manager$217:	
	.db $F1
	
; Data from B2E to B2E (1 bytes)	
A$content_manager$218:	
	.db $F1
	
; Data from B2F to B31 (3 bytes)	
A$content_manager$222:	
C$content_manager.c$52$1$20:	
	.db $01 $E8 $92
	
; Data from B32 to B32 (1 bytes)	
A$content_manager$223:	
	.db $C5
	
; Data from B33 to B35 (3 bytes)	
A$content_manager$224:	
	.db $21 $00 $00
	
; Data from B36 to B36 (1 bytes)	
A$content_manager$225:	
	.db $E5
	
; Data from B37 to B39 (3 bytes)	
A$content_manager$226:	
	.db $CD $A4 $08
	
; Data from B3A to B3A (1 bytes)	
A$content_manager$227:	
	.db $F1
	
; Data from B3B to B3B (1 bytes)	
A$content_manager$228:	
	.db $F1
	
; Data from B3C to B3E (3 bytes)	
A$content_manager$232:	
C$content_manager.c$53$1$20:	
	.db $01 $D8 $92
	
; Data from B3F to B3F (1 bytes)	
A$content_manager$233:	
	.db $C5
	
; Data from B40 to B42 (3 bytes)	
A$content_manager$234:	
	.db $CD $C5 $08
	
; Data from B43 to B43 (1 bytes)	
A$content_manager$235:	
	.db $F1
	
; Data from B44 to B46 (3 bytes)	
A$content_manager$239:	
C$content_manager.c$56$1$20:	
	.db $21 $03 $03
	
; Data from B47 to B47 (1 bytes)	
A$content_manager$240:	
	.db $E5
	
; Data from B48 to B49 (2 bytes)	
A$content_manager$241:	
	.db $2E $0F
	
; Data from B4A to B4A (1 bytes)	
A$content_manager$242:	
	.db $E5
	
; Data from B4B to B4D (3 bytes)	
A$content_manager$243:	
	.db $CD $D3 $08
	
; Data from B4E to B4E (1 bytes)	
A$content_manager$244:	
	.db $F1
	
; Data from B4F to B4F (1 bytes)	
A$content_manager$245:	
	.db $F1
	
; Data from B50 to B50 (1 bytes)	
A$content_manager$250:	
C$content_manager.c$57$1$20:	
XH$engine_content_manager_load_t:	
	.db $C9
	
A$content_manager$263:	
C$content_manager.c$60$1$20:	
C$content_manager.c$63$1$21:	
G$engine_content_manager_load_sp:	
_engine_content_manager_load_spr:	
		ld hl, $0120
		push hl
		ld hl, _cursor__tiles__psgcompr	; _cursor__tiles__psgcompr = $16ED
		;ld hl, $16ED
		push hl
		call A$_sms_manager$400
		pop af
		pop af
		ld bc, _cursor__palette__bin	; _cursor__palette__bin = $16DD
		;ld bc, _DATA_16DD_
		push bc
		call A$_sms_manager$493
		pop af
		ret
	
; Data from B67 to B69 (3 bytes)	
A$cursor_manager$68:	
C$cursor_manager.c$13$0$0:	
C$cursor_manager.c$15$1$23:	
G$engine_cursor_manager_init$0$0:	
_engine_cursor_manager_init:	
	.db $01 $26 $C0
	
; Data from B6A to B6A (1 bytes)	
A$cursor_manager$72:	
C$cursor_manager.c$16$1$23:	
	.db $AF
	
; Data from B6B to B6B (1 bytes)	
A$cursor_manager$73:	
	.db $02
	
; Data from B6C to B6E (3 bytes)	
A$cursor_manager$77:	
C$cursor_manager.c$17$1$23:	
	.db $21 $27 $C0
	
; Data from B6F to B70 (2 bytes)	
A$cursor_manager$78:	
	.db $36 $00
	
; Data from B71 to B71 (1 bytes)	
A$cursor_manager$82:	
C$cursor_manager.c$19$1$23:	
	.db $C5
	
; Data from B72 to B73 (2 bytes)	
A$cursor_manager$83:	
	.db $3E $03
	
; Data from B74 to B74 (1 bytes)	
A$cursor_manager$84:	
	.db $F5
	
; Data from B75 to B75 (1 bytes)	
A$cursor_manager$85:	
	.db $33
	
; Data from B76 to B78 (3 bytes)	
A$cursor_manager$86:	
	.db $21 $05 $00
	
; Data from B79 to B79 (1 bytes)	
A$cursor_manager$87:	
	.db $39
	
; Data from B7A to B7A (1 bytes)	
A$cursor_manager$88:	
	.db $7E
	
; Data from B7B to B7B (1 bytes)	
A$cursor_manager$89:	
	.db $F5
	
; Data from B7C to B7C (1 bytes)	
A$cursor_manager$90:	
	.db $33
	
; Data from B7D to B7F (3 bytes)	
A$cursor_manager$91:	
	.db $CD $6D $1B
	
; Data from B80 to B80 (1 bytes)	
A$cursor_manager$92:	
	.db $F1
	
; Data from B81 to B81 (1 bytes)	
A$cursor_manager$93:	
	.db $7D
	
; Data from B82 to B82 (1 bytes)	
A$cursor_manager$94:	
	.db $C1
	
; Data from B83 to B83 (1 bytes)	
A$cursor_manager$95:	
	.db $02
	
; Data from B84 to B85 (2 bytes)	
A$cursor_manager$99:	
C$cursor_manager.c$20$1$23:	
	.db $3E $03
	
; Data from B86 to B86 (1 bytes)	
A$cursor_manager$100:	
	.db $F5
	
; Data from B87 to B87 (1 bytes)	
A$cursor_manager$101:	
	.db $33
	
; Data from B88 to B8A (3 bytes)	
A$cursor_manager$102:	
	.db $21 $03 $00
	
; Data from B8B to B8B (1 bytes)	
A$cursor_manager$103:	
	.db $39
	
; Data from B8C to B8C (1 bytes)	
A$cursor_manager$104:	
	.db $7E
	
; Data from B8D to B8D (1 bytes)	
A$cursor_manager$105:	
	.db $F5
	
; Data from B8E to B8E (1 bytes)	
A$cursor_manager$106:	
	.db $33
	
; Data from B8F to B91 (3 bytes)	
A$cursor_manager$107:	
	.db $CD $EE $1E
	
; Data from B92 to B92 (1 bytes)	
A$cursor_manager$108:	
	.db $F1
	
; Data from B93 to B93 (1 bytes)	
A$cursor_manager$109:	
	.db $4D
	
; Data from B94 to B96 (3 bytes)	
A$cursor_manager$110:	
	.db $21 $27 $C0
	
; Data from B97 to B97 (1 bytes)	
A$cursor_manager$111:	
	.db $71
	
; Data from B98 to B9A (3 bytes)	
A$cursor_manager$119:	
C$cursor_manager.c$21$1$23:	
C$cursor_manager.c$22$1$23:	
XG$engine_cursor_manager_init$0$:	
	.db $C3 $88 $0D
	
; Data from B9B to B9C (2 bytes)	
A$cursor_manager$129:	
C$cursor_manager.c$24$1$23:	
G$engine_cursor_manager_load$0$0:	
_engine_cursor_manager_load:	
	.db $DD $E5
	
; Data from B9D to BA0 (4 bytes)	
A$cursor_manager$130:	
	.db $DD $21 $00 $00
	
; Data from BA1 to BA2 (2 bytes)	
A$cursor_manager$131:	
	.db $DD $39
	
; Data from BA3 to BA3 (1 bytes)	
A$cursor_manager$132:	
	.db $F5
	
; Data from BA4 to BA4 (1 bytes)	
A$cursor_manager$133:	
	.db $F5
	
; Data from BA5 to BA8 (4 bytes)	
A$cursor_manager$137:	
C$cursor_manager.c$31$5$29:	
	.db $DD $36 $FD $00
	
; Data from BA9 to BAA (2 bytes)	
A$cursor_manager$142:	
C$cursor_manager.c$33$2$26:	
	.db $3E $E0
	
; Data from BAB to BAD (3 bytes)	
A$cursor_manager$143:	
	.db $DD $86 $FD
	
; Data from BAE to BB0 (3 bytes)	
A$cursor_manager$144:	
	.db $DD $77 $FE
	
; Data from BB1 to BB2 (2 bytes)	
A$cursor_manager$145:	
	.db $3E $11
	
; Data from BB3 to BB4 (2 bytes)	
A$cursor_manager$146:	
	.db $CE $00
	
; Data from BB5 to BB7 (3 bytes)	
A$cursor_manager$147:	
	.db $DD $77 $FF
	
; Data from BB8 to BB9 (2 bytes)	
A$cursor_manager$148:	
	.db $0E $00
	
; Data from BBA to BBA (1 bytes)	
A$cursor_manager$153:	
C$cursor_manager.c$35$5$29:	
	.db $69
	
; Data from BBB to BBB (1 bytes)	
A$cursor_manager$154:	
	.db $29
	
; Data from BBC to BBC (1 bytes)	
A$cursor_manager$155:	
	.db $09
	
; Data from BBD to BBD (1 bytes)	
A$cursor_manager$156:	
	.db $7D
	
; Data from BBE to BC0 (3 bytes)	
A$cursor_manager$157:	
	.db $DD $86 $FD
	
; Data from BC1 to BC1 (1 bytes)	
A$cursor_manager$158:	
	.db $5F
	
; Data from BC2 to BC4 (3 bytes)	
A$cursor_manager$162:	
C$cursor_manager.c$37$5$29:	
	.db $21 $DC $11
	
; Data from BC5 to BC6 (2 bytes)	
A$cursor_manager$163:	
	.db $06 $00
	
; Data from BC7 to BC7 (1 bytes)	
A$cursor_manager$164:	
	.db $09
	
; Data from BC8 to BC8 (1 bytes)	
A$cursor_manager$165:	
	.db $46
	
; Data from BC9 to BCB (3 bytes)	
A$cursor_manager$169:	
C$cursor_manager.c$38$5$29:	
	.db $DD $6E $FE
	
; Data from BCC to BCE (3 bytes)	
A$cursor_manager$170:	
	.db $DD $66 $FF
	
; Data from BCF to BCF (1 bytes)	
A$cursor_manager$171:	
	.db $7E
	
; Data from BD0 to BD2 (3 bytes)	
A$cursor_manager$172:	
	.db $DD $77 $FC
	
; Data from BD3 to BD4 (2 bytes)	
A$cursor_manager$176:	
C$cursor_manager.c$39$5$29:	
	.db $26 $00
	
; Data from BD5 to BD5 (1 bytes)	
A$cursor_manager$177:	
	.db $6B
	
; Data from BD6 to BD6 (1 bytes)	
A$cursor_manager$178:	
	.db $29
	
; Data from BD7 to BD9 (3 bytes)	
A$cursor_manager$179:	
	.db $11 $56 $C1
	
; Data from BDA to BDA (1 bytes)	
A$cursor_manager$180:	
	.db $19
	
; Data from BDB to BDB (1 bytes)	
A$cursor_manager$181:	
	.db $5E
	
; Data from BDC to BDC (1 bytes)	
A$cursor_manager$182:	
	.db $23
	
; Data from BDD to BDD (1 bytes)	
A$cursor_manager$183:	
	.db $56
	
; Data from BDE to BE0 (3 bytes)	
A$cursor_manager$187:	
C$cursor_manager.c$40$5$29:	
	.db $DD $7E $FC
	
; Data from BE1 to BE3 (3 bytes)	
A$cursor_manager$188:	
	.db $DD $86 $04
	
; Data from BE4 to BE4 (1 bytes)	
A$cursor_manager$189:	
	.db $C5
	
; Data from BE5 to BE5 (1 bytes)	
A$cursor_manager$190:	
	.db $F5
	
; Data from BE6 to BE6 (1 bytes)	
A$cursor_manager$191:	
	.db $33
	
; Data from BE7 to BE7 (1 bytes)	
A$cursor_manager$192:	
	.db $C5
	
; Data from BE8 to BE8 (1 bytes)	
A$cursor_manager$193:	
	.db $33
	
; Data from BE9 to BE9 (1 bytes)	
A$cursor_manager$194:	
	.db $D5
	
; Data from BEA to BEC (3 bytes)	
A$cursor_manager$195:	
	.db $CD $E9 $0D
	
; Data from BED to BED (1 bytes)	
A$cursor_manager$196:	
	.db $F1
	
; Data from BEE to BEE (1 bytes)	
A$cursor_manager$197:	
	.db $F1
	
; Data from BEF to BEF (1 bytes)	
A$cursor_manager$198:	
	.db $C1
	
; Data from BF0 to BF0 (1 bytes)	
A$cursor_manager$202:	
C$cursor_manager.c$33$4$28:	
	.db $0C
	
; Data from BF1 to BF1 (1 bytes)	
A$cursor_manager$203:	
	.db $79
	
; Data from BF2 to BF3 (2 bytes)	
A$cursor_manager$204:	
	.db $D6 $04
	
; Data from BF4 to BF5 (2 bytes)	
A$cursor_manager$205:	
	.db $38 $C4
	
; Data from BF6 to BF8 (3 bytes)	
A$cursor_manager$209:	
C$cursor_manager.c$31$2$26:	
	.db $DD $34 $FD
	
; Data from BF9 to BFB (3 bytes)	
A$cursor_manager$210:	
	.db $DD $7E $FD
	
; Data from BFC to BFD (2 bytes)	
A$cursor_manager$211:	
	.db $D6 $03
	
; Data from BFE to BFF (2 bytes)	
A$cursor_manager$212:	
	.db $38 $A9
	
; Data from C00 to C01 (2 bytes)	
A$cursor_manager$213:	
	.db $DD $F9
	
; Data from C02 to C03 (2 bytes)	
A$cursor_manager$214:	
	.db $DD $E1
	
; Data from C04 to C04 (1 bytes)	
A$cursor_manager$219:	
C$cursor_manager.c$43$2$26:	
XG$engine_cursor_manager_load$0$:	
	.db $C9
	
; Data from C05 to C07 (3 bytes)	
A$cursor_manager$235:	
C$cursor_manager.c$45$2$26:	
C$cursor_manager.c$47$1$30:	
C$cursor_manager.c$48$1$30:	
G$engine_cursor_manager_save$0$0:	
_engine_cursor_manager_save:	
	.db $3A $26 $C0
	
; Data from C08 to C08 (1 bytes)	
A$cursor_manager$236:	
	.db $4F
	
; Data from C09 to C09 (1 bytes)	
A$cursor_manager$237:	
	.db $87
	
; Data from C0A to C0A (1 bytes)	
A$cursor_manager$238:	
	.db $81
	
; Data from C0B to C0B (1 bytes)	
A$cursor_manager$239:	
	.db $4F
	
; Data from C0C to C0E (3 bytes)	
A$cursor_manager$240:	
	.db $21 $26 $C0
	
; Data from C0F to C0F (1 bytes)	
A$cursor_manager$241:	
	.db $23
	
; Data from C10 to C10 (1 bytes)	
A$cursor_manager$242:	
	.db $6E
	
; Data from C11 to C11 (1 bytes)	
A$cursor_manager$243:	
	.db $09
	
; Data from C12 to C12 (1 bytes)	
A$cursor_manager$248:	
C$cursor_manager.c$55$1$30:	
XG$engine_cursor_manager_save$0$:	
	.db $C9
	
; Data from C13 to C14 (2 bytes)	
A$cursor_manager$258:	
C$cursor_manager.c$57$1$30:	
G$engine_cursor_manager_draw$0$0:	
_engine_cursor_manager_draw:	
	.db $DD $E5
	
; Data from C15 to C18 (4 bytes)	
A$cursor_manager$259:	
	.db $DD $21 $00 $00
	
; Data from C19 to C1A (2 bytes)	
A$cursor_manager$260:	
	.db $DD $39
	
; Data from C1B to C1B (1 bytes)	
A$cursor_manager$261:	
	.db $F5
	
; Data from C1C to C1C (1 bytes)	
A$cursor_manager$262:	
	.db $F5
	
; Data from C1D to C1F (3 bytes)	
A$cursor_manager$269:	
C$cursor_manager.c$59$1$31:	
C$cursor_manager.c$60$1$31:	
	.db $21 $26 $C0
	
; Data from C20 to C20 (1 bytes)	
A$cursor_manager$270:	
	.db $23
	
; Data from C21 to C21 (1 bytes)	
A$cursor_manager$271:	
	.db $23
	
; Data from C22 to C22 (1 bytes)	
A$cursor_manager$272:	
	.db $4E
	
; Data from C23 to C25 (3 bytes)	
A$cursor_manager$276:	
C$cursor_manager.c$61$1$31:	
	.db $21 $26 $C0
	
; Data from C26 to C26 (1 bytes)	
A$cursor_manager$277:	
	.db $23
	
; Data from C27 to C27 (1 bytes)	
A$cursor_manager$278:	
	.db $23
	
; Data from C28 to C28 (1 bytes)	
A$cursor_manager$279:	
	.db $23
	
; Data from C29 to C29 (1 bytes)	
A$cursor_manager$280:	
	.db $46
	
; Data from C2A to C2A (1 bytes)	
A$cursor_manager$284:	
C$cursor_manager.c$65$1$31:	
	.db $C5
	
; Data from C2B to C2D (3 bytes)	
A$cursor_manager$285:	
	.db $21 $20 $01
	
; Data from C2E to C2E (1 bytes)	
A$cursor_manager$286:	
	.db $E5
	
; Data from C2F to C2F (1 bytes)	
A$cursor_manager$287:	
	.db $C5
	
; Data from C30 to C32 (3 bytes)	
A$cursor_manager$288:	
	.db $CD $64 $09
	
; Data from C33 to C33 (1 bytes)	
A$cursor_manager$289:	
	.db $F1
	
; Data from C34 to C34 (1 bytes)	
A$cursor_manager$290:	
	.db $F1
	
; Data from C35 to C35 (1 bytes)	
A$cursor_manager$291:	
	.db $C1
	
; Data from C36 to C36 (1 bytes)	
A$cursor_manager$295:	
C$cursor_manager.c$66$1$31:	
	.db $79
	
; Data from C37 to C38 (2 bytes)	
A$cursor_manager$296:	
	.db $C6 $28
	
; Data from C39 to C39 (1 bytes)	
A$cursor_manager$297:	
	.db $5F
	
; Data from C3A to C3A (1 bytes)	
A$cursor_manager$298:	
	.db $C5
	
; Data from C3B to C3B (1 bytes)	
A$cursor_manager$299:	
	.db $D5
	
; Data from C3C to C3E (3 bytes)	
A$cursor_manager$300:	
	.db $21 $25 $01
	
; Data from C3F to C3F (1 bytes)	
A$cursor_manager$301:	
	.db $E5
	
; Data from C40 to C40 (1 bytes)	
A$cursor_manager$302:	
	.db $C5
	
; Data from C41 to C41 (1 bytes)	
A$cursor_manager$303:	
	.db $33
	
; Data from C42 to C42 (1 bytes)	
A$cursor_manager$304:	
	.db $7B
	
; Data from C43 to C43 (1 bytes)	
A$cursor_manager$305:	
	.db $F5
	
; Data from C44 to C44 (1 bytes)	
A$cursor_manager$306:	
	.db $33
	
; Data from C45 to C47 (3 bytes)	
A$cursor_manager$307:	
	.db $CD $64 $09
	
; Data from C48 to C48 (1 bytes)	
A$cursor_manager$308:	
	.db $F1
	
; Data from C49 to C49 (1 bytes)	
A$cursor_manager$309:	
	.db $F1
	
; Data from C4A to C4A (1 bytes)	
A$cursor_manager$310:	
	.db $D1
	
; Data from C4B to C4B (1 bytes)	
A$cursor_manager$311:	
	.db $C1
	
; Data from C4C to C4C (1 bytes)	
A$cursor_manager$315:	
C$cursor_manager.c$67$1$31:	
	.db $78
	
; Data from C4D to C4E (2 bytes)	
A$cursor_manager$316:	
	.db $C6 $10
	
; Data from C4F to C4F (1 bytes)	
A$cursor_manager$317:	
	.db $57
	
; Data from C50 to C50 (1 bytes)	
A$cursor_manager$318:	
	.db $C5
	
; Data from C51 to C51 (1 bytes)	
A$cursor_manager$319:	
	.db $D5
	
; Data from C52 to C54 (3 bytes)	
A$cursor_manager$320:	
	.db $21 $2C $01
	
; Data from C55 to C55 (1 bytes)	
A$cursor_manager$321:	
	.db $E5
	
; Data from C56 to C56 (1 bytes)	
A$cursor_manager$322:	
	.db $59
	
; Data from C57 to C57 (1 bytes)	
A$cursor_manager$323:	
	.db $D5
	
; Data from C58 to C5A (3 bytes)	
A$cursor_manager$324:	
	.db $CD $64 $09
	
; Data from C5B to C5B (1 bytes)	
A$cursor_manager$325:	
	.db $F1
	
; Data from C5C to C5C (1 bytes)	
A$cursor_manager$326:	
	.db $F1
	
; Data from C5D to C5D (1 bytes)	
A$cursor_manager$327:	
	.db $D1
	
; Data from C5E to C5E (1 bytes)	
A$cursor_manager$328:	
	.db $D5
	
; Data from C5F to C61 (3 bytes)	
A$cursor_manager$329:	
	.db $21 $31 $01
	
; Data from C62 to C62 (1 bytes)	
A$cursor_manager$330:	
	.db $E5
	
; Data from C63 to C63 (1 bytes)	
A$cursor_manager$331:	
	.db $D5
	
; Data from C64 to C66 (3 bytes)	
A$cursor_manager$332:	
	.db $CD $64 $09
	
; Data from C67 to C67 (1 bytes)	
A$cursor_manager$333:	
	.db $F1
	
; Data from C68 to C68 (1 bytes)	
A$cursor_manager$334:	
	.db $F1
	
; Data from C69 to C69 (1 bytes)	
A$cursor_manager$335:	
	.db $D1
	
; Data from C6A to C6A (1 bytes)	
A$cursor_manager$336:	
	.db $C1
	
; Data from C6B to C6B (1 bytes)	
A$cursor_manager$340:	
C$cursor_manager.c$71$1$31:	
	.db $79
	
; Data from C6C to C6D (2 bytes)	
A$cursor_manager$341:	
	.db $C6 $08
	
; Data from C6E to C70 (3 bytes)	
A$cursor_manager$342:	
	.db $DD $77 $FD
	
; Data from C71 to C71 (1 bytes)	
A$cursor_manager$343:	
	.db $C5
	
; Data from C72 to C72 (1 bytes)	
A$cursor_manager$344:	
	.db $D5
	
; Data from C73 to C75 (3 bytes)	
A$cursor_manager$345:	
	.db $21 $21 $01
	
; Data from C76 to C76 (1 bytes)	
A$cursor_manager$346:	
	.db $E5
	
; Data from C77 to C77 (1 bytes)	
A$cursor_manager$347:	
	.db $C5
	
; Data from C78 to C78 (1 bytes)	
A$cursor_manager$348:	
	.db $33
	
; Data from C79 to C7B (3 bytes)	
A$cursor_manager$349:	
	.db $DD $7E $FD
	
; Data from C7C to C7C (1 bytes)	
A$cursor_manager$350:	
	.db $F5
	
; Data from C7D to C7D (1 bytes)	
A$cursor_manager$351:	
	.db $33
	
; Data from C7E to C80 (3 bytes)	
A$cursor_manager$352:	
	.db $CD $64 $09
	
; Data from C81 to C81 (1 bytes)	
A$cursor_manager$353:	
	.db $F1
	
; Data from C82 to C82 (1 bytes)	
A$cursor_manager$354:	
	.db $F1
	
; Data from C83 to C83 (1 bytes)	
A$cursor_manager$355:	
	.db $D1
	
; Data from C84 to C84 (1 bytes)	
A$cursor_manager$356:	
	.db $C1
	
; Data from C85 to C85 (1 bytes)	
A$cursor_manager$360:	
C$cursor_manager.c$72$1$31:	
	.db $79
	
; Data from C86 to C87 (2 bytes)	
A$cursor_manager$361:	
	.db $C6 $10
	
; Data from C88 to C8A (3 bytes)	
A$cursor_manager$362:	
	.db $DD $77 $FF
	
; Data from C8B to C8B (1 bytes)	
A$cursor_manager$363:	
	.db $C5
	
; Data from C8C to C8C (1 bytes)	
A$cursor_manager$364:	
	.db $D5
	
; Data from C8D to C8F (3 bytes)	
A$cursor_manager$365:	
	.db $21 $22 $01
	
; Data from C90 to C90 (1 bytes)	
A$cursor_manager$366:	
	.db $E5
	
; Data from C91 to C91 (1 bytes)	
A$cursor_manager$367:	
	.db $C5
	
; Data from C92 to C92 (1 bytes)	
A$cursor_manager$368:	
	.db $33
	
; Data from C93 to C95 (3 bytes)	
A$cursor_manager$369:	
	.db $DD $7E $FF
	
; Data from C96 to C96 (1 bytes)	
A$cursor_manager$370:	
	.db $F5
	
; Data from C97 to C97 (1 bytes)	
A$cursor_manager$371:	
	.db $33
	
; Data from C98 to C9A (3 bytes)	
A$cursor_manager$372:	
	.db $CD $64 $09
	
; Data from C9B to C9B (1 bytes)	
A$cursor_manager$373:	
	.db $F1
	
; Data from C9C to C9C (1 bytes)	
A$cursor_manager$374:	
	.db $F1
	
; Data from C9D to C9D (1 bytes)	
A$cursor_manager$375:	
	.db $D1
	
; Data from C9E to C9E (1 bytes)	
A$cursor_manager$376:	
	.db $C1
	
; Data from C9F to C9F (1 bytes)	
A$cursor_manager$380:	
C$cursor_manager.c$73$1$31:	
	.db $79
	
; Data from CA0 to CA1 (2 bytes)	
A$cursor_manager$381:	
	.db $C6 $18
	
; Data from CA2 to CA4 (3 bytes)	
A$cursor_manager$382:	
	.db $DD $77 $FC
	
; Data from CA5 to CA5 (1 bytes)	
A$cursor_manager$383:	
	.db $C5
	
; Data from CA6 to CA6 (1 bytes)	
A$cursor_manager$384:	
	.db $D5
	
; Data from CA7 to CA9 (3 bytes)	
A$cursor_manager$385:	
	.db $21 $23 $01
	
; Data from CAA to CAA (1 bytes)	
A$cursor_manager$386:	
	.db $E5
	
; Data from CAB to CAB (1 bytes)	
A$cursor_manager$387:	
	.db $C5
	
; Data from CAC to CAC (1 bytes)	
A$cursor_manager$388:	
	.db $33
	
; Data from CAD to CAF (3 bytes)	
A$cursor_manager$389:	
	.db $DD $7E $FC
	
; Data from CB0 to CB0 (1 bytes)	
A$cursor_manager$390:	
	.db $F5
	
; Data from CB1 to CB1 (1 bytes)	
A$cursor_manager$391:	
	.db $33
	
; Data from CB2 to CB4 (3 bytes)	
A$cursor_manager$392:	
	.db $CD $64 $09
	
; Data from CB5 to CB5 (1 bytes)	
A$cursor_manager$393:	
	.db $F1
	
; Data from CB6 to CB6 (1 bytes)	
A$cursor_manager$394:	
	.db $F1
	
; Data from CB7 to CB7 (1 bytes)	
A$cursor_manager$395:	
	.db $D1
	
; Data from CB8 to CB8 (1 bytes)	
A$cursor_manager$396:	
	.db $C1
	
; Data from CB9 to CB9 (1 bytes)	
A$cursor_manager$400:	
C$cursor_manager.c$74$1$31:	
	.db $79
	
; Data from CBA to CBB (2 bytes)	
A$cursor_manager$401:	
	.db $C6 $20
	
; Data from CBC to CBE (3 bytes)	
A$cursor_manager$402:	
	.db $DD $77 $FE
	
; Data from CBF to CBF (1 bytes)	
A$cursor_manager$403:	
	.db $C5
	
; Data from CC0 to CC0 (1 bytes)	
A$cursor_manager$404:	
	.db $D5
	
; Data from CC1 to CC3 (3 bytes)	
A$cursor_manager$405:	
	.db $21 $24 $01
	
; Data from CC4 to CC4 (1 bytes)	
A$cursor_manager$406:	
	.db $E5
	
; Data from CC5 to CC5 (1 bytes)	
A$cursor_manager$407:	
	.db $C5
	
; Data from CC6 to CC6 (1 bytes)	
A$cursor_manager$408:	
	.db $33
	
; Data from CC7 to CC9 (3 bytes)	
A$cursor_manager$409:	
	.db $DD $7E $FE
	
; Data from CCA to CCA (1 bytes)	
A$cursor_manager$410:	
	.db $F5
	
; Data from CCB to CCB (1 bytes)	
A$cursor_manager$411:	
	.db $33
	
; Data from CCC to CCE (3 bytes)	
A$cursor_manager$412:	
	.db $CD $64 $09
	
; Data from CCF to CCF (1 bytes)	
A$cursor_manager$413:	
	.db $F1
	
; Data from CD0 to CD0 (1 bytes)	
A$cursor_manager$414:	
	.db $F1
	
; Data from CD1 to CD1 (1 bytes)	
A$cursor_manager$415:	
	.db $D1
	
; Data from CD2 to CD2 (1 bytes)	
A$cursor_manager$416:	
	.db $C1
	
; Data from CD3 to CD3 (1 bytes)	
A$cursor_manager$420:	
C$cursor_manager.c$77$1$31:	
	.db $78
	
; Data from CD4 to CD5 (2 bytes)	
A$cursor_manager$421:	
	.db $C6 $08
	
; Data from CD6 to CD6 (1 bytes)	
A$cursor_manager$422:	
	.db $47
	
; Data from CD7 to CD7 (1 bytes)	
A$cursor_manager$423:	
	.db $C5
	
; Data from CD8 to CD8 (1 bytes)	
A$cursor_manager$424:	
	.db $D5
	
; Data from CD9 to CDB (3 bytes)	
A$cursor_manager$425:	
	.db $21 $26 $01
	
; Data from CDC to CDC (1 bytes)	
A$cursor_manager$426:	
	.db $E5
	
; Data from CDD to CDD (1 bytes)	
A$cursor_manager$427:	
	.db $C5
	
; Data from CDE to CE0 (3 bytes)	
A$cursor_manager$428:	
	.db $CD $64 $09
	
; Data from CE1 to CE1 (1 bytes)	
A$cursor_manager$429:	
	.db $F1
	
; Data from CE2 to CE2 (1 bytes)	
A$cursor_manager$430:	
	.db $F1
	
; Data from CE3 to CE3 (1 bytes)	
A$cursor_manager$431:	
	.db $D1
	
; Data from CE4 to CE4 (1 bytes)	
A$cursor_manager$432:	
	.db $C1
	
; Data from CE5 to CE5 (1 bytes)	
A$cursor_manager$436:	
C$cursor_manager.c$78$1$31:	
	.db $D5
	
; Data from CE6 to CE8 (3 bytes)	
A$cursor_manager$437:	
	.db $21 $2B $01
	
; Data from CE9 to CE9 (1 bytes)	
A$cursor_manager$438:	
	.db $E5
	
; Data from CEA to CEA (1 bytes)	
A$cursor_manager$439:	
	.db $C5
	
; Data from CEB to CEB (1 bytes)	
A$cursor_manager$440:	
	.db $33
	
; Data from CEC to CEC (1 bytes)	
A$cursor_manager$441:	
	.db $7B
	
; Data from CED to CED (1 bytes)	
A$cursor_manager$442:	
	.db $F5
	
; Data from CEE to CEE (1 bytes)	
A$cursor_manager$443:	
	.db $33
	
; Data from CEF to CF1 (3 bytes)	
A$cursor_manager$444:	
	.db $CD $64 $09
	
; Data from CF2 to CF2 (1 bytes)	
A$cursor_manager$445:	
	.db $F1
	
; Data from CF3 to CF3 (1 bytes)	
A$cursor_manager$446:	
	.db $F1
	
; Data from CF4 to CF4 (1 bytes)	
A$cursor_manager$447:	
	.db $D1
	
; Data from CF5 to CF5 (1 bytes)	
A$cursor_manager$451:	
C$cursor_manager.c$81$1$31:	
	.db $D5
	
; Data from CF6 to CF8 (3 bytes)	
A$cursor_manager$452:	
	.db $21 $2D $01
	
; Data from CF9 to CF9 (1 bytes)	
A$cursor_manager$453:	
	.db $E5
	
; Data from CFA to CFA (1 bytes)	
A$cursor_manager$454:	
	.db $D5
	
; Data from CFB to CFB (1 bytes)	
A$cursor_manager$455:	
	.db $33
	
; Data from CFC to CFE (3 bytes)	
A$cursor_manager$456:	
	.db $DD $7E $FD
	
; Data from CFF to CFF (1 bytes)	
A$cursor_manager$457:	
	.db $F5
	
; Data from D00 to D00 (1 bytes)	
A$cursor_manager$458:	
	.db $33
	
; Data from D01 to D03 (3 bytes)	
A$cursor_manager$459:	
	.db $CD $64 $09
	
; Data from D04 to D04 (1 bytes)	
A$cursor_manager$460:	
	.db $F1
	
; Data from D05 to D05 (1 bytes)	
A$cursor_manager$461:	
	.db $F1
	
; Data from D06 to D06 (1 bytes)	
A$cursor_manager$462:	
	.db $D1
	
; Data from D07 to D07 (1 bytes)	
A$cursor_manager$466:	
C$cursor_manager.c$82$1$31:	
	.db $D5
	
; Data from D08 to D0A (3 bytes)	
A$cursor_manager$467:	
	.db $21 $2E $01
	
; Data from D0B to D0B (1 bytes)	
A$cursor_manager$468:	
	.db $E5
	
; Data from D0C to D0C (1 bytes)	
A$cursor_manager$469:	
	.db $D5
	
; Data from D0D to D0D (1 bytes)	
A$cursor_manager$470:	
	.db $33
	
; Data from D0E to D10 (3 bytes)	
A$cursor_manager$471:	
	.db $DD $7E $FF
	
; Data from D11 to D11 (1 bytes)	
A$cursor_manager$472:	
	.db $F5
	
; Data from D12 to D12 (1 bytes)	
A$cursor_manager$473:	
	.db $33
	
; Data from D13 to D15 (3 bytes)	
A$cursor_manager$474:	
	.db $CD $64 $09
	
; Data from D16 to D16 (1 bytes)	
A$cursor_manager$475:	
	.db $F1
	
; Data from D17 to D17 (1 bytes)	
A$cursor_manager$476:	
	.db $F1
	
; Data from D18 to D18 (1 bytes)	
A$cursor_manager$477:	
	.db $D1
	
; Data from D19 to D19 (1 bytes)	
A$cursor_manager$481:	
C$cursor_manager.c$83$1$31:	
	.db $D5
	
; Data from D1A to D1C (3 bytes)	
A$cursor_manager$482:	
	.db $21 $2F $01
	
; Data from D1D to D1D (1 bytes)	
A$cursor_manager$483:	
	.db $E5
	
; Data from D1E to D1E (1 bytes)	
A$cursor_manager$484:	
	.db $D5
	
; Data from D1F to D1F (1 bytes)	
A$cursor_manager$485:	
	.db $33
	
; Data from D20 to D22 (3 bytes)	
A$cursor_manager$486:	
	.db $DD $7E $FC
	
; Data from D23 to D23 (1 bytes)	
A$cursor_manager$487:	
	.db $F5
	
; Data from D24 to D24 (1 bytes)	
A$cursor_manager$488:	
	.db $33
	
; Data from D25 to D27 (3 bytes)	
A$cursor_manager$489:	
	.db $CD $64 $09
	
; Data from D28 to D28 (1 bytes)	
A$cursor_manager$490:	
	.db $F1
	
; Data from D29 to D29 (1 bytes)	
A$cursor_manager$491:	
	.db $F1
	
; Data from D2A to D2A (1 bytes)	
A$cursor_manager$492:	
	.db $D1
	
; Data from D2B to D2D (3 bytes)	
A$cursor_manager$496:	
C$cursor_manager.c$84$1$31:	
	.db $21 $30 $01
	
; Data from D2E to D2E (1 bytes)	
A$cursor_manager$497:	
	.db $E5
	
; Data from D2F to D2F (1 bytes)	
A$cursor_manager$498:	
	.db $D5
	
; Data from D30 to D30 (1 bytes)	
A$cursor_manager$499:	
	.db $33
	
; Data from D31 to D33 (3 bytes)	
A$cursor_manager$500:	
	.db $DD $7E $FE
	
; Data from D34 to D34 (1 bytes)	
A$cursor_manager$501:	
	.db $F5
	
; Data from D35 to D35 (1 bytes)	
A$cursor_manager$502:	
	.db $33
	
; Data from D36 to D38 (3 bytes)	
A$cursor_manager$503:	
	.db $CD $64 $09
	
; Data from D39 to D3A (2 bytes)	
A$cursor_manager$504:	
	.db $DD $F9
	
; Data from D3B to D3C (2 bytes)	
A$cursor_manager$505:	
	.db $DD $E1
	
; Data from D3D to D3D (1 bytes)	
A$cursor_manager$510:	
C$cursor_manager.c$85$1$31:	
XG$engine_cursor_manager_draw$0$:	
	.db $C9
	
; Data from D3E to D40 (3 bytes)	
A$cursor_manager$523:	
C$cursor_manager.c$87$1$31:	
C$cursor_manager.c$89$1$32:	
G$engine_cursor_manager_decX$0$0:	
_engine_cursor_manager_decX:	
	.db $01 $26 $C0
	
; Data from D41 to D41 (1 bytes)	
A$cursor_manager$527:	
C$cursor_manager.c$90$1$32:	
	.db $0A
	
; Data from D42 to D42 (1 bytes)	
A$cursor_manager$528:	
	.db $B7
	
; Data from D43 to D44 (2 bytes)	
A$cursor_manager$529:	
	.db $20 $06
	
; Data from D45 to D46 (2 bytes)	
A$cursor_manager$533:	
C$cursor_manager.c$92$2$33:	
	.db $3E $03
	
; Data from D47 to D47 (1 bytes)	
A$cursor_manager$534:	
	.db $02
	
; Data from D48 to D4A (3 bytes)	
A$cursor_manager$535:	
	.db $C3 $88 $0D
	
; Data from D4B to D4C (2 bytes)	
A$cursor_manager$540:	
C$cursor_manager.c$96$2$34:	
	.db $C6 $FF
	
; Data from D4D to D4D (1 bytes)	
A$cursor_manager$541:	
	.db $02
	
; Data from D4E to D50 (3 bytes)	
A$cursor_manager$549:	
C$cursor_manager.c$100$1$32:	
C$cursor_manager.c$99$1$32:	
XG$engine_cursor_manager_decX$0$:	
	.db $C3 $88 $0D
	
; Data from D51 to D53 (3 bytes)	
A$cursor_manager$562:	
C$cursor_manager.c$101$1$32:	
C$cursor_manager.c$103$1$35:	
G$engine_cursor_manager_incX$0$0:	
_engine_cursor_manager_incX:	
	.db $01 $26 $C0
	
; Data from D54 to D54 (1 bytes)	
A$cursor_manager$566:	
C$cursor_manager.c$104$1$35:	
	.db $0A
	
; Data from D55 to D56 (2 bytes)	
A$cursor_manager$567:	
	.db $FE $03
	
; Data from D57 to D58 (2 bytes)	
A$cursor_manager$568:	
	.db $20 $05
	
; Data from D59 to D59 (1 bytes)	
A$cursor_manager$572:	
C$cursor_manager.c$106$2$36:	
	.db $AF
	
; Data from D5A to D5A (1 bytes)	
A$cursor_manager$573:	
	.db $02
	
; Data from D5B to D5D (3 bytes)	
A$cursor_manager$574:	
	.db $C3 $88 $0D
	
; Data from D5E to D5E (1 bytes)	
A$cursor_manager$579:	
C$cursor_manager.c$110$2$37:	
	.db $3C
	
; Data from D5F to D5F (1 bytes)	
A$cursor_manager$580:	
	.db $02
	
; Data from D60 to D62 (3 bytes)	
A$cursor_manager$588:	
C$cursor_manager.c$113$1$35:	
C$cursor_manager.c$114$1$35:	
XG$engine_cursor_manager_incX$0$:	
	.db $C3 $88 $0D
	
; Data from D63 to D65 (3 bytes)	
A$cursor_manager$604:	
C$cursor_manager.c$115$1$35:	
C$cursor_manager.c$117$1$38:	
C$cursor_manager.c$118$1$38:	
G$engine_cursor_manager_decY$0$0:	
_engine_cursor_manager_decY:	
	.db $01 $27 $C0
	
; Data from D66 to D66 (1 bytes)	
A$cursor_manager$605:	
	.db $0A
	
; Data from D67 to D67 (1 bytes)	
A$cursor_manager$606:	
	.db $B7
	
; Data from D68 to D69 (2 bytes)	
A$cursor_manager$607:	
	.db $20 $06
	
; Data from D6A to D6B (2 bytes)	
A$cursor_manager$611:	
C$cursor_manager.c$120$2$39:	
	.db $3E $02
	
; Data from D6C to D6C (1 bytes)	
A$cursor_manager$612:	
	.db $02
	
; Data from D6D to D6F (3 bytes)	
A$cursor_manager$613:	
	.db $C3 $88 $0D
	
; Data from D70 to D71 (2 bytes)	
A$cursor_manager$618:	
C$cursor_manager.c$124$2$40:	
	.db $C6 $FF
	
; Data from D72 to D72 (1 bytes)	
A$cursor_manager$619:	
	.db $02
	
; Data from D73 to D75 (3 bytes)	
A$cursor_manager$627:	
C$cursor_manager.c$127$1$38:	
C$cursor_manager.c$128$1$38:	
XG$engine_cursor_manager_decY$0$:	
	.db $C3 $88 $0D
	
; Data from D76 to D78 (3 bytes)	
A$cursor_manager$643:	
C$cursor_manager.c$129$1$38:	
C$cursor_manager.c$131$1$41:	
C$cursor_manager.c$132$1$41:	
G$engine_cursor_manager_incY$0$0:	
_engine_cursor_manager_incY:	
	.db $01 $27 $C0
	
; Data from D79 to D79 (1 bytes)	
A$cursor_manager$644:	
	.db $0A
	
; Data from D7A to D7B (2 bytes)	
A$cursor_manager$645:	
	.db $FE $02
	
; Data from D7C to D7D (2 bytes)	
A$cursor_manager$646:	
	.db $20 $05
	
; Data from D7E to D7E (1 bytes)	
A$cursor_manager$650:	
C$cursor_manager.c$134$2$42:	
	.db $AF
	
; Data from D7F to D7F (1 bytes)	
A$cursor_manager$651:	
	.db $02
	
; Data from D80 to D82 (3 bytes)	
A$cursor_manager$652:	
	.db $C3 $88 $0D
	
; Data from D83 to D83 (1 bytes)	
A$cursor_manager$657:	
C$cursor_manager.c$138$2$43:	
	.db $3C
	
; Data from D84 to D84 (1 bytes)	
A$cursor_manager$658:	
	.db $02
	
; Data from D85 to D87 (3 bytes)	
A$cursor_manager$666:	
C$cursor_manager.c$141$1$41:	
C$cursor_manager.c$142$1$41:	
XG$engine_cursor_manager_incY$0$:	
	.db $C3 $88 $0D
	
; Data from D88 to D8A (3 bytes)	
A$cursor_manager$682:	
C$cursor_manager.c$144$1$41:	
C$cursor_manager.c$146$1$44:	
C$cursor_manager.c$147$1$44:	
Fcursor_manager$update_values$0$:	
	.db $01 $DC $11
	
; Data from D8B to D8D (3 bytes)	
A$cursor_manager$683:	
	.db $21 $26 $C0
	
; Data from D8E to D8E (1 bytes)	
A$cursor_manager$684:	
	.db $6E
	
; Data from D8F to D90 (2 bytes)	
A$cursor_manager$685:	
	.db $26 $00
	
; Data from D91 to D91 (1 bytes)	
A$cursor_manager$686:	
	.db $09
	
; Data from D92 to D92 (1 bytes)	
A$cursor_manager$687:	
	.db $4E
	
; Data from D93 to D95 (3 bytes)	
A$cursor_manager$691:	
C$cursor_manager.c$148$1$44:	
	.db $11 $E0 $11
	
; Data from D96 to D98 (3 bytes)	
A$cursor_manager$692:	
	.db $21 $26 $C0
	
; Data from D99 to D99 (1 bytes)	
A$cursor_manager$693:	
	.db $23
	
; Data from D9A to D9A (1 bytes)	
A$cursor_manager$694:	
	.db $6E
	
; Data from D9B to D9C (2 bytes)	
A$cursor_manager$695:	
	.db $26 $00
	
; Data from D9D to D9D (1 bytes)	
A$cursor_manager$696:	
	.db $19
	
; Data from D9E to D9E (1 bytes)	
A$cursor_manager$697:	
	.db $5E
	
; Data from D9F to D9F (1 bytes)	
A$cursor_manager$701:	
C$cursor_manager.c$150$1$44:	
	.db $0D
	
; Data from DA0 to DA0 (1 bytes)	
A$cursor_manager$702:	
	.db $79
	
; Data from DA1 to DA1 (1 bytes)	
A$cursor_manager$703:	
	.db $07
	
; Data from DA2 to DA2 (1 bytes)	
A$cursor_manager$704:	
	.db $07
	
; Data from DA3 to DA3 (1 bytes)	
A$cursor_manager$705:	
	.db $07
	
; Data from DA4 to DA5 (2 bytes)	
A$cursor_manager$706:	
	.db $E6 $F8
	
; Data from DA6 to DA6 (1 bytes)	
A$cursor_manager$707:	
	.db $57
	
; Data from DA7 to DA9 (3 bytes)	
A$cursor_manager$708:	
	.db $21 $28 $C0
	
; Data from DAA to DAA (1 bytes)	
A$cursor_manager$709:	
	.db $72
	
; Data from DAB to DAD (3 bytes)	
A$cursor_manager$713:	
C$cursor_manager.c$151$1$44:	
	.db $01 $29 $C0
	
; Data from DAE to DAE (1 bytes)	
A$cursor_manager$714:	
	.db $1D
	
; Data from DAF to DAF (1 bytes)	
A$cursor_manager$715:	
	.db $7B
	
; Data from DB0 to DB0 (1 bytes)	
A$cursor_manager$716:	
	.db $07
	
; Data from DB1 to DB1 (1 bytes)	
A$cursor_manager$717:	
	.db $07
	
; Data from DB2 to DB2 (1 bytes)	
A$cursor_manager$718:	
	.db $07
	
; Data from DB3 to DB4 (2 bytes)	
A$cursor_manager$719:	
	.db $E6 $F8
	
; Data from DB5 to DB5 (1 bytes)	
A$cursor_manager$720:	
	.db $5F
	
; Data from DB6 to DB6 (1 bytes)	
A$cursor_manager$721:	
	.db $02
	
; Data from DB7 to DB7 (1 bytes)	
A$cursor_manager$725:	
C$cursor_manager.c$154$1$44:	
	.db $14
	
; Data from DB8 to DB8 (1 bytes)	
A$cursor_manager$726:	
	.db $72
	
; Data from DB9 to DB9 (1 bytes)	
A$cursor_manager$730:	
C$cursor_manager.c$155$1$44:	
	.db $1D
	
; Data from DBA to DBA (1 bytes)	
A$cursor_manager$731:	
	.db $7B
	
; Data from DBB to DBB (1 bytes)	
A$cursor_manager$732:	
	.db $02
	
; Data from DBC to DBC (1 bytes)	
A$cursor_manager$737:	
C$cursor_manager.c$156$1$44:	
XFcursor_manager$update_values$0:	
	.db $C9
	
; Data from DBD to DBE (2 bytes)	
A$font_manager$56:	
C$font_manager.c$10$0$0:	
G$engine_font_manager_draw_char$:	
_engine_font_manager_draw_char:	
	.db $DD $E5
	
; Data from DBF to DC2 (4 bytes)	
A$font_manager$57:	
	.db $DD $21 $00 $00
	
; Data from DC3 to DC4 (2 bytes)	
A$font_manager$58:	
	.db $DD $39
	
; Data from DC5 to DC7 (3 bytes)	
A$font_manager$65:	
C$font_manager.c$12$1$0:	
C$font_manager.c$13$1$21:	
	.db $DD $7E $04
	
; Data from DC8 to DC9 (2 bytes)	
A$font_manager$66:	
	.db $C6 $E0
	
; Data from DCA to DCA (1 bytes)	
A$font_manager$67:	
	.db $4F
	
; Data from DCB to DCB (1 bytes)	
A$font_manager$71:	
C$font_manager.c$14$1$21:	
	.db $C5
	
; Data from DCC to DCE (3 bytes)	
A$font_manager$72:	
	.db $DD $66 $06
	
; Data from DCF to DD1 (3 bytes)	
A$font_manager$73:	
	.db $DD $6E $05
	
; Data from DD2 to DD2 (1 bytes)	
A$font_manager$74:	
	.db $E5
	
; Data from DD3 to DD5 (3 bytes)	
A$font_manager$75:	
	.db $CD $23 $09
	
; Data from DD6 to DD6 (1 bytes)	
A$font_manager$76:	
	.db $F1
	
; Data from DD7 to DD7 (1 bytes)	
A$font_manager$77:	
	.db $C1
	
; Data from DD8 to DDA (3 bytes)	
A$font_manager$81:	
C$font_manager.c$15$1$21:	
	.db $21 $B8 $17
	
; Data from DDB to DDB (1 bytes)	
A$font_manager$82:	
	.db $6E
	
; Data from DDC to DDD (2 bytes)	
A$font_manager$83:	
	.db $26 $00
	
; Data from DDE to DDF (2 bytes)	
A$font_manager$84:	
	.db $06 $00
	
; Data from DE0 to DE0 (1 bytes)	
A$font_manager$85:	
	.db $09
	
; Data from DE1 to DE1 (1 bytes)	
A$font_manager$86:	
	.db $E5
	
; Data from DE2 to DE4 (3 bytes)	
A$font_manager$87:	
	.db $CD $4C $09
	
; Data from DE5 to DE5 (1 bytes)	
A$font_manager$88:	
	.db $F1
	
; Data from DE6 to DE7 (2 bytes)	
A$font_manager$89:	
	.db $DD $E1
	
; Data from DE8 to DE8 (1 bytes)	
A$font_manager$94:	
C$font_manager.c$16$1$21:	
XG$engine_font_manager_draw_char:	
	.db $C9
	
; Data from DE9 to DEA (2 bytes)	
A$font_manager$104:	
C$font_manager.c$18$1$21:	
G$engine_font_manager_draw_text$:	
_engine_font_manager_draw_text:	
	.db $DD $E5
	
; Data from DEB to DEE (4 bytes)	
A$font_manager$105:	
	.db $DD $21 $00 $00
	
; Data from DEF to DF0 (2 bytes)	
A$font_manager$106:	
	.db $DD $39
	
; Data from DF1 to DF1 (1 bytes)	
A$font_manager$107:	
	.db $3B
	
; Data from DF2 to DF4 (3 bytes)	
A$font_manager$114:	
C$font_manager.c$20$1$21:	
C$font_manager.c$23$1$23:	
	.db $DD $4E $06
	
; Data from DF5 to DF8 (4 bytes)	
A$font_manager$115:	
	.db $DD $36 $FF $00
	
; Data from DF9 to DFB (3 bytes)	
A$font_manager$117:	
	.db $DD $7E $04
	
; Data from DFC to DFE (3 bytes)	
A$font_manager$118:	
	.db $DD $86 $FF
	
; Data from DFF to DFF (1 bytes)	
A$font_manager$119:	
	.db $5F
	
; Data from E00 to E02 (3 bytes)	
A$font_manager$120:	
	.db $DD $7E $05
	
; Data from E03 to E04 (2 bytes)	
A$font_manager$121:	
	.db $CE $00
	
; Data from E05 to E05 (1 bytes)	
A$font_manager$122:	
	.db $57
	
; Data from E06 to E06 (1 bytes)	
A$font_manager$123:	
	.db $1A
	
; Data from E07 to E07 (1 bytes)	
A$font_manager$124:	
	.db $B7
	
; Data from E08 to E09 (2 bytes)	
A$font_manager$125:	
	.db $28 $2D
	
; Data from E0A to E0B (2 bytes)	
A$font_manager$129:	
C$font_manager.c$25$2$24:	
	.db $C6 $E0
	
; Data from E0C to E0C (1 bytes)	
A$font_manager$130:	
	.db $47
	
; Data from E0D to E0D (1 bytes)	
A$font_manager$134:	
C$font_manager.c$26$2$24:	
	.db $51
	
; Data from E0E to E0E (1 bytes)	
A$font_manager$135:	
	.db $0C
	
; Data from E0F to E11 (3 bytes)	
A$font_manager$136:	
	.db $DD $71 $06
	
; Data from E12 to E12 (1 bytes)	
A$font_manager$137:	
	.db $C5
	
; Data from E13 to E15 (3 bytes)	
A$font_manager$138:	
	.db $DD $7E $07
	
; Data from E16 to E16 (1 bytes)	
A$font_manager$139:	
	.db $F5
	
; Data from E17 to E17 (1 bytes)	
A$font_manager$140:	
	.db $33
	
; Data from E18 to E18 (1 bytes)	
A$font_manager$141:	
	.db $D5
	
; Data from E19 to E19 (1 bytes)	
A$font_manager$142:	
	.db $33
	
; Data from E1A to E1C (3 bytes)	
A$font_manager$143:	
	.db $CD $23 $09
	
; Data from E1D to E1D (1 bytes)	
A$font_manager$144:	
	.db $F1
	
; Data from E1E to E1E (1 bytes)	
A$font_manager$145:	
	.db $C1
	
; Data from E1F to E21 (3 bytes)	
A$font_manager$149:	
C$font_manager.c$27$2$24:	
	.db $21 $B8 $17
	
; Data from E22 to E22 (1 bytes)	
A$font_manager$150:	
	.db $5E
	
; Data from E23 to E24 (2 bytes)	
A$font_manager$151:	
	.db $16 $00
	
; Data from E25 to E25 (1 bytes)	
A$font_manager$152:	
	.db $78
	
; Data from E26 to E26 (1 bytes)	
A$font_manager$153:	
	.db $6F
	
; Data from E27 to E27 (1 bytes)	
A$font_manager$154:	
	.db $17
	
; Data from E28 to E28 (1 bytes)	
A$font_manager$155:	
	.db $9F
	
; Data from E29 to E29 (1 bytes)	
A$font_manager$156:	
	.db $67
	
; Data from E2A to E2A (1 bytes)	
A$font_manager$157:	
	.db $19
	
; Data from E2B to E2B (1 bytes)	
A$font_manager$158:	
	.db $C5
	
; Data from E2C to E2C (1 bytes)	
A$font_manager$159:	
	.db $E5
	
; Data from E2D to E2F (3 bytes)	
A$font_manager$160:	
	.db $CD $4C $09
	
; Data from E30 to E30 (1 bytes)	
A$font_manager$161:	
	.db $F1
	
; Data from E31 to E31 (1 bytes)	
A$font_manager$162:	
	.db $C1
	
; Data from E32 to E34 (3 bytes)	
A$font_manager$166:	
C$font_manager.c$28$2$24:	
	.db $DD $34 $FF
	
; Data from E35 to E36 (2 bytes)	
A$font_manager$167:	
	.db $18 $C2
	
; Data from E37 to E37 (1 bytes)	
A$font_manager$169:	
	.db $33
	
; Data from E38 to E39 (2 bytes)	
A$font_manager$170:	
	.db $DD $E1
	
; Data from E3A to E3A (1 bytes)	
A$font_manager$175:	
C$font_manager.c$30$1$23:	
XG$engine_font_manager_draw_text:	
	.db $C9
	
; Data from E3B to E3C (2 bytes)	
A$font_manager$185:	
C$font_manager.c$32$1$23:	
G$engine_font_manager_draw_data$:	
_engine_font_manager_draw_data:	
	.db $DD $E5
	
; Data from E3D to E40 (4 bytes)	
A$font_manager$186:	
	.db $DD $21 $00 $00
	
; Data from E41 to E42 (2 bytes)	
A$font_manager$187:	
	.db $DD $39
	
; Data from E43 to E43 (1 bytes)	
A$font_manager$188:	
	.db $F5
	
; Data from E44 to E46 (3 bytes)	
A$font_manager$195:	
C$font_manager.c$34$1$23:	
	.db $DD $7E $06
	
; Data from E47 to E49 (3 bytes)	
A$font_manager$196:	
	.db $DD $77 $FF
	
; Data from E4A to E4D (4 bytes)	
A$font_manager$197:	
	.db $DD $36 $FE $00
	
; Data from E4E to E50 (3 bytes)	
A$font_manager$202:	
C$font_manager.c$45$2$27:	
	.db $21 $0A $00
	
; Data from E51 to E51 (1 bytes)	
A$font_manager$203:	
	.db $E5
	
; Data from E52 to E54 (3 bytes)	
A$font_manager$204:	
	.db $DD $6E $04
	
; Data from E55 to E57 (3 bytes)	
A$font_manager$205:	
	.db $DD $66 $05
	
; Data from E58 to E58 (1 bytes)	
A$font_manager$206:	
	.db $E5
	
; Data from E59 to E5B (3 bytes)	
A$font_manager$207:	
	.db $CD $65 $1B
	
; Data from E5C to E5C (1 bytes)	
A$font_manager$208:	
	.db $F1
	
; Data from E5D to E5D (1 bytes)	
A$font_manager$209:	
	.db $F1
	
; Data from E5E to E5E (1 bytes)	
A$font_manager$210:	
	.db $5D
	
; Data from E5F to E5F (1 bytes)	
A$font_manager$211:	
	.db $54
	
; Data from E60 to E60 (1 bytes)	
A$font_manager$215:	
C$font_manager.c$46$2$27:	
	.db $E5
	
; Data from E61 to E61 (1 bytes)	
A$font_manager$216:	
	.db $D5
	
; Data from E62 to E64 (3 bytes)	
A$font_manager$217:	
	.db $01 $0A $00
	
; Data from E65 to E65 (1 bytes)	
A$font_manager$218:	
	.db $C5
	
; Data from E66 to E68 (3 bytes)	
A$font_manager$219:	
	.db $DD $4E $04
	
; Data from E69 to E6B (3 bytes)	
A$font_manager$220:	
	.db $DD $46 $05
	
; Data from E6C to E6C (1 bytes)	
A$font_manager$221:	
	.db $C5
	
; Data from E6D to E6F (3 bytes)	
A$font_manager$222:	
	.db $CD $FA $1E
	
; Data from E70 to E70 (1 bytes)	
A$font_manager$223:	
	.db $F1
	
; Data from E71 to E71 (1 bytes)	
A$font_manager$224:	
	.db $F1
	
; Data from E72 to E72 (1 bytes)	
A$font_manager$225:	
	.db $45
	
; Data from E73 to E73 (1 bytes)	
A$font_manager$226:	
	.db $D1
	
; Data from E74 to E74 (1 bytes)	
A$font_manager$227:	
	.db $E1
	
; Data from E75 to E77 (3 bytes)	
A$font_manager$231:	
C$font_manager.c$49$3$28:	
	.db $DD $75 $04
	
; Data from E78 to E7A (3 bytes)	
A$font_manager$232:	
	.db $DD $74 $05
	
; Data from E7B to E7B (1 bytes)	
A$font_manager$236:	
C$font_manager.c$52$3$28:	
	.db $78
	
; Data from E7C to E7D (2 bytes)	
A$font_manager$237:	
	.db $C6 $10
	
; Data from E7E to E7E (1 bytes)	
A$font_manager$238:	
	.db $4F
	
; Data from E7F to E7F (1 bytes)	
A$font_manager$242:	
C$font_manager.c$53$3$28:	
	.db $7A
	
; Data from E80 to E80 (1 bytes)	
A$font_manager$243:	
	.db $B3
	
; Data from E81 to E82 (2 bytes)	
A$font_manager$244:	
	.db $20 $0B
	
; Data from E83 to E83 (1 bytes)	
A$font_manager$245:	
	.db $B0
	
; Data from E84 to E85 (2 bytes)	
A$font_manager$246:	
	.db $20 $08
	
; Data from E86 to E88 (3 bytes)	
A$font_manager$247:	
	.db $DD $7E $FE
	
; Data from E89 to E89 (1 bytes)	
A$font_manager$248:	
	.db $B7
	
; Data from E8A to E8B (2 bytes)	
A$font_manager$249:	
	.db $28 $02
	
; Data from E8C to E8D (2 bytes)	
A$font_manager$253:	
C$font_manager.c$56$4$29:	
	.db $0E $00
	
; Data from E8E to E90 (3 bytes)	
A$font_manager$258:	
C$font_manager.c$59$3$28:	
	.db $DD $46 $FF
	
; Data from E91 to E93 (3 bytes)	
A$font_manager$259:	
	.db $DD $35 $FF
	
; Data from E94 to E96 (3 bytes)	
A$font_manager$260:	
	.db $DD $7E $FF
	
; Data from E97 to E99 (3 bytes)	
A$font_manager$261:	
	.db $DD $77 $06
	
; Data from E9A to E9A (1 bytes)	
A$font_manager$262:	
	.db $C5
	
; Data from E9B to E9D (3 bytes)	
A$font_manager$263:	
	.db $DD $7E $07
	
; Data from E9E to E9E (1 bytes)	
A$font_manager$264:	
	.db $F5
	
; Data from E9F to E9F (1 bytes)	
A$font_manager$265:	
	.db $33
	
; Data from EA0 to EA0 (1 bytes)	
A$font_manager$266:	
	.db $C5
	
; Data from EA1 to EA1 (1 bytes)	
A$font_manager$267:	
	.db $33
	
; Data from EA2 to EA4 (3 bytes)	
A$font_manager$268:	
	.db $CD $23 $09
	
; Data from EA5 to EA5 (1 bytes)	
A$font_manager$269:	
	.db $F1
	
; Data from EA6 to EA6 (1 bytes)	
A$font_manager$270:	
	.db $C1
	
; Data from EA7 to EA9 (3 bytes)	
A$font_manager$274:	
C$font_manager.c$60$3$28:	
	.db $21 $B8 $17
	
; Data from EAA to EAA (1 bytes)	
A$font_manager$275:	
	.db $6E
	
; Data from EAB to EAC (2 bytes)	
A$font_manager$276:	
	.db $26 $00
	
; Data from EAD to EAD (1 bytes)	
A$font_manager$277:	
	.db $79
	
; Data from EAE to EAE (1 bytes)	
A$font_manager$278:	
	.db $17
	
; Data from EAF to EAF (1 bytes)	
A$font_manager$279:	
	.db $9F
	
; Data from EB0 to EB0 (1 bytes)	
A$font_manager$280:	
	.db $47
	
; Data from EB1 to EB1 (1 bytes)	
A$font_manager$281:	
	.db $09
	
; Data from EB2 to EB2 (1 bytes)	
A$font_manager$282:	
	.db $E5
	
; Data from EB3 to EB5 (3 bytes)	
A$font_manager$283:	
	.db $CD $4C $09
	
; Data from EB6 to EB6 (1 bytes)	
A$font_manager$284:	
	.db $F1
	
; Data from EB7 to EB9 (3 bytes)	
A$font_manager$288:	
C$font_manager.c$43$2$27:	
	.db $DD $34 $FE
	
; Data from EBA to EBC (3 bytes)	
A$font_manager$289:	
	.db $DD $7E $FE
	
; Data from EBD to EBE (2 bytes)	
A$font_manager$290:	
	.db $D6 $05
	
; Data from EBF to EC0 (2 bytes)	
A$font_manager$291:	
	.db $38 $8D
	
; Data from EC1 to EC2 (2 bytes)	
A$font_manager$292:	
	.db $DD $F9
	
; Data from EC3 to EC4 (2 bytes)	
A$font_manager$293:	
	.db $DD $E1
	
; Data from EC5 to EC5 (1 bytes)	
A$font_manager$298:	
C$font_manager.c$62$2$27:	
XG$engine_font_manager_draw_data:	
	.db $C9
	
A$input_manager$65:	
C$input_manager.c$10$0$0:	
C$input_manager.c$12$1$19:	
G$engine_input_manager_update$0$:	
_engine_input_manager_update:	
		ld hl, (Finput_manager$curr_joypad1$0$0)	; Finput_manager$curr_joypad1$0$0 = $C152
		ld (Finput_manager$prev_joypad1$0$0), hl	; Finput_manager$prev_joypad1$0$0 = $C154
		call A$_sms_manager$874
		ld (Finput_manager$curr_joypad1$0$0), hl	; Finput_manager$curr_joypad1$0$0 = $C152
		ret
	
; Data from ED3 to ED5 (3 bytes)	
A$input_manager$89:	
C$input_manager.c$17$1$19:	
C$input_manager.c$19$1$21:	
G$engine_input_manager_hold$0$0:	
_engine_input_manager_hold:	
	.db $21 $02 $00
	
; Data from ED6 to ED6 (1 bytes)	
A$input_manager$90:	
	.db $39
	
; Data from ED7 to ED7 (1 bytes)	
A$input_manager$91:	
	.db $4E
	
; Data from ED8 to ED9 (2 bytes)	
A$input_manager$92:	
	.db $06 $00
	
; Data from EDA to EDD (4 bytes)	
A$input_manager$93:	
	.db $FD $21 $52 $C1
	
; Data from EDE to EE0 (3 bytes)	
A$input_manager$94:	
	.db $FD $7E $00
	
; Data from EE1 to EE1 (1 bytes)	
A$input_manager$95:	
	.db $A1
	
; Data from EE2 to EE2 (1 bytes)	
A$input_manager$96:	
	.db $5F
	
; Data from EE3 to EE5 (3 bytes)	
A$input_manager$97:	
	.db $FD $7E $01
	
; Data from EE6 to EE6 (1 bytes)	
A$input_manager$98:	
	.db $A0
	
; Data from EE7 to EE7 (1 bytes)	
A$input_manager$99:	
	.db $B3
	
; Data from EE8 to EE9 (2 bytes)	
A$input_manager$100:	
	.db $28 $10
	
; Data from EEA to EEA (1 bytes)	
A$input_manager$101:	
	.db $79
	
; Data from EEB to EEE (4 bytes)	
A$input_manager$102:	
	.db $FD $21 $54 $C1
	
; Data from EEF to EF1 (3 bytes)	
A$input_manager$103:	
	.db $FD $A6 $00
	
; Data from EF2 to EF2 (1 bytes)	
A$input_manager$104:	
	.db $4F
	
; Data from EF3 to EF3 (1 bytes)	
A$input_manager$105:	
	.db $78
	
; Data from EF4 to EF6 (3 bytes)	
A$input_manager$106:	
	.db $FD $A6 $01
	
; Data from EF7 to EF7 (1 bytes)	
A$input_manager$107:	
	.db $B1
	
; Data from EF8 to EF9 (2 bytes)	
A$input_manager$108:	
	.db $28 $03
	
; Data from EFA to EFB (2 bytes)	
A$input_manager$110:	
	.db $2E $00
	
; Data from EFC to EFC (1 bytes)	
A$input_manager$111:	
	.db $C9
	
; Data from EFD to EFE (2 bytes)	
A$input_manager$113:	
	.db $2E $01
	
; Data from EFF to EFF (1 bytes)	
A$input_manager$118:	
C$input_manager.c$20$1$21:	
XG$engine_input_manager_hold$0$0:	
	.db $C9
	
; Data from F00 to F02 (3 bytes)	
A$input_manager$131:	
C$input_manager.c$22$1$21:	
C$input_manager.c$24$1$23:	
G$engine_input_manager_move$0$0:	
_engine_input_manager_move:	
	.db $21 $02 $00
	
; Data from F03 to F03 (1 bytes)	
A$input_manager$132:	
	.db $39
	
; Data from F04 to F04 (1 bytes)	
A$input_manager$133:	
	.db $4E
	
; Data from F05 to F07 (3 bytes)	
A$input_manager$134:	
	.db $3A $52 $C1
	
; Data from F08 to F08 (1 bytes)	
A$input_manager$135:	
	.db $A1
	
; Data from F09 to F09 (1 bytes)	
A$input_manager$136:	
	.db $6F
	
; Data from F0A to F0A (1 bytes)	
A$input_manager$141:	
C$input_manager.c$25$1$23:	
XG$engine_input_manager_move$0$0:	
	.db $C9
	
; Data from F0B to F0C (2 bytes)	
A$input_manager$154:	
C$input_manager.c$27$1$23:	
C$input_manager.c$29$1$23:	
G$engine_input_manager_direction:	
_engine_input_manager_direction:	
	.db $0E $00
	
; Data from F0D to F0D (1 bytes)	
A$input_manager$158:	
C$input_manager.c$35$1$24:	
	.db $C5
	
; Data from F0E to F0F (2 bytes)	
A$input_manager$159:	
	.db $3E $01
	
; Data from F10 to F10 (1 bytes)	
A$input_manager$160:	
	.db $F5
	
; Data from F11 to F11 (1 bytes)	
A$input_manager$161:	
	.db $33
	
; Data from F12 to F14 (3 bytes)	
A$input_manager$162:	
	.db $CD $00 $0F
	
; Data from F15 to F15 (1 bytes)	
A$input_manager$163:	
	.db $33
	
; Data from F16 to F16 (1 bytes)	
A$input_manager$164:	
	.db $C1
	
; Data from F17 to F17 (1 bytes)	
A$input_manager$165:	
	.db $45
	
; Data from F18 to F18 (1 bytes)	
A$input_manager$169:	
C$input_manager.c$36$1$24:	
	.db $C5
	
; Data from F19 to F1A (2 bytes)	
A$input_manager$170:	
	.db $3E $02
	
; Data from F1B to F1B (1 bytes)	
A$input_manager$171:	
	.db $F5
	
; Data from F1C to F1C (1 bytes)	
A$input_manager$172:	
	.db $33
	
; Data from F1D to F1F (3 bytes)	
A$input_manager$173:	
	.db $CD $00 $0F
	
; Data from F20 to F20 (1 bytes)	
A$input_manager$174:	
	.db $33
	
; Data from F21 to F21 (1 bytes)	
A$input_manager$175:	
	.db $5D
	
; Data from F22 to F22 (1 bytes)	
A$input_manager$176:	
	.db $D5
	
; Data from F23 to F24 (2 bytes)	
A$input_manager$177:	
	.db $3E $04
	
; Data from F25 to F25 (1 bytes)	
A$input_manager$178:	
	.db $F5
	
; Data from F26 to F26 (1 bytes)	
A$input_manager$179:	
	.db $33
	
; Data from F27 to F29 (3 bytes)	
A$input_manager$180:	
	.db $CD $00 $0F
	
; Data from F2A to F2A (1 bytes)	
A$input_manager$181:	
	.db $33
	
; Data from F2B to F2B (1 bytes)	
A$input_manager$182:	
	.db $D1
	
; Data from F2C to F2C (1 bytes)	
A$input_manager$183:	
	.db $C1
	
; Data from F2D to F2D (1 bytes)	
A$input_manager$184:	
	.db $55
	
; Data from F2E to F2E (1 bytes)	
A$input_manager$188:	
C$input_manager.c$38$1$24:	
	.db $C5
	
; Data from F2F to F2F (1 bytes)	
A$input_manager$189:	
	.db $D5
	
; Data from F30 to F31 (2 bytes)	
A$input_manager$190:	
	.db $3E $08
	
; Data from F32 to F32 (1 bytes)	
A$input_manager$191:	
	.db $F5
	
; Data from F33 to F33 (1 bytes)	
A$input_manager$192:	
	.db $33
	
; Data from F34 to F36 (3 bytes)	
A$input_manager$193:	
	.db $CD $00 $0F
	
; Data from F37 to F37 (1 bytes)	
A$input_manager$194:	
	.db $33
	
; Data from F38 to F38 (1 bytes)	
A$input_manager$195:	
	.db $D1
	
; Data from F39 to F39 (1 bytes)	
A$input_manager$196:	
	.db $C1
	
; Data from F3A to F3A (1 bytes)	
A$input_manager$200:	
C$input_manager.c$41$1$24:	
	.db $78
	
; Data from F3B to F3B (1 bytes)	
A$input_manager$201:	
	.db $B7
	
; Data from F3C to F3D (2 bytes)	
A$input_manager$202:	
	.db $28 $04
	
; Data from F3E to F3E (1 bytes)	
A$input_manager$203:	
	.db $7A
	
; Data from F3F to F3F (1 bytes)	
A$input_manager$204:	
	.db $B7
	
; Data from F40 to F41 (2 bytes)	
A$input_manager$205:	
	.db $20 $18
	
; Data from F42 to F42 (1 bytes)	
A$input_manager$207:	
	.db $7B
	
; Data from F43 to F43 (1 bytes)	
A$input_manager$208:	
	.db $B7
	
; Data from F44 to F45 (2 bytes)	
A$input_manager$209:	
	.db $28 $04
	
; Data from F46 to F46 (1 bytes)	
A$input_manager$210:	
	.db $7A
	
; Data from F47 to F47 (1 bytes)	
A$input_manager$211:	
	.db $B7
	
; Data from F48 to F49 (2 bytes)	
A$input_manager$212:	
	.db $20 $10
	
; Data from F4A to F4A (1 bytes)	
A$input_manager$214:	
	.db $78
	
; Data from F4B to F4B (1 bytes)	
A$input_manager$215:	
	.db $B7
	
; Data from F4C to F4D (2 bytes)	
A$input_manager$216:	
	.db $28 $04
	
; Data from F4E to F4E (1 bytes)	
A$input_manager$217:	
	.db $7D
	
; Data from F4F to F4F (1 bytes)	
A$input_manager$218:	
	.db $B7
	
; Data from F50 to F51 (2 bytes)	
A$input_manager$219:	
	.db $20 $08
	
; Data from F52 to F52 (1 bytes)	
A$input_manager$221:	
	.db $7B
	
; Data from F53 to F53 (1 bytes)	
A$input_manager$222:	
	.db $B7
	
; Data from F54 to F55 (2 bytes)	
A$input_manager$223:	
	.db $28 $07
	
; Data from F56 to F56 (1 bytes)	
A$input_manager$224:	
	.db $7D
	
; Data from F57 to F57 (1 bytes)	
A$input_manager$225:	
	.db $B7
	
; Data from F58 to F59 (2 bytes)	
A$input_manager$226:	
	.db $28 $03
	
; Data from F5A to F5B (2 bytes)	
A$input_manager$231:	
C$input_manager.c$43$2$25:	
	.db $2E $00
	
; Data from F5C to F5C (1 bytes)	
A$input_manager$232:	
	.db $C9
	
; Data from F5D to F5D (1 bytes)	
A$input_manager$237:	
C$input_manager.c$47$2$26:	
	.db $78
	
; Data from F5E to F5E (1 bytes)	
A$input_manager$238:	
	.db $B7
	
; Data from F5F to F60 (2 bytes)	
A$input_manager$239:	
	.db $28 $04
	
; Data from F61 to F62 (2 bytes)	
A$input_manager$243:	
C$input_manager.c$49$3$27:	
	.db $0E $01
	
; Data from F63 to F64 (2 bytes)	
A$input_manager$244:	
	.db $18 $16
	
; Data from F65 to F65 (1 bytes)	
A$input_manager$249:	
C$input_manager.c$53$3$28:	
	.db $7B
	
; Data from F66 to F66 (1 bytes)	
A$input_manager$250:	
	.db $B7
	
; Data from F67 to F68 (2 bytes)	
A$input_manager$251:	
	.db $28 $04
	
; Data from F69 to F6A (2 bytes)	
A$input_manager$255:	
C$input_manager.c$55$4$29:	
	.db $0E $02
	
; Data from F6B to F6C (2 bytes)	
A$input_manager$256:	
	.db $18 $0E
	
; Data from F6D to F6D (1 bytes)	
A$input_manager$261:	
C$input_manager.c$59$4$30:	
	.db $7A
	
; Data from F6E to F6E (1 bytes)	
A$input_manager$262:	
	.db $B7
	
; Data from F6F to F70 (2 bytes)	
A$input_manager$263:	
	.db $28 $04
	
; Data from F71 to F72 (2 bytes)	
A$input_manager$267:	
C$input_manager.c$61$5$31:	
	.db $0E $04
	
; Data from F73 to F74 (2 bytes)	
A$input_manager$268:	
	.db $18 $06
	
; Data from F75 to F75 (1 bytes)	
A$input_manager$273:	
C$input_manager.c$65$5$32:	
	.db $7D
	
; Data from F76 to F76 (1 bytes)	
A$input_manager$274:	
	.db $B7
	
; Data from F77 to F78 (2 bytes)	
A$input_manager$275:	
	.db $28 $02
	
; Data from F79 to F7A (2 bytes)	
A$input_manager$279:	
C$input_manager.c$67$6$33:	
	.db $0E $08
	
; Data from F7B to F7B (1 bytes)	
A$input_manager$284:	
C$input_manager.c$74$1$24:	
	.db $69
	
; Data from F7C to F7C (1 bytes)	
A$input_manager$289:	
C$input_manager.c$75$1$24:	
XG$engine_input_manager_directio:	
	.db $C9
	
; Data from F7D to F7F (3 bytes)	
A$record_manager$69:	
C$record_manager.c$12$0$0:	
C$record_manager.c$14$1$19:	
C$record_manager.c$15$1$19:	
G$engine_record_manager_init$0$0:	
_engine_record_manager_init:	
	.db $21 $2A $C0
	
; Data from F80 to F83 (4 bytes)	
A$record_manager$70:	
	.db $FD $21 $02 $00
	
; Data from F84 to F85 (2 bytes)	
A$record_manager$71:	
	.db $FD $39
	
; Data from F86 to F88 (3 bytes)	
A$record_manager$72:	
	.db $FD $7E $00
	
; Data from F89 to F89 (1 bytes)	
A$record_manager$73:	
	.db $77
	
; Data from F8A to F8A (1 bytes)	
A$record_manager$78:	
C$record_manager.c$16$1$19:	
XG$engine_record_manager_init$0$:	
	.db $C9
	
; Data from F8B to F8C (2 bytes)	
A$record_manager$88:	
C$record_manager.c$17$1$19:	
G$engine_record_manager_load$0$0:	
_engine_record_manager_load:	
	.db $DD $E5
	
; Data from F8D to F90 (4 bytes)	
A$record_manager$89:	
	.db $DD $21 $00 $00
	
; Data from F91 to F92 (2 bytes)	
A$record_manager$90:	
	.db $DD $39
	
; Data from F93 to F93 (1 bytes)	
A$record_manager$91:	
	.db $3B
	
; Data from F94 to F96 (3 bytes)	
A$record_manager$98:	
C$record_manager.c$19$1$20:	
C$record_manager.c$20$1$20:	
	.db $3A $2A $C0
	
; Data from F97 to F99 (3 bytes)	
A$record_manager$102:	
C$record_manager.c$22$1$20:	
	.db $DD $77 $FF
	
; Data from F9A to F9A (1 bytes)	
A$record_manager$103:	
	.db $6F
	
; Data from F9B to F9C (2 bytes)	
A$record_manager$104:	
	.db $26 $00
	
; Data from F9D to F9D (1 bytes)	
A$record_manager$105:	
	.db $29
	
; Data from F9E to F9E (1 bytes)	
A$record_manager$106:	
	.db $4D
	
; Data from F9F to F9F (1 bytes)	
A$record_manager$107:	
	.db $44
	
; Data from FA0 to FA2 (3 bytes)	
A$record_manager$108:	
	.db $21 $6E $C1
	
; Data from FA3 to FA3 (1 bytes)	
A$record_manager$109:	
	.db $09
	
; Data from FA4 to FA4 (1 bytes)	
A$record_manager$110:	
	.db $5E
	
; Data from FA5 to FA5 (1 bytes)	
A$record_manager$111:	
	.db $23
	
; Data from FA6 to FA6 (1 bytes)	
A$record_manager$112:	
	.db $56
	
; Data from FA7 to FA9 (3 bytes)	
A$record_manager$116:	
C$record_manager.c$23$1$20:	
	.db $21 $86 $C1
	
; Data from FAA to FAA (1 bytes)	
A$record_manager$117:	
	.db $09
	
; Data from FAB to FAB (1 bytes)	
A$record_manager$118:	
	.db $4E
	
; Data from FAC to FAC (1 bytes)	
A$record_manager$119:	
	.db $23
	
; Data from FAD to FAD (1 bytes)	
A$record_manager$120:	
	.db $46
	
; Data from FAE to FB0 (3 bytes)	
A$record_manager$124:	
C$record_manager.c$24$1$20:	
	.db $DD $7E $FF
	
; Data from FB1 to FB2 (2 bytes)	
A$record_manager$125:	
	.db $C6 $1F
	
; Data from FB3 to FB3 (1 bytes)	
A$record_manager$126:	
	.db $6F
	
; Data from FB4 to FB5 (2 bytes)	
A$record_manager$127:	
	.db $3E $00
	
; Data from FB6 to FB7 (2 bytes)	
A$record_manager$128:	
	.db $CE $12
	
; Data from FB8 to FB8 (1 bytes)	
A$record_manager$129:	
	.db $67
	
; Data from FB9 to FB9 (1 bytes)	
A$record_manager$130:	
	.db $66
	
; Data from FBA to FBA (1 bytes)	
A$record_manager$134:	
C$record_manager.c$26$1$20:	
	.db $C5
	
; Data from FBB to FBB (1 bytes)	
A$record_manager$135:	
	.db $D5
	
; Data from FBC to FBC (1 bytes)	
A$record_manager$136:	
	.db $E5
	
; Data from FBD to FBD (1 bytes)	
A$record_manager$137:	
	.db $33
	
; Data from FBE to FC0 (3 bytes)	
A$record_manager$138:	
	.db $CD $31 $08
	
; Data from FC1 to FC1 (1 bytes)	
A$record_manager$139:	
	.db $33
	
; Data from FC2 to FC2 (1 bytes)	
A$record_manager$140:	
	.db $D1
	
; Data from FC3 to FC5 (3 bytes)	
A$record_manager$141:	
	.db $21 $00 $00
	
; Data from FC6 to FC6 (1 bytes)	
A$record_manager$142:	
	.db $E5
	
; Data from FC7 to FC7 (1 bytes)	
A$record_manager$143:	
	.db $D5
	
; Data from FC8 to FCA (3 bytes)	
A$record_manager$144:	
	.db $CD $8E $08
	
; Data from FCB to FCB (1 bytes)	
A$record_manager$145:	
	.db $F1
	
; Data from FCC to FCE (3 bytes)	
A$record_manager$146:	
	.db $21 $00 $00
	
; Data from FCF to FCF (1 bytes)	
A$record_manager$147:	
	.db $E3
	
; Data from FD0 to FD2 (3 bytes)	
A$record_manager$148:	
	.db $CD $A4 $08
	
; Data from FD3 to FD3 (1 bytes)	
A$record_manager$149:	
	.db $F1
	
; Data from FD4 to FD4 (1 bytes)	
A$record_manager$150:	
	.db $F1
	
; Data from FD5 to FD7 (3 bytes)	
A$record_manager$154:	
C$record_manager.c$31$1$20:	
	.db $2A $9E $C1
	
; Data from FD8 to FD8 (1 bytes)	
A$record_manager$155:	
	.db $E5
	
; Data from FD9 to FDB (3 bytes)	
A$record_manager$156:	
	.db $CD $C5 $08
	
; Data from FDC to FDC (1 bytes)	
A$record_manager$157:	
	.db $F1
	
; Data from FDD to FDD (1 bytes)	
A$record_manager$158:	
	.db $33
	
; Data from FDE to FDF (2 bytes)	
A$record_manager$159:	
	.db $DD $E1
	
; Data from FE0 to FE0 (1 bytes)	
A$record_manager$164:	
C$record_manager.c$32$1$20:	
XG$engine_record_manager_load$0$:	
	.db $C9
	
; Data from FE1 to FE3 (3 bytes)	
A$record_manager$177:	
C$record_manager.c$34$1$20:	
C$record_manager.c$36$1$21:	
G$engine_record_manager_decremen:	
_engine_record_manager_decrement:	
	.db $01 $2A $C0
	
; Data from FE4 to FE4 (1 bytes)	
A$record_manager$181:	
C$record_manager.c$37$1$21:	
	.db $0A
	
; Data from FE5 to FE5 (1 bytes)	
A$record_manager$182:	
	.db $B7
	
; Data from FE6 to FE7 (2 bytes)	
A$record_manager$183:	
	.db $20 $04
	
; Data from FE8 to FE9 (2 bytes)	
A$record_manager$187:	
C$record_manager.c$39$2$22:	
	.db $3E $0B
	
; Data from FEA to FEA (1 bytes)	
A$record_manager$188:	
	.db $02
	
; Data from FEB to FEB (1 bytes)	
A$record_manager$189:	
	.db $C9
	
; Data from FEC to FED (2 bytes)	
A$record_manager$194:	
C$record_manager.c$43$2$23:	
	.db $C6 $FF
	
; Data from FEE to FEE (1 bytes)	
A$record_manager$195:	
	.db $02
	
; Data from FEF to FEF (1 bytes)	
A$record_manager$200:	
C$record_manager.c$45$1$21:	
XG$engine_record_manager_decreme:	
	.db $C9
	
; Data from FF0 to FF2 (3 bytes)	
A$record_manager$213:	
C$record_manager.c$46$1$21:	
C$record_manager.c$48$1$24:	
G$engine_record_manager_incremen:	
_engine_record_manager_increment:	
	.db $01 $2A $C0
	
; Data from FF3 to FF3 (1 bytes)	
A$record_manager$217:	
C$record_manager.c$49$1$24:	
	.db $0A
	
; Data from FF4 to FF5 (2 bytes)	
A$record_manager$218:	
	.db $FE $0B
	
; Data from FF6 to FF7 (2 bytes)	
A$record_manager$219:	
	.db $20 $03
	
; Data from FF8 to FF8 (1 bytes)	
A$record_manager$223:	
C$record_manager.c$51$2$25:	
	.db $AF
	
; Data from FF9 to FF9 (1 bytes)	
A$record_manager$224:	
	.db $02
	
; Data from FFA to FFA (1 bytes)	
A$record_manager$225:	
	.db $C9
	
; Data from FFB to FFB (1 bytes)	
A$record_manager$230:	
C$record_manager.c$55$2$26:	
	.db $3C
	
; Data from FFC to FFC (1 bytes)	
A$record_manager$231:	
	.db $02
	
; Data from FFD to FFD (1 bytes)	
A$record_manager$236:	
C$record_manager.c$57$1$24:	
XG$engine_record_manager_increme:	
	.db $C9
	
A$screen_manager$86:	
C$screen_manager.c$22$0$0:	
C$screen_manager.c$24$1$13:	
G$engine_screen_manager_init$0$0:	
_engine_screen_manager_init:	
		ld hl, $0002
		add hl, sp
		ld a, (hl)
		ld (Fscreen_manager$next_screen_type), a	; Fscreen_manager$next_screen_type = $C02C
		ld hl, Fscreen_manager$curr_screen_type	; Fscreen_manager$curr_screen_type = $C02B
		ld (hl), $00
		ld hl, A$none_screen$60	; A$none_screen$60 = $122B
		ld (Fscreen_manager$load_method$0$0), hl	; Fscreen_manager$load_method$0$0 = $C02D
		ld hl, A$splash_screen$69	; A$splash_screen$69 = $1233
		ld (Fscreen_manager$load_method$0$0 + 2), hl	; Fscreen_manager$load_method$0$0 + 2 = $C02F
		ld hl, A$title_screen$81	; A$title_screen$81 = $12B6
		ld (_RAM_C031_), hl
		ld hl, A$scroll_screen$62	; A$scroll_screen$62 = $141F
		ld (_RAM_C033_), hl
		ld hl, A$select_screen$86	; A$select_screen$86 = $1480
		ld (_RAM_C035_), hl
		ld hl, A$record_screen$71	; A$record_screen$71 = $1578
		ld (_RAM_C037_), hl
		ld hl, A$detail_screen$60	; A$detail_screen$60 = $1605
		ld (_RAM_C039_), hl
		ld hl, A$test_screen$65	; A$test_screen$65 = $160D
		ld (_RAM_C03B_), hl
		ld hl, A$func_screen$62	; A$func_screen$62 = $1655
		ld (_RAM_C03D_), hl
		ld hl, A$none_screen$73	; A$none_screen$73 = $122C
		ld (Fscreen_manager$update_method$0$), hl	; Fscreen_manager$update_method$0$ = $C03F
		ld hl, A$splash_screen$109	; A$splash_screen$109 = $124F
		ld (Fscreen_manager$update_method$0$ + 2), hl	; Fscreen_manager$update_method$0$ + 2 = $C041
		ld hl, A$title_screen$229	; A$title_screen$229 = $1354
		ld (_RAM_C043_), hl
		ld hl, A$scroll_screen$78	; A$scroll_screen$78 = $1425
		ld (_RAM_C045_), hl
		ld hl, A$select_screen$190	; A$select_screen$190 = $14E3
		ld (_RAM_C047_), hl
		ld hl, A$record_screen$89	; A$record_screen$89 = $157E
		ld (_RAM_C049_), hl
		ld hl, A$detail_screen$73	; A$detail_screen$73 = $1606
		ld (_RAM_C04B_), hl
		ld hl, A$test_screen$110	; A$test_screen$110 = $1635
		ld (_RAM_C04D_), hl
		ld hl, A$func_screen$181	; A$func_screen$181 = $16D6
		ld (_RAM_C04F_), hl
		ret
	
A$screen_manager$202:	
C$screen_manager.c$50$1$13:	
C$screen_manager.c$52$1$14:	
G$engine_screen_manager_update$0:	
_engine_screen_manager_update:	
		ld a, (Fscreen_manager$curr_screen_type)	; Fscreen_manager$curr_screen_type = $C02B
		ld iy, Fscreen_manager$next_screen_type	; Fscreen_manager$next_screen_type = $C02C
		sub (iy+0)
		jr z, A$screen_manager$229
		ld a, (iy+0)
		ld iy, Fscreen_manager$curr_screen_type	; Fscreen_manager$curr_screen_type = $C02B
		ld (iy+0), a
		ld bc, Fscreen_manager$load_method$0$0	; Fscreen_manager$load_method$0$0 = $C02D
		ld l, (iy+0)
		ld h, $00
		add hl, hl
		add hl, bc
		ld c, (hl)
		inc hl
		ld h, (hl)
		ld l, c
		call ___sdcc_call_hl
A$screen_manager$229:	
C$screen_manager.c$58$1$14:	
		ld bc, Fscreen_manager$update_method$0$	; Fscreen_manager$update_method$0$ = $C03F
		ld iy, Fscreen_manager$curr_screen_type	; Fscreen_manager$curr_screen_type = $C02B
		ld l, (iy+0)
		ld h, $00
		add hl, hl
		add hl, bc
		ld c, (hl)
		inc hl
		ld b, (hl)
		ld hl, Fscreen_manager$next_screen_type	; Fscreen_manager$next_screen_type = $C02C
		push hl
		ld l, c
		ld h, b
		call ___sdcc_call_hl
		pop af
		ret
	
A$scroll_manager$61:	
C$scroll_manager.c$10$1$18:	
C$scroll_manager.c$8$0$0:	
G$engine_scroll_manager_reset$0$:	
_engine_scroll_manager_reset:	
		xor a
		push af
		inc sp
		call A$scroll_manager$94
		inc sp
		xor a
		push af
		inc sp
		call A$_sms_manager$222
		inc sp
		ret
	
A$scroll_manager$94:	
C$scroll_manager.c$14$1$18:	
C$scroll_manager.c$16$1$20:	
C$scroll_manager.c$17$1$20:	
G$engine_scroll_manager_load$0$0:	
_engine_scroll_manager_load:	
		ld hl, G$global_scroll_object$0$0	; G$global_scroll_object$0$0 = $C051
		ld iy, $0002
		add iy, sp
		ld a, (iy+0)
		ld (hl), a
		ret
	
; Data from 10D8 to 10DA (3 bytes)	
A$storage_manager$65:	
C$storage_manager.c$16$0$0:	
C$storage_manager.c$18$1$18:	
G$engine_storage_manager_availab:	
_engine_storage_manager_availabl:	
	.db $CD $6D $08
	
; Data from 10DB to 10DB (1 bytes)	
A$storage_manager$69:	
C$storage_manager.c$21$1$18:	
	.db $E5
	
; Data from 10DC to 10DE (3 bytes)	
A$storage_manager$70:	
	.db $CD $52 $08
	
; Data from 10DF to 10DF (1 bytes)	
A$storage_manager$71:	
	.db $E1
	
; Data from 10E0 to 10E0 (1 bytes)	
A$storage_manager$75:	
C$storage_manager.c$22$1$18:	
	.db $4E
	
; Data from 10E1 to 10E1 (1 bytes)	
A$storage_manager$76:	
	.db $23
	
; Data from 10E2 to 10E2 (1 bytes)	
A$storage_manager$77:	
	.db $46
	
; Data from 10E3 to 10E3 (1 bytes)	
A$storage_manager$78:	
	.db $23
	
; Data from 10E4 to 10E4 (1 bytes)	
A$storage_manager$79:	
	.db $5E
	
; Data from 10E5 to 10E5 (1 bytes)	
A$storage_manager$80:	
	.db $23
	
; Data from 10E6 to 10E6 (1 bytes)	
A$storage_manager$81:	
	.db $56
	
; Data from 10E7 to 10E7 (1 bytes)	
A$storage_manager$82:	
	.db $79
	
; Data from 10E8 to 10E9 (2 bytes)	
A$storage_manager$83:	
	.db $D6 $04
	
; Data from 10EA to 10EB (2 bytes)	
A$storage_manager$84:	
	.db $20 $13
	
; Data from 10EC to 10EC (1 bytes)	
A$storage_manager$85:	
	.db $78
	
; Data from 10ED to 10EE (2 bytes)	
A$storage_manager$86:	
	.db $D6 $B0
	
; Data from 10EF to 10F0 (2 bytes)	
A$storage_manager$87:	
	.db $20 $0E
	
; Data from 10F1 to 10F1 (1 bytes)	
A$storage_manager$88:	
	.db $7B
	
; Data from 10F2 to 10F3 (2 bytes)	
A$storage_manager$89:	
	.db $D6 $E0
	
; Data from 10F4 to 10F5 (2 bytes)	
A$storage_manager$90:	
	.db $20 $09
	
; Data from 10F6 to 10F6 (1 bytes)	
A$storage_manager$91:	
	.db $7A
	
; Data from 10F7 to 10F8 (2 bytes)	
A$storage_manager$92:	
	.db $D6 $AC
	
; Data from 10F9 to 10FA (2 bytes)	
A$storage_manager$93:	
	.db $20 $04
	
; Data from 10FB to 10FC (2 bytes)	
A$storage_manager$94:	
	.db $3E $01
	
; Data from 10FD to 10FE (2 bytes)	
A$storage_manager$95:	
	.db $18 $01
	
; Data from 10FF to 10FF (1 bytes)	
A$storage_manager$97:	
	.db $AF
	
; Data from 1100 to 1100 (1 bytes)	
A$storage_manager$99:	
	.db $6F
	
; Data from 1101 to 1101 (1 bytes)	
A$storage_manager$103:	
C$storage_manager.c$23$1$18:	
	.db $E5
	
; Data from 1102 to 1104 (3 bytes)	
A$storage_manager$104:	
	.db $CD $67 $08
	
; Data from 1105 to 1105 (1 bytes)	
A$storage_manager$105:	
	.db $E1
	
; Data from 1106 to 1106 (1 bytes)	
A$storage_manager$113:	
C$storage_manager.c$24$1$18:	
C$storage_manager.c$25$1$18:	
XG$engine_storage_manager_availa:	
	.db $C9
	
; Data from 1107 to 1109 (3 bytes)	
A$storage_manager$126:	
C$storage_manager.c$27$1$18:	
C$storage_manager.c$29$1$19:	
G$engine_storage_manager_read$0$:	
_engine_storage_manager_read:	
	.db $CD $6D $08
	
; Data from 110A to 110A (1 bytes)	
A$storage_manager$133:	
C$storage_manager.c$30$1$19:	
C$storage_manager.c$32$1$19:	
	.db $E5
	
; Data from 110B to 110D (3 bytes)	
A$storage_manager$134:	
	.db $CD $52 $08
	
; Data from 110E to 110F (2 bytes)	
A$storage_manager$135:	
	.db $FD $E1
	
; Data from 1110 to 1112 (3 bytes)	
A$storage_manager$136:	
	.db $FD $4E $04
	
; Data from 1113 to 1115 (3 bytes)	
A$storage_manager$137:	
	.db $21 $2A $C0
	
; Data from 1116 to 1116 (1 bytes)	
A$storage_manager$138:	
	.db $71
	
; Data from 1117 to 1119 (3 bytes)	
A$storage_manager$146:	
C$storage_manager.c$34$1$19:	
C$storage_manager.c$35$1$19:	
XG$engine_storage_manager_read$0:	
	.db $C3 $67 $08
	
; Data from 111A to 111C (3 bytes)	
A$storage_manager$159:	
C$storage_manager.c$37$1$19:	
C$storage_manager.c$39$1$20:	
G$engine_storage_manager_write$0:	
_engine_storage_manager_write:	
	.db $CD $6D $08
	
; Data from 111D to 111D (1 bytes)	
A$storage_manager$166:	
C$storage_manager.c$40$1$20:	
C$storage_manager.c$42$1$20:	
	.db $E5
	
; Data from 111E to 1120 (3 bytes)	
A$storage_manager$167:	
	.db $CD $52 $08
	
; Data from 1121 to 1121 (1 bytes)	
A$storage_manager$168:	
	.db $C1
	
; Data from 1122 to 1122 (1 bytes)	
A$storage_manager$172:	
C$storage_manager.c$43$1$20:	
	.db $69
	
; Data from 1123 to 1123 (1 bytes)	
A$storage_manager$173:	
	.db $60
	
; Data from 1124 to 1125 (2 bytes)	
A$storage_manager$174:	
	.db $36 $04
	
; Data from 1126 to 1126 (1 bytes)	
A$storage_manager$175:	
	.db $23
	
; Data from 1127 to 1128 (2 bytes)	
A$storage_manager$176:	
	.db $36 $B0
	
; Data from 1129 to 1129 (1 bytes)	
A$storage_manager$177:	
	.db $23
	
; Data from 112A to 112B (2 bytes)	
A$storage_manager$178:	
	.db $36 $E0
	
; Data from 112C to 112C (1 bytes)	
A$storage_manager$179:	
	.db $23
	
; Data from 112D to 112E (2 bytes)	
A$storage_manager$180:	
	.db $36 $AC
	
; Data from 112F to 1131 (3 bytes)	
A$storage_manager$184:	
C$storage_manager.c$44$1$20:	
	.db $21 $04 $00
	
; Data from 1132 to 1132 (1 bytes)	
A$storage_manager$185:	
	.db $09
	
; Data from 1133 to 1133 (1 bytes)	
A$storage_manager$186:	
	.db $EB
	
; Data from 1134 to 1136 (3 bytes)	
A$storage_manager$187:	
	.db $3A $2A $C0
	
; Data from 1137 to 1137 (1 bytes)	
A$storage_manager$188:	
	.db $12
	
; Data from 1138 to 113A (3 bytes)	
A$storage_manager$192:	
C$storage_manager.c$45$1$20:	
	.db $21 $05 $00
	
; Data from 113B to 113B (1 bytes)	
A$storage_manager$193:	
	.db $09
	
; Data from 113C to 113D (2 bytes)	
A$storage_manager$194:	
	.db $36 $FE
	
; Data from 113E to 1140 (3 bytes)	
A$storage_manager$202:	
C$storage_manager.c$46$1$20:	
C$storage_manager.c$47$1$20:	
XG$engine_storage_manager_write$:	
	.db $C3 $67 $08
	
; Data from 1141 to 1143 (3 bytes)	
A$storage_manager$215:	
C$storage_manager.c$49$1$20:	
C$storage_manager.c$51$1$21:	
G$engine_storage_manager_erase$0:	
_engine_storage_manager_erase:	
	.db $CD $6D $08
	
; Data from 1144 to 1144 (1 bytes)	
A$storage_manager$219:	
C$storage_manager.c$53$1$21:	
	.db $E5
	
; Data from 1145 to 1147 (3 bytes)	
A$storage_manager$220:	
	.db $CD $52 $08
	
; Data from 1148 to 1148 (1 bytes)	
A$storage_manager$221:	
	.db $C1
	
; Data from 1149 to 1149 (1 bytes)	
A$storage_manager$225:	
C$storage_manager.c$54$1$21:	
	.db $69
	
; Data from 114A to 114A (1 bytes)	
A$storage_manager$226:	
	.db $60
	
; Data from 114B to 114B (1 bytes)	
A$storage_manager$227:	
	.db $AF
	
; Data from 114C to 114C (1 bytes)	
A$storage_manager$228:	
	.db $77
	
; Data from 114D to 114D (1 bytes)	
A$storage_manager$229:	
	.db $23
	
; Data from 114E to 114E (1 bytes)	
A$storage_manager$230:	
	.db $77
	
; Data from 114F to 114F (1 bytes)	
A$storage_manager$231:	
	.db $23
	
; Data from 1150 to 1150 (1 bytes)	
A$storage_manager$232:	
	.db $AF
	
; Data from 1151 to 1151 (1 bytes)	
A$storage_manager$233:	
	.db $77
	
; Data from 1152 to 1152 (1 bytes)	
A$storage_manager$234:	
	.db $23
	
; Data from 1153 to 1153 (1 bytes)	
A$storage_manager$235:	
	.db $77
	
; Data from 1154 to 1156 (3 bytes)	
A$storage_manager$239:	
C$storage_manager.c$55$1$21:	
	.db $21 $04 $00
	
; Data from 1157 to 1157 (1 bytes)	
A$storage_manager$240:	
	.db $09
	
; Data from 1158 to 1159 (2 bytes)	
A$storage_manager$241:	
	.db $36 $00
	
; Data from 115A to 115C (3 bytes)	
A$storage_manager$245:	
C$storage_manager.c$56$1$21:	
	.db $21 $05 $00
	
; Data from 115D to 115D (1 bytes)	
A$storage_manager$246:	
	.db $09
	
; Data from 115E to 115F (2 bytes)	
A$storage_manager$247:	
	.db $36 $FE
	
; Data from 1160 to 1162 (3 bytes)	
A$storage_manager$255:	
C$storage_manager.c$57$1$21:	
C$storage_manager.c$58$1$21:	
XG$engine_storage_manager_erase$:	
	.db $C3 $67 $08
	
; Data from 1163 to 1165 (3 bytes)	
A$timer_manager$70:	
C$timer_manager.c$11$1$4:	
C$timer_manager.c$12$1$4:	
C$timer_manager.c$9$0$0:	
G$engine_delay_manager_load$0$0:	
_engine_delay_manager_load:	
	.db $21 $58 $C0
	
; Data from 1166 to 1169 (4 bytes)	
A$timer_manager$71:	
	.db $FD $21 $02 $00
	
; Data from 116A to 116B (2 bytes)	
A$timer_manager$72:	
	.db $FD $39
	
; Data from 116C to 116E (3 bytes)	
A$timer_manager$73:	
	.db $FD $7E $00
	
; Data from 116F to 116F (1 bytes)	
A$timer_manager$74:	
	.db $77
	
; Data from 1170 to 1170 (1 bytes)	
A$timer_manager$75:	
	.db $23
	
; Data from 1171 to 1173 (3 bytes)	
A$timer_manager$76:	
	.db $FD $7E $01
	
; Data from 1174 to 1174 (1 bytes)	
A$timer_manager$77:	
	.db $77
	
; Data from 1175 to 1177 (3 bytes)	
A$timer_manager$81:	
C$timer_manager.c$13$1$4:	
	.db $21 $00 $00
	
; Data from 1178 to 117A (3 bytes)	
A$timer_manager$82:	
	.db $22 $5A $C0
	
; Data from 117B to 117B (1 bytes)	
A$timer_manager$87:	
C$timer_manager.c$14$1$4:	
XG$engine_delay_manager_load$0$0:	
	.db $C9
	
; Data from 117C to 117F (4 bytes)	
A$timer_manager$103:	
C$timer_manager.c$15$1$4:	
C$timer_manager.c$17$1$5:	
C$timer_manager.c$20$1$5:	
G$engine_delay_manager_update$0$:	
_engine_delay_manager_update:	
	.db $ED $4B $5A $C0
	
; Data from 1180 to 1180 (1 bytes)	
A$timer_manager$104:	
	.db $03
	
; Data from 1181 to 1184 (4 bytes)	
A$timer_manager$105:	
	.db $ED $43 $5A $C0
	
; Data from 1185 to 1187 (3 bytes)	
A$timer_manager$109:	
C$timer_manager.c$21$1$5:	
	.db $2A $58 $C0
	
; Data from 1188 to 1188 (1 bytes)	
A$timer_manager$110:	
	.db $79
	
; Data from 1189 to 1189 (1 bytes)	
A$timer_manager$111:	
	.db $95
	
; Data from 118A to 118A (1 bytes)	
A$timer_manager$112:	
	.db $78
	
; Data from 118B to 118B (1 bytes)	
A$timer_manager$113:	
	.db $9C
	
; Data from 118C to 118D (2 bytes)	
A$timer_manager$114:	
	.db $3E $00
	
; Data from 118E to 118E (1 bytes)	
A$timer_manager$115:	
	.db $17
	
; Data from 118F to 1190 (2 bytes)	
A$timer_manager$116:	
	.db $EE $01
	
; Data from 1191 to 1191 (1 bytes)	
A$timer_manager$120:	
C$timer_manager.c$22$1$5:	
	.db $4F
	
; Data from 1192 to 1192 (1 bytes)	
A$timer_manager$121:	
	.db $47
	
; Data from 1193 to 1193 (1 bytes)	
A$timer_manager$122:	
	.db $B7
	
; Data from 1194 to 1195 (2 bytes)	
A$timer_manager$123:	
	.db $28 $06
	
; Data from 1196 to 1198 (3 bytes)	
A$timer_manager$127:	
C$timer_manager.c$24$2$6:	
	.db $21 $00 $00
	
; Data from 1199 to 119B (3 bytes)	
A$timer_manager$128:	
	.db $22 $5A $C0
	
; Data from 119C to 119C (1 bytes)	
A$timer_manager$133:	
C$timer_manager.c$27$1$5:	
	.db $68
	
; Data from 119D to 119D (1 bytes)	
A$timer_manager$138:	
C$timer_manager.c$28$1$5:	
XG$engine_delay_manager_update$0:	
	.db $C9
	
; Data from 119E to 11A0 (3 bytes)	
A$timer_manager$154:	
C$timer_manager.c$32$1$5:	
C$timer_manager.c$34$1$8:	
C$timer_manager.c$35$1$8:	
G$engine_reset_manager_load$0$0:	
_engine_reset_manager_load:	
	.db $21 $5C $C0
	
; Data from 11A1 to 11A4 (4 bytes)	
A$timer_manager$155:	
	.db $FD $21 $02 $00
	
; Data from 11A5 to 11A6 (2 bytes)	
A$timer_manager$156:	
	.db $FD $39
	
; Data from 11A7 to 11A9 (3 bytes)	
A$timer_manager$157:	
	.db $FD $7E $00
	
; Data from 11AA to 11AA (1 bytes)	
A$timer_manager$158:	
	.db $77
	
; Data from 11AB to 11AB (1 bytes)	
A$timer_manager$159:	
	.db $23
	
; Data from 11AC to 11AE (3 bytes)	
A$timer_manager$160:	
	.db $FD $7E $01
	
; Data from 11AF to 11AF (1 bytes)	
A$timer_manager$161:	
	.db $77
	
; Data from 11B0 to 11B2 (3 bytes)	
A$timer_manager$169:	
C$timer_manager.c$36$1$8:	
C$timer_manager.c$37$1$8:	
XG$engine_reset_manager_load$0$0:	
	.db $C3 $D5 $11
	
; Data from 11B3 to 11B6 (4 bytes)	
A$timer_manager$185:	
C$timer_manager.c$38$1$8:	
C$timer_manager.c$40$1$9:	
C$timer_manager.c$43$1$9:	
G$engine_reset_manager_update$0$:	
_engine_reset_manager_update:	
	.db $ED $4B $5E $C0
	
; Data from 11B7 to 11B7 (1 bytes)	
A$timer_manager$186:	
	.db $03
	
; Data from 11B8 to 11BB (4 bytes)	
A$timer_manager$187:	
	.db $ED $43 $5E $C0
	
; Data from 11BC to 11BE (3 bytes)	
A$timer_manager$191:	
C$timer_manager.c$44$1$9:	
	.db $2A $5C $C0
	
; Data from 11BF to 11BF (1 bytes)	
A$timer_manager$192:	
	.db $79
	
; Data from 11C0 to 11C0 (1 bytes)	
A$timer_manager$193:	
	.db $95
	
; Data from 11C1 to 11C1 (1 bytes)	
A$timer_manager$194:	
	.db $78
	
; Data from 11C2 to 11C2 (1 bytes)	
A$timer_manager$195:	
	.db $9C
	
; Data from 11C3 to 11C4 (2 bytes)	
A$timer_manager$196:	
	.db $3E $00
	
; Data from 11C5 to 11C5 (1 bytes)	
A$timer_manager$197:	
	.db $17
	
; Data from 11C6 to 11C7 (2 bytes)	
A$timer_manager$198:	
	.db $EE $01
	
; Data from 11C8 to 11C8 (1 bytes)	
A$timer_manager$202:	
C$timer_manager.c$45$1$9:	
	.db $4F
	
; Data from 11C9 to 11C9 (1 bytes)	
A$timer_manager$203:	
	.db $47
	
; Data from 11CA to 11CA (1 bytes)	
A$timer_manager$204:	
	.db $B7
	
; Data from 11CB to 11CC (2 bytes)	
A$timer_manager$205:	
	.db $28 $06
	
; Data from 11CD to 11CF (3 bytes)	
A$timer_manager$209:	
C$timer_manager.c$47$2$10:	
	.db $21 $00 $00
	
; Data from 11D0 to 11D2 (3 bytes)	
A$timer_manager$210:	
	.db $22 $5E $C0
	
; Data from 11D3 to 11D3 (1 bytes)	
A$timer_manager$215:	
C$timer_manager.c$50$1$9:	
	.db $68
	
; Data from 11D4 to 11D4 (1 bytes)	
A$timer_manager$220:	
C$timer_manager.c$51$1$9:	
XG$engine_reset_manager_update$0:	
	.db $C9
	
; Data from 11D5 to 11D7 (3 bytes)	
A$timer_manager$236:	
C$timer_manager.c$52$1$9:	
C$timer_manager.c$54$1$11:	
C$timer_manager.c$55$1$11:	
G$engine_reset_manager_reset$0$0:	
_engine_reset_manager_reset:	
	.db $21 $00 $00
	
; Data from 11D8 to 11DA (3 bytes)	
A$timer_manager$237:	
	.db $22 $5E $C0
	
; Data from 11DB to 11DB (1 bytes)	
A$timer_manager$242:	
C$timer_manager.c$56$1$11:	
XG$engine_reset_manager_reset$0$:	
	.db $C9
	
; Data from 11DC to 11DF (4 bytes)	
G$cursor_gridX$0$0:	
_cursor_gridX:	
	.db $04 $0B $12 $19
	
; Data from 11E0 to 11E2 (3 bytes)	
G$cursor_gridY$0$0:	
_cursor_gridY:	
	.db $10 $13 $16
	
; Data from 11E3 to 11E7 (5 bytes)	
Fcursor_object$__str_0$0$0:	
	.db $31 $39 $37 $38 $00
	
; Data from 11E8 to 11EC (5 bytes)	
Fcursor_object$__str_1$0$0:	
	.db $31 $39 $37 $39 $00
	
; Data from 11ED to 11F1 (5 bytes)	
Fcursor_object$__str_2$0$0:	
	.db $31 $39 $38 $30 $00
	
; Data from 11F2 to 11F6 (5 bytes)	
Fcursor_object$__str_3$0$0:	
	.db $31 $39 $38 $31 $00
	
; Data from 11F7 to 11FB (5 bytes)	
Fcursor_object$__str_4$0$0:	
	.db $31 $39 $38 $32 $00
	
; Data from 11FC to 1200 (5 bytes)	
Fcursor_object$__str_5$0$0:	
	.db $31 $39 $38 $34 $00
	
; Data from 1201 to 1205 (5 bytes)	
Fcursor_object$__str_6$0$0:	
	.db $31 $39 $38 $36 $00
	
; Data from 1206 to 120A (5 bytes)	
Fcursor_object$__str_7$0$0:	
	.db $31 $39 $38 $38 $00
	
; Data from 120B to 120F (5 bytes)	
Fcursor_object$__str_8$0$0:	
	.db $31 $39 $39 $31 $00
	
; Data from 1210 to 1214 (5 bytes)	
Fcursor_object$__str_9$0$0:	
	.db $31 $39 $39 $35 $00
	
; Data from 1215 to 1219 (5 bytes)	
Fcursor_object$__str_10$0$0:	
	.db $31 $39 $39 $38 $00
	
; Data from 121A to 121E (5 bytes)	
Fcursor_object$__str_11$0$0:	
	.db $32 $30 $31 $32 $00
	
; Data from 121F to 122A (12 bytes)	
G$record_tiles_bank$0$0:	
_record_tiles_bank:	
	.db $04 $05 $06 $07 $08 $09 $0A $0B $0C $0D $0E $0F
	
; Data from 122B to 122B (1 bytes)	
A$none_screen$60:	
C$none_screen.c$4$0$0:	
C$none_screen.c$6$0$0:	
G$screen_none_screen_load$0$0:	
XG$screen_none_screen_load$0$0:	
_screen_none_screen_load:	
	.db $C9
	
; Data from 122C to 122C (1 bytes)	
A$none_screen$73:	
C$none_screen.c$10$1$4:	
C$none_screen.c$8$0$0:	
G$screen_none_screen_update$0$0:	
_screen_none_screen_update:	
	.db $D1
	
; Data from 122D to 122D (1 bytes)	
A$none_screen$74:	
	.db $C1
	
; Data from 122E to 122E (1 bytes)	
A$none_screen$75:	
	.db $C5
	
; Data from 122F to 122F (1 bytes)	
A$none_screen$76:	
	.db $D5
	
; Data from 1230 to 1230 (1 bytes)	
A$none_screen$77:	
	.db $AF
	
; Data from 1231 to 1231 (1 bytes)	
A$none_screen$78:	
	.db $02
	
; Data from 1232 to 1232 (1 bytes)	
A$none_screen$83:	
C$none_screen.c$11$1$4:	
XG$screen_none_screen_update$0$0:	
	.db $C9
	
; Data from 1233 to 1235 (3 bytes)	
A$splash_screen$69:	
C$splash_screen.c$14$0$0:	
C$splash_screen.c$16$1$25:	
G$screen_splash_screen_load$0$0:	
_screen_splash_screen_load:	
	.db $CD $2B $08
	
; Data from 1236 to 1238 (3 bytes)	
A$splash_screen$73:	
C$splash_screen.c$17$1$25:	
	.db $CD $A2 $0A
	
; Data from 1239 to 123B (3 bytes)	
A$splash_screen$77:	
C$splash_screen.c$18$1$25:	
	.db $CD $B8 $0A
	
; Data from 123C to 123E (3 bytes)	
A$splash_screen$81:	
C$splash_screen.c$19$1$25:	
	.db $CD $25 $08
	
; Data from 123F to 1241 (3 bytes)	
A$splash_screen$85:	
C$splash_screen.c$21$1$25:	
	.db $21 $96 $00
	
; Data from 1242 to 1242 (1 bytes)	
A$splash_screen$86:	
	.db $E5
	
; Data from 1243 to 1245 (3 bytes)	
A$splash_screen$87:	
	.db $CD $63 $11
	
; Data from 1246 to 1248 (3 bytes)	
A$splash_screen$91:	
C$splash_screen.c$22$1$25:	
	.db $21 $4B $00
	
; Data from 1249 to 1249 (1 bytes)	
A$splash_screen$92:	
	.db $E3
	
; Data from 124A to 124C (3 bytes)	
A$splash_screen$93:	
	.db $CD $9E $11
	
; Data from 124D to 124D (1 bytes)	
A$splash_screen$94:	
	.db $F1
	
; Data from 124E to 124E (1 bytes)	
A$splash_screen$99:	
C$splash_screen.c$23$1$25:	
XG$screen_splash_screen_load$0$0:	
	.db $C9
	
; Data from 124F to 1250 (2 bytes)	
A$splash_screen$109:	
C$splash_screen.c$25$1$25:	
G$screen_splash_screen_update$0$:	
_screen_splash_screen_update:	
	.db $DD $E5
	
; Data from 1251 to 1254 (4 bytes)	
A$splash_screen$110:	
	.db $DD $21 $00 $00
	
; Data from 1255 to 1256 (2 bytes)	
A$splash_screen$111:	
	.db $DD $39
	
; Data from 1257 to 1257 (1 bytes)	
A$splash_screen$112:	
	.db $F5
	
; Data from 1258 to 125A (3 bytes)	
A$splash_screen$116:	
C$splash_screen.c$32$1$27:	
	.db $CD $7C $11
	
; Data from 125B to 125D (3 bytes)	
A$splash_screen$117:	
	.db $DD $75 $FE
	
; Data from 125E to 125F (2 bytes)	
A$splash_screen$121:	
C$splash_screen.c$33$1$27:	
	.db $3E $10
	
; Data from 1260 to 1260 (1 bytes)	
A$splash_screen$122:	
	.db $F5
	
; Data from 1261 to 1261 (1 bytes)	
A$splash_screen$123:	
	.db $33
	
; Data from 1262 to 1264 (3 bytes)	
A$splash_screen$124:	
	.db $CD $D3 $0E
	
; Data from 1265 to 1265 (1 bytes)	
A$splash_screen$125:	
	.db $33
	
; Data from 1266 to 1268 (3 bytes)	
A$splash_screen$126:	
	.db $DD $75 $FF
	
; Data from 1269 to 126A (2 bytes)	
A$splash_screen$130:	
C$splash_screen.c$34$1$27:	
	.db $3E $20
	
; Data from 126B to 126B (1 bytes)	
A$splash_screen$131:	
	.db $F5
	
; Data from 126C to 126C (1 bytes)	
A$splash_screen$132:	
	.db $33
	
; Data from 126D to 126F (3 bytes)	
A$splash_screen$133:	
	.db $CD $00 $0F
	
; Data from 1270 to 1270 (1 bytes)	
A$splash_screen$134:	
	.db $33
	
; Data from 1271 to 1271 (1 bytes)	
A$splash_screen$138:	
C$splash_screen.c$35$1$27:	
	.db $7D
	
; Data from 1272 to 1272 (1 bytes)	
A$splash_screen$139:	
	.db $B7
	
; Data from 1273 to 1274 (2 bytes)	
A$splash_screen$140:	
	.db $28 $1C
	
; Data from 1275 to 1277 (3 bytes)	
A$splash_screen$144:	
C$splash_screen.c$37$2$28:	
	.db $CD $B3 $11
	
; Data from 1278 to 1278 (1 bytes)	
A$splash_screen$148:	
C$splash_screen.c$38$2$28:	
	.db $7D
	
; Data from 1279 to 1279 (1 bytes)	
A$splash_screen$149:	
	.db $B7
	
; Data from 127A to 127B (2 bytes)	
A$splash_screen$150:	
	.db $28 $18
	
; Data from 127C to 127E (3 bytes)	
A$splash_screen$154:	
C$splash_screen.c$40$3$29:	
	.db $CD $41 $11
	
; Data from 127F to 1281 (3 bytes)	
A$splash_screen$158:	
C$splash_screen.c$42$3$29:	
	.db $CD $D5 $11
	
; Data from 1282 to 1284 (3 bytes)	
A$splash_screen$162:	
C$splash_screen.c$43$3$29:	
	.db $21 $1C $17
	
; Data from 1285 to 1285 (1 bytes)	
A$splash_screen$163:	
	.db $E5
	
; Data from 1286 to 1288 (3 bytes)	
A$splash_screen$164:	
	.db $21 $B1 $12
	
; Data from 1289 to 1289 (1 bytes)	
A$splash_screen$165:	
	.db $E5
	
; Data from 128A to 128C (3 bytes)	
A$splash_screen$166:	
	.db $CD $E9 $0D
	
; Data from 128D to 128D (1 bytes)	
A$splash_screen$167:	
	.db $F1
	
; Data from 128E to 128E (1 bytes)	
A$splash_screen$168:	
	.db $F1
	
; Data from 128F to 1290 (2 bytes)	
A$splash_screen$169:	
	.db $18 $03
	
; Data from 1291 to 1293 (3 bytes)	
A$splash_screen$174:	
C$splash_screen.c$48$2$30:	
	.db $CD $D5 $11
	
; Data from 1294 to 1296 (3 bytes)	
A$splash_screen$179:	
C$splash_screen.c$53$1$27:	
	.db $DD $6E $04
	
; Data from 1297 to 1299 (3 bytes)	
A$splash_screen$180:	
	.db $DD $66 $05
	
; Data from 129A to 129C (3 bytes)	
A$splash_screen$184:	
C$splash_screen.c$51$1$27:	
	.db $DD $7E $FE
	
; Data from 129D to 129D (1 bytes)	
A$splash_screen$185:	
	.db $B7
	
; Data from 129E to 129F (2 bytes)	
A$splash_screen$186:	
	.db $20 $06
	
; Data from 12A0 to 12A2 (3 bytes)	
A$splash_screen$187:	
	.db $DD $7E $FF
	
; Data from 12A3 to 12A3 (1 bytes)	
A$splash_screen$188:	
	.db $B7
	
; Data from 12A4 to 12A5 (2 bytes)	
A$splash_screen$189:	
	.db $28 $04
	
; Data from 12A6 to 12A7 (2 bytes)	
A$splash_screen$194:	
C$splash_screen.c$53$2$31:	
	.db $36 $02
	
; Data from 12A8 to 12A9 (2 bytes)	
A$splash_screen$198:	
C$splash_screen.c$54$2$31:	
	.db $18 $02
	
; Data from 12AA to 12AB (2 bytes)	
A$splash_screen$203:	
C$splash_screen.c$57$1$27:	
	.db $36 $01
	
; Data from 12AC to 12AD (2 bytes)	
A$splash_screen$205:	
	.db $DD $F9
	
; Data from 12AE to 12AF (2 bytes)	
A$splash_screen$206:	
	.db $DD $E1
	
; Data from 12B0 to 12B0 (1 bytes)	
A$splash_screen$211:	
C$splash_screen.c$58$1$27:	
XG$screen_splash_screen_update$0:	
	.db $C9
	
; Data from 12B1 to 12B5 (5 bytes)	
Fsplash_screen$__str_0$0$0:	
	.db $35 $31 $35 $30 $00
	
; Data from 12B6 to 12B8 (3 bytes)	
A$title_screen$81:	
C$title_screen.c$20$0$0:	
C$title_screen.c$22$1$28:	
C$title_screen.c$25$1$28:	
G$screen_title_screen_load$0$0:	
_screen_title_screen_load:	
	.db $CD $2B $08
	
; Data from 12B9 to 12BB (3 bytes)	
A$title_screen$85:	
C$title_screen.c$26$1$28:	
	.db $CD $A2 $0A
	
; Data from 12BC to 12BE (3 bytes)	
A$title_screen$89:	
C$title_screen.c$27$1$28:	
	.db $CD $51 $0B
	
; Data from 12BF to 12C1 (3 bytes)	
A$title_screen$93:	
C$title_screen.c$28$1$28:	
	.db $CD $E3 $0A
	
; Data from 12C2 to 12C4 (3 bytes)	
A$title_screen$97:	
C$title_screen.c$29$1$28:	
	.db $21 $0A $15
	
; Data from 12C5 to 12C5 (1 bytes)	
A$title_screen$98:	
	.db $E5
	
; Data from 12C6 to 12C8 (3 bytes)	
A$title_screen$99:	
	.db $21 $35 $13
	
; Data from 12C9 to 12C9 (1 bytes)	
A$title_screen$100:	
	.db $E5
	
; Data from 12CA to 12CC (3 bytes)	
A$title_screen$101:	
	.db $CD $E9 $0D
	
; Data from 12CD to 12CD (1 bytes)	
A$title_screen$102:	
	.db $F1
	
; Data from 12CE to 12D0 (3 bytes)	
A$title_screen$106:	
C$title_screen.c$31$1$28:	
	.db $21 $06 $0C
	
; Data from 12D1 to 12D1 (1 bytes)	
A$title_screen$107:	
	.db $E3
	
; Data from 12D2 to 12D4 (3 bytes)	
A$title_screen$108:	
	.db $21 $41 $13
	
; Data from 12D5 to 12D5 (1 bytes)	
A$title_screen$109:	
	.db $E5
	
; Data from 12D6 to 12D8 (3 bytes)	
A$title_screen$110:	
	.db $CD $E9 $0D
	
; Data from 12D9 to 12D9 (1 bytes)	
A$title_screen$111:	
	.db $F1
	
; Data from 12DA to 12DC (3 bytes)	
A$title_screen$115:	
C$title_screen.c$32$1$28:	
	.db $21 $14 $0C
	
; Data from 12DD to 12DD (1 bytes)	
A$title_screen$116:	
	.db $E3
	
; Data from 12DE to 12E0 (3 bytes)	
A$title_screen$117:	
	.db $21 $48 $13
	
; Data from 12E1 to 12E1 (1 bytes)	
A$title_screen$118:	
	.db $E5
	
; Data from 12E2 to 12E4 (3 bytes)	
A$title_screen$119:	
	.db $CD $E9 $0D
	
; Data from 12E5 to 12E5 (1 bytes)	
A$title_screen$120:	
	.db $F1
	
; Data from 12E6 to 12E8 (3 bytes)	
A$title_screen$124:	
C$title_screen.c$33$1$28:	
	.db $21 $1C $17
	
; Data from 12E9 to 12E9 (1 bytes)	
A$title_screen$125:	
	.db $E3
	
; Data from 12EA to 12EC (3 bytes)	
A$title_screen$126:	
	.db $21 $4F $13
	
; Data from 12ED to 12ED (1 bytes)	
A$title_screen$127:	
	.db $E5
	
; Data from 12EE to 12F0 (3 bytes)	
A$title_screen$128:	
	.db $CD $E9 $0D
	
; Data from 12F1 to 12F1 (1 bytes)	
A$title_screen$129:	
	.db $F1
	
; Data from 12F2 to 12F2 (1 bytes)	
A$title_screen$130:	
	.db $F1
	
; Data from 12F3 to 12F5 (3 bytes)	
A$title_screen$134:	
C$title_screen.c$34$1$28:	
	.db $CD $25 $08
	
; Data from 12F6 to 12F8 (3 bytes)	
A$title_screen$138:	
C$title_screen.c$36$1$28:	
	.db $21 $32 $00
	
; Data from 12F9 to 12F9 (1 bytes)	
A$title_screen$139:	
	.db $E5
	
; Data from 12FA to 12FC (3 bytes)	
A$title_screen$140:	
	.db $CD $63 $11
	
; Data from 12FD to 12FF (3 bytes)	
A$title_screen$144:	
C$title_screen.c$37$1$28:	
	.db $21 $4B $00
	
; Data from 1300 to 1300 (1 bytes)	
A$title_screen$145:	
	.db $E3
	
; Data from 1301 to 1303 (3 bytes)	
A$title_screen$146:	
	.db $CD $9E $11
	
; Data from 1304 to 1304 (1 bytes)	
A$title_screen$147:	
	.db $F1
	
; Data from 1305 to 1305 (1 bytes)	
A$title_screen$151:	
C$title_screen.c$40$1$28:	
	.db $AF
	
; Data from 1306 to 1306 (1 bytes)	
A$title_screen$152:	
	.db $F5
	
; Data from 1307 to 1307 (1 bytes)	
A$title_screen$153:	
	.db $33
	
; Data from 1308 to 130A (3 bytes)	
A$title_screen$154:	
	.db $CD $7D $0F
	
; Data from 130B to 130B (1 bytes)	
A$title_screen$155:	
	.db $33
	
; Data from 130C to 130E (3 bytes)	
A$title_screen$159:	
C$title_screen.c$42$1$28:	
	.db $CD $D8 $10
	
; Data from 130F to 130F (1 bytes)	
A$title_screen$163:	
C$title_screen.c$43$1$28:	
	.db $7D
	
; Data from 1310 to 1310 (1 bytes)	
A$title_screen$164:	
	.db $B7
	
; Data from 1311 to 1312 (2 bytes)	
A$title_screen$165:	
	.db $28 $03
	
; Data from 1313 to 1315 (3 bytes)	
A$title_screen$169:	
C$title_screen.c$45$2$29:	
	.db $CD $07 $11
	
; Data from 1316 to 1318 (3 bytes)	
A$title_screen$174:	
C$title_screen.c$48$1$28:	
	.db $21 $2A $C0
	
; Data from 1319 to 1319 (1 bytes)	
A$title_screen$175:	
	.db $46
	
; Data from 131A to 131A (1 bytes)	
A$title_screen$176:	
	.db $C5
	
; Data from 131B to 131B (1 bytes)	
A$title_screen$177:	
	.db $33
	
; Data from 131C to 131E (3 bytes)	
A$title_screen$178:	
	.db $CD $7D $0F
	
; Data from 131F to 131F (1 bytes)	
A$title_screen$179:	
	.db $33
	
; Data from 1320 to 1322 (3 bytes)	
A$title_screen$183:	
C$title_screen.c$49$1$28:	
	.db $21 $2A $C0
	
; Data from 1323 to 1323 (1 bytes)	
A$title_screen$184:	
	.db $46
	
; Data from 1324 to 1324 (1 bytes)	
A$title_screen$185:	
	.db $C5
	
; Data from 1325 to 1325 (1 bytes)	
A$title_screen$186:	
	.db $33
	
; Data from 1326 to 1328 (3 bytes)	
A$title_screen$187:	
	.db $CD $67 $0B
	
; Data from 1329 to 1329 (1 bytes)	
A$title_screen$188:	
	.db $33
	
; Data from 132A to 132C (3 bytes)	
A$title_screen$192:	
C$title_screen.c$51$1$28:	
	.db $21 $60 $C0
	
; Data from 132D to 132E (2 bytes)	
A$title_screen$193:	
	.db $36 $00
	
; Data from 132F to 1331 (3 bytes)	
A$title_screen$197:	
C$title_screen.c$52$1$28:	
	.db $21 $61 $C0
	
; Data from 1332 to 1333 (2 bytes)	
A$title_screen$198:	
	.db $36 $00
	
; Data from 1334 to 1334 (1 bytes)	
A$title_screen$203:	
C$title_screen.c$53$1$28:	
XG$screen_title_screen_load$0$0:	
	.db $C9
	
; Data from 1335 to 1340 (12 bytes)	
Ftitle_screen$__str_0$0$0:	
	.db $50 $52 $45 $53 $53 $20 $53 $54 $41 $52 $54 $00
	
; Data from 1341 to 1347 (7 bytes)	
Ftitle_screen$__str_1$0$0:	
	.db $52 $45 $43 $4F $52 $44 $00
	
; Data from 1348 to 134E (7 bytes)	
Ftitle_screen$__str_2$0$0:	
	.db $43 $4F $56 $45 $52 $53 $00
	
; Data from 134F to 1353 (5 bytes)	
Ftitle_screen$__str_3$0$0:	
	.db $56 $31 $2E $30 $00
	
; Data from 1354 to 1355 (2 bytes)	
A$title_screen$229:	
C$title_screen.c$55$1$28:	
G$screen_title_screen_update$0$0:	
_screen_title_screen_update:	
	.db $DD $E5
	
; Data from 1356 to 1359 (4 bytes)	
A$title_screen$230:	
	.db $DD $21 $00 $00
	
; Data from 135A to 135B (2 bytes)	
A$title_screen$231:	
	.db $DD $39
	
; Data from 135C to 135C (1 bytes)	
A$title_screen$232:	
	.db $F5
	
; Data from 135D to 135D (1 bytes)	
A$title_screen$233:	
	.db $3B
	
; Data from 135E to 1360 (3 bytes)	
A$title_screen$237:	
C$title_screen.c$69$1$31:	
	.db $DD $7E $04
	
; Data from 1361 to 1363 (3 bytes)	
A$title_screen$238:	
	.db $DD $77 $FE
	
; Data from 1364 to 1366 (3 bytes)	
A$title_screen$239:	
	.db $DD $7E $05
	
; Data from 1367 to 1369 (3 bytes)	
A$title_screen$240:	
	.db $DD $77 $FF
	
; Data from 136A to 136C (3 bytes)	
A$title_screen$244:	
C$title_screen.c$60$1$31:	
	.db $3A $60 $C0
	
; Data from 136D to 136D (1 bytes)	
A$title_screen$245:	
	.db $3D
	
; Data from 136E to 136F (2 bytes)	
A$title_screen$246:	
	.db $20 $36
	
; Data from 1370 to 1372 (3 bytes)	
A$title_screen$250:	
C$title_screen.c$62$2$32:	
	.db $CD $B3 $11
	
; Data from 1373 to 1373 (1 bytes)	
A$title_screen$251:	
	.db $4D
	
; Data from 1374 to 1374 (1 bytes)	
A$title_screen$255:	
C$title_screen.c$63$2$32:	
	.db $79
	
; Data from 1375 to 1375 (1 bytes)	
A$title_screen$256:	
	.db $B7
	
; Data from 1376 to 1377 (2 bytes)	
A$title_screen$257:	
	.db $28 $1B
	
; Data from 1378 to 1378 (1 bytes)	
A$title_screen$261:	
C$title_screen.c$65$3$33:	
	.db $C5
	
; Data from 1379 to 137B (3 bytes)	
A$title_screen$262:	
	.db $21 $0A $15
	
; Data from 137C to 137C (1 bytes)	
A$title_screen$263:	
	.db $E5
	
; Data from 137D to 137F (3 bytes)	
A$title_screen$264:	
	.db $21 $07 $14
	
; Data from 1380 to 1380 (1 bytes)	
A$title_screen$265:	
	.db $E5
	
; Data from 1381 to 1383 (3 bytes)	
A$title_screen$266:	
	.db $CD $E9 $0D
	
; Data from 1384 to 1384 (1 bytes)	
A$title_screen$267:	
	.db $F1
	
; Data from 1385 to 1387 (3 bytes)	
A$title_screen$268:	
	.db $21 $15 $17
	
; Data from 1388 to 1388 (1 bytes)	
A$title_screen$269:	
	.db $E3
	
; Data from 1389 to 138B (3 bytes)	
A$title_screen$270:	
	.db $21 $07 $14
	
; Data from 138C to 138C (1 bytes)	
A$title_screen$271:	
	.db $E5
	
; Data from 138D to 138F (3 bytes)	
A$title_screen$272:	
	.db $CD $E9 $0D
	
; Data from 1390 to 1390 (1 bytes)	
A$title_screen$273:	
	.db $F1
	
; Data from 1391 to 1391 (1 bytes)	
A$title_screen$274:	
	.db $F1
	
; Data from 1392 to 1392 (1 bytes)	
A$title_screen$275:	
	.db $C1
	
; Data from 1393 to 1393 (1 bytes)	
A$title_screen$280:	
C$title_screen.c$69$2$32:	
	.db $79
	
; Data from 1394 to 1394 (1 bytes)	
A$title_screen$281:	
	.db $B7
	
; Data from 1395 to 1396 (2 bytes)	
A$title_screen$282:	
	.db $28 $04
	
; Data from 1397 to 1398 (2 bytes)	
A$title_screen$283:	
	.db $0E $03
	
; Data from 1399 to 139A (2 bytes)	
A$title_screen$284:	
	.db $18 $02
	
; Data from 139B to 139C (2 bytes)	
A$title_screen$286:	
	.db $0E $02
	
; Data from 139D to 139F (3 bytes)	
A$title_screen$288:	
	.db $DD $6E $FE
	
; Data from 13A0 to 13A2 (3 bytes)	
A$title_screen$289:	
	.db $DD $66 $FF
	
; Data from 13A3 to 13A3 (1 bytes)	
A$title_screen$290:	
	.db $71
	
; Data from 13A4 to 13A5 (2 bytes)	
A$title_screen$294:	
C$title_screen.c$70$2$32:	
	.db $18 $5C
	
; Data from 13A6 to 13A8 (3 bytes)	
A$title_screen$299:	
C$title_screen.c$73$1$31:	
	.db $CD $7C $11
	
; Data from 13A9 to 13AB (3 bytes)	
A$title_screen$303:	
C$title_screen.c$74$1$31:	
	.db $DD $75 $FD
	
; Data from 13AC to 13AC (1 bytes)	
A$title_screen$304:	
	.db $7D
	
; Data from 13AD to 13AD (1 bytes)	
A$title_screen$305:	
	.db $B7
	
; Data from 13AE to 13AF (2 bytes)	
A$title_screen$306:	
	.db $28 $29
	
; Data from 13B0 to 13B2 (3 bytes)	
A$title_screen$310:	
C$title_screen.c$76$2$34:	
	.db $21 $61 $C0
	
; Data from 13B3 to 13B4 (2 bytes)	
A$title_screen$311:	
	.db $3E $01
	
; Data from 13B5 to 13B5 (1 bytes)	
A$title_screen$312:	
	.db $96
	
; Data from 13B6 to 13B6 (1 bytes)	
A$title_screen$313:	
	.db $77
	
; Data from 13B7 to 13B9 (3 bytes)	
A$title_screen$317:	
C$title_screen.c$77$2$34:	
	.db $3A $61 $C0
	
; Data from 13BA to 13BA (1 bytes)	
A$title_screen$318:	
	.db $B7
	
; Data from 13BB to 13BC (2 bytes)	
A$title_screen$319:	
	.db $28 $0F
	
; Data from 13BD to 13BF (3 bytes)	
A$title_screen$323:	
C$title_screen.c$79$3$35:	
	.db $21 $0A $15
	
; Data from 13C0 to 13C0 (1 bytes)	
A$title_screen$324:	
	.db $E5
	
; Data from 13C1 to 13C3 (3 bytes)	
A$title_screen$325:	
	.db $21 $07 $14
	
; Data from 13C4 to 13C4 (1 bytes)	
A$title_screen$326:	
	.db $E5
	
; Data from 13C5 to 13C7 (3 bytes)	
A$title_screen$327:	
	.db $CD $E9 $0D
	
; Data from 13C8 to 13C8 (1 bytes)	
A$title_screen$328:	
	.db $F1
	
; Data from 13C9 to 13C9 (1 bytes)	
A$title_screen$329:	
	.db $F1
	
; Data from 13CA to 13CB (2 bytes)	
A$title_screen$330:	
	.db $18 $0D
	
; Data from 13CC to 13CE (3 bytes)	
A$title_screen$335:	
C$title_screen.c$83$3$36:	
	.db $21 $0A $15
	
; Data from 13CF to 13CF (1 bytes)	
A$title_screen$336:	
	.db $E5
	
; Data from 13D0 to 13D2 (3 bytes)	
A$title_screen$337:	
	.db $21 $13 $14
	
; Data from 13D3 to 13D3 (1 bytes)	
A$title_screen$338:	
	.db $E5
	
; Data from 13D4 to 13D6 (3 bytes)	
A$title_screen$339:	
	.db $CD $E9 $0D
	
; Data from 13D7 to 13D7 (1 bytes)	
A$title_screen$340:	
	.db $F1
	
; Data from 13D8 to 13D8 (1 bytes)	
A$title_screen$341:	
	.db $F1
	
; Data from 13D9 to 13DA (2 bytes)	
A$title_screen$346:	
C$title_screen.c$87$1$31:	
	.db $3E $10
	
; Data from 13DB to 13DB (1 bytes)	
A$title_screen$347:	
	.db $F5
	
; Data from 13DC to 13DC (1 bytes)	
A$title_screen$348:	
	.db $33
	
; Data from 13DD to 13DF (3 bytes)	
A$title_screen$349:	
	.db $CD $D3 $0E
	
; Data from 13E0 to 13E0 (1 bytes)	
A$title_screen$350:	
	.db $33
	
; Data from 13E1 to 13E1 (1 bytes)	
A$title_screen$354:	
C$title_screen.c$88$1$31:	
	.db $7D
	
; Data from 13E2 to 13E2 (1 bytes)	
A$title_screen$355:	
	.db $B7
	
; Data from 13E3 to 13E4 (2 bytes)	
A$title_screen$356:	
	.db $28 $15
	
; Data from 13E5 to 13E7 (3 bytes)	
A$title_screen$360:	
C$title_screen.c$90$2$37:	
	.db $21 $0A $15
	
; Data from 13E8 to 13E8 (1 bytes)	
A$title_screen$361:	
	.db $E5
	
; Data from 13E9 to 13EB (3 bytes)	
A$title_screen$362:	
	.db $21 $13 $14
	
; Data from 13EC to 13EC (1 bytes)	
A$title_screen$363:	
	.db $E5
	
; Data from 13ED to 13EF (3 bytes)	
A$title_screen$364:	
	.db $CD $E9 $0D
	
; Data from 13F0 to 13F0 (1 bytes)	
A$title_screen$365:	
	.db $F1
	
; Data from 13F1 to 13F1 (1 bytes)	
A$title_screen$366:	
	.db $F1
	
; Data from 13F2 to 13F4 (3 bytes)	
A$title_screen$370:	
C$title_screen.c$91$2$37:	
	.db $CD $70 $0A
	
; Data from 13F5 to 13F7 (3 bytes)	
A$title_screen$374:	
C$title_screen.c$93$2$37:	
	.db $21 $60 $C0
	
; Data from 13F8 to 13F9 (2 bytes)	
A$title_screen$375:	
	.db $36 $01
	
; Data from 13FA to 13FC (3 bytes)	
A$title_screen$380:	
C$title_screen.c$96$1$31:	
	.db $DD $6E $FE
	
; Data from 13FD to 13FF (3 bytes)	
A$title_screen$381:	
	.db $DD $66 $FF
	
; Data from 1400 to 1401 (2 bytes)	
A$title_screen$382:	
	.db $36 $02
	
; Data from 1402 to 1403 (2 bytes)	
A$title_screen$384:	
	.db $DD $F9
	
; Data from 1404 to 1405 (2 bytes)	
A$title_screen$385:	
	.db $DD $E1
	
; Data from 1406 to 1406 (1 bytes)	
A$title_screen$390:	
C$title_screen.c$97$1$31:	
XG$screen_title_screen_update$0$:	
	.db $C9
	
; Data from 1407 to 1412 (12 bytes)	
Ftitle_screen$__str_4$0$0:	
	.dsb 11, $20
	.db $00
	
; Data from 1413 to 141E (12 bytes)	
Ftitle_screen$__str_5$0$0:	
	.db $50 $52 $45 $53 $53 $20 $53 $54 $41 $52 $54 $00
	
; Data from 141F to 1421 (3 bytes)	
A$scroll_screen$62:	
C$scroll_screen.c$14$0$0:	
C$scroll_screen.c$16$1$24:	
G$screen_scroll_screen_load$0$0:	
_screen_scroll_screen_load:	
	.db $21 $62 $C0
	
; Data from 1422 to 1423 (2 bytes)	
A$scroll_screen$63:	
	.db $36 $00
	
; Data from 1424 to 1424 (1 bytes)	
A$scroll_screen$68:	
C$scroll_screen.c$17$1$24:	
XG$screen_scroll_screen_load$0$0:	
	.db $C9
	
; Data from 1425 to 1425 (1 bytes)	
A$scroll_screen$78:	
C$scroll_screen.c$19$1$24:	
G$screen_scroll_screen_update$0$:	
_screen_scroll_screen_update:	
	.db $3B
	
; Data from 1426 to 1428 (3 bytes)	
A$scroll_screen$82:	
C$scroll_screen.c$24$1$26:	
	.db $3A $62 $C0
	
; Data from 1429 to 142A (2 bytes)	
A$scroll_screen$83:	
	.db $D6 $20
	
; Data from 142B to 142C (2 bytes)	
A$scroll_screen$84:	
	.db $20 $04
	
; Data from 142D to 142E (2 bytes)	
A$scroll_screen$85:	
	.db $3E $01
	
; Data from 142F to 1430 (2 bytes)	
A$scroll_screen$86:	
	.db $18 $01
	
; Data from 1431 to 1431 (1 bytes)	
A$scroll_screen$88:	
	.db $AF
	
; Data from 1432 to 1432 (1 bytes)	
A$scroll_screen$90:	
	.db $33
	
; Data from 1433 to 1433 (1 bytes)	
A$scroll_screen$91:	
	.db $F5
	
; Data from 1434 to 1434 (1 bytes)	
A$scroll_screen$92:	
	.db $33
	
; Data from 1435 to 1438 (4 bytes)	
A$scroll_screen$96:	
C$scroll_screen.c$25$1$26:	
	.db $FD $21 $62 $C0
	
; Data from 1439 to 143B (3 bytes)	
A$scroll_screen$97:	
	.db $FD $46 $00
	
; Data from 143C to 143E (3 bytes)	
A$scroll_screen$98:	
	.db $FD $34 $00
	
; Data from 143F to 143F (1 bytes)	
A$scroll_screen$99:	
	.db $C5
	
; Data from 1440 to 1440 (1 bytes)	
A$scroll_screen$100:	
	.db $33
	
; Data from 1441 to 1443 (3 bytes)	
A$scroll_screen$101:	
	.db $CD $46 $08
	
; Data from 1444 to 1444 (1 bytes)	
A$scroll_screen$102:	
	.db $33
	
; Data from 1445 to 1446 (2 bytes)	
A$scroll_screen$106:	
C$scroll_screen.c$27$1$26:	
	.db $3E $10
	
; Data from 1447 to 1447 (1 bytes)	
A$scroll_screen$107:	
	.db $F5
	
; Data from 1448 to 1448 (1 bytes)	
A$scroll_screen$108:	
	.db $33
	
; Data from 1449 to 144B (3 bytes)	
A$scroll_screen$109:	
	.db $CD $D3 $0E
	
; Data from 144C to 144C (1 bytes)	
A$scroll_screen$110:	
	.db $33
	
; Data from 144D to 144D (1 bytes)	
A$scroll_screen$111:	
	.db $4D
	
; Data from 144E to 1450 (3 bytes)	
A$scroll_screen$115:	
C$scroll_screen.c$33$1$26:	
	.db $21 $03 $00
	
; Data from 1451 to 1451 (1 bytes)	
A$scroll_screen$116:	
	.db $39
	
; Data from 1452 to 1452 (1 bytes)	
A$scroll_screen$117:	
	.db $7E
	
; Data from 1453 to 1453 (1 bytes)	
A$scroll_screen$118:	
	.db $23
	
; Data from 1454 to 1454 (1 bytes)	
A$scroll_screen$119:	
	.db $66
	
; Data from 1455 to 1455 (1 bytes)	
A$scroll_screen$120:	
	.db $6F
	
; Data from 1456 to 1456 (1 bytes)	
A$scroll_screen$124:	
C$scroll_screen.c$28$1$26:	
	.db $79
	
; Data from 1457 to 1457 (1 bytes)	
A$scroll_screen$125:	
	.db $B7
	
; Data from 1458 to 1459 (2 bytes)	
A$scroll_screen$126:	
	.db $20 $0C
	
; Data from 145A to 145D (4 bytes)	
A$scroll_screen$127:	
	.db $FD $21 $00 $00
	
; Data from 145E to 145F (2 bytes)	
A$scroll_screen$128:	
	.db $FD $39
	
; Data from 1460 to 1462 (3 bytes)	
A$scroll_screen$129:	
	.db $FD $7E $00
	
; Data from 1463 to 1463 (1 bytes)	
A$scroll_screen$130:	
	.db $B7
	
; Data from 1464 to 1465 (2 bytes)	
A$scroll_screen$131:	
	.db $28 $16
	
; Data from 1466 to 1466 (1 bytes)	
A$scroll_screen$136:	
C$scroll_screen.c$30$2$27:	
	.db $E5
	
; Data from 1467 to 1468 (2 bytes)	
A$scroll_screen$137:	
	.db $3E $04
	
; Data from 1469 to 1469 (1 bytes)	
A$scroll_screen$138:	
	.db $F5
	
; Data from 146A to 146A (1 bytes)	
A$scroll_screen$139:	
	.db $33
	
; Data from 146B to 146D (3 bytes)	
A$scroll_screen$140:	
	.db $CD $CA $10
	
; Data from 146E to 146E (1 bytes)	
A$scroll_screen$141:	
	.db $33
	
; Data from 146F to 1470 (2 bytes)	
A$scroll_screen$142:	
	.db $3E $20
	
; Data from 1471 to 1471 (1 bytes)	
A$scroll_screen$143:	
	.db $F5
	
; Data from 1472 to 1472 (1 bytes)	
A$scroll_screen$144:	
	.db $33
	
; Data from 1473 to 1475 (3 bytes)	
A$scroll_screen$145:	
	.db $CD $46 $08
	
; Data from 1476 to 1476 (1 bytes)	
A$scroll_screen$146:	
	.db $33
	
; Data from 1477 to 1477 (1 bytes)	
A$scroll_screen$147:	
	.db $E1
	
; Data from 1478 to 1479 (2 bytes)	
A$scroll_screen$151:	
C$scroll_screen.c$33$2$27:	
	.db $36 $04
	
; Data from 147A to 147B (2 bytes)	
A$scroll_screen$155:	
C$scroll_screen.c$34$2$27:	
	.db $18 $02
	
; Data from 147C to 147D (2 bytes)	
A$scroll_screen$160:	
C$scroll_screen.c$37$1$26:	
	.db $36 $03
	
; Data from 147E to 147E (1 bytes)	
A$scroll_screen$162:	
	.db $33
	
; Data from 147F to 147F (1 bytes)	
A$scroll_screen$167:	
C$scroll_screen.c$38$1$26:	
XG$screen_scroll_screen_update$0:	
	.db $C9
	
; Data from 1480 to 1482 (3 bytes)	
A$select_screen$86:	
C$select_screen.c$22$0$0:	
C$select_screen.c$24$1$29:	
C$select_screen.c$25$1$29:	
G$screen_select_screen_load$0$0:	
_screen_select_screen_load:	
	.db $3A $51 $C0
	
; Data from 1483 to 1483 (1 bytes)	
A$select_screen$87:	
	.db $B7
	
; Data from 1484 to 1485 (2 bytes)	
A$select_screen$88:	
	.db $20 $2B
	
; Data from 1486 to 1488 (3 bytes)	
A$select_screen$92:	
C$select_screen.c$27$2$30:	
	.db $CD $2B $08
	
; Data from 1489 to 148B (3 bytes)	
A$select_screen$96:	
C$select_screen.c$28$2$30:	
	.db $CD $5A $0A
	
; Data from 148C to 148E (3 bytes)	
A$select_screen$100:	
C$select_screen.c$29$2$30:	
	.db $CD $A2 $0A
	
; Data from 148F to 1491 (3 bytes)	
A$select_screen$104:	
C$select_screen.c$30$2$30:	
	.db $CD $1A $0B
	
; Data from 1492 to 1494 (3 bytes)	
A$select_screen$108:	
C$select_screen.c$31$2$30:	
	.db $CD $51 $0B
	
; Data from 1495 to 1497 (3 bytes)	
A$select_screen$112:	
C$select_screen.c$33$2$30:	
	.db $21 $06 $08
	
; Data from 1498 to 1498 (1 bytes)	
A$select_screen$113:	
	.db $E5
	
; Data from 1499 to 149B (3 bytes)	
A$select_screen$114:	
	.db $21 $D5 $14
	
; Data from 149C to 149C (1 bytes)	
A$select_screen$115:	
	.db $E5
	
; Data from 149D to 149F (3 bytes)	
A$select_screen$116:	
	.db $CD $E9 $0D
	
; Data from 14A0 to 14A0 (1 bytes)	
A$select_screen$117:	
	.db $F1
	
; Data from 14A1 to 14A3 (3 bytes)	
A$select_screen$121:	
C$select_screen.c$34$2$30:	
	.db $21 $14 $08
	
; Data from 14A4 to 14A4 (1 bytes)	
A$select_screen$122:	
	.db $E3
	
; Data from 14A5 to 14A7 (3 bytes)	
A$select_screen$123:	
	.db $21 $DC $14
	
; Data from 14A8 to 14A8 (1 bytes)	
A$select_screen$124:	
	.db $E5
	
; Data from 14A9 to 14AB (3 bytes)	
A$select_screen$125:	
	.db $CD $E9 $0D
	
; Data from 14AC to 14AC (1 bytes)	
A$select_screen$126:	
	.db $F1
	
; Data from 14AD to 14AD (1 bytes)	
A$select_screen$127:	
	.db $F1
	
; Data from 14AE to 14B0 (3 bytes)	
A$select_screen$131:	
C$select_screen.c$35$2$30:	
	.db $CD $25 $08
	
; Data from 14B1 to 14B3 (3 bytes)	
A$select_screen$136:	
C$select_screen.c$38$1$29:	
	.db $21 $51 $C0
	
; Data from 14B4 to 14B4 (1 bytes)	
A$select_screen$137:	
	.db $46
	
; Data from 14B5 to 14B5 (1 bytes)	
A$select_screen$138:	
	.db $C5
	
; Data from 14B6 to 14B6 (1 bytes)	
A$select_screen$139:	
	.db $33
	
; Data from 14B7 to 14B9 (3 bytes)	
A$select_screen$140:	
	.db $CD $9B $0B
	
; Data from 14BA to 14BA (1 bytes)	
A$select_screen$141:	
	.db $33
	
; Data from 14BB to 14BD (3 bytes)	
A$select_screen$145:	
C$select_screen.c$40$1$29:	
	.db $21 $0F $00
	
; Data from 14BE to 14BE (1 bytes)	
A$select_screen$146:	
	.db $E5
	
; Data from 14BF to 14C1 (3 bytes)	
A$select_screen$147:	
	.db $CD $63 $11
	
; Data from 14C2 to 14C4 (3 bytes)	
A$select_screen$151:	
C$select_screen.c$41$1$29:	
	.db $21 $4B $00
	
; Data from 14C5 to 14C5 (1 bytes)	
A$select_screen$152:	
	.db $E3
	
; Data from 14C6 to 14C8 (3 bytes)	
A$select_screen$153:	
	.db $CD $9E $11
	
; Data from 14C9 to 14C9 (1 bytes)	
A$select_screen$154:	
	.db $F1
	
; Data from 14CA to 14CC (3 bytes)	
A$select_screen$158:	
C$select_screen.c$43$1$29:	
	.db $21 $63 $C0
	
; Data from 14CD to 14CE (2 bytes)	
A$select_screen$159:	
	.db $36 $00
	
; Data from 14CF to 14D1 (3 bytes)	
A$select_screen$163:	
C$select_screen.c$44$1$29:	
	.db $21 $64 $C0
	
; Data from 14D2 to 14D3 (2 bytes)	
A$select_screen$164:	
	.db $36 $01
	
; Data from 14D4 to 14D4 (1 bytes)	
A$select_screen$169:	
C$select_screen.c$45$1$29:	
XG$screen_select_screen_load$0$0:	
	.db $C9
	
; Data from 14D5 to 14DB (7 bytes)	
Fselect_screen$__str_0$0$0:	
	.db $52 $45 $43 $4F $52 $44 $00
	
; Data from 14DC to 14E2 (7 bytes)	
Fselect_screen$__str_1$0$0:	
	.db $43 $4F $56 $45 $52 $53 $00
	
; Data from 14E3 to 14E5 (3 bytes)	
A$select_screen$190:	
C$select_screen.c$47$1$29:	
C$select_screen.c$54$1$32:	
G$screen_select_screen_update$0$:	
_screen_select_screen_update:	
	.db $3A $63 $C0
	
; Data from 14E6 to 14E6 (1 bytes)	
A$select_screen$191:	
	.db $3D
	
; Data from 14E7 to 14E8 (2 bytes)	
A$select_screen$192:	
	.db $20 $2A
	
; Data from 14E9 to 14EB (3 bytes)	
A$select_screen$196:	
C$select_screen.c$56$2$33:	
	.db $3A $64 $C0
	
; Data from 14EC to 14EC (1 bytes)	
A$select_screen$197:	
	.db $B7
	
; Data from 14ED to 14EE (2 bytes)	
A$select_screen$198:	
	.db $28 $03
	
; Data from 14EF to 14F1 (3 bytes)	
A$select_screen$202:	
C$select_screen.c$58$3$34:	
	.db $CD $13 $0C
	
; Data from 14F2 to 14F4 (3 bytes)	
A$select_screen$207:	
C$select_screen.c$61$2$33:	
	.db $CD $7C $11
	
; Data from 14F5 to 14F5 (1 bytes)	
A$select_screen$211:	
C$select_screen.c$62$2$33:	
	.db $7D
	
; Data from 14F6 to 14F6 (1 bytes)	
A$select_screen$212:	
	.db $B7
	
; Data from 14F7 to 14F8 (2 bytes)	
A$select_screen$213:	
	.db $28 $07
	
; Data from 14F9 to 14FB (3 bytes)	
A$select_screen$217:	
C$select_screen.c$64$3$35:	
	.db $21 $64 $C0
	
; Data from 14FC to 14FD (2 bytes)	
A$select_screen$218:	
	.db $3E $01
	
; Data from 14FE to 14FE (1 bytes)	
A$select_screen$219:	
	.db $96
	
; Data from 14FF to 14FF (1 bytes)	
A$select_screen$220:	
	.db $77
	
; Data from 1500 to 1502 (3 bytes)	
A$select_screen$225:	
C$select_screen.c$67$2$33:	
	.db $CD $B3 $11
	
; Data from 1503 to 1503 (1 bytes)	
A$select_screen$229:	
C$select_screen.c$68$2$33:	
	.db $D1
	
; Data from 1504 to 1504 (1 bytes)	
A$select_screen$230:	
	.db $C1
	
; Data from 1505 to 1505 (1 bytes)	
A$select_screen$231:	
	.db $C5
	
; Data from 1506 to 1506 (1 bytes)	
A$select_screen$232:	
	.db $D5
	
; Data from 1507 to 1507 (1 bytes)	
A$select_screen$233:	
	.db $7D
	
; Data from 1508 to 1508 (1 bytes)	
A$select_screen$234:	
	.db $B7
	
; Data from 1509 to 150A (2 bytes)	
A$select_screen$235:	
	.db $28 $04
	
; Data from 150B to 150C (2 bytes)	
A$select_screen$236:	
	.db $3E $05
	
; Data from 150D to 150E (2 bytes)	
A$select_screen$237:	
	.db $18 $02
	
; Data from 150F to 1510 (2 bytes)	
A$select_screen$239:	
	.db $3E $04
	
; Data from 1511 to 1511 (1 bytes)	
A$select_screen$241:	
	.db $02
	
; Data from 1512 to 1512 (1 bytes)	
A$select_screen$245:	
C$select_screen.c$69$2$33:	
	.db $C9
	
; Data from 1513 to 1515 (3 bytes)	
A$select_screen$250:	
C$select_screen.c$72$1$32:	
	.db $CD $13 $0C
	
; Data from 1516 to 1517 (2 bytes)	
A$select_screen$254:	
C$select_screen.c$74$1$32:	
	.db $3E $10
	
; Data from 1518 to 1518 (1 bytes)	
A$select_screen$255:	
	.db $F5
	
; Data from 1519 to 1519 (1 bytes)	
A$select_screen$256:	
	.db $33
	
; Data from 151A to 151C (3 bytes)	
A$select_screen$257:	
	.db $CD $D3 $0E
	
; Data from 151D to 151D (1 bytes)	
A$select_screen$258:	
	.db $33
	
; Data from 151E to 151E (1 bytes)	
A$select_screen$262:	
C$select_screen.c$75$1$32:	
	.db $7D
	
; Data from 151F to 151F (1 bytes)	
A$select_screen$263:	
	.db $B7
	
; Data from 1520 to 1521 (2 bytes)	
A$select_screen$264:	
	.db $28 $13
	
; Data from 1522 to 1524 (3 bytes)	
A$select_screen$268:	
C$select_screen.c$77$2$36:	
	.db $CD $05 $0C
	
; Data from 1525 to 1525 (1 bytes)	
A$select_screen$269:	
	.db $45
	
; Data from 1526 to 1526 (1 bytes)	
A$select_screen$273:	
C$select_screen.c$78$2$36:	
	.db $C5
	
; Data from 1527 to 1527 (1 bytes)	
A$select_screen$274:	
	.db $33
	
; Data from 1528 to 152A (3 bytes)	
A$select_screen$275:	
	.db $CD $7D $0F
	
; Data from 152B to 152B (1 bytes)	
A$select_screen$276:	
	.db $33
	
; Data from 152C to 152E (3 bytes)	
A$select_screen$280:	
C$select_screen.c$81$2$36:	
	.db $CD $70 $0A
	
; Data from 152F to 1531 (3 bytes)	
A$select_screen$284:	
C$select_screen.c$82$2$36:	
	.db $21 $63 $C0
	
; Data from 1532 to 1533 (2 bytes)	
A$select_screen$285:	
	.db $36 $01
	
; Data from 1534 to 1534 (1 bytes)	
A$select_screen$289:	
C$select_screen.c$83$2$36:	
	.db $C9
	
; Data from 1535 to 1536 (2 bytes)	
A$select_screen$294:	
C$select_screen.c$86$1$32:	
	.db $3E $04
	
; Data from 1537 to 1537 (1 bytes)	
A$select_screen$295:	
	.db $F5
	
; Data from 1538 to 1538 (1 bytes)	
A$select_screen$296:	
	.db $33
	
; Data from 1539 to 153B (3 bytes)	
A$select_screen$297:	
	.db $CD $D3 $0E
	
; Data from 153C to 153C (1 bytes)	
A$select_screen$298:	
	.db $33
	
; Data from 153D to 153D (1 bytes)	
A$select_screen$302:	
C$select_screen.c$87$1$32:	
	.db $7D
	
; Data from 153E to 153E (1 bytes)	
A$select_screen$303:	
	.db $B7
	
; Data from 153F to 1540 (2 bytes)	
A$select_screen$304:	
	.db $28 $03
	
; Data from 1541 to 1543 (3 bytes)	
A$select_screen$308:	
C$select_screen.c$89$2$37:	
	.db $CD $3E $0D
	
; Data from 1544 to 1545 (2 bytes)	
A$select_screen$313:	
C$select_screen.c$91$1$32:	
	.db $3E $08
	
; Data from 1546 to 1546 (1 bytes)	
A$select_screen$314:	
	.db $F5
	
; Data from 1547 to 1547 (1 bytes)	
A$select_screen$315:	
	.db $33
	
; Data from 1548 to 154A (3 bytes)	
A$select_screen$316:	
	.db $CD $D3 $0E
	
; Data from 154B to 154B (1 bytes)	
A$select_screen$317:	
	.db $33
	
; Data from 154C to 154C (1 bytes)	
A$select_screen$321:	
C$select_screen.c$92$1$32:	
	.db $7D
	
; Data from 154D to 154D (1 bytes)	
A$select_screen$322:	
	.db $B7
	
; Data from 154E to 154F (2 bytes)	
A$select_screen$323:	
	.db $28 $03
	
; Data from 1550 to 1552 (3 bytes)	
A$select_screen$327:	
C$select_screen.c$94$2$38:	
	.db $CD $51 $0D
	
; Data from 1553 to 1554 (2 bytes)	
A$select_screen$332:	
C$select_screen.c$96$1$32:	
	.db $3E $01
	
; Data from 1555 to 1555 (1 bytes)	
A$select_screen$333:	
	.db $F5
	
; Data from 1556 to 1556 (1 bytes)	
A$select_screen$334:	
	.db $33
	
; Data from 1557 to 1559 (3 bytes)	
A$select_screen$335:	
	.db $CD $D3 $0E
	
; Data from 155A to 155A (1 bytes)	
A$select_screen$336:	
	.db $33
	
; Data from 155B to 155B (1 bytes)	
A$select_screen$340:	
C$select_screen.c$97$1$32:	
	.db $7D
	
; Data from 155C to 155C (1 bytes)	
A$select_screen$341:	
	.db $B7
	
; Data from 155D to 155E (2 bytes)	
A$select_screen$342:	
	.db $28 $03
	
; Data from 155F to 1561 (3 bytes)	
A$select_screen$346:	
C$select_screen.c$99$2$39:	
	.db $CD $63 $0D
	
; Data from 1562 to 1563 (2 bytes)	
A$select_screen$351:	
C$select_screen.c$101$1$32:	
	.db $3E $02
	
; Data from 1564 to 1564 (1 bytes)	
A$select_screen$352:	
	.db $F5
	
; Data from 1565 to 1565 (1 bytes)	
A$select_screen$353:	
	.db $33
	
; Data from 1566 to 1568 (3 bytes)	
A$select_screen$354:	
	.db $CD $D3 $0E
	
; Data from 1569 to 1569 (1 bytes)	
A$select_screen$355:	
	.db $33
	
; Data from 156A to 156A (1 bytes)	
A$select_screen$359:	
C$select_screen.c$102$1$32:	
	.db $7D
	
; Data from 156B to 156B (1 bytes)	
A$select_screen$360:	
	.db $B7
	
; Data from 156C to 156D (2 bytes)	
A$select_screen$361:	
	.db $28 $03
	
; Data from 156E to 1570 (3 bytes)	
A$select_screen$365:	
C$select_screen.c$104$2$40:	
	.db $CD $76 $0D
	
; Data from 1571 to 1571 (1 bytes)	
A$select_screen$370:	
C$select_screen.c$107$1$32:	
	.db $C1
	
; Data from 1572 to 1572 (1 bytes)	
A$select_screen$371:	
	.db $E1
	
; Data from 1573 to 1573 (1 bytes)	
A$select_screen$372:	
	.db $E5
	
; Data from 1574 to 1574 (1 bytes)	
A$select_screen$373:	
	.db $C5
	
; Data from 1575 to 1576 (2 bytes)	
A$select_screen$374:	
	.db $36 $04
	
; Data from 1577 to 1577 (1 bytes)	
A$select_screen$379:	
C$select_screen.c$108$1$32:	
XG$screen_select_screen_update$0:	
	.db $C9
	
; Data from 1578 to 157A (3 bytes)	
A$record_screen$71:	
C$record_screen.c$16$0$0:	
C$record_screen.c$18$1$29:	
G$screen_record_screen_load$0$0:	
_screen_record_screen_load:	
	.db $CD $BB $10
	
; Data from 157B to 157D (3 bytes)	
A$record_screen$79:	
C$record_screen.c$19$1$29:	
C$record_screen.c$20$1$29:	
XG$screen_record_screen_load$0$0:	
	.db $C3 $F9 $15
	
; Data from 157E to 157F (2 bytes)	
A$record_screen$89:	
C$record_screen.c$22$1$29:	
G$screen_record_screen_update$0$:	
_screen_record_screen_update:	
	.db $DD $E5
	
; Data from 1580 to 1583 (4 bytes)	
A$record_screen$90:	
	.db $DD $21 $00 $00
	
; Data from 1584 to 1585 (2 bytes)	
A$record_screen$91:	
	.db $DD $39
	
; Data from 1586 to 1587 (2 bytes)	
A$record_screen$98:	
C$record_screen.c$24$1$31:	
C$record_screen.c$28$1$31:	
	.db $3E $04
	
; Data from 1588 to 1588 (1 bytes)	
A$record_screen$99:	
	.db $F5
	
; Data from 1589 to 1589 (1 bytes)	
A$record_screen$100:	
	.db $33
	
; Data from 158A to 158C (3 bytes)	
A$record_screen$101:	
	.db $CD $D3 $0E
	
; Data from 158D to 158D (1 bytes)	
A$record_screen$102:	
	.db $33
	
; Data from 158E to 158E (1 bytes)	
A$record_screen$106:	
C$record_screen.c$29$1$31:	
	.db $7D
	
; Data from 158F to 158F (1 bytes)	
A$record_screen$107:	
	.db $B7
	
; Data from 1590 to 1591 (2 bytes)	
A$record_screen$108:	
	.db $28 $06
	
; Data from 1592 to 1594 (3 bytes)	
A$record_screen$112:	
C$record_screen.c$31$2$32:	
	.db $CD $E1 $0F
	
; Data from 1595 to 1597 (3 bytes)	
A$record_screen$116:	
C$record_screen.c$32$2$32:	
	.db $CD $F9 $15
	
; Data from 1598 to 1599 (2 bytes)	
A$record_screen$121:	
C$record_screen.c$34$1$31:	
	.db $3E $08
	
; Data from 159A to 159A (1 bytes)	
A$record_screen$122:	
	.db $F5
	
; Data from 159B to 159B (1 bytes)	
A$record_screen$123:	
	.db $33
	
; Data from 159C to 159E (3 bytes)	
A$record_screen$124:	
	.db $CD $D3 $0E
	
; Data from 159F to 159F (1 bytes)	
A$record_screen$125:	
	.db $33
	
; Data from 15A0 to 15A0 (1 bytes)	
A$record_screen$129:	
C$record_screen.c$35$1$31:	
	.db $7D
	
; Data from 15A1 to 15A1 (1 bytes)	
A$record_screen$130:	
	.db $B7
	
; Data from 15A2 to 15A3 (2 bytes)	
A$record_screen$131:	
	.db $28 $06
	
; Data from 15A4 to 15A6 (3 bytes)	
A$record_screen$135:	
C$record_screen.c$37$2$33:	
	.db $CD $F0 $0F
	
; Data from 15A7 to 15A9 (3 bytes)	
A$record_screen$139:	
C$record_screen.c$38$2$33:	
	.db $CD $F9 $15
	
; Data from 15AA to 15AB (2 bytes)	
A$record_screen$144:	
C$record_screen.c$41$1$31:	
	.db $3E $10
	
; Data from 15AC to 15AC (1 bytes)	
A$record_screen$145:	
	.db $F5
	
; Data from 15AD to 15AD (1 bytes)	
A$record_screen$146:	
	.db $33
	
; Data from 15AE to 15B0 (3 bytes)	
A$record_screen$147:	
	.db $CD $D3 $0E
	
; Data from 15B1 to 15B1 (1 bytes)	
A$record_screen$148:	
	.db $33
	
; Data from 15B2 to 15B2 (1 bytes)	
A$record_screen$149:	
	.db $4D
	
; Data from 15B3 to 15B3 (1 bytes)	
A$record_screen$153:	
C$record_screen.c$42$1$31:	
	.db $C5
	
; Data from 15B4 to 15B5 (2 bytes)	
A$record_screen$154:	
	.db $3E $20
	
; Data from 15B6 to 15B6 (1 bytes)	
A$record_screen$155:	
	.db $F5
	
; Data from 15B7 to 15B7 (1 bytes)	
A$record_screen$156:	
	.db $33
	
; Data from 15B8 to 15BA (3 bytes)	
A$record_screen$157:	
	.db $CD $D3 $0E
	
; Data from 15BB to 15BB (1 bytes)	
A$record_screen$158:	
	.db $33
	
; Data from 15BC to 15BC (1 bytes)	
A$record_screen$159:	
	.db $C1
	
; Data from 15BD to 15BF (3 bytes)	
A$record_screen$163:	
C$record_screen.c$51$1$31:	
	.db $DD $5E $04
	
; Data from 15C0 to 15C2 (3 bytes)	
A$record_screen$164:	
	.db $DD $56 $05
	
; Data from 15C3 to 15C3 (1 bytes)	
A$record_screen$168:	
C$record_screen.c$43$1$31:	
	.db $79
	
; Data from 15C4 to 15C4 (1 bytes)	
A$record_screen$169:	
	.db $B7
	
; Data from 15C5 to 15C6 (2 bytes)	
A$record_screen$170:	
	.db $20 $03
	
; Data from 15C7 to 15C7 (1 bytes)	
A$record_screen$171:	
	.db $B5
	
; Data from 15C8 to 15C9 (2 bytes)	
A$record_screen$172:	
	.db $28 $29
	
; Data from 15CA to 15CA (1 bytes)	
A$record_screen$177:	
C$record_screen.c$45$2$34:	
	.db $D5
	
; Data from 15CB to 15CB (1 bytes)	
A$record_screen$178:	
	.db $AF
	
; Data from 15CC to 15CC (1 bytes)	
A$record_screen$179:	
	.db $F5
	
; Data from 15CD to 15CD (1 bytes)	
A$record_screen$180:	
	.db $33
	
; Data from 15CE to 15D0 (3 bytes)	
A$record_screen$181:	
	.db $CD $46 $08
	
; Data from 15D1 to 15D1 (1 bytes)	
A$record_screen$182:	
	.db $33
	
; Data from 15D2 to 15D2 (1 bytes)	
A$record_screen$183:	
	.db $D1
	
; Data from 15D3 to 15D5 (3 bytes)	
A$record_screen$187:	
C$record_screen.c$47$2$34:	
	.db $21 $2A $C0
	
; Data from 15D6 to 15D6 (1 bytes)	
A$record_screen$188:	
	.db $46
	
; Data from 15D7 to 15D7 (1 bytes)	
A$record_screen$189:	
	.db $D5
	
; Data from 15D8 to 15D8 (1 bytes)	
A$record_screen$190:	
	.db $C5
	
; Data from 15D9 to 15D9 (1 bytes)	
A$record_screen$191:	
	.db $33
	
; Data from 15DA to 15DC (3 bytes)	
A$record_screen$192:	
	.db $CD $7D $0F
	
; Data from 15DD to 15DD (1 bytes)	
A$record_screen$193:	
	.db $33
	
; Data from 15DE to 15DE (1 bytes)	
A$record_screen$194:	
	.db $D1
	
; Data from 15DF to 15E1 (3 bytes)	
A$record_screen$198:	
C$record_screen.c$48$2$34:	
	.db $21 $2A $C0
	
; Data from 15E2 to 15E2 (1 bytes)	
A$record_screen$199:	
	.db $46
	
; Data from 15E3 to 15E3 (1 bytes)	
A$record_screen$200:	
	.db $D5
	
; Data from 15E4 to 15E4 (1 bytes)	
A$record_screen$201:	
	.db $C5
	
; Data from 15E5 to 15E5 (1 bytes)	
A$record_screen$202:	
	.db $33
	
; Data from 15E6 to 15E8 (3 bytes)	
A$record_screen$203:	
	.db $CD $67 $0B
	
; Data from 15E9 to 15E9 (1 bytes)	
A$record_screen$204:	
	.db $33
	
; Data from 15EA to 15EC (3 bytes)	
A$record_screen$205:	
	.db $CD $1A $11
	
; Data from 15ED to 15ED (1 bytes)	
A$record_screen$206:	
	.db $D1
	
; Data from 15EE to 15EF (2 bytes)	
A$record_screen$210:	
C$record_screen.c$51$2$34:	
	.db $3E $04
	
; Data from 15F0 to 15F0 (1 bytes)	
A$record_screen$211:	
	.db $12
	
; Data from 15F1 to 15F2 (2 bytes)	
A$record_screen$215:	
C$record_screen.c$52$2$34:	
	.db $18 $03
	
; Data from 15F3 to 15F4 (2 bytes)	
A$record_screen$220:	
C$record_screen.c$55$1$31:	
	.db $3E $05
	
; Data from 15F5 to 15F5 (1 bytes)	
A$record_screen$221:	
	.db $12
	
; Data from 15F6 to 15F7 (2 bytes)	
A$record_screen$223:	
	.db $DD $E1
	
; Data from 15F8 to 15F8 (1 bytes)	
A$record_screen$228:	
C$record_screen.c$56$1$31:	
XG$screen_record_screen_update$0:	
	.db $C9
	
; Data from 15F9 to 15FB (3 bytes)	
A$record_screen$241:	
C$record_screen.c$58$1$31:	
C$record_screen.c$60$1$35:	
Frecord_screen$load_record$0$0:	
	.db $CD $2B $08
	
; Data from 15FC to 15FE (3 bytes)	
A$record_screen$245:	
C$record_screen.c$61$1$35:	
	.db $CD $5A $0A
	
; Data from 15FF to 1601 (3 bytes)	
A$record_screen$249:	
C$record_screen.c$62$1$35:	
	.db $CD $8B $0F
	
; Data from 1602 to 1604 (3 bytes)	
A$record_screen$257:	
C$record_screen.c$63$1$35:	
C$record_screen.c$64$1$35:	
XFrecord_screen$load_record$0$0:	
	.db $C3 $25 $08
	
; Data from 1605 to 1605 (1 bytes)	
A$detail_screen$60:	
C$detail_screen.c$12$0$0:	
C$detail_screen.c$15$0$0:	
G$screen_detail_screen_load$0$0:	
XG$screen_detail_screen_load$0$0:	
_screen_detail_screen_load:	
	.db $C9
	
; Data from 1606 to 1606 (1 bytes)	
A$detail_screen$73:	
C$detail_screen.c$17$0$0:	
C$detail_screen.c$19$1$25:	
G$screen_detail_screen_update$0$:	
_screen_detail_screen_update:	
	.db $C1
	
; Data from 1607 to 1607 (1 bytes)	
A$detail_screen$74:	
	.db $E1
	
; Data from 1608 to 1608 (1 bytes)	
A$detail_screen$75:	
	.db $E5
	
; Data from 1609 to 1609 (1 bytes)	
A$detail_screen$76:	
	.db $C5
	
; Data from 160A to 160B (2 bytes)	
A$detail_screen$77:	
	.db $36 $06
	
; Data from 160C to 160C (1 bytes)	
A$detail_screen$82:	
C$detail_screen.c$20$1$25:	
XG$screen_detail_screen_update$0:	
	.db $C9
	
; Data from 160D to 160F (3 bytes)	
A$test_screen$65:	
C$test_screen.c$13$0$0:	
C$test_screen.c$15$1$23:	
G$screen_test_screen_load$0$0:	
_screen_test_screen_load:	
	.db $CD $2B $08
	
; Data from 1610 to 1612 (3 bytes)	
A$test_screen$69:	
C$test_screen.c$16$1$23:	
	.db $CD $E3 $0A
	
; Data from 1613 to 1615 (3 bytes)	
A$test_screen$73:	
C$test_screen.c$17$1$23:	
	.db $21 $0A $15
	
; Data from 1616 to 1616 (1 bytes)	
A$test_screen$74:	
	.db $E5
	
; Data from 1617 to 1619 (3 bytes)	
A$test_screen$75:	
	.db $21 $29 $16
	
; Data from 161A to 161A (1 bytes)	
A$test_screen$76:	
	.db $E5
	
; Data from 161B to 161D (3 bytes)	
A$test_screen$77:	
	.db $CD $E9 $0D
	
; Data from 161E to 161E (1 bytes)	
A$test_screen$78:	
	.db $F1
	
; Data from 161F to 161F (1 bytes)	
A$test_screen$79:	
	.db $F1
	
; Data from 1620 to 1622 (3 bytes)	
A$test_screen$83:	
C$test_screen.c$18$1$23:	
	.db $CD $25 $08
	
; Data from 1623 to 1625 (3 bytes)	
A$test_screen$87:	
C$test_screen.c$20$1$23:	
	.db $21 $66 $C0
	
; Data from 1626 to 1627 (2 bytes)	
A$test_screen$88:	
	.db $36 $00
	
; Data from 1628 to 1628 (1 bytes)	
A$test_screen$93:	
C$test_screen.c$21$1$23:	
XG$screen_test_screen_load$0$0:	
	.db $C9
	
; Data from 1629 to 1634 (12 bytes)	
Ftest_screen$__str_0$0$0:	
	.db $50 $52 $45 $53 $53 $20 $53 $54 $41 $52 $54 $00
	
; Data from 1635 to 1636 (2 bytes)	
A$test_screen$110:	
C$test_screen.c$23$1$23:	
C$test_screen.c$28$1$25:	
G$screen_test_screen_update$0$0:	
_screen_test_screen_update:	
	.db $3E $02
	
; Data from 1637 to 1637 (1 bytes)	
A$test_screen$111:	
	.db $F5
	
; Data from 1638 to 1638 (1 bytes)	
A$test_screen$112:	
	.db $33
	
; Data from 1639 to 163B (3 bytes)	
A$test_screen$113:	
	.db $CD $00 $0F
	
; Data from 163C to 163C (1 bytes)	
A$test_screen$114:	
	.db $33
	
; Data from 163D to 163D (1 bytes)	
A$test_screen$118:	
C$test_screen.c$29$1$25:	
	.db $7D
	
; Data from 163E to 163E (1 bytes)	
A$test_screen$119:	
	.db $B7
	
; Data from 163F to 1640 (2 bytes)	
A$test_screen$120:	
	.db $28 $0D
	
; Data from 1641 to 1643 (3 bytes)	
A$test_screen$124:	
C$test_screen.c$32$2$26:	
	.db $3A $66 $C0
	
; Data from 1644 to 1644 (1 bytes)	
A$test_screen$125:	
	.db $F5
	
; Data from 1645 to 1645 (1 bytes)	
A$test_screen$126:	
	.db $33
	
; Data from 1646 to 1648 (3 bytes)	
A$test_screen$127:	
	.db $CD $46 $08
	
; Data from 1649 to 1649 (1 bytes)	
A$test_screen$128:	
	.db $33
	
; Data from 164A to 164C (3 bytes)	
A$test_screen$132:	
C$test_screen.c$34$2$26:	
	.db $21 $66 $C0
	
; Data from 164D to 164D (1 bytes)	
A$test_screen$133:	
	.db $34
	
; Data from 164E to 164E (1 bytes)	
A$test_screen$138:	
C$test_screen.c$38$1$25:	
	.db $C1
	
; Data from 164F to 164F (1 bytes)	
A$test_screen$139:	
	.db $E1
	
; Data from 1650 to 1650 (1 bytes)	
A$test_screen$140:	
	.db $E5
	
; Data from 1651 to 1651 (1 bytes)	
A$test_screen$141:	
	.db $C5
	
; Data from 1652 to 1653 (2 bytes)	
A$test_screen$142:	
	.db $36 $07
	
; Data from 1654 to 1654 (1 bytes)	
A$test_screen$147:	
C$test_screen.c$39$1$25:	
XG$screen_test_screen_update$0$0:	
	.db $C9
	
; Data from 1655 to 1657 (3 bytes)	
A$func_screen$62:	
C$func_screen.c$15$0$0:	
C$func_screen.c$17$1$23:	
G$screen_func_screen_load$0$0:	
_screen_func_screen_load:	
	.db $CD $2B $08
	
; Data from 1658 to 165A (3 bytes)	
A$func_screen$66:	
C$func_screen.c$18$1$23:	
	.db $CD $A2 $0A
	
; Data from 165B to 165D (3 bytes)	
A$func_screen$70:	
C$func_screen.c$19$1$23:	
	.db $CD $E3 $0A
	
; Data from 165E to 1660 (3 bytes)	
A$func_screen$74:	
C$func_screen.c$20$1$23:	
	.db $CD $51 $0B
	
; Data from 1661 to 1663 (3 bytes)	
A$func_screen$78:	
C$func_screen.c$21$1$23:	
	.db $21 $06 $0C
	
; Data from 1664 to 1664 (1 bytes)	
A$func_screen$79:	
	.db $E5
	
; Data from 1665 to 1667 (3 bytes)	
A$func_screen$80:	
	.db $21 $B9 $16
	
; Data from 1668 to 1668 (1 bytes)	
A$func_screen$81:	
	.db $E5
	
; Data from 1669 to 166B (3 bytes)	
A$func_screen$82:	
	.db $CD $E9 $0D
	
; Data from 166C to 166C (1 bytes)	
A$func_screen$83:	
	.db $F1
	
; Data from 166D to 166F (3 bytes)	
A$func_screen$87:	
C$func_screen.c$22$1$23:	
	.db $21 $14 $0C
	
; Data from 1670 to 1670 (1 bytes)	
A$func_screen$88:	
	.db $E3
	
; Data from 1671 to 1673 (3 bytes)	
A$func_screen$89:	
	.db $21 $C0 $16
	
; Data from 1674 to 1674 (1 bytes)	
A$func_screen$90:	
	.db $E5
	
; Data from 1675 to 1677 (3 bytes)	
A$func_screen$91:	
	.db $CD $E9 $0D
	
; Data from 1678 to 1678 (1 bytes)	
A$func_screen$92:	
	.db $F1
	
; Data from 1679 to 1679 (1 bytes)	
A$func_screen$93:	
	.db $F1
	
; Data from 167A to 167C (3 bytes)	
A$func_screen$97:	
C$func_screen.c$24$1$23:	
	.db $21 $B8 $16
	
; Data from 167D to 167D (1 bytes)	
A$func_screen$98:	
	.db $56
	
; Data from 167E to 1680 (3 bytes)	
A$func_screen$99:	
	.db $21 $B7 $16
	
; Data from 1681 to 1681 (1 bytes)	
A$func_screen$100:	
	.db $5E
	
; Data from 1682 to 1682 (1 bytes)	
A$func_screen$101:	
	.db $D5
	
; Data from 1683 to 1685 (3 bytes)	
A$func_screen$102:	
	.db $21 $C7 $16
	
; Data from 1686 to 1686 (1 bytes)	
A$func_screen$103:	
	.db $E5
	
; Data from 1687 to 1689 (3 bytes)	
A$func_screen$104:	
	.db $CD $E9 $0D
	
; Data from 168A to 168A (1 bytes)	
A$func_screen$105:	
	.db $F1
	
; Data from 168B to 168B (1 bytes)	
A$func_screen$106:	
	.db $F1
	
; Data from 168C to 168E (3 bytes)	
A$func_screen$110:	
C$func_screen.c$25$1$23:	
	.db $21 $B8 $16
	
; Data from 168F to 168F (1 bytes)	
A$func_screen$111:	
	.db $46
	
; Data from 1690 to 1692 (3 bytes)	
A$func_screen$112:	
	.db $3A $B7 $16
	
; Data from 1693 to 1694 (2 bytes)	
A$func_screen$113:	
	.db $C6 $07
	
; Data from 1695 to 1695 (1 bytes)	
A$func_screen$114:	
	.db $4F
	
; Data from 1696 to 1696 (1 bytes)	
A$func_screen$115:	
	.db $C5
	
; Data from 1697 to 1699 (3 bytes)	
A$func_screen$116:	
	.db $21 $CC $16
	
; Data from 169A to 169A (1 bytes)	
A$func_screen$117:	
	.db $E5
	
; Data from 169B to 169D (3 bytes)	
A$func_screen$118:	
	.db $CD $E9 $0D
	
; Data from 169E to 169E (1 bytes)	
A$func_screen$119:	
	.db $F1
	
; Data from 169F to 169F (1 bytes)	
A$func_screen$120:	
	.db $F1
	
; Data from 16A0 to 16A2 (3 bytes)	
A$func_screen$124:	
C$func_screen.c$26$1$23:	
	.db $21 $B8 $16
	
; Data from 16A3 to 16A3 (1 bytes)	
A$func_screen$125:	
	.db $46
	
; Data from 16A4 to 16A6 (3 bytes)	
A$func_screen$126:	
	.db $3A $B7 $16
	
; Data from 16A7 to 16A8 (2 bytes)	
A$func_screen$127:	
	.db $C6 $0E
	
; Data from 16A9 to 16A9 (1 bytes)	
A$func_screen$128:	
	.db $4F
	
; Data from 16AA to 16AA (1 bytes)	
A$func_screen$129:	
	.db $C5
	
; Data from 16AB to 16AD (3 bytes)	
A$func_screen$130:	
	.db $21 $D1 $16
	
; Data from 16AE to 16AE (1 bytes)	
A$func_screen$131:	
	.db $E5
	
; Data from 16AF to 16B1 (3 bytes)	
A$func_screen$132:	
	.db $CD $E9 $0D
	
; Data from 16B2 to 16B2 (1 bytes)	
A$func_screen$133:	
	.db $F1
	
; Data from 16B3 to 16B3 (1 bytes)	
A$func_screen$134:	
	.db $F1
	
; Data from 16B4 to 16B6 (3 bytes)	
A$func_screen$142:	
C$func_screen.c$27$1$23:	
C$func_screen.c$32$1$23:	
XG$screen_func_screen_load$0$0:	
	.db $C3 $25 $08
	
; Data from 16B7 to 16B7 (1 bytes)	
Ffunc_screen$x$0$0:	
	.db $04
	
; Data from 16B8 to 16B8 (1 bytes)	
Ffunc_screen$y$0$0:	
	.db $14
	
; Data from 16B9 to 16BF (7 bytes)	
Ffunc_screen$__str_0$0$0:	
	.db $52 $45 $43 $4F $52 $44 $00
	
; Data from 16C0 to 16C6 (7 bytes)	
Ffunc_screen$__str_1$0$0:	
	.db $43 $4F $56 $45 $52 $53 $00
	
; Data from 16C7 to 16CB (5 bytes)	
Ffunc_screen$__str_2$0$0:	
	.db $31 $39 $38 $34 $00
	
; Data from 16CC to 16D0 (5 bytes)	
Ffunc_screen$__str_3$0$0:	
	.db $31 $39 $38 $36 $00
	
; Data from 16D1 to 16D5 (5 bytes)	
Ffunc_screen$__str_4$0$0:	
	.db $31 $39 $38 $38 $00
	
; Data from 16D6 to 16D6 (1 bytes)	
A$func_screen$181:	
C$func_screen.c$34$1$23:	
C$func_screen.c$57$1$25:	
G$screen_func_screen_update$0$0:	
_screen_func_screen_update:	
	.db $C1
	
; Data from 16D7 to 16D7 (1 bytes)	
A$func_screen$182:	
	.db $E1
	
; Data from 16D8 to 16D8 (1 bytes)	
A$func_screen$183:	
	.db $E5
	
; Data from 16D9 to 16D9 (1 bytes)	
A$func_screen$184:	
	.db $C5
	
; Data from 16DA to 16DB (2 bytes)	
A$func_screen$185:	
	.db $36 $08
	
; Data from 16DC to 16DC (1 bytes)	
A$func_screen$190:	
C$func_screen.c$58$1$25:	
XG$screen_func_screen_update$0$0:	
	.db $C9
	
; Data from 16DD to 16EC (16 bytes)	
_cursor__palette__bin:	
	.db $00 $00 $15 $15 $2A $2A $15 $15 $2A $2A $2A $2A $3F $3F $3F $3F
	
; Data from 16ED to 17A7 (187 bytes)	
_cursor__tiles__psgcompr:	
	.db $12 $00 $AA $CF $00 $7F $20 $0F $E0 $80 $C0 $DF $DF $1F $00 $7F
	.db $7F $3F $0F $C0 $FF $FF $FF $E0 $AA $DF $00 $FF $20 $EF $FF $20
	.db $3F $FF $FF $02 $AA $DF $00 $FF $20 $EF $FF $20 $3F $FF $FF $02
	.db $AA $DF $00 $FF $20 $EF $FF $20 $3F $FF $FF $02 $AA $DF $00 $FF
	.db $20 $EF $FF $20 $3F $FF $FF $02 $AA $0F $04 $01 $00 $FC $00 $20
	.db $8F $02 $F8 $F8 $0F $00 $FE $FC $FC $04 $1F $03 $FF $FF $FF $22
	.db $FF $E0 $FF $C0 $00 $00 $00 $00 $A2 $FF $04 $00 $FF $03 $AA $F5
	.db $00 $3F $80 $F8 $E0 $80 $80 $00 $F0 $00 $20 $3F $7F $FF $FC $C0
	.db $80 $00 $88 $F7 $00 $FF $F8 $00 $FF $FF $FF $88 $F7 $00 $FF $F8
	.db $00 $FF $FF $FF $88 $F7 $00 $FF $F8 $00 $FF $FF $FF $88 $F7 $00
	.db $FF $F8 $00 $FF $FF $FF $AA $F0 $04 $F8 $02 $01 $00 $F8 $04 $00
	.db $06 $07 $F8 $00 $FC $FE $FF $FC $03 $01 $00
	
; Data from 17A8 to 17B7 (16 bytes)	
_font__palette__bin:	
	.db $00 $02 $08 $0A $20 $22 $28 $2A $3F $03 $0C $0F $30 $33 $3C $3F
	
; Data from 17B8 to 1837 (128 bytes)	
_font__tilemap__bin:	
	.db $00 $00 $01 $00 $02 $00 $03 $00 $04 $00 $05 $00 $06 $00 $07 $00
	.db $08 $00 $09 $00 $0A $00 $0B $00 $0C $00 $0D $00 $0E $00 $0F $00
	.db $10 $00 $11 $00 $12 $00 $13 $00 $14 $00 $15 $00 $16 $00 $17 $00
	.db $18 $00 $19 $00 $1A $00 $1B $00 $1C $00 $1D $00 $1E $00 $1F $00
	.db $20 $00 $21 $00 $22 $00 $23 $00 $24 $00 $25 $00 $26 $00 $27 $00
	.db $28 $00 $29 $00 $2A $00 $2B $00 $2C $00 $2D $00 $2E $00 $2F $00
	.db $30 $00 $31 $00 $32 $00 $33 $00 $34 $00 $35 $00 $36 $00 $37 $00
	.db $38 $00 $39 $00 $3A $00 $3B $00 $3C $00 $3D $00 $3E $00 $3F $00
	
; Data from 1838 to 1ACE (663 bytes)	
_font__tiles__psgcompr:	
	.db $40 $00 $00 $AA $1A $18 $1C $1C $1C $00 $00 $00 $00 $00 $AA $1F
	.db $00 $36 $36 $24 $00 $00 $00 $AA $D6 $36 $7F $7F $00 $00 $00 $00
	.db $AA $54 $3E $08 $68 $0B $08 $00 $00 $00 $00 $EA $21 $52 $24 $08
	.db $12 $25 $42 $00 $00 $00 $00 $EA $18 $24 $34 $38 $4D $46 $3D $00
	.db $00 $00 $00 $AA $0F $00 $30 $30 $10 $20 $00 $00 $00 $AA $38 $30
	.db $0C $18 $18 $0C $00 $00 $00 $00 $AA $38 $06 $18 $0C $0C $18 $00
	.db $00 $00 $00 $AA $83 $00 $22 $14 $08 $14 $22 $00 $00 $00 $AA $6C
	.db $08 $00 $3E $00 $00 $00 $00 $00 $AA $F1 $00 $18 $18 $30 $00 $00
	.db $00 $AA $EF $00 $3E $00 $00 $00 $AA $F9 $00 $18 $18 $00 $00 $00
	.db $EA $01 $02 $04 $08 $10 $20 $40 $00 $00 $00 $00 $AA $38 $63 $1C
	.db $26 $32 $1C $00 $00 $00 $00 $AA $BC $0C $1C $3F $00 $00 $00 $00
	.db $EA $3E $63 $07 $1E $3C $70 $7F $00 $00 $00 $00 $EA $3F $06 $0C
	.db $1E $03 $63 $3E $00 $00 $00 $00 $EA $0E $1E $36 $66 $7F $06 $06
	.db $00 $00 $00 $00 $EA $7E $60 $7E $03 $03 $63 $3E $00 $00 $00 $00
	.db $EA $1E $30 $60 $7E $63 $63 $3E $00 $00 $00 $00 $AA $0E $18 $7F
	.db $63 $06 $0C $00 $00 $00 $00 $EA $3C $62 $72 $3C $4F $43 $3E $00
	.db $00 $00 $00 $EA $3E $63 $63 $3F $03 $06 $3C $00 $00 $00 $00 $AA
	.db $93 $00 $18 $18 $18 $18 $00 $00 $00 $AA $6C $18 $00 $00 $30 $00
	.db $00 $00 $00 $EA $06 $0C $18 $30 $18 $0C $06 $00 $00 $00 $00 $AA
	.db $D7 $00 $3E $3E $00 $00 $00 $EA $30 $18 $0C $06 $0C $18 $30 $00
	.db $00 $00 $00 $EA $3E $7F $63 $06 $1C $00 $1C $00 $00 $00 $00 $EA
	.db $1E $33 $67 $67 $60 $33 $1E $00 $00 $00 $00 $AA $36 $63 $1C $36
	.db $7F $00 $00 $00 $00 $AA $6C $63 $7E $7E $7E $00 $00 $00 $00 $AA
	.db $38 $60 $1E $33 $33 $1E $00 $00 $00 $00 $AA $38 $63 $7C $66 $66
	.db $7C $00 $00 $00 $00 $AA $6C $60 $7F $7E $7F $00 $00 $00 $00 $AA
	.db $6E $60 $7F $7E $00 $00 $00 $00 $EA $1F $30 $60 $67 $63 $33 $1F
	.db $00 $00 $00 $00 $AA $EE $63 $7F $00 $00 $00 $00 $AA $7C $0C $3F
	.db $3F $00 $00 $00 $00 $AA $F8 $03 $63 $3E $00 $00 $00 $00 $EA $63
	.db $66 $6C $78 $7C $6E $67 $00 $00 $00 $00 $AA $FC $60 $7F $00 $00
	.db $00 $00 $AA $86 $63 $77 $7F $7F $6B $00 $00 $00 $00 $EA $63 $73
	.db $7B $7F $6F $67 $63 $00 $00 $00 $00 $AA $7C $63 $3E $3E $00 $00
	.db $00 $00 $AA $70 $63 $7E $7E $60 $60 $00 $00 $00 $00 $AA $70 $63
	.db $3E $6F $66 $3D $00 $00 $00 $00 $EA $7E $63 $63 $67 $7C $6E $67
	.db $00 $00 $00 $00 $EA $3C $66 $60 $3E $03 $63 $3E $00 $00 $00 $00
	.db $AA $7E $0C $3F $00 $00 $00 $00 $AA $FC $63 $3E $00 $00 $00 $00
	.db $AA $E0 $63 $77 $3E $1C $08 $00 $00 $00 $00 $AA $C2 $63 $6B $7F
	.db $7F $77 $00 $00 $00 $00 $EA $63 $77 $3E $1C $3E $77 $63 $00 $00
	.db $00 $00 $AA $0E $0C $33 $33 $33 $1E $00 $00 $00 $00 $EA $7F $07
	.db $0E $1C $38 $70 $7F $00 $00 $00 $00 $AA $7C $18 $1E $1E $00 $00
	.db $00 $00 $EA $40 $20 $10 $08 $04 $02 $01 $00 $00 $00 $00 $AA $7C
	.db $0C $3C $3C $00 $00 $00 $00 $AA $1F $00 $08 $14 $2A $00 $00 $00
	.db $AA $FE $00 $7F $00 $00 $00
	
; Data from 1ACF to 1ADE (16 bytes)	
_sprite__palette__bin:	
	.db $00 $02 $08 $0A $20 $22 $28 $2A $3F $03 $0C $0F $30 $33 $3C $3F
	
; Data from 1ADF to 1AFE (32 bytes)	
_sprite__tiles__psgcompr:	
	.db $02 $00 $32 $03 $0F $1F $3F $33 $61 $61 $73 $21 $F9 $6D $6D $33
	.db $7F $33 $38 $1C $8F $53 $A0 $50 $7F $3F $3F $1F $8F $D3 $E0 $70
	
; Data from 1AFF to 1B21 (35 bytes)	
_sfx_cheat_psg:	
	.db $CE $4B $D0 $3B $D1 $38 $CF $47 $08 $02 $00 $C7 $49 $0A $02 $00
	.db $09 $02 $00 $45 $D0 $3B $D1 $3B $D2 $3A $D3 $39 $D4 $39 $C3 $55
	.db $DF $3C $00
	
; Data from 1B22 to 1B41 (32 bytes)	
_sfx_right_psg:	
	.db $C5 $4D $D0 $3B $CE $48 $3B $C7 $44 $D5 $3A $CA $46 $3B $C5 $4D
	.db $DA $3A $09 $04 $00 $DB $3B $CA $46 $DD $3A $C0 $40 $DF $38 $00
	
; Data from 1B42 to 1B64 (35 bytes)	
_sfx_wrong_psg:	
	.db $C5 $4D $D0 $3B $C0 $4A $3B $C7 $49 $3B $CE $48 $D5 $3B $C5 $4D
	.db $3B $C0 $4A $3B $C7 $49 $DA $3B $CE $48 $3B $C0 $49 $3B $C0 $40
	.db $DF $3B $00
	
; Data from 1B65 to 1B6C (8 bytes)	
__divuint:	
	.db $F1 $E1 $D1 $D5 $E5 $F5 $18 $0A
	
; Data from 1B6D to 1B73 (7 bytes)	
__divuchar:	
	.db $21 $03 $00 $39 $5E $2B $6E
	
; Data from 1B74 to 1B76 (3 bytes)	
__divu8:	
	.db $26 $00 $54
	
; Data from 1B77 to 1BA5 (47 bytes)	
__divu16:	
	.db $7B $E6 $80 $B2 $20 $10 $06 $10 $ED $6A $17 $93 $30 $01 $83 $3F
	.db $ED $6A $10 $F6 $5F $C9 $06 $09 $7D $6C $26 $00 $CB $1D $ED $6A
	.db $ED $52 $30 $01 $19 $3F $17 $10 $F5 $CB $10 $50 $5F $EB $C9

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
	
; Data from 21C9 to 21CA (2 bytes)	
Finput_manager$__xinit_curr_joyp:	
	.db $00 $00
	
; Data from 21CB to 21CC (2 bytes)	
Finput_manager$__xinit_prev_joyp:	
	.db $00 $00
	
; Data from 21CD to 21E4 (24 bytes)	
Fcursor_object$__xinit_cursor_al:	
	.db $E3 $11 $E8 $11 $ED $11 $F2 $11 $F7 $11 $FC $11 $01 $12 $06 $12
	.db $0B $12 $10 $12 $15 $12 $1A $12
	
; Data from 21E5 to 21FC (24 bytes)	
Frecord_object$__xinit_record_ti:	
	.db $89 $80 $32 $81 $70 $80 $9F $80 $18 $81 $8D $80 $87 $80 $67 $80
	.db $67 $80 $9F $80 $C7 $80 $7A $80
	
; Data from 21FD to 2214 (24 bytes)	
Grecord_object$__xinit_record_ti:	
	.db $10 $80 $10 $80 $10 $80 $10 $80 $10 $80 $10 $80 $10 $80 $10 $80
	.db $10 $80 $10 $80 $10 $80 $10 $80
	
; Data from 2215 to 2230 (28 bytes)	
Frecord_object$__xinit_record_pa:	
	.db $00 $80 $00 $80 $00 $80 $00 $80 $00 $80 $00 $80 $00 $80 $00 $80
	.db $00 $80 $00 $80 $00 $80 $00 $80 $04 $20 $08 $08
	
gsinit:	
		ld bc, $0068
		ld a, b
		or c
		jr z, +
		ld de, Finput_manager$curr_joypad1$0$0	; Finput_manager$curr_joypad1$0$0 = $C152
		ld hl, Finput_manager$__xinit_curr_joyp	; Finput_manager$__xinit_curr_joyp = $21C9
		ldir
+:	
		ret
	
; Data from 2241 to 7F8B (23883 bytes)
	.dsb 23883, $00
	
; Data from 7F8C to 7FC7 (60 bytes)	
G$__SMS__SDSC_descr$0$0:	
___SMS__SDSC_descr:	
	.db $56 $61 $6E $20 $48 $61 $6C $65 $6E $20 $52 $65 $63 $6F $72 $64
	.db $20 $43 $6F $76 $65 $72 $73 $20 $66 $6F $72 $20 $74 $68 $65 $20
	.db $53 $4D $53 $20 $50 $6F $77 $65 $72 $21 $20 $32 $30 $32 $31 $20
	.db $43 $6F $6D $70 $65 $74 $69 $74 $69 $6F $6E $00
	
; Data from 7FC8 to 7FD1 (10 bytes)	
G$__SMS__SDSC_name$0$0:	
___SMS__SDSC_name:	
	.db $56 $61 $6E $20 $48 $61 $6C $65 $6E $00
	
; Data from 7FD2 to 7FDF (14 bytes)	
G$__SMS__SDSC_author$0$0:	
___SMS__SDSC_author:	
	.db $53 $74 $65 $76 $65 $6E $20 $42 $6F $6C $61 $6E $64 $00
	
; Data from 7FE0 to 7FEF (16 bytes)	
G$__SMS__SDSC_signature$0$0:	
___SMS__SDSC_signature:	
	.db $53 $44 $53 $43 $01 $00 $27 $03 $21 $20 $D2 $7F $C8 $7F $8C $7F
	
.BANK 1 SLOT 1	
.ORG $0000	
	
; Data from 7FF0 to 7FFF (16 bytes)
G$__SMS__SEGA_signature$0$0:	
___SMS__SEGA_signature:
	.db $54 $4D $52 $20 $53 $45 $47 $41 $FF $FF $5C $54 $99 $99 $00 $4C


.include "asset_manager.inc"