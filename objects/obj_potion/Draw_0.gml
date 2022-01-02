/// @description Draws highlight
if(touchingMouse){
	draw_set_alpha(0.5);
	if (collision_point(mouse_x, mouse_y, obj_inventory, false, true)) {
		var inst = instance_position(mouse_x, mouse_y, obj_inventory);
		if(!inst.occupied){
			draw_sprite(spr_placelight, 0 , inst.x + 2, inst.y + 2);	
		} else {
			draw_sprite(spr_placelight, 0 , snapX + 1, snapY + 1);
		}
	} else {
		draw_sprite(spr_placelight, 0 , snapX + 1, snapY + 1);
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