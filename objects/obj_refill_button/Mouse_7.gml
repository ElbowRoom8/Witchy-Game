/// @description Jump refills or drains inventory
if(touchingMouse and !mouseUsed){
	if(sprite_index = spr_refill_button2){
		for(var i = 0; i < array_length(inventory); i++){
			if(inventory[i] != -1){
				potion_array_add(i, "inventory");
			}
		}
	} else {
		for(var i = 0; i < array_length(potions); i++){
			if(potions[i] != -1){
				var temp = potions[i].num;
				if (!potion_array_add(i, temp)){
					potions[i].num = temp;
				}
			} else {
				break;
			}
		}
	}
}