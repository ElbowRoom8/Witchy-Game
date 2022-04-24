/// @description moves trees
if (inQuest) {
	if(hSpd > 0){
		if(obj_player.x <= 100) {
			x -= hSpd * 1.11111;
		} else {
			x -= hSpd * 1.11111 * 1.7;
		}
	} else if (!backTracked){
		if(obj_player.x >= 250) {
			x -= hSpd * 1.11111;
		} else {
			x -= hSpd * 1.11111 * 1.7;
		}
	}
	
	if(x < -1280){
		instance_destroy();
	}
}