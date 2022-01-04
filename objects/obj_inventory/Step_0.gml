/// @description Checks if occupied

//checks if touching potion
if(place_meeting(x, y, obj_potion)) {
	//checks if potion being touched is in transit
	var inst = instance_place(x,y, obj_potion);
	if(!inst.touchingMouse){
		occupied = true;
	}
} else {
	occupied = false;
}