_devkit_SMS_init:
		jp _SMS_init

_devkit_SMS_displayOn:
		ld hl, $0140
		jp _SMS_VDPturnOnFeature

_devkit_SMS_displayOff:
		ld hl, $0140
		jp _SMS_VDPturnOffFeature

; Data from 831 to 833 (3 bytes)
_devkit_SMS_mapROMBank:
	;.db $21 $02 $00
	ld hl, $0002
	
; Data from 834 to 834 (1 bytes)
	add hl, sp

; Data from 835 to 835 (1 bytes)
	ld a, (hl)

; Data from 836 to 838 (3 bytes)
	;.db $32 $FF $FF
	ld ($FFFF), a

; Data from 839 to 839 (1 bytes)
	ret
	
; Data from 83A to 83D (4 bytes)
_devkit_SMS_setBGScrollX:
	;.db $FD $21 $02 $00
	ld iy, $0002

; Data from 83E to 83F (2 bytes)
	add iy, sp
	
; Data from 840 to 842 (3 bytes)
	;.db $FD $6E $00
	ld l, (iy + $00)
	
; Data from 843 to 845 (3 bytes)
	;.db $C3 $AC $1C
	jp $1CAC

_devkit_SMS_setBGScrollY:
		ld iy, $0002
		add iy, sp
		ld l, (iy+0)
		jp _SMS_setBGScrollY
	
; Data from 852 to 854 (3 bytes)
_devkit_SMS_enableSRAM:
	;.db $21 $FC $FF
	ld hl, $FFFC
	
; Data from 855 to 856 (2 bytes)
	ld (hl), $08

; Data from 857 to 857 (1 bytes)
	ret

; Data from 858 to 85A (3 bytes)
_devkit_SMS_enableSRAMBank:
	;.db $21 $02 $00
	ld hl, $0002

; Data from 85B to 85B (1 bytes)
	add hl, sp

; Data from 85C to 85C (1 bytes)
	ld a, (hl)

; Data from 85D to 85D (1 bytes)
	add a, a

; Data from 85E to 85E (1 bytes)
	add a, a

; Data from 85F to 860 (2 bytes)
	;.db $CB $DF
	set 3, a

; Data from 861 to 862 (2 bytes)
	and $0C

; Data from 863 to 865 (3 bytes)
	;.db $32 $FC $FF
	ld ($FFFC), a

; Data from 866 to 866 (1 bytes)
	ret

; Data from 867 to 869 (3 bytes)
_devkit_SMS_disableSRAM:
	;.db $21 $FC $FF
	ld hl, $FFFC
	
; Data from 86A to 86B (2 bytes)
	ld (hl), $00

; Data from 86C to 86C (1 bytes)
	ret

; Data from 86D to 86F (3 bytes)
_devkit_SMS_SRAM:
	;.db $21 $00 $80
	ld hl, $8000

; Data from 870 to 870 (1 bytes)
	ret

_devkit_SMS_setSpriteMode:
		ld iy, $0002
		add iy, sp
		ld l, (iy+0)
		jp _SMS_setSpriteMode

_devkit_SMS_useFirstHalfTilesfor:
		ld l, $00
		jp _SMS_useFirstHalfTilesforSprites

; Data from 882 to 883 (2 bytes)
_eevkit_SMS_useFirstHalfTilesfor:
	;.db $2E $01
	ld l, $01

; Data from 884 to 886 (3 bytes)
	;.db $C3 $CA $1C
	jp $1CCA

_devkit_SMS_VDPturnOnFeature:
		pop bc
		pop hl
		push hl
		push bc
		jp _SMS_VDPturnOnFeature

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
_devkit_SMS_loadSTMcompressedTil:
	ld a, $20

; Data from 8A6 to 8A6 (1 bytes)
	push af

; Data from 8A7 to 8A7 (1 bytes)
	inc sp

; Data from 8A8 to 8AA (3 bytes)
	;.db $21 $05 $00
	ld hl, $0005

; Data from 8AB to 8AB (1 bytes)
	add hl, sp

