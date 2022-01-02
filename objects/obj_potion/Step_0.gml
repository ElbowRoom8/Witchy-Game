/// @description Follows mouse
// follow mouse if clicked
if(touchingMouse){
	mouseUsed = true;
	if (mouse_check_button(mb_left)) {
	    x = mouse_x - 16;
	    y = mouse_y - 16;
	}
}
