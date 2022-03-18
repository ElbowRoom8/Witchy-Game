//finds the appropriate spot in the brew_slots arrays, and adjusts both accordingly
function item_array_add(_val, _stored){
	//moves from brew_slots to items
	if (_stored == "brewing") {
		for(var i = 0; i < array_length(items); i++){
			if (items[i] == -1) {
				
			}else if(items[i].type = brew_slots[_val].type){
				//move everything from brew_slots location to items index
				items[i].num += brew_slots[_val].num;
				brew_slots[_val] = -1; //empty brew_slots slot
				return true;
			}
		}
	//moves from items to brew_slots
	} else {
		for(var i = 0; i < array_length(brew_slots); i++){
			if (brew_slots[i] != -1) {
				if (brew_slots[i].type == items[_val].type){
					var temp = brew_slots[i].num;
					brew_slots[i].num += _stored;
					/*subtracts the appropriate amount from items.
					Necessary because deleted items in transit will automatically 
					add their qty value to items array*/
					items[_val].num -= (brew_slots[i].num - temp);
					return true;
				}
			}
		}
	} 
	return false;
}