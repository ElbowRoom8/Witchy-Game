/// @description follow player

show_debug_message(move_delay);
// move Floofy
if (move_delay) {// set timer for movement
	move_delay = false;
	alarm[0] = 70;
	// check direction the player is facing
	follow_x = obj_player.x + obj_player.sprite_width/2;
	follow_y = obj_player.y + obj_player.sprite_height/2 + 8;
}

if (point_distance(x,y,follow_x,follow_y) > follow_dist){
	depth = room_height - (y + sprite_height / 2);
	move_towards_point(follow_x, follow_y, 3);
	image_speed = 1.2;
} else {
	speed = 0;
	image_speed = 0;
	image_index = 3;
}

// change direction
if (direction > 90) && (direction < 270) {
   image_xscale = def_scale;
} else {
   image_xscale = -def_scale;
}

script_object_movement();
