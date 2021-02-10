; Data from 122B to 122B (1 bytes)	
_screen_none_screen_load:	
	ret
	
; Data from 122C to 122C (1 bytes)	
_screen_none_screen_update:	
	.db $D1
	
	.db $C1
	
	.db $C5
	
	.db $D5
	
	.db $AF

	.db $02
	
	ret