/// @description
//draws inventory highlight
if (inQuest){
	draw_sprite_ext(spr_highlight, 0, cx + 10, cy + 6 + 8 * (selNum + 1) + 70 * selNum, 2, 2, 0, c_white, 1);
}