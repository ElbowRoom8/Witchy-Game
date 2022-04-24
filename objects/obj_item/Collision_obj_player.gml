/// @description 
// updates item array
if(index != -1){
	if(items[index] != -1){
		items[index].num += dropNum;
	} else {
		items[index] = {type : sprite_index, num : dropNum}
	}
	array_insert(obj_player.pickup, 0, "+1 " + itemRef[index].t_text);
	instance_destroy();
}