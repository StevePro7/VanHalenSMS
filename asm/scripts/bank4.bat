@echo off
REM albums

cd ..
cd banks
cd bank4

:: Tiles
bmp2tile.exe raw\VanHalen1978.bmp ^
	-savetiles 	"VanHalen1978 (tiles).inc" -removedupes -mirror -planar -tileoffset 0 ^
	-savetilemap "VanHalen1978 (tilemap).inc" ^
	-savepalette "VanHalen1978 (palette).inc" ^
	-fullpalette -exit

cd ..
cd ..
cd scripts