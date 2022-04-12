//modifiers _text based on what _char is
function escape_char(_char, _text, _j){
	if(_char == "p"){ //inserts player's name
		_text = string_delete(_text, _j, 2);
		_text = string_insert(playerName, _text, _j);
	} else if(_char == "n"){ //inserts newline
		_text = string_delete(_text, _j, 2);
		_text = string_insert("\n", _text, _j);
	} else {
		return 0;
	}
	
	return _text;
}

//offers the correct color for a modifier
function escape_color(_char){
	var color = 0;
	if(_char == "r"){ //red
		color = c_red;
	} else if(_char == "g"){ //green
		color = c_green;
	} else if(_char == "q"){ //normal
		color = c_dkgray;
	} else if (_char == "d"){ //shaky text
		color = 1;
	} else if (_char == "s"){ //still text
		color = 2;
	}
	
	return color
}
