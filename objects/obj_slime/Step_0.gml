/// @description slime movement
script_object_movement();

depth = room_height - (y + image_yscale * sprite_height / 4);

//keeps target position for jumps in place
if(hSpd > 0){
	if(obj_player.x <= 100) {
		target_x -= hSpd;
	} else {
		target_x -= hSpd * 1.7;
	}
} else if (!backTracked){
	if(obj_player.x >= 250) {
		target_x -= hSpd;
	} else {
		target_x -= hSpd * 1.7;
	}
}

//checks if slime can jump
if ((distance_to_object(obj_player) < 200) & jump_delay){
	image_speed = 1;
	jump_delay = false;
	alarm[1] = 250; //sets delay for next attack
	alarm[2] = 20; //short delay before attack
	
	#region //outdated slime path
	/*
	jump_delay = false;
	slimePath = path_add();
	start_x = x;
	start_y = y;
	target_x = obj_player.x;
	target_y = obj_player.y;

	distance_y = (start_y - target_y);
	distance_x = (start_x - target_x);

	if (distance_y == 0) {
		width = start_x - distance_x / 2;
	} else {
		width = start_x - distance_x / 2 - distance_x / distance_y;
	}

	if(distance_y < 0){
		distance_y = 0;
	}

	height = start_y - distance_y - 50;

	path_set_precision(slimePath, 8);
	path_set_kind(slimePath, true);
	path_add_point(slimePath, start_x, start_y, 400);
	path_add_point(slimePath, width, height, 400);
	path_add_point(slimePath, target_x, target_y, 400);
	path_set_closed(slimePath, false);
	image_speed = 1;
	alarm[1] = 250;
	path_start(slimePath, 1, path_action_stop, true);
	*/
	#endregion
	
}

//if close enough to target position, stop jumping
if((abs(x - target_x) < 3) && (abs(y - target_y) < 3)){
	jumping = false;
	//resets sprite
	sprite_index = sprRef;
	image_alpha = 1;
	image_xscale = def_scale;
	image_yscale = image_xscale;
}


//jumps
if(jumping){
	speed = 3; //begins moving
	
	//lower z until at ground again
	if (z > 0) {
	    z += zspeed;
	    zspeed += zgravity;
	}
	//bounce on landing if needed
	if (z < 0) {
	    z = -z;
	    zspeed = abs(zspeed) * 0.1;
	    if (zspeed < 1) {
	        z = 0;
	        zspeed = 0;
	    }
	}
	
	//switches to shadow sprite
	sprite_index = spr_shadow;
	image_alpha = 0.6;
	//scales shadow based on height and size
	image_xscale = 35 * def_scale / (z + 70);
	image_yscale = image_xscale;
	
	#region //fancy stuff that doesn't work but might be useful
	//this is fancy math that doesn't work
	//k = start_y - distance_y - 50;
	
	//h = (start_x * sqrt(abs(target_y - k)) - target_x * sqrt(abs(target_x - k))) / (sqrt(abs(target_y - k)) - sqrt(abs(target_x - k)));
	
	//a = (start_y - k) / ((start_x - h) ^ 2);
	
	//y = a * ((x - h) ^ 2) + k;
	
	//this is a jump using the midpoint as the vertex:
	//z = -abs((((target_x - start_x) / 2) + start_x) - x) + abs((target_x - start_x) / 2);
	#endregion
	
//if not jjumping, jiggle randomly
} else {
	speed = 0;
	if((irandom_range(1, 200) == 1) & ani_delay){
		image_speed = 1;
		ani_delay = false;
		alarm[0] = irandom_range(25, 50);
	}
}

//checks for death
if(slimeHealth <= 0 && !jumping) {
	instance_destroy();
}