; Data from 8AC to 8AC (1 bytes)
	ld c, (hl)

; Data from 8AD to 8AD (1 bytes)
	inc hl

; Data from 8AE to 8AE (1 bytes)
	ld b, (hl)

; Data from 8AF to 8AF (1 bytes)
	push bc

; Data from 8B0 to 8B2 (3 bytes)
	;.db $21 $06 $00
	ld hl, $0006

; Data from 8B3 to 8B3 (1 bytes)
	add hl, sp

; Data from 8B4 to 8B4 (1 bytes)
	ld a, (hl)

; Data from 8B5 to 8B5 (1 bytes)
	push af

; Data from 8B6 to 8B6 (1 bytes)
	inc sp

; Data from 8B7 to 8B9 (3 bytes)
	;.db $21 $06 $00
	ld hl, $0006

; Data from 8BA to 8BA (1 bytes)
	add hl, sp

; Data from 8BB to 8BB (1 bytes)
	ld a, (hl)

; Data from 8BC to 8BC (1 bytes)
	push af

; Data from 8BD to 8BD (1 bytes)
	inc sp

; Data from 8BE to 8C0 (3 bytes)
	;.db $CD $05 $1F
	call $1F05

; Data from 8C1 to 8C1 (1 bytes)
	pop af

; Data from 8C2 to 8C2 (1 bytes)
	pop af

; Data from 8C3 to 8C3 (1 bytes)
	inc sp

; Data from 8C4 to 8C4 (1 bytes)
	ret

_devkit_SMS_loadBGPalette:
		pop bc
		pop hl
		push hl
		push bc
		jp _SMS_loadBGPalette

_devkit_SMS_loadSpritePalette:
		pop bc
		pop hl
		push hl
		push bc
		jp _SMS_loadSpritePalette

; Data from 8D3 to 8D5 (3 bytes)
_devkit_SMS_setBGPaletteColor:
	;.db $21 $04 $00
	ld hl, $0004

; Data from 8D6 to 8D6 (1 bytes)
	add hl, sp

; Data from 8D7 to 8D7 (1 bytes)
	ld a, (hl)

; Data from 8D8 to 8D8 (1 bytes)
	add a, a

; Data from 8D9 to 8D9 (1 bytes)
	add a, a

; Data from 8DA to 8DC (3 bytes)
	;.db $21 $03 $00
	ld hl, $0003

; Data from 8DD to 8DD (1 bytes)
	add hl, sp

; Data from 8DE to 8DE (1 bytes)
	or (hl)

; Data from 8DF to 8DF (1 bytes)
	ld c, a

; Data from 8E0 to 8E2 (3 bytes)
	;.db $21 $05 $00
	ld hl, $0005

; Data from 8E3 to 8E3 (1 bytes)
	add hl, sp

; Data from 8E4 to 8E4 (1 bytes)
	ld a, (hl)

; Data from 8E5 to 8E5 (1 bytes)
	;.db $07
	rlca

; Data from 8E6 to 8E6 (1 bytes)
	;.db $07
	rlca

; Data from 8E7 to 8E7 (1 bytes)
	;.db $07
	rlca

; Data from 8E8 to 8E8 (1 bytes)
	;.db $07
	rlca

; Data from 8E9 to 8EA (2 bytes)
	and $F0

; Data from 8EB to 8EB (1 bytes)
	or c

; Data from 8EC to 8EC (1 bytes)
	ld b, a

; Data from 8ED to 8ED (1 bytes)
	push bc

; Data from 8EE to 8EE (1 bytes)
	inc sp

; Data from 8EF to 8F1 (3 bytes)
	;.db $21 $03 $00
	ld hl, $0003

; Data from 8F2 to 8F2 (1 bytes)
	add hl, sp

; Data from 8F3 to 8F3 (1 bytes)
	ld a, (hl)

; Data from 8F4 to 8F4 (1 bytes)
	push af

; Data from 8F5 to 8F5 (1 bytes)
	inc sp

