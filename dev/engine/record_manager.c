#include "record_manager.h"
#include "..\devkit\_sms_manager.h"
#include "..\object\record_object.h"

#define RECORD_TILES	0

void engine_record_manager_load( unsigned char index )
{
	const unsigned char *tiles = ( const unsigned char * ) record_tiles_data[ index ];
	const unsigned char *tilemap = ( const unsigned char * ) record_tilemap_data[ index ];

	const unsigned char bank = ( const unsigned char ) record_tiles_bank[ index ];

	devkit_SMS_mapROMBank( bank );
	devkit_SMS_loadPSGaidencompressedTiles( tiles, RECORD_TILES );
	devkit_SMS_loadSTMcompressedTileMap( 0, 0, ( void * ) tilemap );

	// Not too sure why this works but it works!
	devkit_SMS_loadBGPalette( ( void * ) record_palette_data[ 0 ] );
}