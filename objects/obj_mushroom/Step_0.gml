/// @description pick up mushroom
if(place_meeting(x, y, obj_player) && keyboard_check(vk_space)){
	if(collectTimer > 0){
		collectTimer--;
	}
	if(!collectTimer && image_alpha){
		if(index != -1){
			if(items[index] != -1){
				items[index].num += dropNum;
			} else {
				items[index] = {type : itemRef[index].type, num : dropNum}
			}
			array_insert(obj_player.pickup, 0, {text : "+1 " + itemRef[index].t_text, val : 0});
			instance_destroy();
		}
	}
} else {
	collectTimer = room_speed * 0.5; 
}
