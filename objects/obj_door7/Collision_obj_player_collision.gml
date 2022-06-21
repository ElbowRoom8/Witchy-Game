/// @description moves to given room
if(room = rm_westhall){
	room_goto(rm_cafeteria);
	obj_player.x = 24;
	obj_player.y = 355;
} else if(room = rm_cafeteria){
	room_goto(rm_westhall);
	obj_player.x = 400;
	obj_player.y = 220;
}else if(room = rm_easthall){
	room_goto(rm_laboratory);
	obj_player.x = 241;
	obj_player.y = 162;
} else if(room = rm_laboratory){
	room_goto(rm_easthall);
	obj_player.x = 300;
	obj_player.y = 725;
}
