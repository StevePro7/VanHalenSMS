#ifndef _DELAY_MANAGER_H_
#define _DELAY_MANAGER_H_

void engine_delay_manager_load( unsigned int delay );
unsigned char engine_delay_manager_update();

extern unsigned int delay_value;
extern unsigned int delay_timer;

#endif//_DELAY_MANAGER_H_