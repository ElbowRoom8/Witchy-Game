/// @description moves to given room
if(room = rm_mainhall){
	room_goto(Room1);
} else if(room = rm_westhall){
	room_goto(rm_mainhall);	
}