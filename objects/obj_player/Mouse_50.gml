/// @description use potion
if(gap & inQuest){
	if(inventory[selNum] != -1){
		if(inventory[selNum].type = spr_health_potion){
			health += 2;
		} else if (inventory[selNum].type = spr_fire_potion){
			fireBreath = 100;
		}
		
		inventory[selNum].num -= 1;
	}
	gap = false;
}