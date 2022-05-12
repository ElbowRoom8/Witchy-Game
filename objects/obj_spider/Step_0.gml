/// @description spider movement
script_object_movement();

//keeps target position for moves in place
if(hSpd > 0){
	if(obj_player.x <= 100) {
		target_x -= hSpd;
	} else {
		target_x -= hSpd * 1.7;
	}
} else {
	if(obj_player.x >= 250) {
		target_x -= hSpd;
	} else {
		target_x -= hSpd * 1.7;
	}
}

//checks if slime can jump
if (distance_to_object(obj_player) < 200){
	/*
	if(obj_player.x > (x + 10)){
		if(jump_delay && move_delay){
			jump_delay = false;
			spiderPath = path_add();
			start_x = x;
			start_y = y;
			target_x = obj_player.x + 60;
			target_y = obj_player.y + obj_player.sprite_height / 2;

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

			path_set_precision(spiderPath, 8);
			path_set_kind(spiderPath, true);
			path_add_point(spiderPath, start_x, start_y, 400);
			path_add_point(spiderPath, width, height, 400);
			path_add_point(spiderPath, target_x, target_y, 400);
			path_set_closed(spiderPath, false);
			image_speed = 1;
			speed = 0;
			depth = 40;
			alarm[1] = 150;
			jumping = true;
			path_start(spiderPath, 1, path_action_stop, true);
			depth = 100;
		}
	} else if (move_delay){*/
		//move_delay = false;
		//alarm[0] = 80;
		target_x = obj_player.x + 60;
		target_y = obj_player.y + obj_player.sprite_height / 2;
		direction = point_direction(x, y, target_x, target_y); //moves in a line towards player
		image_speed = 1;
		speed = 4;
	//}
	
}

if(speed == 0){
	image_speed = 0;
}


//if close enough to target position, stop jumping
/*
if((abs(x - target_x) < 3) && (abs(y - target_y) < 3)){
	speed = 0;
	image_speed = 0;
	jumping = false;
}
*/

//checks for death
if(spiderHealth <= 0) {
	instance_destroy();
}