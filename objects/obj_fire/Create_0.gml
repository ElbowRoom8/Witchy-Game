/// @description
randomize();
image_speed = 0.4;

hypot = sqrt( power((mouse_x - x), 2) + power((mouse_y - y), 2));
hspeed = 1.6 * (mouse_x - x)/hypot;
vspeed = 1.6 * (mouse_y - y)/hypot;

hspeed += (hSpd + random_range(-0.1, 0.1));
vspeed += (vSpd + random_range(-0.1, 0.1));

//image_angle = irandom_range(0, 3) * 90;