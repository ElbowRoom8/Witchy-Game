/// @description Skips through dialogue
if(interaction){
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