/// @description
randomize();
image_speed = 0.7;
//image_xscale = 2;
//image_yscale = image_xscale;

hypot = sqrt( power((mouse_x - x), 2) + power((mouse_y - y), 2));
hspeed = 2.5 * (mouse_x - x)/hypot;
vspeed = 2.5 * (mouse_y - y)/hypot;

hspeed += (hSpd);
vspeed += random_range(-0.2, 0.2);

image_angle = darctan2(hspeed, vspeed);
