/// @description Jump refills or drains inventory
//checks that no potion is in transit
if(mouseanimation) {
	image_speed = 1;
}
if(!mouseUsed){
	//checks which button it is
	if(sprite_index = spr_refill_button2){
		//loops through inventory, and moves each slot to potions
		for(var i = 0; i < array_length(inventory); i++){
			if(inventory[i] != -1){
				var vrty = inventory[i].vrty;
				potion_array_add(i, vrty, "inventory");
			}
		}
	} else if(sprite_index = spr_refill_button1){
		//loops through potions, and refills each inventory slot that matches
		for(var i = 0; i < array_length(potions); i++){
			if(potions[i] != -1){
				var max_v = array_length(potions[i]);
				for(var j = 0; j < max_v; j++){
					if (potions[i][j] != -1){
						var temp = potions[i][j].num;
						var vrty = potions[i][j].vrty;
						if (!potion_array_add(i, vrty, temp)){
							potions[i][vrty].num = temp; //resets potions if no match
						}
					}
				}
			}
		}
	}
}