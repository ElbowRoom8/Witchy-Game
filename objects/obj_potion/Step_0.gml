/// @description Follows mouse
// follow mouse if clicked
if(touchingMouse){
	mouseUsed = true;
	if (mouse_check_button(mb_left) or rightClick) {
	    x = mouse_x - 16;
	    y = mouse_y - 16;
	}
}
//checks type of potion
if (stored == "inventory"){
	//destroys object if inventory slot is emptied
	if(inventory[val] == -1){
		instance_destroy(self);
	}
//fades empty potions
} else if (stored == "potions"){
	if(potions[val].num == 0){
		image_alpha = 0.35;
	} else {
		image_alpha = 1;
	}
}