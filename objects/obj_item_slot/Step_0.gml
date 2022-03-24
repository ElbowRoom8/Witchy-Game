/// @description Follows mouse
// follow mouse if clicked
if(touchingMouse){
	mouseUsed = true;
	if (mouse_check_button(mb_left) or rightClick) {
	    x = mouse_x - 16;
	    y = mouse_y - 16;
	}
}

//changes amount grabbed on click
if keyboard_check(vk_shift){
	grabNum = 5;
} else if keyboard_check(vk_control){
	grabNum = 10;
} else {
	grabNum = 1;
}

//checks type of potion
if (stored == "brewing" || stored == "m_brewing"){
	//destroys object if brew_slots slot is emptied
	if(brew_slots[val] == -1){
		instance_destroy(self);
	} else if(brew_slots[val].num == 0){
		//removes slot if num drops to 0
		brew_slots[val] = -1;
		instance_destroy(self);
	}
//fades empty items
} else if (stored == "items" || stored == "modifiers"){
	if(items[val].num == 0){
		image_alpha = 0.35;
	} else {
		image_alpha = 1;
	}
}