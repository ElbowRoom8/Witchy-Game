/// @description Checks for interactions
//checks diraction facing, and creates a pinger object in that direction
if(!inDialogue & !inInventory & !brewing){
	if(sprite_index = spr_amber_walkleft){
		instance_create_depth(x - 10, y + sprite_height / 2, 1, obj_pinger);
	
	} else if (sprite_index = spr_amber_walkright){
		instance_create_depth(x + sprite_width + 10, y + sprite_height / 2, 1, obj_pinger);
	
	} else if(sprite_index = spr_amber_walkup){
		instance_create_depth(x + sprite_width / 2, y, 1, obj_pinger);
	
	} else if(sprite_index = spr_amber_walkdown){
		instance_create_depth(x + sprite_width / 2, y + sprite_height + 5, 1, obj_pinger);
	}
}

if(brewing){
	for(i = 0; i < 10; i++){
		for(j = 0; j < 10; j++){
			//creates inventory objects
			newObj = instance_create_depth(cx + 35 * i, cy + 35 * j, -1, obj_inventory);
			newObj.image_alpha = 0.85
			newObj.depth = -1;
			
			potNum = i + j * 10; //caclulates array number
			//reads potions array and adds potions accordingly
			if(items[potNum] != -1){
				newObj = instance_create_depth(cx + 1 + 35 * i, cy + 1 + 35 * j, -2, obj_item_slot);
				newObj.depth = -2;
				newObj.val = potNum;
				newObj.stored = "inventory";
				newObj.sprite_index = items[potNum].type;
			}
		}
	}
}