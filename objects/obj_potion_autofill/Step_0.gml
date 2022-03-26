/// @description 

//changes amount of ingredients filled
if keyboard_check(vk_shift){
	grabNum = 5;
} else if keyboard_check(vk_control){
	grabNum = 10;
} else {
	grabNum = 1;
}

//fades empty potions
if(potions[val][vrty].num == 0){
	image_alpha = 0.35;
} else {
	image_alpha = 1;
}

//deletes if wrong tab open
if(val != tabType){
	instance_destroy();
}