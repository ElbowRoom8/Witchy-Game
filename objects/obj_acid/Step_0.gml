/// @description fades out acid
if (image_alpha > 0) {
	image_alpha -= 0.003;
}
if (image_alpha < 0){
	instance_destroy();
}
script_object_movement();