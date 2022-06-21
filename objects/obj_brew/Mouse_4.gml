/// @description brews potion

image_speed = 1;
//checks if any of the slots are empty
var full_slots = true;
var lowest_num = -1;
for(var i = 0; i < 4; i++){
	if(brew_slots[i] == -1){
		full_slots = false;
		sprite_index = spr_brew_button_shake;
		break;
	} else {
		//grabs lowest quantity being used in brewer
		if(lowest_num == -1 || brew_slots[i].num < lowest_num){
			lowest_num = brew_slots[i].num;
		}
	}
}

if(full_slots){
	//compares to recipe book
	var potion = compare_recipe(brew_slots[0].type, brew_slots[1].type, brew_slots[2].type)
		
	//aaaaaaaaaaaaaaaaaaa
	if(potion != -1){
		for(var i = 0; i < array_length(potRef); i++){
			//searches for correct potion in potRef
			if(potRef[i][0].type == potion){
				for(var j = 0; j < array_length(potRef[i]); j++){
					//searches for correct modifier in potRef
					if(potRef[i][j].modifier == brew_slots[3].type){
						var ind = potRef[i][j].index;
						var temp = potRef[i][j].vrty;
						var t = potRef[i][j].t_text;
						var v = potRef[i][j].v_text;
						tabType = -1;
						//checks if potions index exists
						if(potions[ind][temp] == -1){
							potions[ind][temp] = {type : potRef[i][j].type, vrty : temp, num : lowest_num, t_text : t, v_text : v};
						} else {
							potions[ind][temp].num += lowest_num;
						}
					}
				}
			}
		}
	}
	//remove ingredients used
	for(var i = 0; i < 4; i++){
		brew_slots[i].num -= lowest_num;
	}
	
}