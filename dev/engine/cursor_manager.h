#ifndef _CURSOR_MANAGER_H_
#define _CURSOR_MANAGER_H_

#include "..\object\cursor_object.h"

// Global variable.
extern struct_cursor_object global_cursor_object;

void engine_cursor_manager_init( unsigned char index );
void engine_cursor_manager_load();

#endif//_CURSOR_MANAGER_H_