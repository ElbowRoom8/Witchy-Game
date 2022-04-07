/// @description draws inventory highlight
//this is only here because of layering
if (inQuest){
	var selNum = obj_player.selNum;
	draw_sprite_ext(spr_highlight, 0, 5, 3 + 4 * (selNum + 1) + 35 * selNum, 1, 1, 0, c_white, 1);
}
