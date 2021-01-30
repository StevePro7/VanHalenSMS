@echo off
REM title

cd ..
cd banks
cd bank14


:: Tiles
bmp2tile.exe "raw\VanHalenTitle.bmp" -savetiles "VanHalenTitle (tiles).psgcompr" -removedupes -mirror -planar -tileoffset 64 -savetilemap "VanHalenTitle (tilemap).stmcompr" -savepalette "VanHalenTitle (palette).bin" -fullpalette -exit


cd ..
folder2c bank14 bank14 14

sdcc -c --no-std-crt0 -mz80 --Werror --opt-code-speed --constseg BANK14 bank14.c

del *.asm > nul; del *.lst > nul; del *.sym > nul

cd ..
cd scripts