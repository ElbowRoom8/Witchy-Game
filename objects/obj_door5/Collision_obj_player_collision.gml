/// @description moves to given room
if(room = rm_frontyard){
	room_goto(rm_forest);
	obj_player.x = 100;
	obj_player.y = 160;
	inQuest = true;
	obj_player.selNum = 0;
}else if(room= rm_forest){
	room_goto(rm_mainhall);
	obj_player.x = 390;
	obj_player.y = 610;
	inQuest = false;
} else if(room = rm_westhall){
	room_goto(rm_classroom3);
	obj_player.x = 166;
	obj_player.y = 424;
} else if(room = rm_classroom3){
	room_goto(rm_westhall);
	obj_player.x = 645;
	obj_player.y = 50;
} else if(room = rm_courtyard){
	room_goto(rm_easthall);
	obj_player.x = 177;
	obj_player.y = 420;
} else if(room = rm_easthall){
	room_goto(rm_courtyard);
	obj_player.x = 640;
	obj_player.y = 64;
} else if(room = rm_cafeteria){
	room_goto(rm_kitchen);
	obj_player.x = 24;
	obj_player.y = 196;
} else if(room = rm_kitchen){
	room_goto(rm_cafeteria);
	obj_player.x = 753;
	obj_player.y = 162;
}
obj_floofy.x = obj_player.x;
obj_floofy.y = obj_player.y;
