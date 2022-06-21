/// @description draws inventory highlight
//this is only here because of layering
if (inQuest){
	var selNum = obj_player.selNum;
	
	//weird camera stuff
	cx = camera_get_view_x(view_camera[0]);
	cy = camera_get_view_y(view_camera[0]);

	
	draw_sprite_ext(spr_highlight, 0, cx + 5, cy + 3 + 4 * (selNum + 1) + 35 * selNum, 1, 1, 0, c_white, 1);
}
