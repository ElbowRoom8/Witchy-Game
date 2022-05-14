/// @description

depth = room_height - (y + image_yscale * sprite_height / 2);

// potion effects
if(def_timer > 0){
	def_timer--;
} else {
	defense = 1;
}
slowness = false;

// change selNum
if keyboard_check(ord(1)){
	selNum = 0;
} else if keyboard_check(ord(2)){
	selNum = 1;
} else if keyboard_check(ord(3)){
	selNum = 2;
} else if keyboard_check(ord(4)){
	selNum = 3;
} else if keyboard_check(ord(5)){
	selNum = 4;
} else if keyboard_check(ord(6)){
	selNum = 5;
} else if keyboard_check(ord(7)){
	selNum = 6;
} else if keyboard_check(ord(8)){
	selNum = 7;
} else if keyboard_check(ord(9)){
	selNum = 8;
}

if(health <= 0){
	room_persistent = false;
	room_goto(rm_mainhall);
	obj_player.x = 160;
	obj_player.y = 168;
	inQuest = false;
	health = 10;
	fireBreath = 0;
	defense = 1;
}