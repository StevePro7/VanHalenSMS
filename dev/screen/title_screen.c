#include "title_screen.h"
#include "..\engine\enum_manager.h"
#include "..\engine\font_manager.h"

void screen_title_screen_load()
{
	engine_font_manager_draw_text( "TITLE SCREEN!!", 2, 10 );
}

void screen_title_screen_update( unsigned char *screen_type )
{
	*screen_type = screen_type_title;
}
