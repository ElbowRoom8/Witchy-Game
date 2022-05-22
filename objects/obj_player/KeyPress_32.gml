/// @description Checks for interactions
//checks diraction facing, and creates a pinger object in that direction
if(!inDialogue & !inInventory & !brewing){
	if(sprite_index = spr_player_walkleft || sprite_index = spr_player_runleft){
		instance_create_depth(x - 10, y + sprite_height / 2, depth, obj_pinger);
	
	} else if (sprite_index = spr_player_walkright || sprite_index = spr_player_runright){
		instance_create_depth(x + sprite_width + 10, y + sprite_height / 2, depth, obj_pinger);
	
	} else if(sprite_index = spr_player_walkup || sprite_index = spr_player_runup){
		instance_create_depth(x + sprite_width / 2, y + 20, 1, obj_pinger);
	
	} else if(sprite_index = spr_player_walkdown || sprite_index = spr_player_rundown){
		instance_create_depth(x + sprite_width / 2, y + 3 * sprite_height / 4, depth, obj_pinger);
	}
}