/// @description Insert description here
// You can write your code in this editor

//makes directional speed variables
var leftSpd = 0;
var rightSpd = 0;
var upSpd = 0;
var downSpd = 0;

//sets directional spped and sprites
if keyboard_check(ord("A")){
	leftSpd = 1;
	sprite_index = spr_amber_walkleft;
	image_speed = 1;
}
if keyboard_check(ord("D")){
	rightSpd = 1;
	sprite_index = spr_amber_walkright;
	image_speed = 1;
}
if keyboard_check(ord("W")){
	upSpd = 1;
	sprite_index = spr_amber_walkup;
	image_speed = 1;
}
if keyboard_check(ord("S")){
	downSpd = 1;
	sprite_index = spr_amber_walkdown;
	image_speed = 1;
}

//calculates horizonatal and vertical speed
var hSpd = 2 * (rightSpd - leftSpd);
var vSpd = 2 * (downSpd - upSpd);

//adjusts for diagonal movement
if (hSpd != 0) and (vSpd != 0) {
	hSpd *= 0.71;
	vSpd *= 0.71;
}

//moves player
obj_temp_player.x = obj_temp_player.x + hSpd;
obj_temp_player.y = obj_temp_player.y + vSpd;

//stops sprite animation if player stopped
if hSpd == 0 and vSpd == 0 {
	image_speed = 0;
	image_index = 0;
}