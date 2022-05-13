/// @description draws health bar
//draws shadow
draw_sprite_ext(spr_shadow, 0, x, y + 16, def_scale*2, def_scale, 0, c_white, 1);
draw_self();

if(wolfHealth > 0){
	//draw_healthbar(x, y - 1, x , y - 6, slimeHealth, c_white, c_green, c_red, 1, false, true);
}