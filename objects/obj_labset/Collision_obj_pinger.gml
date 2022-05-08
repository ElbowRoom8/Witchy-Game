/// Begins interaction
if(!inDialogue & !inQuest & !inInventory){
	brewing = true;
	
	//sets camera variable
	halfViewWidth = camera_get_view_width(view_camera[0]) / 2;
	halfViewHeight = camera_get_view_height(view_camera[0])/2;

	cx = obj_player.x + (obj_player.sprite_width / 2) - halfViewWidth;
	cy = obj_player.y + (obj_player.sprite_height / 2) - halfViewHeight;

	cx = clamp(cx, min_view_x, max_view_x);
	cy = clamp(cy, min_view_y, max_view_y);
	
	//creates brewing area
	for(var i = 0; i < 4; i++){
		newObj = instance_create_depth(cx + 200, cy + 10 + 36 * i, -2, obj_inventory);
		newObj.image_alpha = 0.85;
		if (i < 3){
			newObj.stored = "brewing";
		} else {
			newObj.stored = "m_brewing";
		}
		newObj.slotNum = i; //sets slotnum
	}
	
	//creates items storage
	for(i = 0; i < 5; i++){
		for(var j = 0; j < 9; j++){
			//creates inventory objects
			newObj = instance_create_depth(cx + 10 + 36 * i, cy + 10 + 36 * j, -2, obj_inventory);
			newObj.image_alpha = 0.85
			
			potNum = i + j * 5; //caclulates array number
			//reads items array and adds items accordingly
			if(items[potNum] != -1){
				newObj = instance_create_depth(cx + 12 + 36 * i, cy + 12 + 36 * j, -3, obj_item_slot);
				newObj.val = potNum;
				newObj.t_text = itemRef[potNum].t_text;
				newObj.v_text = itemRef[potNum].v_text;
				newObj.stored = "items";
				newObj.sprite_index = items[potNum].type;
			}
		}
	}
	
	//creates modifiers storage
	for(i = 0; i < 4; i++){
		for(var j = 0; j < 3; j++){
			//creates inventory objects
			newObj = instance_create_depth(cx + 486 + 36 * i, cy + 10 + 36 * j, -2, obj_inventory);
			newObj.image_alpha = 0.85
			
			potNum = i + j * 4 + mod_index; //caclulates array number
			//reads items array and adds items accordingly
			if(items[potNum] != -1){
				newObj = instance_create_depth(cx + 488 + 36 * i, cy + 12 + 36 * j, -3, obj_item_slot);
				newObj.val = potNum;
				newObj.t_text = itemRef[potNum].t_text;
				newObj.v_text = itemRef[potNum].v_text;
				newObj.stored = "modifiers";
				newObj.sprite_index = items[potNum].type;
			}
		}
	}
	//creates inventory
	//resets open tabs
	tabType = -1;
	//loops through 50 potion storage slots
	for(var i = 0; i < 10; i++){
		for(var j = 0; j < 5; j++){
			//creates inventory objects
			newObj = instance_create_depth(obj_player.cx + 270 + 36 * i, obj_player.cy + 170 + 36 * j, -2, obj_inventory);
			newObj.image_alpha = 0.85
			newObj.stored = "autofill";
			
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
					newObj = instance_create_depth(obj_player.cx + 272 + 36 * i, obj_player.cy + 170 + 36 * j, -3, obj_potion_slot);
					newObj.val = potNum;
					newObj.stored = "autofill";
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
	
	//adds brew button
	newObj = instance_create_depth(cx + 280, cy + 50, -2, obj_brew);

	//adds storage button -> removed :(
	//newObj = instance_create_depth(cx + 595, cy + 134, -3, obj_storage_button);

	//adds fade to background
	newObj = instance_create_depth(0, 0, -1, obj_dim);
	newObj.image_alpha = 0.6;
}
