//moves objects in quests
function script_object_movement(){
	if (inQuest) {
		x -= hSpd;
	}
	if(x < -1280){
		instance_destroy();
	}
}