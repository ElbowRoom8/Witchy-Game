/// @description Opens tab

//sets positioning variables
var cx = obj_player.cx;
var cy = obj_player.cy;

//checks if tab is already open
if(tabType != val){
	//sets open tab to self
	tabType = val;
	
	//loops through all varieties of type
	for(var i = 0; i <= max_v; i++){
		//creates inventory objects
		newObj = instance_create_depth(cx + 55 + 35 * i, cy + 131, -1, obj_inventory);
		newObj.image_alpha = 0.85
		newObj.depth = -1;
		newObj.val = val;
		newObj.stored = "potions";
	
		//reads potions array and adds potions accordingly
		if(potions[val] != -1){
			newObj = instance_create_depth(cx + 56 + 35 * i, cy + 132, -2, obj_potion);
			newObj.depth = -2;
			newObj.val = val;
			newObj.vrty = i;
			newObj.stored = "potions";
			newObj.sprite_index = potions[val][i].type;
		}
	}
} else {
	tabType = -1;
}

