@echo off
REM gfx		Commonly used gfx	not banked

cd ..
cd ..
cd gfx

:: Tiles
bmp2tile.exe raw\font.bmp -savetiles "font (tiles).psgcompr" -removedupes -tileoffset 0 -savetilemap "font (tilemap).bin" -savepalette "font (palette).bin" -exit


:: Sprites
bmp2tile.exe raw\sprite.bmp -savetiles "sprite (tiles).psgcompr" -noremovedupes -planar -tileoffset 0 -savepalette "sprite (palette).bin" -fullpalette  -spritepalette -exit

bmp2tile.exe raw\aaaa.png -savetiles "aaaa (tiles).psgcompr" -noremovedupes -planar -tileoffset 0 -savepalette "aaaa (palette).bin" -fullpalette  -spritepalette -exit
bmp2tile.exe raw\bbbb.png -savetiles "bbbb (tiles).psgcompr" -noremovedupes -planar -tileoffset 0 -savepalette "bbbb (palette).bin" -fullpalette  -spritepalette -exit
bmp2tile.exe raw\cccc.png -savetiles "cccc (tiles).psgcompr" -noremovedupes -planar -tileoffset 0 -savepalette "cccc (palette).bin" -fullpalette  -spritepalette -exit
bmp2tile.exe raw\dddd.png -savetiles "dddd (tiles).psgcompr" -noremovedupes -planar -tileoffset 0 -savepalette "dddd (palette).bin" -fullpalette  -spritepalette -exit
bmp2tile.exe raw\eeee.png -savetiles "eeee (tiles).psgcompr" -noremovedupes -planar -tileoffset 0 -savepalette "eeee (palette).bin" -fullpalette  -spritepalette -exit
bmp2tile.exe raw\ffff.png -savetiles "ffff (tiles).psgcompr" -noremovedupes -planar -tileoffset 0 -savepalette "ffff (palette).bin" -fullpalette  -spritepalette -exit


cd ..\dev

folder2c ..\gfx gfx

sdcc -c -mz80 --opt-code-speed --peep-file peep-rules.txt --std-c99 gfx.c

del *.asm > nul; del *.lst > nul; del *.sym > nul

::cd ..
cd scripts