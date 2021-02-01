#include "record_screen.h"
#include "..\engine\audio_manager.h"
#include "..\engine\enum_manager.h"
#include "..\engine\font_manager.h"
#include "..\engine\input_manager.h"
#include "..\engine\record_manager.h"
#include "..\devkit\_sms_manager.h"

static void load_record();

void screen_record_screen_load()
{
	//engine_record_manager_init( 5 );
	load_record();
}

void screen_record_screen_update( unsigned char *screen_type )
{
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
		*screen_type = screen_type_title;
		return;
	}

	*screen_type = screen_type_record;
}

static void load_record()
{
	devkit_SMS_displayOff();
	//engine_asm_manager_clear_VRAM();
	engine_record_manager_load();
	devkit_SMS_displayOn();
}