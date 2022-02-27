/// @description checks if path is finished
if (path_position == 1){
	if(sprite_index == spr_acid_potion){
		for(var i = 0; i < 75; i++){
			instance_create_depth(x, y, depth, obj_acid);
		}
	}
	instance_destroy();
}