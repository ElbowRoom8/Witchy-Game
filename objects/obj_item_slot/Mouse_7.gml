/// @description Places item
//this code is a mess, but a smart one?

//resets mouse variables
touchingMouse = false;
mouseUsed = false;

/* if brewing type item, will either place on new inventory slot, 
reset back to old slot, or delete and add num to corresonding items index */
if (stored = "brewing" || stored == "m_brewing"){
	//checks if touching inventory object
	if(collision_point(mouse_x, mouse_y, obj_inventory, false, true)) {
		var inst = instance_position(mouse_x, mouse_y, obj_inventory);
		//checks if inventory object has type "brewing"
		if(inst.stored == stored){
			if(!inst.occupied){
				//if slot is empty, sets new coords to move to, and sets slot to occupied
				snapX = inst.x + 1;
				snapY = inst.y + 1;
				inst.occupied = true;
				//updates brew_slot array to match changes
				if (inst.slotNum != val) {
					//new spot (based on inventory objects slotNum) is filled
					brew_slots[inst.slotNum] = {type : sprite_index, num : brew_slots[val].num};
					//old spot is emptied
					brew_slots[val] = -1;
					val = inst.slotNum;
				}
			}
			//if occupied, does nothing, and item will automatically be set back to old coords
		} else if (inst.stored != "brewing" && inst.stored != "m_brewing") {
			//if opposite type of brewing slot, does nothing
			//if over "items" type slot, add num to items array, and delete self
			if (item_array_add(val, "brewing")){
				instance_destroy(self);
			}
		}		
	} else {
		//if over nothing, add num to items array, and delete self
		if (item_array_add(val, "brewing")){
				instance_destroy(self);
		}
	}
/*if item in transit ("items" type items will never move) it will
either move to an empty inventory slot, add to a matching inventory slot
or delete itself (remember counts are automatically fixed if this type of 
item is destroyed)*/
} else if (stored == "transit") {
	//checks if touching inventory object
	if(collision_point(mouse_x, mouse_y, obj_inventory, false, true)) {
		var inst = instance_position(mouse_x, mouse_y, obj_inventory);
		//checks if inventory object is type "inventory"
		if(inst.stored == "brewing"){
			//checks for matching item already in inventory and adds to it, then destroys itself
			if (item_array_add(val, qty)){
				instance_destroy(self);
			} else {
				//if no matching item, then check if slot is empty
				if (!inst.occupied) {
					brew_slots[inst.slotNum] = {type : sprite_index, num : qty};
					//sets new snap coords, and sets slot to occupied
					snapX = inst.x + 1;
					snapY = inst.y + 1;
					inst.occupied = true;
					//transitions object to "brewing" type
					val = inst.slotNum;
					stored = "brewing";
					highlightNum = -1;
				} else {
					//if slot is occupied, delete self
					instance_destroy(self);
				}
			}
		} else if (inst.stored == "m_brewing"){
			if (item_array_add(val, qty)){
				instance_destroy(self);
			}
		} else {
			//if slot is type "item", delete self
			instance_destroy(self);
		}
	} else {
		//if not touching inventory object, delete self
		instance_destroy(self);
	}
//if item is a modifier in transit
} else if (stored == "m_transit") {
	//checks if touching inventory object
	if(collision_point(mouse_x, mouse_y, obj_inventory, false, true)) {
		var inst = instance_position(mouse_x, mouse_y, obj_inventory);
		//checks if inventory object is type "inventory"
		if(inst.stored == "m_brewing"){
			//checks for matching item already in inventory and adds to it, then destroys itself
			if (item_array_add(val, qty)){
				instance_destroy(self);
			} else {
				//if no matching item, then check if slot is empty
				if (!inst.occupied) {
					brew_slots[inst.slotNum] = {type : sprite_index, num : qty};
					//sets new snap coords, and sets slot to occupied
					snapX = inst.x + 1;
					snapY = inst.y + 1;
					inst.occupied = true;
					//transitions object to "brewing" type
					val = inst.slotNum;
					stored = "m_brewing";
					highlightNum = -1;
				} else {
					//if slot is occupied, delete self
					instance_destroy(self);
				}
			}
		} else if (inst.stored == "brewing"){
			if (item_array_add(val, qty)){
				instance_destroy(self);
			}
		} else {
			//if slot is type "item", delete self
			instance_destroy(self);
		}
	} else {
		//if not touching inventory object, delete self
		instance_destroy(self);
	}
}
// resets more variables and finishes placing object
rightClick = false;
depth = -2;
x = snapX;
y = snapY;