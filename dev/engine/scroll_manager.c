#include "scroll_manager.h"
#include "global_manager.h"
#include "..\devkit\_sms_manager.h"

// Global variable.
struct_scroll_object global_scroll_object;

void engine_scroll_manager_reset()
{
	struct_scroll_object *so = &global_scroll_object;
	so->scroll_value_offset = GAP_OFFSET;
	devkit_SMS_setBGScrollY( GAP_OFFSET );
}
