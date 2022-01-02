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
			newObj.sprite_index = inventory[i];
		}
	}
} else {
	instance_destroy(obj_inventory);
	instance_destroy(obj_potion);
}