@echo off
REM albums

cd ..
cd banks
cd bank2


:: Tiles
bmp2tile.exe "raw\VanHalen1978.bmp" -savetiles "VanHalen1978 (tiles).psgcompr" -removedupes -mirror -planar -tileoffset 0 -savetilemap "VanHalen1978 (tilemap).stmcompr" -savepalette "VanHalen1978 (palette).bin" -fullpalette -exit


cd ..
folder2c bank2 bank2 2

sdcc -c --no-std-crt0 -mz80 --Werror --opt-code-speed --constseg BANK2 bank2.c

del *.asm > nul; del *.lst > nul; del *.sym > nul

cd ..
cd scripts