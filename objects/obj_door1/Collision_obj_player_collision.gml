/// @description Moves to given room
if(room = rm_mainhall){
	room_goto(rm_westhall);
	obj_player.x = 24;
	obj_player.y = 196;
} else if(room = rm_westhall){
	room_goto(rm_mainhall);
	obj_player.x = 131;
	obj_player.y = 50;
} else if(room = rm_easthall){
	room_goto(rm_classroom5);
	obj_player.x = 166;
	obj_player.y = 424;
} else if(room = rm_classroom5){
	room_goto(rm_easthall);
	obj_player.x = 165;
	obj_player.y = 50;
} else if(room = rm_forest){
	room_persistent = true;
	obj_player.old_x = obj_player.x;
	room_goto(rm_forest_clearing);
	obj_player.x = 300;
	obj_player.y = 285;
} else if(room = rm_forest_clearing){
	room_goto(rm_forest);
	obj_player.x = obj_player.old_x;
	obj_player.y = 50;
}
