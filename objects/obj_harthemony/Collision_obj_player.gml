/// @description Controls depth
// moves in front or beind player
if(obj_player.y > y){
	depth = 1;
	obj_player.depth = 0;
} else {
	depth = 0;
	obj_player.depth = 1;
}