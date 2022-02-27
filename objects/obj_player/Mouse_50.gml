/// @description use potion
if(gap & inQuest){
	if(inventory[selNum] != -1){
		if(inventory[selNum].type = spr_health_potion){
			if(health > 8){
				health = 10;
			} else {
				health += 2;
			}
		} else if (inventory[selNum].type = spr_fire_potion){
			fireBreath = 100;
		} else if (inventory[selNum].type = spr_acid_potion){
			newObj = instance_create_depth(x + sprite_width / 2, y + sprite_height / 3 + 5, 49, obj_potion_throw);
			newObj.sprite_index = inventory[selNum].type;
			newObj.image_xscale = 0.5;
			newObj.image_yscale = 0.5;
			newObj.target_x = throw_x - newObj.sprite_width / 4;
			newObj.target_y = throw_y - newObj.sprite_height / 4;
		} else if (inventory[selNum].type = spr_defense_potion){
			defense = 2;
			def_timer = room_speed * 30;
		}
		inventory[selNum].num -= 1;
	}
	gap = false;
}