/// @description 
// updates item array
if(index != -1){
	if(items[index] != -1){
		items[index].num += dropNum;
	} else {
		items[index] = {type : sprite_index, num : dropNum}
	}
	array_insert(obj_player.pickup, 0, {text : "+1 " + itemRef[index].t_text, val : 0});
	instance_destroy();
}