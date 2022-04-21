/// @descriptiona Sets room camera
//sets camera variables for new room

max_view_x = room_width - camera_get_view_width(view_camera[0]);
max_view_y = room_height - camera_get_view_height(view_camera[0]);

halfViewWidth = camera_get_view_width(view_camera[0]) / 2;
halfViewHeight = camera_get_view_height(view_camera[0])/2;

cx = x + (obj_player.sprite_width / 2) - halfViewWidth;
cy = y + (obj_player.sprite_height / 2) - halfViewHeight;

cx = clamp(cx, min_view_x, max_view_x);
cy = clamp(cy, min_view_y, max_view_y);

if(inQuest){
	//loops through 9 inventory slots
	for(i = 0; i < 9; i++){
		//creates inventory objects
		newObj = instance_create_depth(cx + 4, cy + 2 + 4 * (i + 1) + 35 * i, -1, obj_inventory);
		newObj.image_alpha = 0.85;
		newObj.stored = "inventory";
		newObj.slotNum = i; //sets slotnum
		//reads inventory array and adds potions accordingly
		if(inventory[i] != -1){
			newObj = instance_create_depth(cx + 5, cy + 3 + 4 * (i + 1) + 35 * i, -2, obj_potion);
			newObj.val = i;
			newObj.vrty = inventory[i].vrty;
			newObj.stored = "inventory";
			newObj.sprite_index = inventory[i].type;
		}
	}
} else {
	instance_destroy(obj_inventory);
	instance_destroy(obj_potion);
}