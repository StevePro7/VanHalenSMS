.enum $C000 export	
Lmain.main$global_pause$1$55 db		; Lmain.main$global_pause$1$55 = $C000
PSGMusicStatus db		; PSGMusicStatus = $C001
_RAM_C002_ dw		; PSGMusicStart = $C002
_RAM_C004_ dw		; PSGMusicPointer = $C004
_RAM_C006_ dw		; PSGMusicLoopPoint = $C006
_RAM_C008_ db		; PSGMusicSkipFrames = $C008
_RAM_C009_ db		; PSGLoopFlag = $C009
_RAM_C00A_ db		; PSGMusicLastLatch = $C00A
_RAM_C00B_ db		; PSGMusicVolumeAttenuation = $C00B
_RAM_C00C_ db		; PSGMusicSubstringLen = $C00C
_RAM_C00D_ dw		; PSGMusicSubstringRetAddr = $C00D
_RAM_C00F_ db		; PSGChan0Volume = $C00F
_RAM_C010_ db		; PSGChan1Volume = $C010
_RAM_C011_ db		; PSGChan2Volume = $C011
_RAM_C012_ db		; PSGChan3Volume = $C012
_RAM_C013_ db		; PSGChan2LowTone = $C013
_RAM_C014_ db		; PSGChan2HighTone = $C014
_RAM_C015_ db		; PSGChan3LowTone = $C015
_RAM_C016_ db		; PSGChannel2SFX = $C016
_RAM_C017_ db		; PSGChannel3SFX = $C017
_RAM_C018_ db		; PSGSFXChan2Volume = $C018
_RAM_C019_ db		; PSGSFXChan3Volume = $C019
_RAM_C01A_ db		; PSGSFXStatus = $C01A
_RAM_C01B_ dw		; PSGSFXStart = $C01B
_RAM_C01D_ dw		; PSGSFXPointer = $C01D
_RAM_C01F_ dw		; PSGSFXLoopPoint = $C01F
_RAM_C021_ db		; PSGSFXSkipFrames = $C021
_RAM_C022_ db		; PSGSFXLoopFlag = $C022
_RAM_C023_ db		; PSGSFXSubstringLen = $C023
_RAM_C024_ dw		; PSGSFXSubstringRetAddr = $C024
.ende	
	
.enum $C02B export	
_RAM_C02B_ db		; Fscreen_manager$curr_screen_type = $C02B
_RAM_C02C_ db		; Fscreen_manager$next_screen_type = $C02C
_RAM_C02D_ dw		; Fscreen_manager$load_method$0$0 = $C02D
_RAM_C02F_ dw		; Fscreen_manager$load_method$0$0 + 2 = $C02F
_RAM_C031_ dw	
_RAM_C033_ dw	
_RAM_C035_ dw	
_RAM_C037_ dw	
_RAM_C039_ dw	
_RAM_C03B_ dw	
_RAM_C03D_ dw	
_RAM_C03F_ dw	
_RAM_C041_ dw	
_RAM_C043_ dw	
_RAM_C045_ dw	
_RAM_C047_ dw	
_RAM_C049_ dw	
_RAM_C04B_ dw	
_RAM_C04D_ dw	
_RAM_C04F_ dw	
_RAM_C051_ db		; G$global_scroll_object$0$0 = $C051
.ende	
	
.enum $C067 export	
_RAM_C067_ db		; VDPBlank = $C067
_RAM_C068_ db		; SMS_VDPFlags = $C068
_RAM_C069_ db		; PauseRequested = $C069
_RAM_C06A_ db		; VDPType = $C06A
_RAM_C06B_ dw		; KeysStatus = $C06B
_RAM_C06D_ dw		; PreviousKeysStatus = $C06D
_RAM_C06F_ db		; SpriteTableY = $C06F
.ende	
	
.enum $C0AF export	
_RAM_C0AF_ db		; SpriteTableXN = $C0AF
.ende	
	
.enum $C12F export	
_RAM_C12F_ db		; SpriteNextFree = $C12F
_RAM_C130_ dw		; SMS_theLineInterruptHandler = $C130
_RAM_C132_ db		; decompBuffer = $C132
.ende	
	
.enum $C152 export	
_RAM_C152_ dw		; Finput_manager$curr_joypad1$0$0 = $C152
_RAM_C154_ dw		; Finput_manager$prev_joypad1$0$0 = $C154
.ende	
	
.enum $C1B6 export	
_RAM_C1B6_ db		; VDPReg = $C1B6
.ende	
	
.enum $C1B8 export	
_RAM_C1B8_ db		; spritesHeight = $C1B8
_RAM_C1B9_ db		; spritesWidth = $C1B9
.ende	
	
.enum $FFFC export	
_RAM_FFFC_ db	
.ende	