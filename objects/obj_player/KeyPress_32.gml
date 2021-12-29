/// @description Checks for interactions
if(sprite_index = spr_amber_walkleft){
	instance_create_depth(x - 10, y + sprite_height / 2, 1, obj_pinger);
	
} else if (sprite_index = spr_amber_walkright){
	instance_create_depth(x + sprite_width + 10, y + sprite_height / 2, 1, obj_pinger);
	
} else if(sprite_index = spr_amber_walkup){
	instance_create_depth(x + sprite_width / 2, y - 5, 1, obj_pinger);
	
} else if(sprite_index = spr_amber_walkdown){
	instance_create_depth(x + sprite_width / 2, y + sprite_height + 5, 1, obj_pinger);
}