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