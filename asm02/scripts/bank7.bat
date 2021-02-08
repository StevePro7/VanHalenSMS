@echo off
REM albums

cd ..
cd banks
cd bank7

:: Tiles
bmp2tile.exe raw\VanHalen1981.bmp ^
	-savetiles 	"VanHalen1981 (tiles).inc" -removedupes -mirror -planar -tileoffset 0 ^
	-savetilemap "VanHalen1981 (tilemap).inc" ^
	-savepalette "VanHalen1981 (palette).inc" ^
	-fullpalette -exit

cd ..
cd ..
cd scripts