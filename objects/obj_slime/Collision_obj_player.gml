/// @description controls depth and damage

if(!jumping){
	//changes depth based on player y
	if(obj_player.y > y - 45){
		depth = 100;
	} else {
		depth = 40;
	}
	
	//damages player once per jump
	if (damage_delay) {
		damage_delay = false;
		health -= 1/defense;
	}
} else {
	depth = 100;
}
