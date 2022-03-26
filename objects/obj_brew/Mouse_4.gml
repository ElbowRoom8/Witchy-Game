/// @description brews potion

//checks if any of the slots are empty
var full_slots = true;
var lowest_num = -1;
for(var i = 0; i < 4; i++){
	if(brew_slots[i] == -1){
		full_slots = false;
		break;
	} else {
		//grabs lowest quantity being used in brewer
		if(lowest_num == -1 || brew_slots[i].num < lowest_num){
			lowest_num = brew_slots[i].num;
		}
	}
}

if(full_slots){
	//compares to recpie book
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
						
						//checks if potions index exists
						if(potions[ind][temp] == -1){
							potions[ind][temp] = {type : potRef[i][j].type, vrty : temp, num : lowest_num};
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