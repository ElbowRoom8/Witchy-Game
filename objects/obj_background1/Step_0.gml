/// @description create next backround
script_object_movement();

if ((x < 3) & (!tiled)){
	tiled = true;
	
	//creates next background
	newObj = instance_create_depth(640, 0, 200, obj_background1);
	newObj.counter = counter + 1;
	
	//adds trees
	newObj = instance_create_depth(640 + irandom_range(0, 150), irandom_range(0, 20), 190, obj_tree);
	newObj.sprite_index = spr_tree2;
	newObj = instance_create_depth(640 + irandom_range(200, 450), irandom_range(0, 20), 190, obj_tree);
	newObj.sprite_index = spr_tree3;
	newObj = instance_create_depth(640 + irandom_range(500, 600), irandom_range(0, 20), 190, obj_tree);
	newObj.sprite_index = spr_tree4;
	newObj = instance_create_depth(640 + irandom_range(0, 150), irandom_range(0, 20), 190, obj_tree);
	newObj = instance_create_depth(640 + irandom_range(200, 450), irandom_range(0, 20), 190, obj_tree);
	newObj.sprite_index = spr_tree2
	newObj = instance_create_depth(640 + irandom_range(500, 600), irandom_range(0, 20), 190, obj_tree);
	newObj = instance_create_depth(640 + irandom_range(0, 150), irandom_range(0, 20), 190, obj_tree);
	newObj = instance_create_depth(640 + irandom_range(200, 450), irandom_range(0, 20), 190, obj_tree);
	newObj = instance_create_depth(640 + irandom_range(500, 600), irandom_range(0, 20), 190, obj_tree);
	newObj.sprite_index = spr_tree3
	
	//creates enemies
	for (var i = 0; i <= irandom_range(0, counter); i++){
		newObj = instance_create_depth(640 + irandom_range(50, 600), irandom_range(50, 300), 100, obj_slime);
		newObj.image_xscale = random_range(1.75, 3);
		newObj.image_yscale = newObj.image_xscale;
	}
}