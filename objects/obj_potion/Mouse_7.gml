/// @description Places item
touchingMouse = false;
mouseUsed = false;
//checks if touching slot
	if(collision_point(mouse_x, mouse_y, obj_inventory, false, true)) {
		var inst = instance_position(mouse_x, mouse_y, obj_inventory);
		//checks if touched slot is empty
		if(inst.stored == "inventory"){
			if(!inst.occupied){
				if (stored == "inventory"){
					//sets new snap position, and sets slot to occupied
					snapX = inst.x + 1;
					snapY = inst.y + 1;
					inst.occupied = true;
				} else {
					
				}
			}
		}
	}
if (stored == "inventory"){
	//places item
	x = snapX;
	y = snapY;	
} else if (stored != "potions") {
	potions[val].num += stored;
	instance_destroy(self);
}