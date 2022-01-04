/// @description Picks up one item
if (stored == "potions"){
	if(!mouseUsed & (potions[val].num > 0)){
		newObj = instance_create_depth(x,y, -3, obj_potion);
		newObj.val = val;
		newObj.stored = 1;
		newObj.sprite_index = sprite_index;
		newObj.touchingMouse = true;
		newObj.rightClick = true;
		newObj.gap = false;
		newObj.objOther = self;
		potions[val].num -= 1;
	}
} else if (stored == "inventory"){
	if(!mouseUsed){
		if (inventory[val].num > 1){
			newObj = instance_create_depth(x,y, -3, obj_potion);
			var temp = -1;
			for(var i = 0; i < array_length(potions); i++){
				if(potions[i] != -1){
					if(potions[i].pot = sprite_index){
						temp = i;
					}
				} else {
					break;
				}
			}
			newObj.val = temp;
			newObj.stored = 1;
			newObj.sprite_index = sprite_index;
			newObj.touchingMouse = true;
			newObj.rightClick = true;
			newObj.gap = false;
			newObj.objOther = self;
			newObj.highlightNum2 = temp;
			newObj.highlightNum = val;
			inventory[val].num -= 1;
		} else {
			touchingMouse = true;
			rightClick = true;
		}
	}
} else if (rightClick & gap){
	if(place_meeting(x, y, objOther)) {
		if(objOther.stored = "potions"){
			if(potions[val].num > 0){
				stored++;
				potions[val].num -= 1;
				gap = false;
			}
		} else if(objOther.stored = "inventory"){
			if(inventory[highlightNum].num > 1){
				stored++;
				inventory[highlightNum].num -= 1;
				gap = false;
			} else {
				inventory[highlightNum].num += stored;
				val = highlightNum;
				stored = "inventory";
				gap = false;
				instance_destroy(objOther);
			}
		}
			
	}
} 