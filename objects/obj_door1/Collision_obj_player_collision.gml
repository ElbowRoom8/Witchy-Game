/// @description Moves to given room
if(room = rm_mainhall){
	room_goto(rm_westhall);
	obj_player.x = 50;
	obj_player.y = 128;
} else if(room = rm_westhall){
	room_goto(rm_mainhall);
	obj_player.x = 106;
	obj_player.y = 30;

} else if(room = rm_easthall){
	room_goto(rm_classroom8);
} else if(room = rm_classroom8){
	room_goto(rm_easthall);
}