/// @description Sets default values
val = 0; //holds a particular index number in an array
vrty = 0; //holds the variety of the potion, as well as an index number
t_text = "";
v_text = "";

stored = ""; //hold which array the potion is a part of

prev_ing = array_create(4, -1); //used to prevent unnecessary looping of items array

//for draw_GUI
//grab the width and height of view
var cw = camera_get_view_width(view_camera);
var ch = camera_get_view_height(view_camera);
//set some variables to hold the value and div that by width and height
display_scalex = display_get_gui_width() / cw;
display_scaley = display_get_gui_height() / ch;
