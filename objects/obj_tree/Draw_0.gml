/// @description draw shadow
var _x = x + sprite_width / 2;
var _y = y + sprite_height;
var rx = 32
var ry = rx * 1.2;
draw_set_color(c_black);
draw_set_alpha(0.6);
	
//draw_ellipse(_x - rx, _y - ry, _x + rx, _y + ry, false);

/// @description draw self
draw_set_color(c_white);
draw_set_alpha(1.0);

draw_self()