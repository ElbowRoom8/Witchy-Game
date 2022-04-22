/// @description Sets index variable at a delay
depth = room_height - (y + image_yscale * sprite_height / 2);

switch sprite_index{
	case spr_mushroom1: 
		type = spr_door1;
		index = 0;
		break;
	case spr_mushroom2: 
		type = spr_door2;
		index = 2;
		break;
	case spr_mushroom3: 
		type = spr_door3;
		index = 3;
		break;
}
