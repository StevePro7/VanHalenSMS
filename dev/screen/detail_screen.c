#include "detail_screen.h"
#include "..\engine\cursor_manager.h"
#include "..\engine\content_manager.h"
#include "..\engine\enum_manager.h"
#include "..\engine\font_manager.h"
#include "..\engine\global_manager.h"
#include "..\engine\input_manager.h"
#include "..\engine\locale_manager.h"
#include "..\engine\sprite_manager.h"
#include "..\devkit\_sms_manager.h"

void screen_detail_screen_load()
{
	engine_content_manager_load_tiles();
	engine_content_manager_load_title();
	engine_content_manager_load_sprites();
	//engine_font_manager_draw_text( "DETAIL SCREEN!!", 2, 10 );
}

void screen_detail_screen_update( unsigned char *screen_type )
{
	unsigned char fx, fy;
	unsigned char sx, sy;
	unsigned char ox, oy;
	unsigned char tx, ty;

	sx = 4;
	sy = 16;
	ox = 3;
	oy = 3;

	fx = sx;
	fy = sy + 0 * oy;
	engine_font_manager_draw_text( "1978", fx, fy );
	fx += sx + ox;
	engine_font_manager_draw_text( "1979", fx, fy );
	fx += sx + ox;
	engine_font_manager_draw_text( "1980", fx, fy );
	fx += sx + ox;
	engine_font_manager_draw_text( "1981", fx, fy );

	fx = sx;
	fy = sy + 1 * oy;
	engine_font_manager_draw_text( "1982", fx, fy );
	fx += sx + ox;
	engine_font_manager_draw_text( "1984", fx, fy );
	fx += sx + ox;
	engine_font_manager_draw_text( "1986", fx, fy );
	fx += sx + ox;
	engine_font_manager_draw_text( "1988", fx, fy );

	fx = sx;
	fy = sy + 2 * oy;
	engine_font_manager_draw_text( "1991", fx, fy );
	fx += sx + ox;
	engine_font_manager_draw_text( "1995", fx, fy );
	fx += sx + ox;
	engine_font_manager_draw_text( "1998", fx, fy );
	fx += sx + ox;
	engine_font_manager_draw_text( "2012", fx, fy );

	//engine_font_manager_draw_text( "1234", 0, 23 );
	//engine_font_manager_draw_text( "7890", 28, fy + 1 );
	//engine_font_manager_draw_text( "1981", x + 4 + 3 * ox, y + 0 );

	tx = ( sx - 1 ) * 8;
	ty = ( sy + oy + oy - 1 ) * 8;
	engine_cursor_manager_draw( tx + 1, ty - 1, CURSOR_TILES );
	*screen_type = screen_type_detail;
}
