; Data from 1233 to 1235 (3 bytes)	
_screen_splash_screen_load:	
	;.db $CD $2B $08
	call $082B
	
; Data from 1236 to 1238 (3 bytes)	
	;.db $CD $A2 $0A
	call $0AA2
	
; Data from 1239 to 123B (3 bytes)	
	;.db $CD $B8 $0A
	call $0AB8
	
; Data from 123C to 123E (3 bytes)	
	;.db $CD $25 $08
	call $0825
	
; Data from 123F to 1241 (3 bytes)	
	;.db $21 $96 $00
	ld hl, $0096
	
; Data from 1242 to 1242 (1 bytes)	
	;.db $E5
	push hl
	
; Data from 1243 to 1245 (3 bytes)	
	;.db $CD $63 $11
	call $1163
	
; Data from 1246 to 1248 (3 bytes)	
	;.db $21 $4B $00
	ld hl, $004B
	
; Data from 1249 to 1249 (1 bytes)	
	;.db $E3
	ex (sp), hl
	
; Data from 124A to 124C (3 bytes)	
	;.db $CD $9E $11
	call $119E
	
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
	call $117C
	
; Data from 125B to 125D (3 bytes)	
	;.db $DD $75 $FE
	ld (ix - 2), l
	
; Data from 125E to 125F (2 bytes)	
	;.db $3E $10
	ld a, $10
	
; Data from 1260 to 1260 (1 bytes)	
	;.db $F5
	push af
	
; Data from 1261 to 1261 (1 bytes)	
	;.db $33
	inc sp
	
; Data from 1262 to 1264 (3 bytes)	
	;.db $CD $D3 $0E
	call $0ED3
	
; Data from 1265 to 1265 (1 bytes)	
	;.db $33
	inc sp
	
; Data from 1266 to 1268 (3 bytes)	
	;.db $DD $75 $FF
	ld (ix - 1), l
	
; Data from 1269 to 126A (2 bytes)	
	;.db $3E $20
	ld a, $20
	
; Data from 126B to 126B (1 bytes)	
	;.db $F5
	push af
	
; Data from 126C to 126C (1 bytes)	
	;.db $33
	inc sp
	
; Data from 126D to 126F (3 bytes)	
	;.db $CD $00 $0F
	call $0F00
	
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
	call $11B3
	
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
	call $1141
	
; Data from 127F to 1281 (3 bytes)	
	;.db $CD $D5 $11
	call $11D5
	
; Data from 1282 to 1284 (3 bytes)	
	;.db $21 $1C $17
	ld hl, $171C
	
; Data from 1285 to 1285 (1 bytes)	
	;.db $E5
	push hl
	
; Data from 1286 to 1288 (3 bytes)	
	;.db $21 $B1 $12
	ld hl, $12B1
	
; Data from 1289 to 1289 (1 bytes)	
	;.db $E5
	push hl
	
; Data from 128A to 128C (3 bytes)	
	;.db $CD $E9 $0D
	call $0DE9
	
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
	call $11D5
	
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
	;.db $35
	dec (hl)
	
	;.db $31 $35 $30
	ld sp, $3035
	
	;.db $00
	nop