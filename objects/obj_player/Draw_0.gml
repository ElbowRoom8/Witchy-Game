/// @description Draw shadow and potion arrow
if(inQuest){
	if(inventory[selNum] != -1){
		if(inventory[selNum].type = spr_acid_potion){
			draw_set_color(c_black);
			var throwDist = 110;
			throw_x = mouse_x;
			throw_y = mouse_y;
			if(point_distance(x + sprite_width / 2, y + sprite_height / 3 + 5, mouse_x, mouse_y) > throwDist){
				var dir = point_direction(x + sprite_width / 2, y + sprite_height / 3 + 5, mouse_x, mouse_y);
				throw_x = (x + sprite_width / 2) + (throwDist * dcos(dir));
				throw_y = (y + sprite_height / 3 + 5) - (throwDist * dsin(dir));
			}
			draw_arrow(x + sprite_width / 2, y + sprite_height / 3 + 5, throw_x, throw_y, 15);
		}
	}
}
draw_sprite_ext(spr_shadow, 0, x + sprite_width / 2, y + sprite_height - 8, image_xscale, image_yscale, 0, c_white, 1);
draw_self();
