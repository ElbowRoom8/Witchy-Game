/// @description draws health bar
if(jumping){
	//draws shadow at actual position
	draw_sprite(spr_shadow, 0, x + 6, y)
	depth = 100;
	//draws slime in air (y - z)
	draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, 0, c_white, 1);
	depth = 40;
} else {
	//only draws self if not jumping
	draw_self();
}
if(slimeHealth > 0){
	//draw_healthbar(x, y - 1, x , y - 6, slimeHealth, c_white, c_green, c_red, 1, false, true);
}