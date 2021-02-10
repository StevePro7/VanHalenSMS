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
		ld hl, _screen_none_screen_load	; _screen_none_screen_load = $122B
		ld (Fscreen_manager$load_method$0$0), hl	; Fscreen_manager$load_method$0$0 = $C02D
		ld hl, _screen_splash_screen_load	; _screen_splash_screen_load = $1233
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
		ld hl, _screen_none_screen_update	; _screen_none_screen_update = $122C
		ld (Fscreen_manager$update_method$0$), hl	; Fscreen_manager$update_method$0$ = $C03F
		ld hl, _screen_splash_screen_update	; _screen_splash_screen_update = $124F
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
	