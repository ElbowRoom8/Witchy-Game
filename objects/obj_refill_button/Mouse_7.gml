/// @description Jump refills or drains inventory
//checks that no potion is in transit
if(!mouseUsed){
	//checks which button it is
	if(sprite_index = spr_refill_button2){
		//loops through inventory, and moves each slot to potions
		for(var i = 0; i < array_length(inventory); i++){
			if(inventory[i] != -1){
				potion_array_add(i, "inventory");
			}
		}
	} else {
		//loops through potions, and refills each inventory slot that matches
		for(var i = 0; i < array_length(potions); i++){
			if(potions[i] != -1){
				var temp = potions[i].num;
				if (!potion_array_add(i, temp)){
					potions[i].num = temp; //resets potions if no match
				}
			} else {
				break; //we've reached end of array
			}
		}
	}
}