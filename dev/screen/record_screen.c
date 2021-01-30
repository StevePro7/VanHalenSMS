#include "record_screen.h"
//#include "..\engine\asm_manager.h"
#include "..\engine\enum_manager.h"
#include "..\engine\font_manager.h"
#include "..\engine\input_manager.h"
#include "..\engine\record_manager.h"
#include "..\devkit\_sms_manager.h"

void screen_record_screen_load()
{
	devkit_SMS_displayOff();
	//engine_asm_manager_clear_VRAM();
	engine_record_manager_load( 11 );
	devkit_SMS_displayOn();

	//engine_font_manager_draw_text( "RECORD SCREEN!!", 2, 10 );
}

void screen_record_screen_update( unsigned char *screen_type )
{
	*screen_type = screen_type_record;
}
