/// @description draws health bar
//draws shadow
draw_sprite_ext(spr_shadow, 0, x, y + 16, def_scale*2, def_scale, 0, c_white, 1);
draw_self();

if(objHealth > 0 && objHealth != maxHealth){
	draw_healthbar(x - sprite_width/2, y + sprite_height/2 + 2, x + sprite_width/2, y + sprite_height/2 + 4, objHealth/maxHealth * 100, c_black, c_red, c_lime, 0, false, false);
}