/// @description Checks if occupied
if(place_meeting(x, y, obj_potion)) {
	var inst = instance_place(x,y, obj_potion);
	if(!inst.touchingMouse){
		occupied = true;
	}
} else {
	occupied = false;
}