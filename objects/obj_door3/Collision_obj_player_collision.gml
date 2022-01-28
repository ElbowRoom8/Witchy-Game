/// @description moves to given room
if(room = rm_mainhall){
	room_goto(rm_courtyard);
} else if(room = rm_courtyard){
	room_goto(rm_mainhall);	
	
} else if(room = rm_westhall){
	room_goto(rm_classroom1);
} else if(room = rm_classroom1){
	room_goto(rm_westhall);

} else if(room = rm_easthall){
	room_goto(rm_classroom6);
} else if(room = rm_classroom6){
	room_goto(rm_easthall);
}