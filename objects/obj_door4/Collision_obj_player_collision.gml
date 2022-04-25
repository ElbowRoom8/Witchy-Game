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
	obj_player.x = 166;
	obj_player.y = 424;
} else if(room = rm_classroom2){
	room_goto(rm_westhall);
	obj_player.x = 485;
	obj_player.y = 50;
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
	obj_player.x = 166;
	obj_player.y = 424;
} else if(room = rm_classroom8){
	room_goto(rm_easthall);
	obj_player.x = 740;
	obj_player.y = 50;
}