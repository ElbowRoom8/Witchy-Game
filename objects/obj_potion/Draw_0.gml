/// @description Draws highlight
if(touchingMouse){
	draw_set_alpha(0.5);
	if (collision_point(mouse_x, mouse_y, obj_inventory, false, true)) {
		var inst = instance_position(mouse_x, mouse_y, obj_inventory);
		if(!inst.occupied){
			draw_sprite(spr_placelight, 0 , inst.x + 1, inst.y + 1);	
		} else {
			draw_sprite(spr_placelight, 0 , snapX, snapY);
		}
	} else {
		draw_sprite(spr_placelight, 0 , snapX, snapY);
	}
}
draw_set_alpha(1);
draw_self()