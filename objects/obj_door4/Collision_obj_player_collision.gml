/// @description moves to given room
if(room = rm_mainhall){
	room_goto(rm_laboratory);
	obj_player.x = 24;
	obj_player.y = 324;
} else if(room = rm_laboratory){
	room_goto(rm_mainhall);	
	obj_player.x = 753;
	obj_player.y = 387;
} else if(room = rm_westhall){
	room_goto(rm_classroom2);
	obj_player.x = 560;
	obj_player.y = 200;
} else if(room = rm_classroom2){
	room_goto(rm_westhall);
	obj_player.x = 40;
	obj_player.y = 575;
} else if(room = rm_courtyard){
	room_goto(rm_cafeteria);
	obj_player.x = 260;
	obj_player.y = 455;
} else if(room = rm_cafeteria){
	room_goto(rm_courtyard);
	obj_player.x = 226;
	obj_player.y = 64;
} else if(room = rm_easthall){
	room_goto(rm_classroom8);
	obj_player.x = 30;
	obj_player.y = 200;
} else if(room = rm_classroom8){
	room_goto(rm_easthall);
	obj_player.x = 580;
	obj_player.y = 775;
} else if(room = rm_frontyard){
	
}
