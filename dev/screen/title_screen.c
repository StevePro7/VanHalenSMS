#include "title_screen.h"
#include "..\engine\content_manager.h"
#include "..\engine\enum_manager.h"
#include "..\engine\font_manager.h"
#include "..\engine\input_manager.h"
#include "..\engine\locale_manager.h"
#include "..\devkit\_sms_manager.h"

void screen_title_screen_load()
{
	devkit_SMS_displayOff();
	engine_content_manager_load_title();
	engine_font_manager_draw_text( LOCALE_PRESS_START, 10, 21 );
	devkit_SMS_displayOn();
}

void screen_title_screen_update( unsigned char *screen_type )
{
	*screen_type = screen_type_title;
}
