/// @description Moves slime
randomize();
/*
if ((distance_to_object(obj_player) < 200) & jump_delay){
	slimePath = path_add();
	path_set_precision(slimePath, 8);
	path_set_kind(slimePath, true);
	path_add_point(slimePath, x + (x - obj_player.x)/2, y - (y - obj_player.y)/2 + distance_to_object(obj_player)/4 , 1);
	path_add_point(slimePath, obj_player.x, obj_player.y, 1);
	path_start(slimePath, 1, path_action_stop, false);
	image_speed = 1;
	jump_delay = false;
	alarm[0] = 100;
	path_delete(slimePath);
} else {
	if((irandom_range(1, 200) == 1) & ani_delay){
		image_speed = 1;
		ani_delay = false;
		alarm[0] = irandom_range(50, 100);
	}
}
*/
script_object_movement();
if(slimeHealth <= 0) {
	instance_destroy();
}