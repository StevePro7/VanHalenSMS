@echo off
REM albums

cd ..
cd banks
cd bank5

:: Tiles
bmp2tile.exe raw\VanHalen1979.bmp ^
	-savetiles 	"VanHalen1979 (tiles).inc" -removedupes -mirror -planar -tileoffset 0 ^
	-savetilemap "VanHalen1979 (tilemap).inc" ^
	-savepalette "VanHalen1979 (palette).inc" ^
	-fullpalette -exit

cd ..
cd ..
cd scripts