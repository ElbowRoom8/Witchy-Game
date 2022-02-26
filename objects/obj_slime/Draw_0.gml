/// @description draws health bar and shadows
if(jumping){
	//draws shadow at actual position
	var _x = x;
	var _y = y;
	var rx = 14 / (1 + z / 100);
	var ry = rx / 2;
	draw_set_color(c_black);
	draw_set_alpha(0.7);
	
	depth = 100;
	draw_ellipse(_x - rx, _y - ry, _x + rx, _y + ry, false);
	
	draw_set_color(c_white);
	draw_set_alpha(1.0);
} else {
	//only draws self if not jumping
	draw_self();
}
if(slimeHealth > 0){
	//draw_healthbar(x, y - 1, x , y - 6, slimeHealth, c_white, c_green, c_red, 1, false, true);
}