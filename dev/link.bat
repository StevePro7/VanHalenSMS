@echo off
REM echo Linking
sdcc -o output.ihx --Werror --opt-code-speed -mz80 --no-std-crt0 --data-loc 0xC000 ^
-Wl-b_BANK2=0x8000 ^
-Wl-b_BANK3=0x8000 ^
-Wl-b_BANK4=0x8000 ^
-Wl-b_BANK5=0x8000 ^
-Wl-b_BANK6=0x8000 ^
-Wl-b_BANK7=0x8000 ^
-Wl-b_BANK8=0x8000 ^
-Wl-b_BANK9=0x8000 ^
-Wl-b_BANK10=0x8000 ^
-Wl-b_BANK11=0x8000 ^
-Wl-b_BANK12=0x8000 ^
-Wl-b_BANK13=0x8000 ^
-Wl-b_BANK14=0x8000 ^
-Wl-b_BANK15=0x8000 ^
..\crt0\crt0_sms.rel main.rel ^
..\lib\SMSlib.lib ^
..\lib\PSGlib.rel ^
banks\bank2.rel ^
banks\bank3.rel ^
banks\bank4.rel ^
banks\bank5.rel ^
banks\bank6.rel ^
banks\bank7.rel ^
banks\bank8.rel ^
banks\bank9.rel ^
banks\bank10.rel ^
banks\bank11.rel ^
banks\bank12.rel ^
banks\bank13.rel ^
banks\bank14.rel ^
banks\bank15.rel ^
devkit\_sms_manager.rel ^
devkit\_snd_manager.rel ^
engine\asm_manager.rel ^
engine\content_manager.rel ^
engine\enum_manager.rel ^
engine\font_manager.rel ^
engine\input_manager.rel ^
engine\screen_manager.rel ^
engine\sprite_manager.rel ^
screen\none_screen.rel ^
screen\splash_screen.rel ^
gfx.rel

@echo on