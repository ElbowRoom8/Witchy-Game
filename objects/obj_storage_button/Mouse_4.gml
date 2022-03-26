/// @description opens potion storage
if (!open){
	open = true;
	//resets open tabs
	tabType = -1;
	//loops through 50 potion storage slots
	for(var i = 0; i < 10; i++){
		for(var j = 0; j < 5; j++){
			//creates inventory objects
			newObj = instance_create_depth(obj_player.cx + 55 + 36 * i, obj_player.cy + 170 + 36 * j, -3, obj_inventory);
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
					newObj = instance_create_depth(obj_player.cx + 56 + 36 * i, obj_player.cy + 171 + 36 * j, -4, obj_potion_slot);
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
	//adds fade to background
	newObj = instance_create_depth(0, 0, -3, obj_dim);
	newObj.image_alpha = 0.3;
	newObj.stored = "autofill";
} else {
	//closes storage
	with (obj_inventory){
		if (stored = "autofill" || stored == "p_autofill"){
			instance_destroy();
		}
	}
	
	with (obj_dim){
		if (stored = "autofill"){
			instance_destroy();
		}
	}
	
	instance_destroy(obj_potion_slot);
	instance_destroy(obj_potion_autofill);
	open = false;
}