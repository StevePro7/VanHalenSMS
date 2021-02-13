; Data from A70 to A72 (3 bytes)
_engine_audio_manager_sfx_right:
	;.db $21 $22 $1B
	;ld hl, $1B22
	ld hl, _sfx_right_psg

; Data from A73 to A73 (1 bytes)
	push hl

; Data from A74 to A76 (3 bytes)
	;.db $CD $8B $0A
	call play_sfx

; Data from A77 to A77 (1 bytes)
	pop af

; Data from A78 to A78 (1 bytes)
	ret

; Data from A79 to A7B (3 bytes)
_engine_audio_manager_sfx_wrong:
	;.db $21 $42 $1B
	ld hl, _sfx_wrong_psg

; Data from A7C to A7C (1 bytes)
	push hl

; Data from A7D to A7F (3 bytes)
	;.db $CD $8B $0A
	call play_sfx

; Data from A80 to A80 (1 bytes)
	pop af

; Data from A81 to A81 (1 bytes)
	ret

; Data from A82 to A84 (3 bytes)
_engine_audio_manager_sfx_cheat:
	;.db $21 $FF $1A
	ld hl, _sfx_cheat_psg

; Data from A85 to A85 (1 bytes)
	push hl

; Data from A86 to A88 (3 bytes)
	;.db $CD $8B $0A
	call play_sfx

; Data from A89 to A89 (1 bytes)
	pop af

; Data from A8A to A8A (1 bytes)
	ret

 play_sfx:
; Data from A8B to A8D (3 bytes)
	;.db $CD $42 $0A
	call $0A42

; Data from A8E to A8E (1 bytes)
	ld a, l

; Data from A8F to A8F (1 bytes)
	or a

; Data from A90 to A90 (1 bytes)
	;.db $C0
	ret nz

; Data from A91 to A93 (3 bytes)
	;.db $CD $51 $0A
	call $0A51

; Data from A94 to A94 (1 bytes)
	;.db $65
	ld h, l

; Data from A95 to A95 (1 bytes)
	pop de

; Data from A96 to A96 (1 bytes)
	pop bc

; Data from A97 to A97 (1 bytes)
	push bc

; Data from A98 to A98 (1 bytes)
	push de

; Data from A99 to A99 (1 bytes)
	push hl

; Data from A9A to A9A (1 bytes)
	inc sp

; Data from A9B to A9B (1 bytes)
	push bc

; Data from A9C to A9E (3 bytes)
	;.db $CD $2A $0A
	call $0A2A

; Data from A9F to A9F (1 bytes)
	pop af

; Data from AA0 to AA0 (1 bytes)
	inc sp

; Data from AA1 to AA1 (1 bytes)
	ret
