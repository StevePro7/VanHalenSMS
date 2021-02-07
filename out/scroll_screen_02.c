#include "scroll_screen.h"
#include "..\engine\audio_manager.h"
#include "..\engine\asm_manager.h"
#include "..\engine\content_manager.h"
#include "..\engine\enum_manager.h"
#include "..\engine\font_manager.h"
#include "..\engine\global_manager.h"
#include "..\engine\input_manager.h"
#include "..\engine\locale_manager.h"
#include "..\engine\scroll_manager.h"
#include "..\engine\timer_manager.h"
#include "..\devkit\_sms_manager.h"

#define SCROLL_VALUE_DELAY	10
#define SCROLL_VALUE_RESET	950

static unsigned char event_stage;
static unsigned char offset;

void screen_scroll_screen_load()
{
	engine_delay_manager_load( SCROLL_VALUE_DELAY );
	engine_reset_manager_load( SCROLL_VALUE_RESET );
	event_stage = event_stage_start;
	offset = 0;
}

void screen_scroll_screen_update( unsigned char *screen_type )
{
	unsigned char delay;
	unsigned char reset;
	unsigned char input;
	unsigned char value;

	if( event_stage_delay == event_stage )
	{
		delay = engine_delay_manager_update();
		reset = engine_reset_manager_update();

		*screen_type = reset ? screen_type_select : screen_type_scroll;
		return;
	}

	value = TOP_SCROLL == offset;
	devkit_SMS_setBGScrollY( offset++ );

	input = engine_input_manager_hold( input_type_fire1 );
	if( input || value )
	{
		engine_scroll_manager_load( TOP_OFFSET );
		devkit_SMS_setBGScrollY( TOP_SCROLL );

		//*screen_type = screen_type_select;
		//return;
	}

	*screen_type = screen_type_scroll;
}
