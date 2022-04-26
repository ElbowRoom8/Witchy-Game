/// @description

//get camera coords
var cx = camera_get_view_x(view_camera);
var cy = camera_get_view_y(view_camera);
//make the adjustment to gui
var xx = (x - cx) * display_scalex;
var yy = (y - cy) * display_scaley;

//draws quest graphics
if (inQuest){
	//draws health
	var h = ceil(health);
	for (var i = 0; i < h; i += 2){
		if(i == (h - 1)) {
			draw_sprite_ext(spr_health2, 0,  980 + 30 * i, 10, 3, 3, 0, c_white, 1);
		} else {
			draw_sprite_ext(spr_health, 0, 980 + 30 * i, 10, 3, 3, 0, c_white, 1);
		}
	}
	
	//draws item pickup text
	for(var i = 0; i < array_length(pickup); i++){
		draw_set_font(fnt_4);
		var temp = pickup[i].val;
		//checks if timed out
		if(temp >= 200){
			array_delete(pickup, i, 1);
			i--;
		} else {
			//set image alpha based on time
			draw_set_alpha(1 - temp / 300);
			pickup[i].val++;
			draw_text(xx - 10, yy - 15 - 15 * i, pickup[i].text);
		}
	}
	draw_set_alpha(1);
	
	//draws defense icon
	if(defense > 1){
		draw_sprite_ext(spr_defense_icon, 0,  1075, 45, 2, 2, 0, c_white, 1);
		draw_text(1075, 60, round(def_timer / room_speed));
	}
	
	//draws fire healthbar
	if(fireBreath > 0){
		draw_healthbar(1255, 60, 1270, 710, fireBreath, c_black, c_red, c_orange, 3, true, true);
	}
	
}