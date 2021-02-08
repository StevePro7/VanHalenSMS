@echo off
REM albums

cd ..
cd banks
cd bank8

:: Tiles
bmp2tile.exe raw\VanHalen1982.bmp ^
	-savetiles 	"VanHalen1982 (tiles).inc" -removedupes -mirror -planar -tileoffset 0 ^
	-savetilemap "VanHalen1982 (tilemap).inc" ^
	-savepalette "VanHalen1982 (palette).inc" ^
	-fullpalette -exit

cd ..
cd ..
cd scripts