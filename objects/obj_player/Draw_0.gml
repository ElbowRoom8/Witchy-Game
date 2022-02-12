/// @description
//draws inventory highlight

depth = -2;
if (inQuest){
	draw_sprite(spr_highlight, 0, cx + 5, cy + 3 + 4 * (selNum + 1) + 35 * selNum);
}
depth = 0
draw_self();