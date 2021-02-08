@echo off
REM albums

cd ..
cd banks
cd bank15

:: Tiles
bmp2tile.exe raw\VanHalen2012.bmp ^
	-savetiles 	"VanHalen2012 (tiles).inc" -removedupes -mirror -planar -tileoffset 0 ^
	-savetilemap "VanHalen2012 (tilemap).inc" ^
	-savepalette "VanHalen2012 (palette).inc" ^
	-fullpalette -exit

cd ..
cd ..
cd scripts