/// @description moves to given room
if(room = rm_westhall){
	room_goto(rm_classroom4);
} else if(room = rm_classroom4){
	room_goto(rm_westhall);

} else if(room = rm_cafeteria){
	room_goto(rm_easthall);
} else if(room = rm_easthall){
	room_goto(rm_cafeteria);
} 