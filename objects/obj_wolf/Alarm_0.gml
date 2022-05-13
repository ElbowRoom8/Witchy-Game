/// @description movement delay
target_x = obj_player.x;
target_y = obj_player.y + obj_player.sprite_height / 2;
direction = point_direction(x, y, target_x, target_y); //moves in a line towards player
// flip image if going in left direction
if (direction < 270) && (direction > 90){
	image_xscale = -def_scale
} else {
	image_xscale = def_scale
}
image_speed = 1;
speed = 3;
alarm[1] = 100;//delay to stop movement
