/// @description fades out fire
if (image_alpha > 0) {
	image_alpha -= 0.005;
}
if (image_alpha < 0){
	instance_destroy();
}