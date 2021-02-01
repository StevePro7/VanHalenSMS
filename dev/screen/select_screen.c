#include "select_screen.h"
#include "..\engine\cursor_manager.h"
#include "..\engine\enum_manager.h"
#include "..\engine\font_manager.h"
#include "..\engine\record_manager.h"

void screen_select_screen_load()
{
	engine_cursor_manager_init( 2 );
	engine_cursor_manager_load();
	//engine_record_manager_init( 0 );
	
	engine_font_manager_draw_text( "SELECT SCREEN!!!", 2, 4 );
}

void screen_select_screen_update( unsigned char *screen_type )
{
	engine_cursor_manager_draw();
	*screen_type = screen_type_select;
}
