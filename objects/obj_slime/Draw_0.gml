/// @description draws health bar and jumping sprite
draw_self();
if(jumping){
	depth = 40;
	//draws slime in air (y - z)
	draw_sprite_ext(spr_slime_green, image_index, x, y - z, def_scale, def_scale, 0, c_white, 1);
}
if(slimeHealth > 0){
	//draw_healthbar(x, y - 1, x , y - 6, slimeHealth, c_white, c_green, c_red, 1, false, true);
}