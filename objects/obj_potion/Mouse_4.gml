/// @description Picks up stack of potions
if (stored == "inventory"){
//if inventory array, just grab object
	if(!mouseUsed & !inQuest){
		touchingMouse = true;
		depth = -4;
	}
} else if (stored == "potions"){
//if potions array, make new object, and set num to 0 
	if(!mouseUsed & (potions[val][vrty].num > 0)){
		newObj = instance_create_depth(x,y, -4, obj_potion);
		newObj.val = val;
		newObj.vrty = vrty;
		newObj.t_text = t_text;
		newObj.v_text = v_text;
		newObj.stored = potions[val][vrty].num; 
		/*in this case, stored is used to hold the number, as the array
		is still tied to the object left in the potions slot. It will be 
		referenced later to move potions from one array to the other
		Yes, this is janky.*/
		newObj.sprite_index = sprite_index;
		newObj.touchingMouse = true;
		potions[val][vrty].num = 0;
	}
}
