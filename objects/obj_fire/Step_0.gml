/// @description fades out fire
if (image_alpha > 0) {
	image_alpha -= 0.003 + (speed / 1000);
}
if (image_alpha < 0){
	instance_destroy();
}
script_object_movement();