/// @description 
// updates item array
if(items[index] != -1){
	items[index].num += dropNum;
} else {
	items[index] = {type : sprite_index, num : dropNum}
}
instance_destroy();