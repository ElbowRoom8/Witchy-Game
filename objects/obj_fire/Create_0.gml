/// @description
randomize();
image_speed = 0.7;
image_xscale = 2;
image_yscale = image_xscale;

hypot = sqrt( power((mouse_x - x), 2) + power((mouse_y - y), 2));
hspeed = 1.6 * (mouse_x - x)/hypot;
vspeed = 1.6 * (mouse_y - y)/hypot;

hspeed += (hSpd + random_range(-0.1, 0.1));
vspeed += (vSpd + random_range(-0.1, 0.1));

image_angle = darctan2(hspeed, vspeed);

//image_angle = irandom_range(0, 3) * 90;