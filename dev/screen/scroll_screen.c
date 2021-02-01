#include "scroll_screen.h"
#include "..\engine\asm_manager.h"
#include "..\engine\content_manager.h"
#include "..\engine\cursor_manager.h"
#include "..\engine\enum_manager.h"
#include "..\engine\font_manager.h"
#include "..\engine\global_manager.h"
#include "..\engine\input_manager.h"
#include "..\engine\locale_manager.h"
#include "..\engine\sprite_manager.h"
#include "..\devkit\_sms_manager.h"

static unsigned char index;
static void print();

void screen_scroll_screen_load()
{
	devkit_SMS_displayOff();
	engine_asm_manager_clear_VRAM();
	engine_content_manager_load_tiles();
	engine_content_manager_load_title();
	engine_content_manager_load_sprites();

	engine_font_manager_draw_text( LOCALE_RECORD_TEXT, 6, 12 );
	engine_font_manager_draw_text( LOCALE_COVERS_TEXT, 20, 12 );
	//engine_cursor_manager_load();
	devkit_SMS_displayOn();

	index = 32;
	//print();
}

void screen_scroll_screen_update( unsigned char *screen_type )
{
	unsigned char input;
	input = engine_input_manager_hold( input_type_down );
	if( input )
	{
		devkit_SMS_setBGScrollY( index );
	}

	input = engine_input_manager_hold( input_type_fire1 );
	if( input )
	{
		//print();
		engine_cursor_manager_load();
	}

	input = engine_input_manager_move( input_type_left );
	if( input )
	{
		engine_cursor_manager_draw();
	}

	*screen_type = screen_type_scroll;
}

static void print()
{
	unsigned char idx;
	for( idx = 0; idx < 24; idx++ )
	{
		engine_font_manager_draw_data( idx, 25, idx );
	}
}