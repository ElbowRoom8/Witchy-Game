/// @description controls depth and damage

if(!jumping){
	//damages player once per jump
	if (damage_delay) {
		damage_delay = false;
		health -= 1/defense;
	}
}
