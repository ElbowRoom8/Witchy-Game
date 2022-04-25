/// @description Ticks each letter in a dialogue
if(j <= string_length(text)){
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
