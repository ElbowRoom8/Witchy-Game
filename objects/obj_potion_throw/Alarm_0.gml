/// @description throws potion
potionPath = path_add();
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

path_set_precision(potionPath, 8);
path_set_kind(potionPath, true);
path_add_point(potionPath, start_x, start_y, 600);
path_add_point(potionPath, width, height, 600);
path_add_point(potionPath, target_x, target_y, 600);
path_set_closed(potionPath, false);
path_start(potionPath, 1, path_action_stop, true);