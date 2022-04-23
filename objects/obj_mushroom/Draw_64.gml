/// @description draw collection bar

//get camera coords
var cx = camera_get_view_x(view_camera);
var cy = camera_get_view_y(view_camera);
//make the adjustment to gui
var xx = (x - cx) * display_scalex;
var yy = (y - cy) * display_scaley;
	
if(place_meeting(x, y, obj_player) && keyboard_check(vk_space) && collectTimer > 0){
	draw_healthbar(xx + 10, yy, xx + 40, yy + 6, (collectTimer / (room_speed * 0.5)) * 100, c_lime, c_black, c_black, 1, true, false);
}
