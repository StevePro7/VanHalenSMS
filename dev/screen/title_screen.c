#include "title_screen.h"
#include "..\engine\content_manager.h"
#include "..\engine\enum_manager.h"
#include "..\engine\font_manager.h"
#include "..\engine\input_manager.h"
#include "..\devkit\_sms_manager.h"

void screen_title_screen_load()
{
	//engine_font_manager_draw_text( "TITLE SCREEN!!", 2, 10 );
	devkit_SMS_displayOff();
	engine_content_manager_load_title();
	devkit_SMS_displayOn();
}

void screen_title_screen_update( unsigned char *screen_type )
{
	*screen_type = screen_type_title;
}
