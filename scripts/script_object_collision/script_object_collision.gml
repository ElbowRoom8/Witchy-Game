function script_object_collision(_xoffset, _yoffset){
	/// @description initiate decor object with proper depth and collision
	// set default value if nothing is passed
	_xoffset = is_undefined(_xoffset) ? 0 : _xoffset;
	_yoffset = is_undefined(_yoffset) ? 0 : _yoffset;
	_yoffset *= 2;
	
	// depth
	image_speed = 1;
	image_xscale = 2;
	image_yscale = 2;
	depth = room_height - y - 4 - _yoffset;

	// collision box
	newObj = instance_create_depth(x - sprite_width/2 + 4, y - sprite_height/2 + 4 + _yoffset, 75, obj_wall);
	newObj.image_xscale = (sprite_width - _xoffset)/ 8 - 1;
	newObj.image_yscale = (sprite_height - 4 - _yoffset)/ 8;
	newObj.moveable = true;
}