; Data from 8F6 to 8F8 (3 bytes)
	;.db $CD $23 $1D
	call $1D23

; Data from 8F9 to 8F9 (1 bytes)
	pop af

; Data from 8FA to 8FA (1 bytes)
	ret

; Data from 8FB to 8FD (3 bytes)
_devkit_SMS_setSpritePaletteColo:
	;.db $21 $04 $00
	ld hl, $0004

; Data from 8FE to 8FE (1 bytes)
	add hl, sp

; Data from 8FF to 8FF (1 bytes)
	ld a, (hl)

; Data from 900 to 900 (1 bytes)
	add a, a

; Data from 901 to 901 (1 bytes)
	add a, a

; Data from 902 to 904 (3 bytes)
	;.db $21 $03 $00
	ld hl, $0003

; Data from 905 to 905 (1 bytes)
	add hl, sp

; Data from 906 to 906 (1 bytes)
	or (hl)

; Data from 907 to 907 (1 bytes)
	ld c, a

; Data from 908 to 90A (3 bytes)
	;.db $21 $05 $00
	ld hl, $0005

; Data from 90B to 90B (1 bytes)
	add hl, sp

; Data from 90C to 90C (1 bytes)
	ld a, (hl)

; Data from 90D to 90D (1 bytes)
	rlca

; Data from 90E to 90E (1 bytes)
	rlca

; Data from 90F to 90F (1 bytes)
	rlca

; Data from 910 to 910 (1 bytes)
	rlca

; Data from 911 to 912 (2 bytes)
	and $F0

; Data from 913 to 913 (1 bytes)
	or c

; Data from 914 to 914 (1 bytes)
	ld b, a

; Data from 915 to 915 (1 bytes)
	push bc

; Data from 916 to 916 (1 bytes)
	inc sp

; Data from 917 to 919 (3 bytes)
	;.db $21 $03 $00
	ld hl, $0003

; Data from 91A to 91A (1 bytes)
	add hl, sp

; Data from 91B to 91B (1 bytes)
	ld a, (hl)

; Data from 91C to 91C (1 bytes)
	push af

; Data from 91D to 91D (1 bytes)
	inc sp

; Data from 91E to 920 (3 bytes)
	;.db $CD $37 $1D
	call $1D37

; Data from 921 to 921 (1 bytes)
	pop af

; Data from 922 to 922 (1 bytes)
	ret

; Data from 923 to 924 (2 bytes)
_devkit_SMS_setNextTileatXY:
	push ix

; Data from 925 to 928 (4 bytes)
	;.db $DD $21 $00 $00
	ld ix, $0000

; Data from 929 to 92A (2 bytes)
	add ix, sp

; Data from 92B to 92D (3 bytes)
	;.db $DD $6E $05
	ld l, (ix + $05)

; Data from 92E to 92F (2 bytes)
	ld h, $00

; Data from 930 to 930 (1 bytes)
	add hl, hl

; Data from 931 to 931 (1 bytes)
	add hl, hl

; Data from 932 to 932 (1 bytes)
	add hl, hl

; Data from 933 to 933 (1 bytes)
	add hl, hl

; Data from 934 to 934 (1 bytes)
	add hl, hl

; Data from 935 to 935 (1 bytes)
	add hl, hl

; Data from 936 to 936 (1 bytes)
	ld c, l

; Data from 937 to 937 (1 bytes)
	ld a, h

; Data from 938 to 939 (2 bytes)
	or $78

; Data from 93A to 93A (1 bytes)
	ld b, a

; Data from 93B to 93D (3 bytes)
	;.db $DD $6E $04
	ld l, (ix + $04)

; Data from 93E to 93F (2 bytes)
	ld h, $00

; Data from 940 to 940 (1 bytes)
	add hl, hl

; Data from 941 to 941 (1 bytes)
	ld a, l

; Data from 942 to 942 (1 bytes)
	or c

; Data from 943 to 943 (1 bytes)
	ld l, a

; Data from 944 to 944 (1 bytes)
	ld a, h

