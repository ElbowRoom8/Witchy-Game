/// @description follow player

// check direction the player is facing
follow_x = obj_player.x + obj_player.sprite_width/2;
follow_y = obj_player.y + obj_player.sprite_height/2 + 8;

// move Floofy
if (point_distance(x,y,follow_x,follow_y) > follow_dist) {
	move_towards_point(follow_x, follow_y, 2);
	depth = room_height - (y + image_yscale * sprite_height / 2);
	image_speed = 1;
} else {
	speed = 0;
	image_speed = 0;
	image_index = 0;
}

// change direction
if (direction > 90) && (direction < 270) {
   image_xscale = def_scale;
} else {
   image_xscale = -def_scale;
}
