/// @description Opens tab

//sets positioning variables
var cx = obj_player.cx;
var cy = obj_player.cy;

var obj = obj_potion;
var sto = "potions";
var xx = 55;
if (stored = "autofill"){
	obj = obj_potion_autofill;
	sto = "p_autofill"
	xx = 270
}

//checks if tab is already open
if(tabType != val){
	//sets open tab to self
	tabType = val;
	
	//loops through all varieties of type
	for(var i = 0; i < max_v; i++){
		//creates inventory objects
		newObj = instance_create_depth(cx + xx + 36 * i, cy + 131, depth + 1, obj_inventory);
		newObj.image_alpha = 0.85
		newObj.val = val;
		newObj.stored = sto;
	
		//reads potions array and adds potions accordingly
		if(potions[val] != -1){
			if(potions[val][i] != -1){
				newObj = instance_create_depth(cx + xx + 1 + 36 * i, cy + 132, depth, obj);
				newObj.val = val;
				newObj.vrty = i;
				newObj.t_text = potions[val][i].t_text;
				newObj.v_text = potions[val][i].v_text;
				newObj.stored = "potions";
				newObj.sprite_index = potions[val][i].type;
			}
		}
	}
} else {
	tabType = -1;
}

