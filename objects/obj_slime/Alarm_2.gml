/// @description initates jump
target_x = obj_player.x;
target_y = obj_player.y + obj_player.sprite_height - sprite_height;
direction = point_direction(x, y, target_x, target_y); //moves in a line towards player
image_speed = 1;

//jumping variables
z = 7;
zspeed = 4 * (point_distance(x, y, target_x, target_y) / 100);
zgravity = -0.25;

jumping = true;