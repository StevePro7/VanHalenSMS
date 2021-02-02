#include "record_screen.h"
#include "..\engine\asm_manager.h"
#include "..\engine\cursor_manager.h"
#include "..\engine\enum_manager.h"
#include "..\engine\font_manager.h"
#include "..\engine\input_manager.h"
#include "..\engine\record_manager.h"
#include "..\devkit\_sms_manager.h"

static void load_record();

void screen_record_screen_load()
{
	load_record();
}

void screen_record_screen_update( unsigned char *screen_type )
{
	struct_record_object *ro = &global_record_object;
	unsigned char input;

	input = engine_input_manager_hold( input_type_left );
	if( input )
	{
		engine_record_manager_decrement();
		load_record();
	}
	input = engine_input_manager_hold( input_type_right );
	if( input )
	{
		engine_record_manager_increment();
		load_record();
	}

	input = engine_input_manager_hold( input_type_fire2 );
	if( input )
	{
		devkit_SMS_setBGScrollY( GAP_OFFSET );
		engine_cursor_manager_init( ro->record_album_index );

		*screen_type = screen_type_select;
		return;
	}

	*screen_type = screen_type_record;
}

static void load_record()
{
	devkit_SMS_displayOff();
	engine_asm_manager_clear_VRAM();
	engine_record_manager_load();
	devkit_SMS_displayOn();
}