/// @description makes wall at delay
depth = room_height - (y + 5 + image_yscale * sprite_height / 2);

if(sprite_index = spr_rock6){
	newObj = instance_create_depth(x + 3, y + sprite_height/2, 75, obj_wall);
	newObj.image_xscale = (sprite_width - 18)/ 8;
	newObj.image_yscale = 2;
}else if(sprite_index = spr_rock5){
	newObj = instance_create_depth(x + 8, y + sprite_height / 2 + 21, 75, obj_wall);
	newObj.image_xscale = (sprite_width - 18)/ 8;
	newObj.image_yscale = 2;
}else {
	newObj = instance_create_depth(x + 3, y + sprite_height/2, 75, obj_wall);
	newObj.image_xscale = (sprite_width - 6)/ 8;
	newObj.image_yscale = 2;
}
newObj.moveable = true;
