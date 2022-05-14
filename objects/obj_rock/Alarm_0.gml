/// @description makes wall at delay
depth = room_height - (y + 5 + image_yscale * sprite_height / 2);

newObj = instance_create_depth(x + 3, y + sprite_height/2, 75, obj_wall);
if(sprite_index = spr_rock6){
	newObj.image_xscale = (sprite_width - 18)/ 8;
	newObj.image_yscale = 2;
}else {
	newObj.image_xscale = (sprite_width - 6)/ 8;
	newObj.image_yscale = 2;
}
newObj.moveable = true;
