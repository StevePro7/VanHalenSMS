#include "content_manager.h"
#include "global_manager.h"
#include "..\devkit\_sms_manager.h"
#include "..\banks\bank14.h"
#include "..\banks\bank15.h"
#include "..\gfx.h"

#define FONT_TILES		0
#define OPTION_TILES	64

// Tiles.
void engine_content_manager_load_tiles()
{
	devkit_SMS_loadPSGaidencompressedTiles( font__tiles__psgcompr, FONT_TILES );
	devkit_SMS_loadBGPalette( ( void * ) font__palette__bin );
}

void engine_content_manager_load_splash()
{
	devkit_SMS_mapROMBank( splash__tiles__psgcompr_bank );
	devkit_SMS_loadPSGaidencompressedTiles( splash__tiles__psgcompr, OPTION_TILES );
	devkit_SMS_loadSTMcompressedTileMap( 0, 0, ( void * ) splash__tilemap__stmcompr );
	devkit_SMS_loadBGPalette( ( void * ) splash__palette__bin );
}

void engine_content_manager_load_title()
{
	devkit_SMS_mapROMBank( VanHalenTitle__tiles__psgcompr_bank );
	devkit_SMS_loadPSGaidencompressedTiles( VanHalenTitle__tiles__psgcompr, OPTION_TILES );
	devkit_SMS_loadSTMcompressedTileMap( 0, 0, ( void * ) VanHalenTitle__tilemap__stmcompr );
	devkit_SMS_loadBGPalette( ( void * ) VanHalenTitle__palette__bin );

	// Set the font tile text to white.
	devkit_SMS_setBGPaletteColor( 15, 3, 3, 3 );
}

// Sprites.
void engine_content_manager_load_sprites()
{
	// Sprite tiles.
	devkit_SMS_loadPSGaidencompressedTiles( sprite__tiles__psgcompr, SPRITE_TILES );
	devkit_SMS_loadSpritePalette( ( void * ) sprite__palette__bin );
}