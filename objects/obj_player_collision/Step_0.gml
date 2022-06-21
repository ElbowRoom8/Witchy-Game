/// @description Move player
//We control movement here so that colisions with walls work properly

//directional speeds
var run = 0;
var leftSpd = 0;
var rightSpd = 0;
var upSpd = 0;
var downSpd = 0;
//movement speed, varies for sprinting
var walkSpd = 0;
//speed of walking animation, varies for sprinting
var animationSpd;
//checks for cutscene
if(!inDialogue and !inInventory and !brewing and !inMenu){
	//controls sprinting
	if keyboard_check(vk_shift){
		walkSpd = 4;
		animationSpd = 2;
		run = true;
	} else {
		walkSpd = 2.4;
		animationSpd = 1.6;
		run = false;
	}

	//sets directional speed and sprites
	if keyboard_check(ord("A")) or keyboard_check(vk_left){
		leftSpd = 1;
		if run {
			obj_player.sprite_index = spr_player_runleft;
		} else {
			obj_player.sprite_index = spr_player_walkleft;
		}
		obj_player.image_speed = animationSpd;
	}
	if keyboard_check(ord("D")) or keyboard_check(vk_right){
		rightSpd = 1;
		if run {
			obj_player.sprite_index = spr_player_runright;
		} else {
			obj_player.sprite_index = spr_player_walkright;
		}
		obj_player.image_speed = animationSpd;
	}
	if keyboard_check(ord("W")) or keyboard_check(vk_up){
		upSpd = 1;
		if run {
			obj_player.sprite_index = spr_player_runup;
		} else {
			obj_player.sprite_index = spr_player_walkup;
		}
		obj_player.image_speed = animationSpd;
	}
	if keyboard_check(ord("S")) or keyboard_check(vk_down){
		downSpd = 1;
		if run {
			obj_player.sprite_index = spr_player_rundown;
		} else {
			obj_player.sprite_index = spr_player_walkdown;
		}
		obj_player.image_speed = animationSpd;
	}
}

//calculates horizonatal and vertical speed
hSpd = walkSpd * (rightSpd - leftSpd);
vSpd = walkSpd * (downSpd - upSpd);

//adjusts for diagonal movement
if (hSpd != 0) && (vSpd != 0) {
	hSpd *= 0.71;
	vSpd *= 0.71;
}

//checks collisions
if(place_meeting(x + hSpd, y, obj_wall)){
	hSpd = 0;
}
if(place_meeting(x, y + vSpd, obj_wall)){
	vSpd = 0;
}

//checks slowness debuff
if (obj_player.slowness) {
	hSpd = hSpd/2;
	vSpd = vSpd/2;
}

//moves player
if(!inQuest || room = rm_forest_clearing){
	obj_player.x = obj_player.x + hSpd;
} else if(hSpd > 0 && obj_player.x > 100){
	obj_player.x = obj_player.x - hSpd * 0.85;
} else if(hSpd < 0 && obj_player.x < 250 && !backTracked) {
	obj_player.x = obj_player.x - hSpd * 0.85;
} else if(hSpd < 0 && obj_player.x > 100 && backTracked){
	obj_player.x = obj_player.x + hSpd;
} else if (backTracked){
	obj_player.image_speed = 0;
	obj_player.image_index = 0;
}
	
obj_player.y = obj_player.y + vSpd;

//stops sprite animation if player stopped
if hSpd == 0 and vSpd == 0 {
	obj_player.image_speed = 0;
	obj_player.image_index = 0;
	//prevents player from humping stuf lmao
	if(obj_player.sprite_index == spr_player_runleft){
		obj_player.sprite_index = spr_player_walkleft;
	}else if(obj_player.sprite_index == spr_player_runright){
		obj_player.sprite_index = spr_player_walkright;
	}else if(obj_player.sprite_index == spr_player_runup){
		obj_player.sprite_index = spr_player_walkup;
	}else if(obj_player.sprite_index == spr_player_rundown){
		obj_player.sprite_index = spr_player_walkdown;
	}
}

//moves to players feet
x = obj_player.x;
y = obj_player.y + 65;