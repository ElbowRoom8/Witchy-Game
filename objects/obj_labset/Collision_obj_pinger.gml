/// Begins interaction
if(!inDialogue & !inQuest & !inInventory){
	brewing = true;
	
	//creates brewing area
	for(var i = 0; i < 4; i++){
		newObj = instance_create_depth(obj_player.cx + 500, obj_player.cy + 36 * i, -1, obj_inventory);
		newObj.image_alpha = 0.85;
		if (i < 3){
			newObj.stored = "brewing";
		} else {
			newObj.stored = "m_brewing";
		}
		newObj.slotNum = i; //sets slotnum
	}
	
	//creates items storage
	for(i = 0; i < 10; i++){
		for(var j = 0; j < 10; j++){
			//creates inventory objects
			newObj = instance_create_depth(obj_player.cx + 36 * i, obj_player.cy + 36 * j, -1, obj_inventory);
			newObj.image_alpha = 0.85
			
			potNum = i + j * 10; //caclulates array number
			//reads items array and adds items accordingly
			if(items[potNum] != -1){
				newObj = instance_create_depth(obj_player.cx + 1 + 36 * i, obj_player.cy + 1 + 36 * j, -2, obj_item_slot);
				newObj.val = potNum;
				newObj.stored = "items";
				newObj.sprite_index = items[potNum].type;
			}
		}
	}
	
	//creates modifiers storage
	for(i = 0; i < 4; i++){
		for(var j = 0; j < 3; j++){
			//creates inventory objects
			newObj = instance_create_depth(obj_player.cx + 500 + 36 * i, obj_player.cy + 200 + 36 * j, -1, obj_inventory);
			newObj.image_alpha = 0.85
			
			potNum = i + j * 3 + mod_index; //caclulates array number
			//reads items array and adds items accordingly
			if(items[potNum] != -1){
				newObj = instance_create_depth(obj_player.cx + 501 + 36 * i, obj_player.cy + 201 + 36 * j, -2, obj_item_slot);
				newObj.val = potNum;
				newObj.stored = "modifiers";
				newObj.sprite_index = items[potNum].type;
			}
		}
	}
	
	//adds brew button
	newObj = instance_create_depth(obj_player.cx + 580, obj_player.cy + 50, -1, obj_brew);

	//adds storage button
	newObj = instance_create_depth(obj_player.cx + 580, obj_player.cy + 320, -3, obj_storage_button);

	//adds fade to background
	newObj = instance_create_depth(0, 0, -1, obj_dim);
	newObj.image_alpha = 0.6;
}
