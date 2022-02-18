/// @description
direction = point_direction(x, y, mouse_x + random_range(-15, 15), mouse_y + random_range(-15, 15));

speed = 1;
hypot = sqrt(power(hSpd, 2) + power(vSpd, 2));
speed *= (hypot + 1);
/*
hypot = sqrt( power((mouse_x - x), 2) + power((mouse_y - y), 2));
hspeed = (mouse_x - x)/hypot;
vspeed = (mouse_y - y)/hypot;

hspeed *= (hSpd + 1);
vspeed *= (vSpd + 1);
*/