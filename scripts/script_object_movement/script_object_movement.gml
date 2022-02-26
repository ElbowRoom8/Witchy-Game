//moves objects in quests
function script_object_movement(){
	if (inQuest) {
		if(hSpd > 0){
			if(obj_player.x <= 100) {
				x -= hSpd;
			} else {
				x -= hSpd * 1.7;
			}
		} else {
			if(obj_player.x >= 250) {
				x -= hSpd;
			} else {
				x -= hSpd * 1.7;
			}
		}
	}
	if(x < -1280){
		instance_destroy();
	}
}