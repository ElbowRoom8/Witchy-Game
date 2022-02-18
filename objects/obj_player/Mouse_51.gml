/// @description use potion effects
if(fireBreath > 0){
	//fireBreath -= 0.4;
	instance_create_depth(x + sprite_width - 8, y + sprite_height / 3 + 5, 50, obj_fire);
}