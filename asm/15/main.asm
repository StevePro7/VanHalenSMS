;.sdsctag 1.0,"Van Halen","Van Halen Record Covers for the SMS Power! 2021 Competition","StevePro Studios"

.include "engine/memory_manager.inc"
.include "engine/enum_manager.inc"
.include "engine/define_manager.inc"

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

.include "engine/psg_manager.inc"

.include "engine/devkit_manager.inc"

	
.include "source/asm_manager.inc"

.include "source/audio_manager.inc"
	
.include "source/content_manager.inc"
	
.include "source/cursor_manager.inc"

.include "source/font_manager.inc"
	
.include "source/input_manager.inc"

.include "source/record_manager.inc"

.include "source/screen_manager.inc"
	
.include "source/scroll_manager.inc"

.include "source/storage_manager.inc"

.include "source/timer_manager.inc"

	

	
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
	
.include "screen/none_screen.inc"


	
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
	

.include "screen/title_screen.inc"	

.include "screen/scroll_screen.inc"
	
.include "screen/select_screen.inc"
	
.include "screen/record_screen.inc"

.include "screen/detail_screen.inc"
	
.include "screen/test_screen.inc"
	
.include "screen/func_screen.inc"


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


.include "engine/sms_manager.inc"

	
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