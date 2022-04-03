/// @description Move player
//We control movement here so that colisions with walls work properly

//directional speeds
var leftSpd = 0;
var rightSpd = 0;
var upSpd = 0;
var downSpd = 0;
//movement speed, varies for sprinting
var walkSpd = 3;
//speed of walking animation, varies for sprinting
var animationSpd = 1.2;
//checks for cutscene
if(!inDialogue and !inInventory and !brewing){
	//controls sprinting
	if keyboard_check(vk_shift){
		walkSpd = 3.5;
		animationSpd = 2;
	} else {
		walkSpd = 2.5;
		animationSpd = 1.2;
	}

	//sets directional speed and sprites
	if keyboard_check(ord("A")) or keyboard_check(vk_left){
		leftSpd = 1;
		obj_player.sprite_index = spr_amber_walkleft;
		obj_player.image_speed = animationSpd;
	}
	if keyboard_check(ord("D")) or keyboard_check(vk_right){
		rightSpd = 1;
		obj_player.sprite_index = spr_amber_walkright;
		obj_player.image_speed = animationSpd;
	}
	if keyboard_check(ord("W")) or keyboard_check(vk_up){
		upSpd = 1;
		obj_player.sprite_index = spr_amber_walkup;
		obj_player.image_speed = animationSpd;
	}
	if keyboard_check(ord("S")) or keyboard_check(vk_down){
		downSpd = 1;
		obj_player.sprite_index = spr_amber_walkdown;
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

//moves player
if(!inQuest){
	obj_player.x = obj_player.x + hSpd;
} else if((hSpd < 0 && obj_player.x < 250) || (hSpd > 0 && obj_player.x > 100)){
	obj_player.x = obj_player.x - hSpd * 0.85;
}
	
obj_player.y = obj_player.y + vSpd;

//stops sprite animation if player stopped
if hSpd == 0 and vSpd == 0 {
	obj_player.image_speed = 0;
	obj_player.image_index = 0;
}

//moves to players feet
x = obj_player.x;
y = obj_player.y + 65;