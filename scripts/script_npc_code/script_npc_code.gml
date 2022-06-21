/*
This is where all the dialogue code for npcs is stored
It's been consolidated here to save space
Any changes here will affect ALL npcs, so double check before 
doing anything rash
*/

//Alarm 0 event: ticks each letter in a dialogue
function script_npc_alarm(){
	//ticks letters one at a time
	if(choosing){
		var i = 0;
		while (i <= string_length(text)){
			var char = string_char_at(text , i);
			if(char == "\\"){
				//if char is esc, then run check on next char
				char = string_char_at(text , i + 1);
				var temp = escape_char(char, text, i);
				if (temp != 0){
					text = temp //see script
					i--;
				} 
			}
			i++;
		}
		escape = false
	
		#region Splits up text by newlines
		//NOTE: i did NOT steal this code from reddit.com
		var slot = 0;
		var splits; //array to hold all splits
		var str2 = ""; //var to hold the current split we're working on building
		var i;
		for (i = 1; i < (string_length(text) + 1); i++) {
			var currStr = string_copy(text, i, 1);
			if (currStr == "\n") {
			    splits[slot] = str2; //add this split to the array of all splits
			    slot++;
			    str2 = "";
			} else {
			    str2 = str2 + currStr;
			    splits[slot] = str2;
			}
		}
		#endregion
	
		letter = splits;
		obj_player.choice = -1;//reset choice
		obj_player.chooseMax = array_length(letter) - 1; //set maximum choice
		j = string_length(text) + 1;
	
	} else if(j <= string_length(text)){
		//this is the next letter
		var char = string_char_at(text , j);
		//checks for escape symbol
		if(char == "\\"){
			escape = true;
		//if last char was esc, then run check on next char
		} else if(escape){
			escape = false;
			j--;
			var temp = escape_char(char, text, j);
			if (temp != 0){
				text = temp //see script
				j--;
			} else {
				//if not a recognized code, leave it for draw GUI
				j++;
				letter += "\\";
				letter += char;
			}
		
		//read as normal
		} else {
			letter += char; //adds next letter to outputted text
		}
		j++;
		alarm[0] = 3;
	}
}

//Shift Press event: skips through dialogue
function script_npc_shift(){
	if(interaction & !choosing){
		var i = 0;
		while (i <= string_length(text)){
			var char = string_char_at(text , i);
			if(char == "\\"){
				//if char is esc, then run check on next char
				char = string_char_at(text , i + 1);
				var temp = escape_char(char, text, i);
				if (temp != 0){
					text = temp //see script
					i--;
				} 
			}
			i++;
		}
		escape = false;
		letter = text;
		j = string_length(text) + 1;
	}
}
	
//Space Press event: skip through dialogue and move to next line 
function script_npc_space(){
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
	
//drawGUI event: Output Dialogue + effects
function script_npc_draw(){
	// checks if in an interaction before printing
	if(interaction){
		var charWidth = 20;
		var lineEnd = 50;
		var line = 0;
		var space = 0;
	
		draw_set_color(c_white);
		draw_sprite(spr_textbox, 0, 0, 440);
	
		//gets portrait sprite of speaker
		name = ds_grid_get(global.dialogue, 2, i + index);
		speaker = script_dialogue_sprite(name);
		if (speaker) {
			draw_sprite_ext(speaker, 0, 20, 470, 5, 5, 0, c_white, 1);
		}
		//write name of character
		draw_set_font(fnt_1);
		draw_set_color(c_dkgrey);
		draw_set_halign(fa_center);
		//swaps playerName var in
		if(name == "Player"){
			name = playerName;
		}
		if(string_width(name) > 190){
			draw_set_font(fnt_3);
			if(string_width(name) > 190){
				draw_text_ext(100, 649, name, -1, 180);
			} else {
				draw_text(100, 663, name);
			}
		} else {
			draw_text(100, 655, name);
		}
	
		//prepares starting variables for text
		draw_set_font(fnt_1);
		draw_set_halign(fa_left);
		color = c_dkgrey;
		shaky = false;
	
		//checks if choosing
		if(!choosing){
			//loops through letter string and does each char individually
			var l = 1,
			while (l <= string_length(letter)){
				var length = 0;
				var char = string_char_at(letter, l);
				while (l <= string_length(letter)){
					if(string_char_at(letter, l) == " "){
						break;
					}
					l++;
					length++;
				}
		
				if(space + length > lineEnd){
					space = 0;
					line++;
				}
				l -= length;
		
				//checks for color changes
				if(char == "\\"){
					//if char is esc, then run check on next char
					l++;
					esc = escape_color(string_char_at(letter, l)); //see script
					if(esc != 0) {
						//set variables accordingly
						if(esc == 1){
							shaky = true;
						}else if(esc == 2){
							shaky = false;
						} else {
							color = esc;
						}
					}
					space--;
				} else if (char =="\n"){
					space = -1;
					line++;
				} else {
					//sets color for character
					draw_set_color(color);
					//draws character
					if(shaky){
						draw_text(215 + space * charWidth + random_range(-1, 1), 456 + 35 * line + random_range(-1, 1), char);
					} else {
						draw_text(215 + space * charWidth, 456 + 35 * line, char);
					}
				}
				space++;
				l++;
			}
		} else {
		//this is very efficient believe me
			//goes line by line to draw the correct color
			for(var k = 0; k < array_length(letter); k++){
				if(k == obj_player.choice){
					color = c_lime;
					draw_sprite(spr_door3, 0, 215 + space * charWidth, 456 + 35 * line);
					space = 1;
				} else {
					color = c_dkgray;
				}
			
				//loops through letter string and does each char individually
				var l = 1,
				while (l <= string_length(letter[k])){
					var length = 0;
					var char = string_char_at(letter[k], l);
					while (l <= string_length(letter[k])){
						if(string_char_at(letter[k], l) == " "){
							break;
						}
						l++;
						length++;
					}
		
					if(space + length > lineEnd){
						space = 0;
						line++;
					}
					l -= length;
		
					//checks for color changes
					if(char == "\\"){
						//if char is esc, then run check on next char
						l++;
						esc = escape_color(string_char_at(letter[k], l)); //see script
						if(esc != 0) {
							//set variables accordingly
							if(esc == 1){
								shaky = true;
							}else if(esc == 2){
								shaky = false;
							} else {
								color = esc;
							}
						}
						space--;
					} else {
						//sets color for character
						draw_set_color(color);
						//draws character
						if(shaky){
							draw_text(215 + space * charWidth + random_range(-1, 1), 456 + 35 * line + random_range(-1, 1), char);
						} else {
							draw_text(215 + space * charWidth, 456 + 35 * line, char);
						}
					}
					space++;
					l++;
				}
				space = 0;
				line+=2;
			}
		}
	}	
}
