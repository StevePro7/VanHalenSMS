#include "screen_manager.h"
//#include "global_manager.h"
#include "enum_manager.h"

// Screens
#include "..\screen\none_screen.h"
#include "..\screen\splash_screen.h"
//#include "..\screen\begin_screen.h"
//#include "..\screen\title_screen.h"
//#include "..\screen\start_screen.h"
//#include "..\screen\init_screen.h"
//#include "..\screen\load_screen.h"
//#include "..\screen\ready_screen.h"
//#include "..\screen\play_screen.h"
//#include "..\screen\pass_screen.h"
//#include "..\screen\dead_screen.h"
//#include "..\screen\cont_screen.h"
//#include "..\screen\over_screen.h"
//#include "..\screen\prep_screen.h"
//#include "..\screen\fight_screen.h"
//#include "..\screen\boss_screen.h"
//#include "..\screen\beat_screen.h"
//#include "..\screen\option_screen.h"

static unsigned char curr_screen_type;
static unsigned char next_screen_type;

static void( *load_method[ 2 ] )( );
static void( *update_method[ 2 ] )( unsigned char *screen_type );

void engine_screen_manager_init( unsigned char open_screen_type )
{
	next_screen_type = open_screen_type;
	curr_screen_type = screen_type_none;

	// Set load methods.
	load_method[ screen_type_none ] = screen_none_screen_load;
	load_method[ screen_type_splash ] = screen_splash_screen_load;


	// Set update methods.
	update_method[ screen_type_none ] = screen_none_screen_update;
	update_method[ screen_type_splash ] = screen_splash_screen_update;

}

void engine_screen_manager_update()
{
	if( curr_screen_type != next_screen_type )
	{
		curr_screen_type = next_screen_type;
		load_method[ curr_screen_type ]();
	}

	update_method[ curr_screen_type ]( &next_screen_type );
}
