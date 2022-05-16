/// @description Draw shadow and bullseye
if(inQuest){
	if(inventory[selNum] != -1){
		if(inventory[selNum].type == spr_acid_potion || inventory[selNum].type == spr_fire_potion){
			var throwDist = 110;
			throw_x = mouse_x;
			throw_y = mouse_y;
			if(point_distance(x + sprite_width / 2, y + sprite_height / 3 + 5, mouse_x, mouse_y) > throwDist){
				var dir = point_direction(x + sprite_width / 2, y + sprite_height / 3 + 5, mouse_x, mouse_y);
				throw_x = (x + sprite_width / 2) + (throwDist * dcos(dir));
				throw_y = (y + sprite_height / 3 + 5) - (throwDist * dsin(dir));
			}
			draw_sprite_ext(spr_bullseye, -1, throw_x, throw_y, image_xscale, image_yscale, 0, c_white, 1);
		}
	}
}
draw_sprite_ext(spr_shadow, 0, x + sprite_width / 2, y + sprite_height - 8, image_xscale, image_yscale, 0, c_white, 1);

//flashes red when hit
if(damaged){
	draw_sprite_ext(sprite_index, image_index, x, y, 2, 2, 0, c_red, 1);
} else {
	draw_self();
}
