#include "func_screen.h"
#include "..\engine\audio_manager.h"
#include "..\engine\content_manager.h"
#include "..\engine\enum_manager.h"
#include "..\engine\font_manager.h"
#include "..\engine\global_manager.h"
#include "..\engine\input_manager.h"
#include "..\engine\sprite_manager.h"

void screen_func_screen_load()
{
	engine_content_manager_load_tiles();
	engine_content_manager_load_sprites();
	engine_font_manager_draw_text( "FUNC SCREEN...!!", 2, 10 );
}

void screen_func_screen_update( unsigned char *screen_type )
{
	//unsigned char input;
	//input = engine_input_manager_hold( input_type_right );
	//if( input )
	//{
	//	engine_audio_manager_sfx_right();
	//}
	//input = engine_input_manager_hold( input_type_left );
	//if( input )
	//{
	//	engine_audio_manager_sfx_wrong();
	//}
	//input = engine_input_manager_hold( input_type_down );
	//if( input )
	//{
	//	engine_audio_manager_sfx_cheat();
	//}

	//engine_sprite_manager_draw( 40, 40, SPRITE_TILES + 24 );
	engine_cursor_manager_draw( 40, 40, CURSOR_TILES );
	*screen_type = screen_type_func;
}
