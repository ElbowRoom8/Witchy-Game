/// @description Outputs dialogues
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
				draw_text(215 + space * charWidth + random_range(-1 ,1), 456 + 35 * line + random_range(-1 ,1), char);
			} else {
				draw_text(215 + space * charWidth, 456 + 35 * line, char);
			}
		}
		space++;
		l++;
	}
}