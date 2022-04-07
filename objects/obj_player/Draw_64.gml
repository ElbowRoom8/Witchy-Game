/// @description
//draws quest graphics
if (inQuest){
	//draws health
	var h = ceil(health);
	for (var i = 0; i < h; i += 2){
		if(i == (h - 1)) {
			draw_sprite_ext(spr_health2, 0,  1075 + 20 * i, 10, 2, 2, 0, c_white, 1);
		} else {
			draw_sprite_ext(spr_health, 0, 1075 + 20 * i, 10, 2, 2, 0, c_white, 1);
		}
	}
	
	if(defense > 1){
		draw_sprite_ext(spr_defense_icon, 0,  1075, 45, 2, 2, 0, c_white, 1);
		draw_text(1075, 60, round(def_timer / room_speed));
	}
	
	if(fireBreath > 0){
		draw_healthbar(1255, 60, 1270, 710, fireBreath, c_black, c_red, c_orange, 3, true, true);
	}
	
}