/// @description Move webs
script_object_movement();

if (speed == 0 && image_alpha > 0) {
	image_alpha -= 0.003;
}
if (image_alpha < 0.2){
	instance_destroy();
}
