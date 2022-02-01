/// @description moves to given room
if(room = rm_mainhall){
	room_goto(rm_forest);
}else if(room= rm_forest){
	room_goto(rm_mainhall);
} else if(room = rm_westhall){
	room_goto(rm_classroom3);
} else if(room = rm_classroom3){
	room_goto(rm_westhall);

} else if(room = rm_courtyard){
	room_goto(rm_easthall);
} else if(room = rm_easthall){
	room_goto(rm_courtyard);

} else if(room = rm_cafeteria){
	room_goto(rm_kitchen);
} else if(room = rm_kitchen){
	room_goto(rm_cafeteria);
}