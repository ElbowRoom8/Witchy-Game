/// @description draws health bar
draw_sprite_ext(spr_shadow, 0, x, y + 12, def_scale*1.5, def_scale, 0, c_white, 1);

draw_sprite_ext(sprite_index, image_index, x, y, 2, 2, 0, damageCol, 1);

if(objHealth > 0 && objHealth != maxHealth){
	draw_healthbar(x - def_width/2, y + sprite_height/2 + 2, x + def_width/2, y + sprite_height/2 + 4, objHealth/maxHealth * 100, c_black, c_red, c_lime, 0, false, false);
}