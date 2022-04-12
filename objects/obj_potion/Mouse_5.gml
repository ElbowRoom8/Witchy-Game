/// @description Picks up one item at a time
//this code is a mess too
if(!inQuest){
	//if potion is in potions array, creates a new object
	if (stored == "potions"){
		//checks if the mouse is currently in use, and that the array index isn't empty
		if(!mouseUsed & (potions[val][vrty].num >= grabNum)){
			//creates new object, and initializes variables
			newObj = instance_create_depth(x,y, -4, obj_potion);
			newObj.val = val;
			newObj.vrty = vrty;
			newObj.t_text = t_text;
			newObj.v_text = v_text;
			newObj.stored = grabNum; //yet again stored is used to hold number of potions
			newObj.sprite_index = sprite_index;
			newObj.touchingMouse = true;
			newObj.rightClick = true;
			newObj.gap = false;
			newObj.objOther = self; //stores reference to self in new object
			potions[val][vrty].num -= grabNum; //decreases potions array num
		} else if(!mouseUsed & (potions[val][vrty].num > 0)){
			//creates new object, and initializes variables
			newObj = instance_create_depth(x,y, -4, obj_potion);
			newObj.val = val;
			newObj.vrty = vrty;
			newObj.t_text = t_text;
			newObj.v_text = v_text;
			newObj.stored = potions[val][vrty].num; //yet again stored is used to hold number of potions
			newObj.sprite_index = sprite_index;
			newObj.touchingMouse = true;
			newObj.rightClick = true;
			newObj.gap = false;
			newObj.objOther = self; //stores reference to self in new object
			potions[val][vrty].num = 0; //decreases potions array num
		}
	//checks if potion is in inventory array
	} else if (stored == "inventory"){
		//checks if mouse is currently in use
		if(!mouseUsed){
			//checks if inventory num is > 1,
			if (inventory[val].num >= grabNum){
				//creates new object, and initializes variables
				newObj = instance_create_depth(x,y, -4, obj_potion);
				//finds index of corresonding potions slot
				var temp = -1;
				for(var i = 0; i < array_length(potions); i++){
					if(potions[i] != -1){
						//if match, grab index
						if((array_length(potions[i]) - 1) >= vrty){
							if(potions[i][vrty] != -1){
								if(potions[i][vrty].type = sprite_index){
									temp = i;
								}
							}
						}
					}
				}
				newObj.val = temp; //saves index
				newObj.vrty = vrty;
				newObj.t_text = t_text;
				newObj.v_text = v_text;
				newObj.stored = grabNum; //sets stored to grabNum
				newObj.sprite_index = sprite_index;
				newObj.touchingMouse = true;
				newObj.rightClick = true;
				newObj.gap = false;
				newObj.objOther = self; //stores reference to self in new object
				newObj.highlightNum = val; //saves highlightNum as val, since we have the value here
				inventory[val].num -= grabNum; //decreases the inventory array accordingly
			
			//if not > 1, must be = 1. In this case, you just grab the object
			} else {
				touchingMouse = true;
				rightClick = true;
				depth = -4;
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
				if(potions[val][vrty].num >= grabNum){
					stored += grabNum;
					potions[val][vrty].num -= grabNum;
					gap = false;
				} else if (potions[val][vrty].num > 0){
					stored += potions[val][vrty].num;
					potions[val][vrty].num = 0;
					gap = false;
				}
			} else if(objOther.stored = "inventory"){
				//checks if corresponding inventory slot is > 1
				//note highlightNum is used to reference the inventory array
				if(inventory[highlightNum].num > grabNum){ 
					stored += grabNum;
					inventory[highlightNum].num -= grabNum;
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
}