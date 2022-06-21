/// @description moves to given room
if(room = rm_mainhall){
	room_goto(rm_player_room);
	obj_player.x = 300;
	obj_player.y = 80;
} else if(room = rm_player_room){
	room_goto(rm_mainhall);
	obj_player.x = 390;
	obj_player.y = 180;
} else if(room = rm_westhall){
	room_goto(rm_tower1);
} else if(room = rm_tower1){
	room_goto(rm_westhall);
	obj_player.x = 100;
	obj_player.y = 875;
} else if(room = rm_easthall){
	room_goto(rm_classroom6);
	obj_player.x = 166;
	obj_player.y = 424;
} else if(room = rm_classroom6){
	room_goto(rm_easthall);
	obj_player.x = 580;
	obj_player.y = 375;
}
