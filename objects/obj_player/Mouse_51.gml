/// @description use potion effects
if(fireBreath > 0){
	//fireBreath -= 0.4;
	var fireDepth = depth + 1;
	if (sprite_index == spr_player_walkdown){
		fireDepth = depth - 1;
	}
	/*
	if (fire_timer < 2) {
		fire_timer += 1
	} else {
		instance_create_depth(x + sprite_width / 2, y + sprite_height / 3 + 5, fireDepth, obj_fire);
		fire_timer = 0
	}*/
	instance_create_depth(x + sprite_width / 2, y + sprite_height / 3 + 5, fireDepth, obj_fire);
}