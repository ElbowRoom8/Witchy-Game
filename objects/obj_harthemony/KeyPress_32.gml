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
	} else {
		//Skips through dialogue
		var l = 0;
		while (l <= string_length(text)){
			var char = string_char_at(text , l);
			if(char == "\\"){
				//if char is esc, then run check on next char
				char = string_char_at(text , l + 1);
				var temp = escape_char(char, text, l);
				if (temp != 0){
					text = temp //see script
					l--;
				} 
			}
			l++;
		}
		escape = false;
		letter = text;
		j = string_length(text) + 1;
	}
}