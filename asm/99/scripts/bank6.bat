@echo off
REM albums

cd ..
cd banks
cd bank6

:: Tiles
bmp2tile.exe raw\VanHalen1980.bmp ^
	-savetiles 	"VanHalen1980 (tiles).inc" -removedupes -mirror -planar -tileoffset 0 ^
	-savetilemap "VanHalen1980 (tilemap).inc" ^
	-savepalette "VanHalen1980 (palette).inc" ^
	-fullpalette -exit

cd ..
cd ..
cd scripts