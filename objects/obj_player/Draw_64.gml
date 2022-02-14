/// @description
//draws quest graphics
if (inQuest){
	//draws inventory highlight
	draw_sprite_ext(spr_highlight, 0, 10, 6 + 8 * (selNum + 1) + 70 * selNum, 2, 2, 0, c_white, 1);
	
	//draws health
	for (var i = 0; i < health; i += 2){
		if(i == (health - 1)) {
			draw_sprite_ext(spr_health2, 0,  1030 + 25 * i, 10, 2.5, 2.5, 0, c_white, 1);
		} else {
			draw_sprite_ext(spr_health, 0, 1030 + 25 * i, 10, 2.5, 2.5, 0, c_white, 1);
		}
	}
	
}