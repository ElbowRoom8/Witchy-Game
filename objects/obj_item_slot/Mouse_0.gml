/// @description Picks up an item
if(!inQuest){
	//if item is in items array, creates a new object
	if (stored == "items"){
		//checks if the mouse is currently in use, and that the array index isn't empty
		if(!mouseUsed & (items[val].num >= grabNum)){
			//creates new object, and initializes variables
			newObj = instance_create_depth(x,y, -3, obj_item_slot);
			newObj.val = val;
			newObj.qty = grabNum;
			newObj.stored = "transit";
			newObj.sprite_index = sprite_index;
			newObj.touchingMouse = true;
			newObj.objOther = self; //stores reference to self in new object
			items[val].num -= grabNum; //decreases items array num
		} else if(!mouseUsed & (items[val].num > 0)){
			//creates new object, and initializes variables
			newObj = instance_create_depth(x,y, -3, obj_item_slot);
			newObj.val = val;
			newObj.qty = items[val].num;
			newObj.stored = "transit";
			newObj.sprite_index = sprite_index;
			newObj.touchingMouse = true;
			newObj.objOther = self; //stores reference to self in new object
			items[val].num = 0; //decreases items array num
		}
	//checks if item is in brew_slots array
	} else if (stored == "brewing"){
		//checks if mouse is currently in use
		if(!mouseUsed){
			touchingMouse = true;
			depth = -3;
		}
	}
}