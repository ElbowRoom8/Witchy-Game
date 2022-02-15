/// @description use potion effects
if(fireBreath > 0){
	fireBreath -= 0.1;
	instance_create_depth(x + sprite_width, y + sprite_height / 2, 50, obj_fire);
}