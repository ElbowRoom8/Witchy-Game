/// @description Moves to given room
if(room = rm_mainhall){
	room_goto(rm_westhall);
	obj_player.x = 32;
	obj_player.y = 128;
} else if(room = rm_westhall){
	room_goto(rm_mainhall);	
}