; Data from 945 to 945 (1 bytes)
	or b

; Data from 946 to 946 (1 bytes)
	ld h, a

; Data from 947 to 948 (2 bytes)
	pop ix

; Data from 949 to 94B (3 bytes)
	;.db $C3 $06 $00
	jp $0006

; Data from 94C to 94C (1 bytes)
_devkit_SMS_setTile:
	pop bc

; Data from 94D to 94D (1 bytes)
	pop hl

; Data from 94E to 94E (1 bytes)
	push hl

; Data from 94F to 94F (1 bytes)
	push bc

; Data from 950 to 952 (3 bytes)
	;.db $C3 $11 $00
	jp $0011

; Data from 953 to 956 (4 bytes)
_devkit_SMS_setTilePriority:
	;.db $FD $21 $02 $00
	ld iy, $0002

; Data from 957 to 958 (2 bytes)
	add iy, sp

; Data from 959 to 95B (3 bytes)
	;.db $FD $6E $00
	ld l, (iy + $00)

; Data from 95C to 95D (2 bytes)
	ld a, $00

; Data from 95E to 95F (2 bytes)
	or $18

; Data from 960 to 960 (1 bytes)
	ld h, a

; Data from 961 to 963 (3 bytes)
	;.db $C3 $11 $00
	jp $0011

; Data from 964 to 966 (3 bytes)
_devkit_SMS_addSprite:
	;.db $21 $04 $00
	ld hl, $0004

; Data from 967 to 967 (1 bytes)
	add hl, sp

; Data from 968 to 968 (1 bytes)
	ld b, (hl)

; Data from 969 to 969 (1 bytes)
	push bc

; Data from 96A to 96A (1 bytes)
	inc sp

; Data from 96B to 96D (3 bytes)
	;.db $21 $04 $00
	ld hl, $0004

; Data from 96E to 96E (1 bytes)
	add hl, sp

; Data from 96F to 96F (1 bytes)
	ld a, (hl)

; Data from 970 to 970 (1 bytes)
	push af

; Data from 971 to 971 (1 bytes)
	inc sp

; Data from 972 to 974 (3 bytes)
	;.db $21 $04 $00
	ld hl, $0004

; Data from 975 to 975 (1 bytes)
	add hl, sp

; Data from 976 to 976 (1 bytes)
	ld a, (hl)

; Data from 977 to 977 (1 bytes)
	push af

; Data from 978 to 978 (1 bytes)
	inc sp

; Data from 979 to 97B (3 bytes)
	;.db $CD $7D $1D
	call $1D7D

; Data from 97C to 97C (1 bytes)
	pop af

; Data from 97D to 97D (1 bytes)
	inc sp

; Data from 97E to 97E (1 bytes)
	ret

_devkit_SMS_initSprites:
		jp _SMS_initSprites

_devkit_SMS_finalizeSprites:
		jp _SMS_finalizeSprites

_devkit_SMS_waitForVBlank:
		jp _SMS_waitForVBlank

_devkit_SMS_copySpritestoSAT:
		jp _UNSAFE_SMS_copySpritestoSAT

; Data from 98B to 98D (3 bytes)

_devkit_UNSAFE_SMS_copySpritesto:
	;.db $C3 $A6 $1B
	jp $1BA6


_devkit_SMS_queryPauseRequested:
		jp _SMS_queryPauseRequested

_devkit_SMS_resetPauseRequest:
		jp _SMS_resetPauseRequest

; Data from 994 to 996 (3 bytes)
_devkit_isCollisionDetected:
	;.db $3A $68 $C0
	ld a, ($C068)

; Data from 997 to 998 (2 bytes)
	and $20

; Data from 999 to 999 (1 bytes)
	ld l, a

; Data from 99A to 99A (1 bytes)
	ret

_devkit_SMS_getKeysStatus:
		jp _SMS_getKeysStatus

_devkit_SPRITEMODE_NORMAL:
		ld l, $00
		ret

_devkit_VDPFEATURE_HIDEFIRSTCOL:
		ld hl, $0020
		ret

