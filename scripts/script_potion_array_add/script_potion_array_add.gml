//finds the appropriate spot in the inventory arrays, and adjusts both accordingly
function potion_array_add(_val, _vrty, _stored){
	//moves from inventory to potions
	if (_stored == "inventory") {
		for(var i = 0; i < array_length(potions); i++){
			if (potions[i] == -1) {
				
			} else if ((array_length(potions[i]) - 1) < _vrty){
				
			} else if (potions[i][_vrty] == -1){
				
			} else if(potions[i][_vrty].type = inventory[_val].type){
				//move everything from inventory location to potions index
				potions[i][_vrty].num += inventory[_val].num;
				inventory[_val] = -1; //empty inventory slot
				return true;
			}
		}
	//moves from potions to inventory
	} else {
		for(var i = 0; i < array_length(inventory); i++){
			if (inventory[i] != -1) {
				if (inventory[i].type == potions[_val][_vrty].type && inventory[i].vrty == _vrty){
					var temp = inventory[i].num;
					inventory[i].num += _stored;
					//makes sure we haven't overadded to inventory
					if (inventory[i].num > maxPotions){
						inventory[i].num = maxPotions;
					}
					/*subtracts the appropriate amount from potions.
					Necessary because deleted potions in transit will automatically 
					add their stored value to potions array*/
					potions[_val][_vrty].num -= (inventory[i].num - temp);
					return true;
				}
			}
		}
	} 
	return false;
}