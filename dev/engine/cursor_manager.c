#include "cursor_manager.h"
#include "font_manager.h"
#include "..\object\cursor_object.h"

void foo()
{
	unsigned char idx;
	unsigned char fx, fy;
	unsigned char vx, vy;
	const char *text;

	fx = 0;
	fy = 0;

	idx = fx * MAX_GRID_X + fx;

	vx = cursor_gridX[ fx ];
	vy = cursor_gridY[ fy ];
	text = cursor_album[ idx ];
	engine_font_manager_draw_text( text, vx, vy );
}