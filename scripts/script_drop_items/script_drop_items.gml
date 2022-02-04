//drops item given a min and max amount of numbers
function script_drop_items(_sprite, _min, _max, _x, _y){
	randomize();
	i = irandom_range(_min, _max);
	if(i > 0){
		newObj = instance_create_depth(_x + 5 * random_range(-1, 1), _y + 5 * random_range(-1, 1), 3, obj_item);
		newObj.sprite_index = _sprite;
		newObj.dropNum = i;
	}
}