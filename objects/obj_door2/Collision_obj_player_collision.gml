/// @description moves to given room
if(room = rm_mainhall){
	
} else if(room = rm_westhall){
	room_goto(rm_tower1);	
} else if(room = rm_tower1){
	room_goto(rm_westhall);

} else if(room = rm_easthall){
	room_goto(rm_classroom7);
} else if(room = rm_classroom7){
	room_goto(rm_easthall);
}