; Data from 9A5 to 9A7 (3 bytes)
_devkit_TILE_PRIORITY:
	;.db $21 $00 $10
	ld hl, $1000
	
; Data from 9A8 to 9A8 (1 bytes)
	ret
	
; Data from 9A9 to 9AB (3 bytes)
_devkit_TILE_USE_SPRITE_PALETTE:
	;.db $21 $00 $08
	ld hl, $0800
	
; Data from 9AC to 9AC (1 bytes)
	ret
	
; Data from 9AD to 9BA (14 bytes)
;	"Steven Boland"
	.db $53 $74 $65 $76 $65 $6E $20 $42 $6F $6C $61 $6E $64 $00
	
; Data from 9BB to 9C4 (10 bytes)
	; "Van Halen"
	.db $56 $61 $6E $20 $48 $61 $6C $65 $6E $00
	
; Data from 9C5 to A00 (60 bytes)
	; "Van Halen Record Covers for the SMS Power! 2021"
	.db $56 $61 $6E $20 $48 $61 $6C $65 $6E $20 $52 $65 $63 $6F $72 $64
	.db $20 $43 $6F $76 $65 $72 $73 $20 $66 $6F $72 $20 $74 $68 $65 $20
	.db $53 $4D $53 $20 $50 $6F $77 $65 $72 $21 $20 $32 $30 $32 $31 $20
	.db $43 $6F $6D $70 $65 $74 $69 $74 $69 $6F $6E $00
	
; Data from A01 to A0A (10 bytes)
_devkit_PSGPlay:
	;.db $C1 $E1 $E5 $C5 $E5 $CD $F4 $02 $F1 $C9
	pop bc
	pop hl
	push hl
	push bc
	push hl
	call $02F4
	pop af
	ret

; Data from A0B to A14 (10 bytes)
_devkit_PSGPlayNoRepeat:
	;.db $C1 $E1 $E5 $C5 $E5 $CD $27 $03 $F1 $C9
	pop bc
	pop hl
	push hl
	push bc
	push hl
	call $0327
	pop af
	ret

; Data from A15 to A17 (3 bytes)
_devkit_PSGStop:
	;.db $C3 $81 $02
	jp $0281
	
; Data from A18 to A1A (3 bytes)
_devkit_PSGResume:
	;.db $C3 $A8 $02
	jp $02A8
	
; Data from A1B to A1D (3 bytes)
_devkit_PSGGetStatus:
	;.db $C3 $36 $03
	jp $0336
	
; Data from A1E to A29 (12 bytes)
_devkit_PSGSetMusicVolumeAttenua:
	;.db $21 $02 $00 $39 $7E $F5 $33 $CD $4E $04 $33 $C9
	ld hl, $0002
	add hl, sp
	ld a, (hl)
	push af
	inc sp
	call $044E
	inc sp
	ret
	
; Data from A2A to A3E (21 bytes)
_devkit_PSGSFXPlay:
	;.db $21 $04 $00 $39 $7E $F5 $33 $21 $03 $00 $39 $4E $23 $46 $C5 $CD
	;.db $07 $06 $F1 $33 $C9
	ld hl, $0004
	add hl, sp
	ld a, (hl)
	push af
	inc sp
	ld hl, $0003
	add hl, sp
	ld c, (hl)
	inc hl
	ld b, (hl)
	push bc
	call $0607
	pop af
	inc sp
	ret
	
; Data from A3F to A41 (3 bytes)
_devkit_PSGSFXStop:
	;.db $C3 $3D $05
	jp $053D
	
; Data from A42 to A44 (3 bytes)
_devkit_PSGSFXGetStatus:
	;.db $C3 $5A $06
	jp $065A
	
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
	ld l, $01
	ret
	
; Data from A54 to A56 (3 bytes)
_devkit_SFX_CHANNEL3:
	ld l, $02
	ret
	
; Data from A57 to A59 (3 bytes)
_devkit_SFX_CHANNELS2AND3:
	ld l, $03
	ret