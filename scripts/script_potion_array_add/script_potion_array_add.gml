//finds the appropriate spot in the inventory arrays, and adjusts both accordingly
function potion_array_add(_val, _stored){
	//moves from inventory to potions
	if (_stored == "inventory") {
		for(var i = 0; i < array_length(potions); i++){
			if (potions[i] == -1) {
				return false; //we've reached the end of the potions array
			} else if(potions[i].pot = inventory[_val].pot){
				//move everything from inventory location to potions index
				potions[i].num += inventory[_val].num;
				inventory[_val] = -1; //empty inventory slot
				return true;
			}
		}
	//moves from potions to inventory
	} else {
		for(var i = 0; i < array_length(inventory); i++){
			if (inventory[i] != -1) {
				if (inventory[i].pot = potions[_val].pot){
					var temp = inventory[i].num;
					inventory[i].num += _stored;
					//makes sure we haven't overadded to inventory
					if (inventory[i].num > maxPotions){
						inventory[i].num = maxPotions;
					}
					/*subtracts the appropriate amount from potions.
					Necessary because deleted potions in transit will automatically 
					add their stored value to potions array*/
					potions[_val].num -= (inventory[i].num - temp);
					return true;
				}
			}
		}
	} 
	return false;
}