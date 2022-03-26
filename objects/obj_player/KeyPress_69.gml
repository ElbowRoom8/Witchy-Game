/// @description Opens inventory
//inverts inInventory if not in dialouge;
if(!inDialogue & !inQuest & !brewing){
	inInventory = !inInventory;
}

//creates all of the potion and inventory slots if in inventory
if(inInventory){
	//loops through 9 inventory slots
	for(var i = 0; i < 9; i++){
		//creates inventory objects
		newObj = instance_create_depth(cx + 4, cy + 2 + 4 * (i + 1) + 35 * i, -1, obj_inventory);
		newObj.image_alpha = 0.85;
		newObj.stored = "inventory";
		newObj.slotNum = i; //sets slotnum
		//reads inventory array and adds potions accordingly
		if(inventory[i] != -1){
			newObj = instance_create_depth(cx + 5, cy + 3 + 4 * (i + 1) + 35 * i, -2, obj_potion);
			newObj.val = i;
			newObj.vrty = inventory[i].vrty;
			newObj.stored = "inventory";
			newObj.sprite_index = inventory[i].type;
		}
	}
	//resets open tabs
	tabType = -1;
	//loops through 50 potion storage slots
	for(var i = 0; i < 10; i++){
		for(var j = 0; j < 5; j++){
			//creates inventory objects
			newObj = instance_create_depth(cx + 55 + 36 * i, cy + 170 + 36 * j, -1, obj_inventory);
			newObj.image_alpha = 0.85
			
			potNum = i + j * 10; //caclulates array number
			//reads potions array and adds potions accordingly
			if(potions[potNum] != -1){
				var filled = false;
				for(var k = 0; k < array_length(potions[potNum]); k++){
					if(potions[potNum][k] != -1){
						filled = true;
						break;
					}
				}
				if(filled){
					newObj = instance_create_depth(cx + 56 + 36 * i, cy + 171 + 36 * j, -2, obj_potion_slot);
					newObj.val = potNum;
					if(potions[potNum][0] != -1){
						newObj.sprite_index = potions[potNum][0].type;
					} else {
						for(var k = 0; k < array_length(potRef); k++){
							if(potRef[k][0].index == potNum){
								newObj.sprite_index = potRef[k][0].type;
							}
						}
					}
				}
			}
		}
	}
	//creates refill buttons
	newObj = instance_create_depth(cx + 418, cy + 281, -1, obj_refill_button);
	
	newObj = instance_create_depth(cx + 418, cy + 316, -1, obj_refill_button);
	newObj.sprite_index = spr_refill_button2;
	
	//adds fade to background
	newObj = instance_create_depth(0, 0, 0, obj_dim);
	newObj.image_alpha = 0.6;
	
//deletes all of the inventory objects if inventory is closed
} else if (!inQuest && !brewing){
	instance_destroy(obj_inventory);
	instance_destroy(obj_potion);
	instance_destroy(obj_potion_slot);
	instance_destroy(obj_refill_button);
	instance_destroy(obj_dim);
}