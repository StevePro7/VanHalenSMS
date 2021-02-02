#include "timer_manager.h"

// Global variables.
struct_delay_object global_delay_object;
struct_reset_object global_reset_object;

//unsigned int delay_value;
//unsigned int delay_timer;

void engine_delay_manager_load( unsigned int delay )
{
	struct_delay_object *dObj = &global_delay_object;
	dObj->delay_value = delay;
	dObj->delay_timer = 0;
	//delay_value = delay;
	//delay_timer = 0;
}

unsigned char engine_delay_manager_update()
{
	struct_delay_object *dObj = &global_delay_object;
	unsigned char test;

	dObj->delay_timer++;
	test = dObj->delay_timer >= dObj->delay_value;
	if( test )
	{
		dObj->delay_timer = 0;
	}

	return test;
}