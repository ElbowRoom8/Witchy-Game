/// @description Places item
touchingMouse = false;
mouseUsed = false;
//checks if touching slot
if(collision_point(mouse_x, mouse_y, obj_inventory, false, true)) {
	var inst = instance_position(mouse_x, mouse_y, obj_inventory);
	//checks if touched slot is empty
	if(!inst.occupied){
		//sets new snap position, and sets slot to occupied
		snapX = inst.x + 1;
		snapY = inst.y + 1;
		inst.occupied = true;
	}
}
//places item
x = snapX;
y = snapY;