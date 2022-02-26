/// @description controls depth and damage

//changes depth based on player y when not jumping
if(!jumping){
	if(obj_player.y > y - 45){
		depth = 100;
	} else {
		depth = 40;
	}
} else {
	depth = 100;
}

//damages player once per jump
if (damage_delay) {
	damage_delay = false;
	health--;
}