@echo off
REM albums

cd ..
cd banks
cd bank3


:: Tiles
bmp2tile.exe raw\VanHalenTitleGap.bmp ^
	-savetiles 	"VanHalenTitleGap (tiles).inc" -removedupes -mirror -planar -tileoffset 0 ^
	-savetilemap "VanHalenTitleGap (tilemap).inc" ^
	-savepalette "VanHalenTitleGap (palette).inc" ^
	-fullpalette -exit

bmp2tile.exe raw\VanHalenTitleTop.bmp ^
	-savetiles 	"VanHalenTitleTop (tiles).inc" -removedupes -mirror -planar -tileoffset 0 ^
	-savetilemap "VanHalenTitleTop (tilemap).inc" ^
	-savepalette "VanHalenTitleTop (palette).inc" ^
	-fullpalette -exit
	
cd ..
cd ..
cd scripts