/// @description Picks up one item at a time
//this code is a mess too

//if potion is in potions array, creates a new object
if (stored == "potions"){
	//checks if the mouse is currently in use, and that the array index isn't empty
	if(!mouseUsed & (potions[val].num > 0)){
		//creates new object, and initializes variables
		newObj = instance_create_depth(x,y, -3, obj_potion);
		newObj.val = val;
		newObj.stored = 1; //yet again stored is used to hold number of potions
		newObj.sprite_index = sprite_index;
		newObj.touchingMouse = true;
		newObj.rightClick = true;
		newObj.gap = false;
		newObj.objOther = self; //stores reference to self in new object
		potions[val].num -= 1; //decreases potions array num
	}
//checks if potion is in inventory array
} else if (stored == "inventory"){
	//checks if mouse is currently in use
	if(!mouseUsed){
		//checks if inventory num is > 1,
		if (inventory[val].num > 1){
			//creates new object, and initializes variables
			newObj = instance_create_depth(x,y, -3, obj_potion);
			//finds index of corresonding potions slot
			var temp = -1;
			for(var i = 0; i < array_length(potions); i++){
				if(potions[i] != -1){
					//if match, grab index
					if(potions[i].pot = sprite_index){
						temp = i;
					}
				} else {
					break; //reached end of potions
				}
			}
			newObj.val = temp; //saves index
			newObj.stored = 1; //sets stored to 1
			newObj.sprite_index = sprite_index;
			newObj.touchingMouse = true;
			newObj.rightClick = true;
			newObj.gap = false;
			newObj.objOther = self; //stores reference to self in new object
			newObj.highlightNum = val; //saves highlightNum as val, since we have the value here
			inventory[val].num -= 1; //decreases the inventory array accordingly
			
		//if not > 1, must be = 1. In this case, you just grab the object
		} else {
			touchingMouse = true;
			rightClick = true;
			depth = -3;
		}
	}
/* if not "potions" or "inventory", must be a potion in transit
check if this potion has been picked up by right click before, 
and if right click was released previously */
} else if (rightClick & gap){
	//checks if touching objOther (the parent potion object)
	if(place_meeting(x, y, objOther)) {
		//checks parent objects type
		if(objOther.stored = "potions"){
			//adds 1 from potions array to this objects stored value;
			if(potions[val].num > 0){
				stored++;
				potions[val].num -= 1;
				gap = false;
			}
		} else if(objOther.stored = "inventory"){
			//checks if corresponding inventory slot is > 1
			//note highlightNum is used to reference the inventory array
			if(inventory[highlightNum].num > 1){ 
				stored++;
				inventory[highlightNum].num -= 1;
				gap = false;
			/*if not > 1, must be = 1. In this case, just delete
			objOther, and transition this object to type "inventory" */
			} else {
				//resets matching inventory array slot
				inventory[highlightNum].num += stored;
				//swaps val and highlightNum
				var temp = val;
				val = highlightNum;
				highlightNum = temp;
				
				stored = "inventory";
				gap = false;
				instance_destroy(objOther); //delete parent object
			}
		}
	}
} 