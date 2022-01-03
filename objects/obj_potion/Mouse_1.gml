/// @description Picks up one item
if (stored == "potions"){
	if(!mouseUsed & (potions[val].num > 0)){
		newObj = instance_create_depth(x,y, -3, obj_potion);
		newObj.val = val;
		newObj.stored = 1;
		newObj.sprite_index = sprite_index;
		newObj.touchingMouse = true;
		newObj.rightClick = true;
		newObj.gap = false;
		newObj.objOther = self;
		potions[val].num -= 1;
	}
} else if ((stored != "inventory") & rightClick & gap){
	if(place_meeting(x, y, objOther)) {
		if(potions[val].num > 0){
			stored++;
			potions[val].num -= 1;
			gap = false;
		}
	}
}