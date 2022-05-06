//modifiers _text based on what _char is
function escape_char(_char, _text, _j){
	if(_char == "p"){ //inserts player's name
		_text = string_delete(_text, _j, 2);
		_text = string_insert(playerName, _text, _j);
	} else if(_char == "n"){ //inserts newline
		_text = string_delete(_text, _j, 2);
		_text = string_insert("\n", _text, _j);
	} else if(_char == "q"){ //inserts newline
		_text = string_delete(_text, _j, 2);
		_text = string_insert("\"", _text, _j);
	}else if (_char == "c"){ //player choice
		choosing = true; //lol guess I'm allowed to do this huh
		_text = string_delete(_text, _j, 2);
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
	}else if(_char == "b"){ //blue
		color = c_blue;
	} else if(_char == "w"){ //normal
		if(choosing){
			color = c_lime;
		} else {
			color = c_dkgray;
		}
	} else if (_char == "d"){ //shaky text
		color = 1;
	} else if (_char == "s"){ //still text
		color = 2;
	}
	
	return color
}
