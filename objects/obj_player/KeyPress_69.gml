/// @description Opens inventory
//inverts inInventory if not in dialouge;
if(!inDialogue & !inQuest){
	inInventory = !inInventory;
}

//creates all of the potion and inventory slots if in inventory
if(inInventory){
	//loops through 9 inventory slots
	for(i = 0; i < 9; i++){
		//creates inventory objects
		newObj = instance_create_depth(cx + 4, cy + 2 + 4 * (i + 1) + 35 * i, -1, obj_inventory);
		newObj.image_alpha = 0.85
		newObj.stored = "inventory";
		newObj.slotNum = i; //sets slotnum
		//reads inventory array and adds potions accordingly
		if(inventory[i] != -1){
			newObj = instance_create_depth(cx + 5, cy + 3 + 4 * (i + 1) + 35 * i, -2, obj_potion);
			newObj.val = i;
			newObj.stored = "inventory";
			newObj.sprite_index = inventory[i].type;
		}
	}
	//loops through 50 potion storage slots
	for(i = 0; i < 10; i++){
		for(j = 0; j < 5; j++){
			//creates inventory objects
			newObj = instance_create_depth(cx + 55 + 35 * i, cy + 170 + 35 * j, -1, obj_inventory);
			newObj.image_alpha = 0.85
			newObj.stored = "potions";
			
			potNum = i + j * 10; //caclulates array number
			//reads potions array and adds potions accordingly
			if(potions[potNum] != -1){
				newObj = instance_create_depth(cx + 56 + 35 * i, cy + 171 + 35 * j, -2, obj_potion);
				newObj.val = potNum;
				newObj.stored = "potions";
				newObj.sprite_index = potions[potNum].type;
			}
		}
	}
	//creates refill buttons
	newObj = instance_create_depth(cx + 56, cy + 136, -1, obj_refill_button);
	newObj.image_xscale = 0.45;
	newObj.image_yscale = 0.45;
	
	newObj = instance_create_depth(cx + 89, cy + 136, -1, obj_refill_button);
	newObj.image_xscale = 0.45;
	newObj.image_yscale = 0.45;
	newObj.sprite_index = spr_refill_button2;
	
	//adds fade to background
	newObj = instance_create_depth(0, 0, -1, obj_dim);
	newObj.image_alpha = 0.6;
	
//deletes all of the inventory objects if inventory is closed
} else if (!inQuest){
	instance_destroy(obj_inventory);
	instance_destroy(obj_potion);
	instance_destroy(obj_refill_button);
	instance_destroy(obj_dim);
}