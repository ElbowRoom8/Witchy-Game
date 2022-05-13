/// @description ramming attack
depth = room_height - (y + image_yscale * sprite_height / 4);
y = clamp(y, 100, room_height);// set minimum y value
script_object_movement();

//keeps target position for ramming in place
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

//checks if ram is active
if (move_delay) {
	move_delay = false;
	alarm[0] = 200;// delay for next move
}

if(speed == 0){
	image_speed = 0;
}


//checks for death
if(wolfHealth <= 0) {
	instance_destroy();
}