;.sdsctag 1.0,"Van Halen","Van Halen Record Covers for the SMS Power! 2021 Competition","StevePro Studios"

.include "devkit/memory_manager.inc"
.include "devkit/enum_manager.inc"
.include "devkit/define_manager.inc"

;.include "content/gfx.inc"


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
	
.include "content/out.inc"
	
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
		call _engine_asm_manager_clear_VRAM
		call _devkit_SMS_init
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
		call _engine_content_manager_load_til
		call _engine_content_manager_load_spr
		call _engine_scroll_manager_reset
		ld a, $01
		push af
		inc sp
		call _engine_screen_manager_init
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
		call _engine_input_manager_update
		call _engine_screen_manager_update
		call A$_sms_manager$752
		call A$_sms_manager$769
		call A$_sms_manager$786
		call _devkit_PSGFrame
		call _devkit_PSGSFXFrame
		jr A$main$140

; devkit
.include "devkit/psg_manager.inc"
.include "devkit/devkit_manager.inc"


; engine	
.include "engine/asm_manager.inc"
.include "engine/audio_manager.inc"
.include "engine/content_manager.inc"
.include "engine/cursor_manager.inc"
.include "engine/font_manager.inc"
.include "engine/input_manager.inc"
.include "engine/record_manager.inc"
.include "engine/screen_manager.inc"
.include "engine/scroll_manager.inc"
.include "engine/storage_manager.inc"
.include "engine/timer_manager.inc"


; object
.include "object/cursor_object.inc"
.include "object/record_object.inc"


; screen
.include "screen/none_screen.inc"
.include "screen/splash_screen.inc"	
.include "screen/title_screen.inc"	
.include "screen/scroll_screen.inc"
.include "screen/select_screen.inc"
.include "screen/record_screen.inc"
.include "screen/detail_screen.inc"
.include "screen/test_screen.inc"
.include "screen/func_screen.inc"


; content
.include "content/gfx.inc"
.include "content/psg.inc"

	
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


.include "devkit/sms_manager.inc"

	
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


.include "engine/bank_manager.inc"