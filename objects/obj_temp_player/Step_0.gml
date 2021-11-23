/// @description Insert description here
// You can write your code in this editor

if keyboard_check(ord("A")){
	obj_temp_player.x = obj_temp_player.x - 2;
	sprite_index = spr_amber_walkleft;
	image_speed = 1;
}

if keyboard_check(ord("D")){
	obj_temp_player.x = obj_temp_player.x + 2;
	sprite_index = spr_amber_walkright;
	image_speed = 1;
}

if keyboard_check(ord("W")){
	obj_temp_player.y = obj_temp_player.y - 2;
	sprite_index = spr_amber_walkup;
	image_speed = 1;
}

if keyboard_check(ord("S")){
	obj_temp_player.y = obj_temp_player.y + 2;
	sprite_index = spr_amber_walkdown;
	image_speed = 1;
}

if keyboard_check_released(ord("W") and ord("A") and ord("S") and ord("D")){
	image_speed = 0;
	image_index = 0;
}