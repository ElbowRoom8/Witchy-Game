/// @description Picks up one item at a time
//this code is a mess too
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
			newObj.rightClick = true;
			newObj.gap = false;
			newObj.objOther = self; //stores reference to self in new object
			items[val].num -= grabNum; //decreases items array num
		} else if (!mouseUsed & (items[val].num > 0)){
			//creates new object, and initializes variables
			newObj = instance_create_depth(x,y, -3, obj_item_slot);
			newObj.val = val;
			newObj.qty = items[val].num;
			newObj.stored = "transit";
			newObj.sprite_index = sprite_index;
			newObj.touchingMouse = true;
			newObj.rightClick = true;
			newObj.gap = false;
			newObj.objOther = self; //stores reference to self in new object
			items[val].num = 0; //decreases items array num
		}
	//checks if item is in brew_slots array
	} else if (stored == "brewing"){
		//checks if mouse is currently in use
		if(!mouseUsed){
			//checks if brew_slots num is > 1,
			if (brew_slots[val].num > grabNum){
				//creates new object, and initializes variables
				newObj = instance_create_depth(x,y, -3, obj_item_slot);
				//finds index of corresonding items slot
				var temp = -1;
				for(var i = 0; i < array_length(items); i++){
					if(items[i] != -1){
						//if match, grab index
						if(items[i].type = sprite_index){
							temp = i;
						}
					}
				}
				newObj.val = temp; //saves index
				newObj.qty = grabNum;
				newObj.stored = "transit";
				newObj.sprite_index = sprite_index;
				newObj.touchingMouse = true;
				newObj.rightClick = true;
				newObj.gap = false;
				newObj.objOther = self; //stores reference to self in new object
				newObj.highlightNum = val; //saves highlightNum as val, since we have the value here
				brew_slots[val].num -= grabNum; //decreases the brew_slots array accordingly
			
			//if not > 1, must be = 1. In this case, you just grab the object
			} else {
				touchingMouse = true;
				rightClick = true;
				depth = -3;
			}
		}
	/* if not "items" or "brewing", must be a item in transit
	check if this item has been picked up by right click before, 
	and if right click was released previously */
	} else if (rightClick & gap){
		//checks if touching objOther (the parent item object)
		if(place_meeting(x, y, objOther)) {
			//checks parent objects type
			if(objOther.stored = "items"){
				//adds 1 from items array to this objects stored value;
				if(items[val].num >= grabNum){
					qty += grabNum;
					items[val].num -= grabNum;
					gap = false;
				} else if(items[val].num > 0){
					qty += items[val].num;
					items[val].num = 0;
					gap = false;
				}
			} else if(objOther.stored = "brewing"){
				//checks if corresponding brew_slots slot is > 1
				//note highlightNum is used to reference the brew_slots array
				if(brew_slots[highlightNum].num > grabNum){ 
					qty += grabNum;
					brew_slots[highlightNum].num -= grabNum;
					gap = false;
				/*if not > 1, must be = 1. In this case, just delete
				objOther, and transition this object to type "brewing" */
				} else {
					//resets matching brew_slots array slot
					brew_slots[highlightNum].num += qty;
					//swaps val and highlightNum
					var temp = val;
					val = highlightNum;
					highlightNum = temp;
					stored = "brewing";
					gap = false;
					
					objOther.stored = "delete";
					objOther.qty = 0;
					instance_destroy(objOther); //delete parent object
				}
			}
		}
	}
}