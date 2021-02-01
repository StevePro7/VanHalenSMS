#include "scroll_screen.h"
#include "..\engine\content_manager.h"
#include "..\engine\enum_manager.h"
#include "..\engine\font_manager.h"
#include "..\engine\global_manager.h"
#include "..\engine\input_manager.h"
#include "..\engine\locale_manager.h"
#include "..\engine\sprite_manager.h"
#include "..\devkit\_sms_manager.h"

void screen_scroll_screen_load()
{
	engine_content_manager_load_tiles();
	engine_content_manager_load_title();
	engine_content_manager_load_sprites();
	engine_font_manager_draw_text( "SCROLL SCREEN!!", 2, 10 );
}

void screen_scroll_screen_update( unsigned char *screen_type )
{
	*screen_type = screen_type_scroll;
}
