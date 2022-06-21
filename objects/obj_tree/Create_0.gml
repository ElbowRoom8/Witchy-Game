/// @description 
image_xscale = 2;
image_yscale = image_xscale;
depth = room_height - (y + image_yscale * sprite_height / 2);
if (depth < 1){
	depth = 1;
}

newObj = instance_create_depth(x + 22, y + 110, 75, obj_wall);
newObj.image_xscale = 3;
newObj.image_yscale = 2;
newObj.moveable = true;
