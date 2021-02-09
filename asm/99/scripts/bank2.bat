@echo off
REM albums

cd ..
cd banks
cd bank2


:: Tiles
bmp2tile.exe raw\splash.bmp -savetiles "splash (tiles).inc" -removedupes -mirror -planar -tileoffset 64 -savetilemap "splash (tilemap).inc" -savepalette "splash (palette).inc" -fullpalette -exit


cd ..
cd ..
cd scripts