#include "cursor_manager.h"
#include "font_manager.h"
#include "global_manager.h"
#include "..\object\cursor_object.h"
#include "..\devkit\_sms_manager.h"

// Global variable.
struct_cursor_object global_cursor_object;

static void update_values();


void engine_cursor_manager_init( unsigned char index )
{
	struct_cursor_object *co = &global_cursor_object;

	co->cursor_index_x = index / MAX_GRID_Y;
	co->cursor_index_y = index % MAX_GRID_Y;
	update_values();
}

void engine_cursor_manager_load()
{
	unsigned char idx;
	unsigned char fx, fy;
	unsigned char vx, vy;
	const char *text;

	for( fy = 0; fy < MAX_GRID_Y; fy++ )
	{
		for( fx = 0; fx < MAX_GRID_X; fx++ )
		{
			idx = fx * MAX_GRID_Y + fy;

			vx = cursor_gridX[ fx ];
			vy = cursor_gridY[ fy ];
			text = cursor_album[ idx ];
			engine_font_manager_draw_text( text, vx, vy );
		}
	}
}

void engine_cursor_manager_draw()
{
	struct_cursor_object *co = &global_cursor_object;
	unsigned char x = co->cursor_value_x;
	unsigned char y = co->cursor_value_y;
	unsigned int tile = CURSOR_TILES;

	// Corners.
	devkit_SMS_addSprite( x + 0, y + 0, tile + 0 );
	devkit_SMS_addSprite( x + 40, y + 0, tile + 5 );
	devkit_SMS_addSprite( x + 0, y + 16, tile + 12 );
	devkit_SMS_addSprite( x + 40, y + 16, tile + 17 );

	// Top.
	devkit_SMS_addSprite( x + 8, y + 0, tile + 1 );
	devkit_SMS_addSprite( x + 16, y + 0, tile + 2 );
	devkit_SMS_addSprite( x + 24, y + 0, tile + 3 );
	devkit_SMS_addSprite( x + 32, y + 0, tile + 4 );

	// Sides.
	devkit_SMS_addSprite( x + 0, y + 8, tile + 6 );
	devkit_SMS_addSprite( x + 40, y + 8, tile + 11 );

	// Bottom.
	devkit_SMS_addSprite( x + 8, y + 16, tile + 13 );
	devkit_SMS_addSprite( x + 16, y + 16, tile + 14 );
	devkit_SMS_addSprite( x + 24, y + 16, tile + 15 );
	devkit_SMS_addSprite( x + 32, y + 16, tile + 16 );
}

static void update_values()
{
	struct_cursor_object *co = &global_cursor_object;
	unsigned char grid_x = cursor_gridX[ co->cursor_index_x ];
	unsigned char grid_y = cursor_gridY[ co->cursor_index_y ];

	co->cursor_value_x = ( grid_x - 1 ) * TILE_PIXEL;
	co->cursor_value_y = ( grid_y - 1 ) * TILE_PIXEL;

	// Adjust for on-screen alignment.
	co->cursor_value_x += 1;
	co->cursor_value_y -= 1;
}