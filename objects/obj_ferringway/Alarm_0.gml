/// @description Ticks each letter in a dialogue
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
