@echo off
REM albums

cd ..
cd banks
cd bank9

:: Tiles
bmp2tile.exe raw\VanHalen1984.bmp ^
	-savetiles 	"VanHalen1984 (tiles).inc" -removedupes -mirror -planar -tileoffset 0 ^
	-savetilemap "VanHalen1984 (tilemap).inc" ^
	-savepalette "VanHalen1984 (palette).inc" ^
	-fullpalette -exit

cd ..
cd ..
cd scripts