.enum $C000 export	
Lmain.main$global_pause$1$55 db		; Lmain.main$global_pause$1$55 = $C000
PSGMusicStatus db		; PSGMusicStatus = $C001
PSGMusicStart dw		; PSGMusicStart = $C002
PSGMusicPointer dw		; PSGMusicPointer = $C004
PSGMusicLoopPoint dw		; PSGMusicLoopPoint = $C006
PSGMusicSkipFrames db		; PSGMusicSkipFrames = $C008
PSGLoopFlag db		; PSGLoopFlag = $C009
PSGMusicLastLatch db		; PSGMusicLastLatch = $C00A
PSGMusicVolumeAttenuation db		; PSGMusicVolumeAttenuation = $C00B
PSGMusicSubstringLen db		; PSGMusicSubstringLen = $C00C
PSGMusicSubstringRetAddr dw		; PSGMusicSubstringRetAddr = $C00D
PSGChan0Volume db		; PSGChan0Volume = $C00F
PSGChan1Volume db		; PSGChan1Volume = $C010
PSGChan2Volume db		; PSGChan2Volume = $C011
PSGChan3Volume db		; PSGChan3Volume = $C012
PSGChan2LowTone db		; PSGChan2LowTone = $C013
PSGChan2HighTone db		; PSGChan2HighTone = $C014
PSGChan3LowTone db		; PSGChan3LowTone = $C015
PSGChannel2SFX db		; PSGChannel2SFX = $C016
PSGChannel3SFX db		; PSGChannel3SFX = $C017
PSGSFXChan2Volume db		; PSGSFXChan2Volume = $C018
PSGSFXChan3Volume db		; PSGSFXChan3Volume = $C019
PSGSFXStatus db		; PSGSFXStatus = $C01A
PSGSFXStart dw		; PSGSFXStart = $C01B
PSGSFXPointer dw		; PSGSFXPointer = $C01D
PSGSFXLoopPoint dw		; PSGSFXLoopPoint = $C01F
PSGSFXSkipFrames db		; PSGSFXSkipFrames = $C021
PSGSFXLoopFlag db		; PSGSFXLoopFlag = $C022
PSGSFXSubstringLen db		; PSGSFXSubstringLen = $C023
PSGSFXSubstringRetAddr dw		; PSGSFXSubstringRetAddr = $C024
.ende	
	
.enum $C02B export	
Fscreen_manager$curr_screen_type db	    ; Fscreen_manager$curr_screen_type = $C02B
Fscreen_manager$next_screen_type db	    ; Fscreen_manager$next_screen_type = $C02C
Fscreen_manager$load_method$0$0 dw	    ; Fscreen_manager$load_method$0$0 = $C02D
_RAM_C02F_ dw	
_RAM_C031_ dw	
_RAM_C033_ dw	
_RAM_C035_ dw	
_RAM_C037_ dw	
_RAM_C039_ dw	
_RAM_C03B_ dw	
_RAM_C03D_ dw	
Fscreen_manager$update_method$0$ dw	    ; Fscreen_manager$update_method$0$ = $C03F
_RAM_C041_ dw	
_RAM_C043_ dw	
_RAM_C045_ dw	
_RAM_C047_ dw	
_RAM_C049_ dw	
_RAM_C04B_ dw	
_RAM_C04D_ dw	
_RAM_C04F_ dw	
G$global_scroll_object$0$0 db	    ; G$global_scroll_object$0$0 = $C051
.ende	
	
.enum $C067 export	
VDPBlank db		; VDPBlank = $C067
SMS_VDPFlags db		; SMS_VDPFlags = $C068
PauseRequested db		; PauseRequested = $C069
VDPType db		; VDPType = $C06A
KeysStatus dw		; KeysStatus = $C06B
PreviousKeysStatus dw		; PreviousKeysStatus = $C06D
SpriteTableY db		; SpriteTableY = $C06F
.ende	
	
.enum $C0AF export	
SpriteTableXN db		; SpriteTableXN = $C0AF
.ende	
	
.enum $C12F export	
SpriteNextFree db		; SpriteNextFree = $C12F
SMS_theLineInterruptHandler dw		; SMS_theLineInterruptHandler = $C130
decompBuffer db		; decompBuffer = $C132
.ende	
	
.enum $C152 export	
Finput_manager$curr_joypad1$0$0 dw		; Finput_manager$curr_joypad1$0$0 = $C152
Finput_manager$prev_joypad1$0$0 dw		; Finput_manager$prev_joypad1$0$0 = $C154
.ende	
	
.enum $C1B6 export	
VDPReg db		; VDPReg = $C1B6
.ende	
	
.enum $C1B8 export	
spritesHeight db		; spritesHeight = $C1B8
spritesWidth db		; spritesWidth = $C1B9
.ende	
	
.enum $FFFC export	
_RAM_FFFC_ db	
.ende	