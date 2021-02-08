@echo off
REM albums

cd ..
cd banks
cd bank10

:: Tiles
bmp2tile.exe raw\VanHalen1986.bmp ^
	-savetiles 	"VanHalen1986 (tiles).inc" -removedupes -mirror -planar -tileoffset 0 ^
	-savetilemap "VanHalen1986 (tilemap).inc" ^
	-savepalette "VanHalen1986 (palette).inc" ^
	-fullpalette -exit

cd ..
cd ..
cd scripts