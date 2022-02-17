/// @description Insert description here
slimePath = path_add();
start_x = x;
start_y = y;
target_x = obj_player.x;
target_y = obj_player.y;

distance_y = (start_y - target_y);
distance_x = (start_x - target_x);

if (distance_y == 0) {
	width = start_x - distance_x / 2;
} else {
	width = start_x - distance_x / 2 - distance_x / distance_y;
}

if(distance_y < 0){
	distance_y = 0;
}

height = start_y - distance_y - 50;

path_set_precision(slimePath, 8);
path_set_kind(slimePath, true);
path_add_point(slimePath, start_x, start_y, 500);
path_add_point(slimePath, width, height, 500);
path_add_point(slimePath, target_x, target_y, 500);
path_set_closed(slimePath, false);
image_speed = 1;
path_start(slimePath, 1, path_action_stop, false);
