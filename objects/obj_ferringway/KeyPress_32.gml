/// @description **Hardcode Choices Here**
//Goes to next dialogue line
if(interaction ){
	//selects an option
	if(choosing){
		if(obj_player.choice != -1){
			choosing = false;
			i = 0; //dialogue line counter

			//check conditions
			//check what option was selected, then load lines/alter variables
			if(obj_player.choice == 0){
				index = script_dialogue_scenario(c_index, "Yes");
			} else {
				index = script_dialogue_scenario(c_index, "No");
			}

			//resets text settings to start new interaction
			text = ds_grid_get(global.dialogue, 3, index);
			letter = "";
			j = 1; //line letter counter
			alarm[0] = 3; //loops each letter
		}
	} else {
		script_npc_space();
	}
}

