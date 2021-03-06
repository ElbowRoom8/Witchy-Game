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
		draw_set_font(fnt_5);
		var str_width = string_width(t_text);
		if(str_width < 150){
			str_width = 150;
		}
		var relWidth = 1;
		if ((string_width(v_text) / (str_width)) > 1){
			relWidth = ceil(string_width(v_text) / (str_width));
		}
		var str_height = string_height(t_text) + 0.70 * relWidth * string_height(v_text);
		draw_sprite_ext(spr_tooltip, 0, xx + 5, yy, str_width / 30, str_height / 25, 0, c_white, 1);
		draw_text_transformed(xx + 10, yy - 3, t_text, 1, 1, 0);
		draw_text_ext_transformed(xx + 15, yy + 18, v_text, -1, str_width, 1, 1, 0);
	}
}
