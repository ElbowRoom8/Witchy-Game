/// @description Move background
script_object_movement();

if ((x < 3) & (!tiled)){
	tiled = true;
	instance_create_depth(640, 0, 5, obj_test_background);
}