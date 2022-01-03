/// @description Draws highlight
if(touchingMouse){
	draw_set_alpha(0.5);
	if (stored == "inventory"){
		if (highlightNum == -1){
			for(i = 0; i < array_length(potions); i++){
				if(potions[i] != -1){
					if(potions[i].pot = sprite_index){
						highlightNum = i;
					}
				} else {
					break;
				}
			}
			hx = highlightNum mod 10;
			hy = highlightNum div 10;
		}
		if (collision_point(mouse_x, mouse_y, obj_inventory, false, true)) {
			var inst = instance_position(mouse_x, mouse_y, obj_inventory);
			if(inst.stored == "inventory") {
				if(!inst.occupied){
					draw_sprite(spr_placelight, 0 , inst.x + 2, inst.y + 2);	
				} else {
					draw_sprite(spr_placelight, 0 , snapX + 1, snapY + 1);
				}
			} else {
				draw_sprite(spr_placelight, 0, obj_player.cx + 57 + 35 * hx, obj_player.cy + 172 + 35 * hy);
			}
		} else {
			draw_sprite(spr_placelight, 0, obj_player.cx + 57 + 35 * hx, obj_player.cy + 172 + 35 * hy);
		}
	} else {
		if (highlightNum == -1){
			for(i = 0; i < array_length(inventory); i++){
				if(inventory[i] != -1){
					if(inventory[i].pot = sprite_index){
						highlightNum = i;
					}
				}
			}
		}	
		if (collision_point(mouse_x, mouse_y, obj_inventory, false, true)) {
			var inst = instance_position(mouse_x, mouse_y, obj_inventory);
			if(inst.stored == "inventory") {
				if (highlightNum == -1){
					if(!inst.occupied){
						draw_sprite(spr_placelight, 0 , inst.x + 2, inst.y + 2);	
					} else {
						draw_sprite(spr_placelight, 0 , snapX + 1, snapY + 1);
					}
				} else {
					draw_sprite(spr_placelight, 0, obj_player.cx + 6, obj_player.cy + 4 + 4 * (highlightNum + 1) + 35 * highlightNum);
				}
			} else {
				draw_sprite(spr_placelight, 0 , snapX + 1, snapY + 1);
			}
		} else {
			draw_sprite(spr_placelight, 0 , snapX + 1, snapY + 1);
		}
	}
}
draw_set_alpha(1);
draw_self();

draw_set_font(fnt_2);
if (stored == "inventory"){
	var i = inventory[val].num;
	if (i > 1) {
		draw_text(x + 1, y + 19, i);
	}
} else if (stored == "potions"){
	var i = potions[val].num
	if (i > 1) {
		draw_text(x + 1, y + 19, i);
	}
} else {
	var i = stored;
	if (i > 1) {
		draw_text(x + 1, y + 19, i);
	}
}