@echo off
REM albums

cd ..
cd banks
cd bank11

:: Tiles
bmp2tile.exe raw\VanHalen1988.bmp ^
	-savetiles 	"VanHalen1988 (tiles).inc" -removedupes -mirror -planar -tileoffset 0 ^
	-savetilemap "VanHalen1988 (tilemap).inc" ^
	-savepalette "VanHalen1988 (palette).inc" ^
	-fullpalette -exit

cd ..
cd ..
cd scripts