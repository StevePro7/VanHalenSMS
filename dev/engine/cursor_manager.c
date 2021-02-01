#include "cursor_manager.h"
#include "font_manager.h"
#include "global_manager.h"
#include "..\object\cursor_object.h"

// Global variable.
struct_cursor_object global_cursor_object;

void engine_cursor_manager_init( unsigned char index )
{
	struct_cursor_object *co = &global_cursor_object;
	co->cursor_index_x = index / MAX_GRID_Y;
	co->cursor_index_y = index % MAX_GRID_Y;

	co->cursor_value_x = ( co->cursor_index_x - 1 ) * TILE_PIXEL;
	co->cursor_value_y = ( co->cursor_index_y - 1 ) * TILE_PIXEL;

	// Adjust for on-screen alignment.
	co->cursor_value_x += 1;
	co->cursor_value_y -= 1;
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