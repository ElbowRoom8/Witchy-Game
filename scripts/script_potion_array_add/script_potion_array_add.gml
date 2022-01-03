function potion_array_add(_val, _stored){
	if (_stored == "inventory") {
		for(var i = 0; i < array_length(potions); i++){
			if (potions[i] == -1) {
				return false;
			} else if(potions[i].pot = inventory[_val].pot){
				potions[i].num += inventory[_val].num;
				inventory[_val] = -1;
				return true;
			}
		}
	} else {
		for(var i = 0; i < array_length(inventory); i++){
			if (inventory[i] != -1) {
				if (inventory[i].pot = potions[_val].pot){
					var temp = inventory[i].num;
					inventory[i].num += _stored;
					if (inventory[i].num > maxPotions){
						inventory[i].num = maxPotions;
					}
					potions[_val].num -= (inventory[i].num - temp);
					return true;
				}
			}
		}
	} 
	return false;
}