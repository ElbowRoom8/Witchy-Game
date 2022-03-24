/// @description Opens inventory
//inverts inInventory if not in dialouge;
if(!inDialogue & !inQuest & !brewing){
	inInventory = !inInventory;
}

//creates all of the potion and inventory slots if in inventory
if(inInventory){
	//loops through 9 inventory slots
	for(i = 0; i < 9; i++){
		//creates inventory objects
		newObj = instance_create_depth(cx + 4, cy + 2 + 4 * (i + 1) + 35 * i, -1, obj_inventory);
		newObj.image_alpha = 0.85
		newObj.depth = -1;
		newObj.stored = "inventory";
		newObj.slotNum = i; //sets slotnum
		//reads inventory array and adds potions accordingly
		if(inventory[i] != -1){
			newObj = instance_create_depth(cx + 5, cy + 3 + 4 * (i + 1) + 35 * i, -2, obj_potion);
			newObj.depth = -2;
			newObj.val = i;
			newObj.vrty = inventory[i].vrty;
			newObj.stored = "inventory";
			newObj.sprite_index = inventory[i].type;
		}
	}
	//resets open tabs
	tabType = -1;
	//loops through 50 potion storage slots
	for(i = 0; i < 10; i++){
		for(j = 0; j < 5; j++){
			//creates inventory objects
			newObj = instance_create_depth(cx + 55 + 36 * i, cy + 170 + 36 * j, -1, obj_inventory);
			newObj.image_alpha = 0.85
			newObj.depth = -1;
			
			potNum = i + j * 10; //caclulates array number
			//reads potions array and adds potions accordingly
			if(potions[potNum] != -1){
				newObj = instance_create_depth(cx + 56 + 36 * i, cy + 171 + 36 * j, -2, obj_potion_slot);
				newObj.depth = -2;
				newObj.val = potNum;
				//newObj.stored = "potions";
				newObj.sprite_index = potions[potNum][0].type;
			}
		}
	}
	//creates refill buttons
	newObj = instance_create_depth(cx + 418, cy + 281, -1, obj_refill_button);
	//newObj.image_xscale = 0.5;
	//newObj.image_yscale = 0.5;
	newObj.depth = -1;
	
	newObj = instance_create_depth(cx + 418, cy + 316, -1, obj_refill_button);
	//newObj.image_xscale = 0.5;
	//newObj.image_yscale = 0.5;
	newObj.sprite_index = spr_refill_button2;
	newObj.depth = -1;
	
	//adds fade to background
	newObj = instance_create_depth(0, 0, -1, obj_dim);
	newObj.image_alpha = 0.6;
	newObj.depth = 0;
	
//deletes all of the inventory objects if inventory is closed
} else if (!inQuest && !brewing){
	instance_destroy(obj_inventory);
	instance_destroy(obj_potion);
	instance_destroy(obj_potion_slot);
	instance_destroy(obj_refill_button);
	instance_destroy(obj_dim);
}