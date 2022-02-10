/// @description moves to given room
if(room = rm_mainhall){
	
} else if(room = rm_westhall){
	room_goto(rm_tower1);
} else if(room = rm_tower1){
	room_goto(rm_westhall);
	obj_player.x = 100;
	obj_player.y = 50;
} else if(room = rm_easthall){
	room_goto(rm_classroom6);
	obj_player.x = 166;
	obj_player.y = 424;
} else if(room = rm_classroom6){
	room_goto(rm_easthall);
	obj_player.x = 356;
	obj_player.y = 50;
}