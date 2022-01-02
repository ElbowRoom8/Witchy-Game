/// @description Insert description here
// You can write your code in this editor
draw_self();
if(collision_point(mouse_x, mouse_y, obj_inventory, false, true)) {
	var inst = instance_position(mouse_x, mouse_y, obj_inventory);
	draw_sprite(spr_highlight, 0 , inst.x + 1, inst.y + 1);	
}