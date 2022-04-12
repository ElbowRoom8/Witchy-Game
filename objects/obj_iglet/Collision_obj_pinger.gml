/// Begins interaction
if(!interaction & !inQuest){
	interaction = true;
	inDialogue = true;
	i = 0; //dialogue line counter
	
	//check if c_index is filled yet
	if(c_index == -1){
		c_index = script_dialogue_character("Iglet");
	}
	//check conditions and load lines
	if(true){
		index = script_dialogue_scenario(c_index, "The Light");
	}

	text = ds_grid_get(global.dialogue, 3, index);
	letter = "";
	j = 1; //line letter counter
	alarm[0] = 3; //loops each letter
}
