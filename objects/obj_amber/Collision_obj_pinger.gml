///@description **Hardcode Intereactions Here**
//Begins interaction
if(!interaction & !inQuest){
	interaction = true;
	inDialogue = true;
	i = 0; //dialogue lSine counter
	
	//check if c_index is filled yet
	if(c_index == -1){
		c_index = script_dialogue_character("Amber");
	}
	//check conditions and load lines
	if(!spoken){
		index = script_dialogue_scenario(c_index, "Playtest");
		spoken = true;
	} else {
		index = script_dialogue_scenario(c_index, "Playtest 2");
	}

	text = ds_grid_get(global.dialogue, 3, index);
	letter = "";
	j = 1; //line letter counter
	alarm[0] = 3; //loops each letter
}
