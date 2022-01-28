/// @description moves to given room
if(room = rm_westhall){
	room_goto(rm_cafeteria);	
} else if(room = rm_cafeteria){
	room_goto(rm_westhall);
}

if(room = rm_easthall){
	room_goto(rm_laboratory);	
} else if(room = rm_laboratory){
	room_goto(rm_easthall);
}