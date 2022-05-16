/// @description damage

if(!jumping){
	//damages player once per jump
	if (damage_delay and !damaged) {
		damage_delay = false;
		damaged = true;
		obj_player.alarm[1] = 20;
		health -= 1/defense;
	}
}
