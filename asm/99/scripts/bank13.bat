@echo off
REM albums

cd ..
cd banks
cd bank13

:: Tiles
bmp2tile.exe raw\VanHalen1995.bmp ^
	-savetiles 	"VanHalen1995 (tiles).inc" -removedupes -mirror -planar -tileoffset 0 ^
	-savetilemap "VanHalen1995 (tilemap).inc" ^
	-savepalette "VanHalen1995 (palette).inc" ^
	-fullpalette -exit

cd ..
cd ..
cd scripts