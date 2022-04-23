/// @description draws tooltips

if(!mouseUsed and !inQuest){
	//get camera coords
	var cx = camera_get_view_x(view_camera);
	var cy = camera_get_view_y(view_camera);
	//make the adjustment to gui
	var xx = (mouse_x - cx) * display_scalex;
	var yy = (mouse_y - cy) * display_scaley;

	//draw tooltip
	if(position_meeting(mouse_x, mouse_y, self)){
		var str_width = string_width(t_text);
		var relWidth = 1;
		if ((string_width(v_text) / (str_width + 15)) > 1){
			relWidth = ceil(string_width(v_text) / (str_width + 15));
		}
		var str_height = string_height(t_text) + 0.70 * relWidth * string_height(v_text);
		draw_sprite_ext(spr_tooltip, 0, xx + 5, yy, str_width / 45, str_height / 40, 0, c_white, 1);
		draw_set_font(fnt_2);
		draw_text_transformed(xx + 10, yy + 3, t_text, 0.7, 0.7, 0);
		draw_text_ext_transformed(xx + 15, yy + 25, v_text, -1, str_width + 15, 0.6, 0.6, 0);
	}
}