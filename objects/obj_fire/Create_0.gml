/// @description
randomize();
hypot = sqrt( power((mouse_x - x), 2) + power((mouse_y - y), 2));
hspeed = 1.6 * (mouse_x - x)/hypot;
vspeed = 1.6 * (mouse_y - y)/hypot;

hspeed += (hSpd + random_range(-0.2, 0.2));
vspeed += (vSpd + random_range(-0.2, 0.2));
