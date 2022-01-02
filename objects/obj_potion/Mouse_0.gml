/// @description 
if (stored == "inventory"){
	if(!mouseUsed & (inventory[val].num > 0)){
		touchingMouse = true;
	}
} else if (stored == "potions"){
	if(!mouseUsed & (potions[val].num > 0)){
		newObj = instance_create_depth(x,y, -2, obj_potion);
		newObj.val = val;
		newObj.stored = potions[val].num;
		newObj.sprite_index = sprite_index;
		newObj.touchingMouse = true;
		potions[val].num = 0;
	}
}