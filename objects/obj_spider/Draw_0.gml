/// @description draws health bar
draw_self();

if(objHealth > 0 && objHealth != maxHealth){
	draw_healthbar(x - sprite_width/2, y + sprite_height/2 + 2, x + sprite_width/2, y + sprite_height/2 + 4, objHealth/maxHealth * 100, c_black, c_red, c_lime, 0, false, false);
}