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