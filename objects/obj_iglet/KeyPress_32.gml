/// @description Goes to next dialogue line
if(interaction){
	//checks if line is done printing
	if (j = string_length(text) + 1){
		i++; //advances to next line
		escape = false;
		shaky = false;
		color = c_dkgrey;
		//checks if past array length
		if (ds_grid_get(global.dialogue, 1, index + i) == ""){
			text = ds_grid_get(global.dialogue, 3, index + i);
			letter = "";
			j = 1;
			alarm[0] = 3;
		} else {
		//ends interaction
			interaction = false;
			alarm[1] = 3;
		}
	}
}