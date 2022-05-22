/// @description follow player

//upon unpausing
if(unpause & !inMenu){
	speed = pause_speed;
	image_speed = pause_image_speed;
	alarm[0] = pause_alarm;
	unpause = false;
}
//upon pausing
if(!unpause & inMenu){
	pause_speed = speed;
	speed = 0;	
	pause_image_speed = image_speed;
	image_speed = 0;
	pause_alarm = alarm[0];
	alarm[0] = -1;	
	unpause = true;
}

//normal behavior
if(!inMenu){
	// move Floofy
	if (move_delay) {// set timer for movement
		move_delay = false;
		alarm[0] = 70;
		// check direction the player is facing
		follow_x = obj_player.x + obj_player.sprite_width/2;
		follow_y = obj_player.y + obj_player.sprite_height/2 + 8;
	}

	if (point_distance(x,y,follow_x,follow_y) > follow_dist){
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

	depth = room_height - (y + sprite_height / 2);

	script_object_movement();
}
