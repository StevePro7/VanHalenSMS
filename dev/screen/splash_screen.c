#include "splash_screen.h"
#include "..\engine\content_manager.h"
#include "..\engine\delay_manager.h"
#include "..\engine\enum_manager.h"
#include "..\engine\font_manager.h"
#include "..\engine\input_manager.h"
#include "..\devkit\_sms_manager.h"

#define SPLASH_SCREEN_DELAY		150

void screen_splash_screen_load()
{
	devkit_SMS_displayOff();
	engine_content_manager_load_splash();
	devkit_SMS_displayOn();

	engine_delay_manager_load( SPLASH_SCREEN_DELAY );
}

void screen_splash_screen_update( unsigned char *screen_type )
{
	unsigned char delay;
	unsigned char input;

	delay = engine_delay_manager_update();
	input = engine_input_manager_hold( input_type_fire1 );

	if( delay || input )
	{
		*screen_type = screen_type_title;
		return;
	}

	*screen_type = screen_type_splash;
}