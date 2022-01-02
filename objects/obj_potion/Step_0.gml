/// @description Follows mouse
// follow mouse if clicked
if(touchingMouse){
	mouseUsed = true;
	if (mouse_check_button(mb_left)) {
	    x = mouse_x - 16;
	    y = mouse_y - 16;
	}
}
//fades empty potions
if (stored == "inventory"){
	if(inventory[val].num == 0){
		image_alpha = 0.35;
	} else {
		image_alpha = 1;
	}
} else if (stored == "potions"){
	if(potions[val].num == 0){
		image_alpha = 0.35;
	} else {
		image_alpha = 1;
	}
}