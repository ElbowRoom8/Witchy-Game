/// @description create next backround
script_object_movement();

if ((x < 3) & (!tiled)){
	tiled = true;
	
	//creates next background
	newObj = instance_create_depth(x + 640, 0, 200, obj_background1);
	newObj.counter = counter + 1;
	
	//adds trees
	for(var i = 0; i < 4; i++){
		var tree_y = irandom_range(15, 0);
		instance_create_depth(640 + irandom_range(0 + 160 * i, 160 + 160 * i), tree_y, 190 - tree_y, obj_tree);
		
		tree_y = irandom_range(15, 0);
		newObj = instance_create_depth(640 + irandom_range(0 + 160 * i, 160 + 160 * i), tree_y, 190 - tree_y, obj_tree);
		
		tree_y = irandom_range(15, 0);
		instance_create_depth(640 + irandom_range(0 + 160 * i, 160 + 160 * i), tree_y, 190 - tree_y, obj_tree);
		
		if (irandom_range(0, 6) = 0){
			newObj.sprite_index = spr_tree4;
		}
	}
	
	//creates enemies
	for (var i = 0; i <= irandom_range(0, counter); i++){
		newObj = instance_create_depth(640 + irandom_range(50, 600), irandom_range(150, 330), 100, obj_slime);
		newObj.image_xscale = random_range(1.75, 3);
		newObj.image_yscale = newObj.image_xscale;
	}
}