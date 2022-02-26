/// @description draws self
if(jumping){
	depth = 40;
	//draws slime in air (y - z)
	draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, 0, c_white, 1);
}