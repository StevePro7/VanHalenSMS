@echo off
REM albums

cd ..
cd banks
cd bank14

:: Tiles
bmp2tile.exe raw\VanHalen1998.bmp ^
	-savetiles 	"VanHalen1998 (tiles).inc" -removedupes -mirror -planar -tileoffset 0 ^
	-savetilemap "VanHalen1998 (tilemap).inc" ^
	-savepalette "VanHalen1998 (palette).inc" ^
	-fullpalette -exit

cd ..
cd ..
cd scripts