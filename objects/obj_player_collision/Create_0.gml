/// @description Sets movement variables
//maybe pointless
globalvar hSpd;
hSpd = 0;
globalvar vSpd;
vSpd = 0;

depth = -1; //just because of draw lol
//camera stuff cause gamemaker is dumb
min_view_x = 0;
min_view_y = 0;
max_view_x = room_width - camera_get_view_width(view_camera[0]);
max_view_y = room_height - camera_get_view_height(view_camera[0]);
