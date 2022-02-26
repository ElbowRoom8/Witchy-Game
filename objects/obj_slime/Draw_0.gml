/// @description draws health bar
if(jumping){
	//draws shadow at actual position
	var _x = x;
	var _y = y;
	var rx = 16 / (1 + z / 80);
	var ry = rx / 2;
	draw_set_color(c_black);
	draw_set_alpha(0.7);
	
	depth = 100;
	draw_ellipse(_x - rx, _y - ry, _x + rx, _y + ry, false);
	
	draw_set_color(c_white);
	draw_set_alpha(1.0);
	
	depth = 40;
	//draws slime in air (y - z)
	draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, 0, c_white, 1);
} else {
	//only draws self if not jumping
	draw_self();
}
if(slimeHealth > 0){
	//draw_healthbar(x, y - 1, x , y - 6, slimeHealth, c_white, c_green, c_red, 1, false, true);
}