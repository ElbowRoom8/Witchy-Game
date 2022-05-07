/// @description draws jumping sprites
draw_self();
if(jumping){
	depth = 40;
	//draws shadow
	var shadow_scale = 70 * def_scale / (z + 70)
	draw_sprite_ext(spr_shadow, 0, x, y + 4, shadow_scale, shadow_scale, 0, c_white, 1);
	//draws slime in air (y - z)
	draw_sprite_ext(sprRef, image_index, x, y - z, def_scale, def_scale, 0, c_white, 1);
} else {
	//draws shadow
	draw_sprite_ext(spr_shadow, 0, x, y + 4, def_scale, def_scale, 0, c_white, 1);
	//draws slime
	draw_sprite_ext(sprRef, image_index, x, y, def_scale, def_scale, 0, c_white, 1);
}

if(slimeHealth > 0){
	//draw_healthbar(x, y - 1, x , y - 6, slimeHealth, c_white, c_green, c_red, 1, false, true);
}