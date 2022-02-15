/// @description Moves slime
randomize();
if(irandom_range(1, 10) = 4){
	x -= 10;
}

script_object_movement();
if(slimeHealth <= 0) {
	instance_destroy();
}