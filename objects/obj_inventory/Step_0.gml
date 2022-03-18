/// @description Checks if occupied

//checks if touching potion or item
if(place_meeting(x, y, obj_potion)) {
	//checks if potion being touched is in transit
	var inst = instance_place(x,y, obj_potion);
	if(!inst.touchingMouse){
		occupied = true;
	}
} else if(place_meeting(x, y, obj_item_slot)) {
	//checks if potion being touched is in transit
	var inst = instance_place(x,y, obj_item_slot);
	if(!inst.touchingMouse){
		occupied = true;
	}
} else {
	occupied = false;
}

//deletes if wrong tab open
if(stored == "potions"){
	if(val != tabType){
		instance_destroy();
	}
}