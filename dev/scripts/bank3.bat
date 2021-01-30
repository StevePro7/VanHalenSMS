@echo off
REM albums

cd ..
cd banks
cd bank3


:: Tiles
bmp2tile.exe "raw\VanHalen1979.bmp" -savetiles "VanHalen1979 (tiles).psgcompr" -removedupes -mirror -planar -tileoffset 0 -savetilemap "VanHalen1979 (tilemap).stmcompr" -savepalette "VanHalen1979 (palette).bin" -fullpalette -exit


cd ..
folder2c bank3 bank3 3

sdcc -c --no-std-crt0 -mz80 --Werror --opt-code-speed --constseg BANK3 bank3.c

del *.asm > nul; del *.lst > nul; del *.sym > nul

cd ..
cd scripts