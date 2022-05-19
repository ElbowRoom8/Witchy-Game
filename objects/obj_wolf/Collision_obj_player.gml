/// @description controls depth and damage

if (damage_delay and !damaged) {
	damage_delay = false;
	damaged = true;
	obj_player.alarm[1] = 1;
	obj_player.alarm[3] = 30;
	health -= 1/defense;
}
