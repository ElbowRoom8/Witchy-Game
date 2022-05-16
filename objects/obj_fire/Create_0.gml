/// @description
randomize();
image_speed = 0.5;
//image_xscale = 2;
//image_yscale = image_xscale;

hypot = sqrt( power((mouse_x - x), 2) + power((mouse_y - y), 2));
hspeed = 2 * (mouse_x - x)/hypot;
vspeed = 2 * (mouse_y - y)/hypot;

hspeed += (hSpd + random_range(-0.1, 0.1));
vspeed += random_range(-0.1, 0.1);

image_angle = darctan2(hspeed, vspeed);
