#include "splash_screen.h"
#include "..\devkit\_sms_manager.h"
#include "..\engine\enum_manager.h"
#include "..\engine\content_manager.h"
#include "..\engine\font_manager.h"
#include "..\engine\global_manager.h"
#include "..\engine\sprite_manager.h"

void screen_splash_screen_load()
{
	devkit_SMS_displayOff();
	engine_content_manager_load_tiles();
	engine_content_manager_load_sprites();
	devkit_SMS_displayOn();

	//engine_font_manager_draw_char( 'C', 24, 20 );
	engine_font_manager_draw_text( "1984", 14, 20 );
	//engine_font_manager_draw_data( 246, 4, 20 );
}

void screen_splash_screen_update( unsigned char *screen_type )
{
	engine_sprite_manager_draw( 64, 86, SPRITE_TILES );
	*screen_type = screen_type_splash;
}