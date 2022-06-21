/// @description moves to given room
if(room = rm_mainhall){
	room_goto(rm_courtyard);
	obj_player.x = 470;
	obj_player.y = 464;
} else if(room = rm_courtyard){
	room_goto(rm_mainhall);	
	obj_player.x = 644;
	obj_player.y = 50;
} else if(room = rm_westhall){
	room_goto(rm_classroom1);
	obj_player.x = 560;
	obj_player.y = 200;
} else if(room = rm_classroom1){
	room_goto(rm_westhall);
	obj_player.x = 40;
	obj_player.y = 750;
} else if(room = rm_easthall){
	room_goto(rm_classroom7);
	obj_player.x = 30;
	obj_player.y = 200;
} else if(room = rm_classroom7){
	room_goto(rm_easthall);
	obj_player.x = 580;
	obj_player.y = 575;
}
