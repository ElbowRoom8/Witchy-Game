/// @description Autofills ingredients
//aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa

//empties brew_slots if not full already
var b_empty = false;
for (var k = 0; k < 4; k ++){
	if(brew_slots[k] == -1){
		b_empty = true;
	}
}
if(b_empty){
	for (var k = 0; k < 4; k ++){
		with (obj_item_slot){
			if (stored = "brewing" || stored == "m_brewing"){
				instance_destroy();
			}
		}
	}
}

//checks if prev_ing is empty
var empty = false;
for (var k = 0; k < 4; k ++){
	if(prev_ing[k] == -1){
		empty = true;
	}
}

//fills prev_ing, to reduce looping
if(empty){
	//loops through recipes to find correct ingredients, fills prev_ing
	for (var i = 0; i < array_length(recipes); i++){
		if (recipes[i].res == sprite_index){
			//adds ingredients to brew slots
			var finished = 0;
			for (var j = 0; j < mod_index; j++){
				if(items[j] != -1){
					if (items[j].type == recipes[i].ing1){
						prev_ing[finished] = j;
						finished++;
					} else if (items[j].type == recipes[i].ing2){
						prev_ing[finished] = j;
						finished++;
					} else if (items[j].type == recipes[i].ing3){
						prev_ing[finished] = j;
						finished++;
					}
				}
				//checks if all 3 slots are filled
				if(finished == 3){
					break;
				}
			}
			break;
		}
	}
	
	//loops through modifiers
	for (var i = 0; i < array_length(potRef); i++){
		if (potRef[i][0].type == sprite_index ){
			for (var k = 0; k < array_length(potRef[i]); k++){
				if (potRef[i][k].vrty == vrty){
					//adds modifier to brew slots
					for (var j = mod_index; j < array_length(items); j++){
						if(items[j] != -1){
							if (items[j].type == potRef[i][k].modifier){
								prev_ing[3] = j;
								break;
							}
						}
					}
					break;
				}
			}
			break;
		}
	}
	
	empty = false;
	for (var k = 0; k < 4; k ++){
		if(prev_ing[k] == -1){
			empty = true;
		}
	}
}

//actually moves items to brew slots
if(!empty){
	var b_x = 200;//used for positioning ingredients
	var b_y = 10;
	//grabs the lowest value in brew
	var lowest_num = -1;
	for(var i = 0; i < 4; i++){
		if(lowest_num == -1 || items[prev_ing[i]].num < lowest_num){
			lowest_num = items[prev_ing[i]].num;
		}
	}
	//compares to grabNum accordingly
	if(lowest_num > grabNum){
		lowest_num = grabNum;
	}	
	
	if(!b_empty){
		//check if potion ingredients already in brew slots
		if(permutate(items[prev_ing[0]].type, items[prev_ing[1]].type, items[prev_ing[2]].type, brew_slots[0].type, brew_slots[1].type, brew_slots[2].type) && items[prev_ing[3]].type == brew_slots[3].type){
			for(var i = 0; i < 3; i++){
				items[prev_ing[i]].num -= lowest_num;
				brew_slots[i].num += lowest_num;
			}
			//adds modifier
			items[prev_ing[3]].num -= lowest_num;
			brew_slots[3].num += lowest_num;
		//if not in brew slots, put in
		} else {
			//empty brew slot
			with (obj_item_slot){
				if (stored = "brewing" || stored == "m_brewing"){
					instance_destroy();
				}
			}
			
			//grabs the lowest value in brew again
			var lowest_num = -1;
			for(var i = 0; i < 4; i++){
				if(lowest_num == -1 || items[prev_ing[i]].num < lowest_num){
					lowest_num = items[prev_ing[i]].num;
				}
			}
			//compares to grabNum accordingly
			if(lowest_num > grabNum){
				lowest_num = grabNum;
			}	
			
			for(var i = 0; i < 3; i++){
				items[prev_ing[i]].num -= lowest_num;
				brew_slots[i] = {type : items[prev_ing[i]].type, num : lowest_num};
				newObj = instance_create_depth(obj_player.cx + b_x + 1, obj_player.cy + b_y + 1 + 36 * i, -2, obj_item_slot);
				newObj.sprite_index = items[prev_ing[i]].type;
				newObj.stored = "brewing";
				newObj.val = i;
				newObj.highlightNum = prev_ing[i];
			}
			//adds modifier
			items[prev_ing[3]].num -= lowest_num;
			brew_slots[3] = {type : items[prev_ing[3]].type, num : lowest_num};
			newObj = instance_create_depth(obj_player.cx + b_x + 1, obj_player.cy + b_y + 1 + 36 * i, -2, obj_item_slot);
			newObj.sprite_index = items[prev_ing[3]].type;
			newObj.stored = "m_brewing";
			newObj.val = 3;
			newObj.highlightNum = prev_ing[3];
		}
		//if brew_slots empty, put in
	} else {
		for(var i = 0; i < 3; i++){
			items[prev_ing[i]].num -= lowest_num;
			brew_slots[i] = {type : items[prev_ing[i]].type, num : lowest_num};
			
			newObj = instance_create_depth(obj_player.cx + b_x + 1, obj_player.cy + b_y + 1 + 36 * i, -2, obj_item_slot);
			newObj.sprite_index = items[prev_ing[i]].type;
			newObj.stored = "brewing";
			newObj.val = i;
			newObj.highlightNum = prev_ing[i];
		}
		//adds modifier
			items[prev_ing[3]].num -= lowest_num;
			brew_slots[3] = {type : items[prev_ing[3]].type, num : lowest_num};
			newObj = instance_create_depth(obj_player.cx + b_x + 1, obj_player.cy + b_y + 1 + 36 * i, -2, obj_item_slot);
			newObj.sprite_index = items[prev_ing[3]].type;
			newObj.stored = "m_brewing";
			newObj.val = 3;
			newObj.highlightNum = prev_ing[3];
	}
}