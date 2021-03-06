; Data from 1233 to 1235 (3 bytes)	
_screen_splash_screen_load:	
	;.db $CD $2B $08
	call _devkit_SMS_displayOff
	
; Data from 1236 to 1238 (3 bytes)	
	;.db $CD $A2 $0A
	call _engine_content_manager_load_til
	
; Data from 1239 to 123B (3 bytes)	
	;.db $CD $B8 $0A
	call _engine_content_manager_load_spl
	
; Data from 123C to 123E (3 bytes)	
	;.db $CD $25 $08
	call _devkit_SMS_displayOn
	
; Data from 123F to 1241 (3 bytes)	
	;.db $21 $96 $00
	ld hl, $0096		; SPLASH_SCREEN_DELAY		150
	
; Data from 1242 to 1242 (1 bytes)	
	;.db $E5
	push hl
	
; Data from 1243 to 1245 (3 bytes)	
	;.db $CD $63 $11
	call _engine_delay_manager_load
	
; Data from 1246 to 1248 (3 bytes)	
	;.db $21 $4B $00
	ld hl, $004B		; DELETE_SCREEN_DELAY		75
	
; Data from 1249 to 1249 (1 bytes)	
	;.db $E3
	ex (sp), hl
	
; Data from 124A to 124C (3 bytes)	
	;.db $CD $9E $11
	call _engine_reset_manager_load
	
; Data from 124D to 124D (1 bytes)	
	;.db $F1
	pop af
	
; Data from 124E to 124E (1 bytes)	
	ret
	
	
; Data from 124F to 1250 (2 bytes)	
_screen_splash_screen_update:	
	;.db $DD $E5
	push ix
	
; Data from 1251 to 1254 (4 bytes)	
	;.db $DD $21 $00 $00
	ld ix, $0000
	
; Data from 1255 to 1256 (2 bytes)	
	;.db $DD $39
	add ix, sp
	
; Data from 1257 to 1257 (1 bytes)	
	;.db $F5
	push af
	
; Data from 1258 to 125A (3 bytes)	
	;.db $CD $7C $11
	call _engine_delay_manager_update
	
; Data from 125B to 125D (3 bytes)	
	;.db $DD $75 $FE
	ld (ix - 2), l
	
; Data from 125E to 125F (2 bytes)	
	;.db $3E $10
	ld a, $10		; input_type_fire1
	
; Data from 1260 to 1260 (1 bytes)	
	;.db $F5
	push af
	
; Data from 1261 to 1261 (1 bytes)	
	;.db $33
	inc sp
	
; Data from 1262 to 1264 (3 bytes)	
	;.db $CD $D3 $0E
	call _engine_input_manager_hold
	
; Data from 1265 to 1265 (1 bytes)	
	;.db $33
	inc sp
	
; Data from 1266 to 1268 (3 bytes)	
	;.db $DD $75 $FF
	ld (ix - 1), l
	
; Data from 1269 to 126A (2 bytes)	
	;.db $3E $20
	ld a, $20		; input_type_fire2
	
; Data from 126B to 126B (1 bytes)	
	;.db $F5
	push af
	
; Data from 126C to 126C (1 bytes)	
	;.db $33
	inc sp
	
; Data from 126D to 126F (3 bytes)	
	;.db $CD $00 $0F
	call _engine_input_manager_move
	
; Data from 1270 to 1270 (1 bytes)	
	;.db $33
	inc sp
	
; Data from 1271 to 1271 (1 bytes)	
	;.db $7D
	ld a, l

; Data from 1272 to 1272 (1 bytes)	
	;.db $B7
	or a
	
; Data from 1273 to 1274 (2 bytes)	
	;.db $28 $1C
	jr z, $1C
	
; Data from 1275 to 1277 (3 bytes)	
	;.db $CD $B3 $11
	call _engine_reset_manager_update
	
; Data from 1278 to 1278 (1 bytes)	
	;.db $7D
	ld a, l
	
; Data from 1279 to 1279 (1 bytes)	
	;.db $B7
	or a
	
; Data from 127A to 127B (2 bytes)	
	;.db $28 $18
	jr z, $18
	
; Data from 127C to 127E (3 bytes)	
	;;.db $CD $41 $11
	call _engine_storage_manager_erase
	
; Data from 127F to 1281 (3 bytes)	
	;.db $CD $D5 $11
	call _engine_reset_manager_reset
	
; Data from 1282 to 1284 (3 bytes)	
	;.db $21 $1C $17
	ld hl, $171C
	
; Data from 1285 to 1285 (1 bytes)	
	;.db $E5
	push hl
	
; Data from 1286 to 1288 (3 bytes)	
	;.db $21 $B1 $12
	ld hl, reset_label
	
; Data from 1289 to 1289 (1 bytes)	
	;.db $E5
	push hl
	
; Data from 128A to 128C (3 bytes)	
	;.db $CD $E9 $0D
	call _engine_font_manager_draw_text
	
; Data from 128D to 128D (1 bytes)	
	;.db $F1
	pop af
	
; Data from 128E to 128E (1 bytes)	
	;.db $F1
	pop af
	
; Data from 128F to 1290 (2 bytes)	
	;.db $18 $03
	jr $03
	
; Data from 1291 to 1293 (3 bytes)	
	;.db $CD $D5 $11
	call _engine_reset_manager_reset
	
; Data from 1294 to 1296 (3 bytes)	
	;.db $DD $6E $04
	ld l, (ix + $04)
	
; Data from 1297 to 1299 (3 bytes)	
	;.db $DD $66 $05
	ld h, (ix + $05)
	
; Data from 129A to 129C (3 bytes)	
	;.db $DD $7E $FE
	ld a, (ix - 2)
	
; Data from 129D to 129D (1 bytes)	
	;.db $B7
	or a
	
; Data from 129E to 129F (2 bytes)	
	;.db $20 $06
	jr nz, $06
	
; Data from 12A0 to 12A2 (3 bytes)	
	;.db $DD $7E $FF
	ld a, (ix - 1)
	
; Data from 12A3 to 12A3 (1 bytes)	
	;.db $B7
	or a
	
; Data from 12A4 to 12A5 (2 bytes)	
	;.db $28 $04
	jr z, $04
	
; Data from 12A6 to 12A7 (2 bytes)	
	;.db $36 $02
	ld (hl), $02
	
; Data from 12A8 to 12A9 (2 bytes)	
	;.db $18 $02
	jr $02
	
; Data from 12AA to 12AB (2 bytes)	
	;.db $36 $01
	ld (hl), $01
	
; Data from 12AC to 12AD (2 bytes)	
	;.db $DD $F9
	ld sp,ix
	
; Data from 12AE to 12AF (2 bytes)	
	;.db $DD $E1
	pop ix
	
; Data from 12B0 to 12B0 (1 bytes)	
	ret
	
; Data from 12B1 to 12B5 (5 bytes)
reset_label:
	; "5150"
	.db $35 $31 $35 $30 $00