/// @description moves trees
if (inQuest) {
	if(sprite_index = spr_tree_background1 || sprite_index = spr_tree_background4){
		if(hSpd > 0){
			if(obj_player.x <= 100) {
				x -= hSpd;
			} else {
				x -= hSpd * 1.7;
			}
		} else if (!backTracked){
			if(obj_player.x >= 250) {
				x -= hSpd;
			} else {
				x -= hSpd * 1.7;
			}
		}
		
	} else if(sprite_index = spr_tree_background2 || sprite_index = spr_tree_background5){
		if(hSpd > 0){
			if(obj_player.x <= 100) {
				x -= hSpd / 1.11111;
			} else {
				x -= hSpd / 1.11111 * 1.7;
			}
		} else if (!backTracked){
			if(obj_player.x >= 250) {
				x -= hSpd / 1.11111;
			} else {
				x -= hSpd / 1.11111 * 1.7;
			}
		}
		
	} else if(sprite_index = spr_tree_background3 || sprite_index = spr_tree_background6){
		if(hSpd > 0){
			if(obj_player.x <= 100) {
				x -= hSpd / 1.25;
			} else {
				x -= hSpd / 1.25 * 1.7;
			}
		} else if (!backTracked){
			if(obj_player.x >= 250) {
				x -= hSpd / 1.25;
			} else {
				x -= hSpd / 1.25 * 1.7;
			}
		}
	}
	
	if(x < -1280){
		instance_destroy();
	}
}