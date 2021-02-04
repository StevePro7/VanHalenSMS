@echo off
REM albums

cd ..
cd banks
cd bank12

:: Tiles
bmp2tile.exe raw\VanHalen1991.bmp ^
	-savetiles 	"VanHalen1991 (tiles).inc" -removedupes -mirror -planar -tileoffset 0 ^
	-savetilemap "VanHalen1991 (tilemap).inc" ^
	-savepalette "VanHalen1991 (palette).inc" ^
	-fullpalette -exit

cd ..
cd ..
cd scripts