/// @description 
image_xscale = 2;
image_yscale = image_xscale;
index = -1;
dropNum = 1;
collectTimer = room_speed * 0.5;

if(room = rm_forest_clearing){
	var chance = irandom_range(0, 4);
	if (chance){
		sprite_index = spr_mushroom3;
	}
}

alarm[0] = 10;

//for draw_GUI
//grab the width and height of view
var cw = camera_get_view_width(view_camera);
var ch = camera_get_view_height(view_camera);
//set some variables to hold the value and div that by width and height
display_scalex = display_get_gui_width() / cw;
display_scaley = display_get_gui_height() / ch;
