/// Begins interaction
if(!inDialogue & !inQuest & !inInventory){
	brewing = true;
	
	//creates brewing area
	for(var i = 0; i < 4; i++){
		newObj = instance_create_depth(obj_player.cx + 500, obj_player.cy + 35 * i, -1, obj_inventory);
		newObj.image_alpha = 0.85
		newObj.depth = -1;
		newObj.stored = "brewing";
		newObj.slotNum = i; //sets slotnum
	}
	
	//creates items storage
	for(i = 0; i < 10; i++){
		for(var j = 0; j < 10; j++){
			//creates inventory objects
			newObj = instance_create_depth(obj_player.cx + 35 * i, obj_player.cy + 35 * j, -1, obj_inventory);
			newObj.image_alpha = 0.85
			newObj.depth = -1;
			
			potNum = i + j * 10; //caclulates array number
			//reads items array and adds items accordingly
			if(items[potNum] != -1){
				newObj = instance_create_depth(obj_player.cx + 1 + 35 * i, obj_player.cy + 1 + 35 * j, -2, obj_item_slot);
				newObj.depth = -2;
				newObj.val = potNum;
				newObj.stored = "items";
				newObj.sprite_index = items[potNum].type;
			}
		}
	}
	
	//adds fade to background
	newObj = instance_create_depth(0, 0, -1, obj_dim);
	newObj.image_alpha = 0.6;
	newObj.depth = 0;
}
