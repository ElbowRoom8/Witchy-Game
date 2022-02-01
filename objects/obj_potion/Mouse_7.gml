/// @description Places item
//this code is a mess, but a smart one?

//resets mouse variables
touchingMouse = false;
mouseUsed = false;

/* if inventory type potion, will either place on new inventory slot, 
reset back to old slot, or delete and add num to corresonding potions index */
if (stored = "inventory"){
	//checks if touching inventory object
	if(collision_point(mouse_x, mouse_y, obj_inventory, false, true)) {
		var inst = instance_position(mouse_x, mouse_y, obj_inventory);
		//checks if inventory object has type "inventory"
		if(inst.stored == "inventory"){
			if(!inst.occupied){
				//if slot is empty, sets new coords to move to, and sets slot to occupied
				snapX = inst.x + 1;
				snapY = inst.y + 1;
				inst.occupied = true;
				//updates inventory array to match changes
				if (inst.slotNum != val) {
					//new spot (based on inventory objects slotNum) is filled
					inventory[inst.slotNum] = {type : sprite_index, num : inventory[val].num};
					//old spot is emptied
					inventory[val] = -1;
					val = inst.slotNum;
				}
			}
			//if occupied, does nothing, and potion will automatically be set back to old coords
		} else {
			//if over "potions" type slot, add num to potions array, and delete self
			if (potion_array_add(val, stored)){
				instance_destroy(self);
			}
		}		
	} else {
		//if over nothing, add num to potions array, and delete self
		if (potion_array_add(val, stored)){
				instance_destroy(self);
		}
	}
/*if potion in transit ("potions" type potions will never move) it will
either move to an empty inventory slot, add to a matching inventory slot
or delete itself (remember counts are automatically fixed if this type of 
potion is destroyed)*/
} else if (stored != "potions") {
	//checks if touching inventory object
	if(collision_point(mouse_x, mouse_y, obj_inventory, false, true)) {
		var inst = instance_position(mouse_x, mouse_y, obj_inventory);
		//checks if inventory object is type "inventory"
		if(inst.stored == "inventory"){
			//checks for matching potion already in inventory and adds to it, then destroys itself
			if (potion_array_add(val, stored)){
				instance_destroy(self);
			} else {
				//if no matching potion, then check if slot is empty
				if (!inst.occupied) {
					//correct the counts
					if (stored > maxPotions){
						//if above maxPotions limit, then update both arrays to fix this
						inventory[inst.slotNum] = {type : sprite_index, num : maxPotions};
						potions[val].num += (stored - maxPotions);
					} else {
						//if not above max potions, only update inventory array
						inventory[inst.slotNum] = {type : sprite_index, num : stored};
					}
					//sets new snap coords, and sets slot to occupied
					snapX = inst.x + 1;
					snapY = inst.y + 1;
					inst.occupied = true;
					//transitions object to "inventory" type
					val = inst.slotNum;
					stored = "inventory";
					highlightNum = -1;
				} else {
					//if slot is occupied, delete self
					instance_destroy(self);
				}
			}
		} else {
			//if slot is type "potion", delete self
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