/// @description Opens inventory
if(!inDialogue){
	inInventory = !inInventory;
}

if(inInventory){
	for(i = 0; i < 9; i++){
		newObj = instance_create_depth(cx + 4, cy + 2 + 4 * (i + 1) + 35 * i, -1, obj_inventory);
		newObj.image_alpha = 0.85
		
		if(inventory[i] != -1){
			newObj = instance_create_depth(cx + 5, cy + 3 + 4 * (i + 1) + 35 * i, -2, obj_potion);
			newObj.sprite_index = inventory[i].type;
		}
	}
	
	for(i = 0; i < 10; i++){
		for(j = 0; j < 5; j++){
			newObj = instance_create_depth(cx + 55 + 35 * i, cy + 170 + 35 * j, -1, obj_inventory);
			newObj.image_alpha = 0.85
			potNum = i + j * 10;
			if(potions[potNum] != -1){
				newObj = instance_create_depth(cx + 56 + 35 * i, cy + 171 + 35 * j, -2, obj_potion);
				newObj.sprite_index = potions[potNum].type;
			
				if(potions[potNum].num == 0){
					newObj.image_alpha = 0.35
				}
			}
		}
	}
} else {
	instance_destroy(obj_inventory);
	instance_destroy(obj_potion);
}