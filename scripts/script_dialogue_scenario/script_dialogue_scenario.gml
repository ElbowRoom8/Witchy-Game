//find the start of a characters lines in dialogue ds_grid
function script_dialogue_character(_char){
	for(var i = 0; i < ds_grid_height(global.dialogue); i++){
		//checks new index
		if (ds_grid_get(global.dialogue, 0, i) == _char){
			return i;
		}
	}
	return;
}

//finds a given scenario in the dialgue ds_grid
function script_dialogue_scenario(_c_index, _scene){
	for(var i = _c_index; i < ds_grid_height(global.dialogue); i++){
		//checks if we've entered a new character's area
		if ((i > _c_index) & (ds_grid_get(global.dialogue, 0, i) != "")){
			return;
		}
		//checks new index
		if (ds_grid_get(global.dialogue, 1, i) == _scene){
			return i;
		}
	}
	return;
}