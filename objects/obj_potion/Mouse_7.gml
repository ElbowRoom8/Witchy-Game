/// @description Places item
touchingMouse = false;
mouseUsed = false;
if (stored = "inventory"){
	//checks if touching slot
	if(collision_point(mouse_x, mouse_y, obj_inventory, false, true)) {
		var inst = instance_position(mouse_x, mouse_y, obj_inventory);
		//checks if touched slot is empty
		if(inst.stored == "inventory"){
			if(!inst.occupied){
				//sets new snap position, and sets slot to occupied
				snapX = inst.x + 1;
				snapY = inst.y + 1;
				inst.occupied = true;
				if (inst.slotNum != val) {
					inventory[inst.slotNum] = {pot : sprite_index, num : inventory[val].num};
					inventory[val] = -1;
					val = inst.slotNum;
				}
			}
		} else {
			if (potion_array_add(val, stored)){
				instance_destroy(self);
			}
		}		
	} else {
		if (potion_array_add(val, stored)){
				instance_destroy(self);
		}
	}
} else if (stored != "potions") {
	if(collision_point(mouse_x, mouse_y, obj_inventory, false, true)) {
		var inst = instance_position(mouse_x, mouse_y, obj_inventory);
		//checks if touched slot is empty
		if(inst.stored == "inventory"){
			if (potion_array_add(val, stored)){
				instance_destroy(self);
			} else {
				if (!inst.occupied) {
					if (stored > maxPotions){
						inventory[inst.slotNum] = {pot : sprite_index, num : maxPotions};
						potions[val].num += (stored - maxPotions);
					} else {
						inventory[inst.slotNum] = {pot : sprite_index, num : stored};
					}
					//sets new snap position, and sets slot to occupied
					snapX = inst.x + 1;
					snapY = inst.y + 1;
					inst.occupied = true;
					val = inst.slotNum;
					stored = "inventory";
				} else {
					potions[val].num += stored;
					instance_destroy(self);
				}
			}
		} else {
			potions[val].num += stored;
			instance_destroy(self);
		}
	} else {
		potions[val].num += stored;
		instance_destroy(self);
	}
}
x = snapX;
y = snapY;