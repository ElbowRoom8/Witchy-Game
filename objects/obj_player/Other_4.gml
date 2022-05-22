/// @descriptiona Sets room camera
#region sets camera variables for new room

max_view_x = room_width - camera_get_view_width(view_camera[0]);
max_view_y = room_height - camera_get_view_height(view_camera[0]);

halfViewWidth = camera_get_view_width(view_camera[0]) / 2;
halfViewHeight = camera_get_view_height(view_camera[0])/2;

cx = x + (obj_player.sprite_width / 2) - halfViewWidth;
cy = y + (obj_player.sprite_height / 2) - halfViewHeight;

cx = clamp(cx, min_view_x, max_view_x);
cy = clamp(cy, min_view_y, max_view_y);

#endregion

#region quest inventory slots
if(inQuest){
	//loops through 9 inventory slots
	for(i = 0; i < 9; i++){
		//creates inventory objects
		newObj = instance_create_depth(cx + 4, cy + 2 + 4 * (i + 1) + 35 * i, -1, obj_inventory);
		newObj.image_alpha = 0.90;
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
#endregion

if (room == rm_forest_clearing && clearing_reset){
	instance_destroy(obj_mushroom);
	//create mushrooms for clearing
	instance_create_depth(64 + irandom_range(-25, 25), 160 + irandom_range(-25, 25), room_height - 4, obj_mushroom);
	instance_create_depth(128 + irandom_range(-25, 25), 128 + irandom_range(-25, 25), room_height - 4, obj_mushroom);
	instance_create_depth(117 + irandom_range(-25, 25), 171 + irandom_range(-25, 25), room_height - 4, obj_mushroom);
	instance_create_depth(54 + irandom_range(-25, 25), 213 + irandom_range(-25, 25), room_height - 4, obj_mushroom);
	instance_create_depth(160 + irandom_range(-25, 25), 192 + irandom_range(-25, 25), room_height - 4, obj_mushroom);
	clearing_reset = false;
}

if(!mute){
	script_music();
}
