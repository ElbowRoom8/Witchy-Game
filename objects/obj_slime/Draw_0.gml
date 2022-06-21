/// @description draws jumping sprites
//draw_sprite_ext(sprite_index, image_index, x, y, 2, 2, 0, damageCol, 1);
if(jumping){
	depth = 40;
	//draws shadow
	var shadow_scale = 70 * def_scale / (z + 70)
	draw_sprite_ext(spr_shadow, 0, x, y + 4, shadow_scale, shadow_scale, 0, c_white, 1);
	//draws slime in air (y - z)
	draw_sprite_ext(sprRef, image_index, x, y - z, def_scale, def_scale, 0, damageCol, 1);
} else {
	//draws shadow
	draw_sprite_ext(spr_shadow, 0, x, y + 4, def_scale, def_scale, 0, c_white, 1);
	//draws slime
	draw_sprite_ext(sprRef, image_index, x, y, def_scale, def_scale, 0, damageCol, 1);
}

if(objHealth > 0 && objHealth != maxHealth){
	draw_healthbar(x - sprite_width/2, y + sprite_height/2 + 2, x + sprite_width/2, y + sprite_height/2 + 4, objHealth/maxHealth * 100, c_black, c_red, c_lime, 0, false, false);
}