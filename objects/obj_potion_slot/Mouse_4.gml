/// @description Opens tab

//sets positioning variables
var cx = obj_player.cx;
var cy = obj_player.cy;

var obj = obj_potion;
var sto = "potions";
if (stored = "autofill"){
	obj = obj_potion_autofill;
	sto = "p_autofill"
}

//checks if tab is already open
if(tabType != val){
	//sets open tab to self
	tabType = val;
	
	//loops through all varieties of type
	for(var i = 0; i < max_v; i++){
		//creates inventory objects
		newObj = instance_create_depth(cx + 55 + 36 * i, cy + 131, depth, obj_inventory);
		newObj.image_alpha = 0.85
		newObj.val = val;
		newObj.stored = sto;
	
		//reads potions array and adds potions accordingly
		if(potions[val] != -1){
			if(potions[val][i] != -1){
				newObj = instance_create_depth(cx + 56 + 36 * i, cy + 132, depth - 1, obj);
				newObj.val = val;
				newObj.vrty = i;
				newObj.stored = "potions";
				newObj.sprite_index = potions[val][i].type;
			}
		}
	}
} else {
	tabType = -1;
}

