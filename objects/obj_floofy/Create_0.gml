/// @description Initiate variables

image_speed = 0;
def_scale = 2
image_xscale = def_scale;
image_yscale = def_scale;
move_delay = true;
follow_dist = 32;
follow_x = 0;
follow_y = 0; // for following the player

unpause = false; //used to trigger single pause/unpause events
pause_alarm = -1; //used to save alarm 
pause_image_speed = -1; //used to save image_speed
pause_speed = -1; //used to save speed
