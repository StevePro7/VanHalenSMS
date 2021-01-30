#include "delay_manager.h"

unsigned int delay_value;
unsigned int delay_timer;

void engine_delay_manager_load( unsigned int delay )
{
	delay_value = delay;
	delay_timer = 0;
}

unsigned char engine_delay_manager_update()
{
	unsigned char test;

	delay_timer++;
	test = delay_timer >= delay_value;
	if( test )
	{
		delay_timer = 0;
	}

	return test;
}