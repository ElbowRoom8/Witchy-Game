/// @description stepping back and spitting attack
depth = room_height - (y + image_yscale * sprite_height / 4);
y = clamp(y, 100, room_height);// set minimum y value
script_object_movement();

//keeps target position for stepping in place
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

//checks if step is active
//only steps back if the player gets too close
if (move_delay && distance_to_object(obj_player) < 100) {
	move_delay = false;
	alarm[0] = 20;// delay for stepping back
} else { // if the spider isn't stepping
	if (attack_delay) {
		attack_delay = false;
		alarm[2] = 200;// delay for spitting
	}
}

//checks for death
if(spiderHealth <= 0) {
	instance_destroy();
}