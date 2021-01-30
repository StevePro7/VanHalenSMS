@echo off
REM albums

cd ..
cd banks
cd bank6


:: Tiles
bmp2tile.exe "raw\VanHalen1982.bmp" -savetiles "VanHalen1982 (tiles).psgcompr" -removedupes -mirror -planar -tileoffset 0 -savetilemap "VanHalen1982 (tilemap).stmcompr" -savepalette "VanHalen1982 (palette).bin" -fullpalette -exit


cd ..
folder2c bank6 bank6 6

sdcc -c --no-std-crt0 -mz80 --Werror --opt-code-speed --constseg BANK6 bank6.c

del *.asm > nul; del *.lst > nul; del *.sym > nul

cd ..
cd scripts