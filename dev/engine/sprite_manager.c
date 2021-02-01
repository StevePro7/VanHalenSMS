#include "sprite_manager.h"
#include "..\devkit\_sms_manager.h"

void engine_cursor_manager_draw( unsigned char x, unsigned char y, unsigned int tile )
{
	//devkit_SMS_addSprite( x + 0, y + 0, tile + 0 );
	//devkit_SMS_addSprite( x + 8, y + 0, tile + 1 );
	//devkit_SMS_addSprite( x + 16, y + 0, tile + 1 );
	//devkit_SMS_addSprite( x + 24, y + 0, tile + 1 );
	//devkit_SMS_addSprite( x + 28, y + 0, tile + 1 );
	//devkit_SMS_addSprite( x + 40, y + 8, tile + 5 );
	//devkit_SMS_addSprite( x + 0, y + 8, tile + 2 );
	//devkit_SMS_addSprite( x + 8, y + 8, tile + 3 );
}

void engine_sprite_manager_draw( unsigned char x, unsigned char y, unsigned int tile )
{
	devkit_SMS_addSprite( x + 0, y + 0, tile + 0 );
	devkit_SMS_addSprite( x + 8, y + 0, tile + 1 );
	devkit_SMS_addSprite( x + 0, y + 8, tile + 2 );
	devkit_SMS_addSprite( x + 8, y + 8, tile + 3 );
}