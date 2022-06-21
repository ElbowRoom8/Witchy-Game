/// @description track player position

image_xscale = 2;
image_yscale = image_xscale;
target_x = obj_player.x;
target_y = obj_player.y + obj_player.sprite_height / 2;
direction = point_direction(x, y, target_x, target_y); //moves in a line towards player
distance = point_distance(x, y, target_x, target_y);
speed = 5;

alarm[0] = distance/speed;
