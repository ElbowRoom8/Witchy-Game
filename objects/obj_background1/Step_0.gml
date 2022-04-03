/// @description create next backround
script_object_movement();

if ((x < 3) & (!tiled)){
	tiled = true;
	
	//creates next background
	newObj = instance_create_depth(x + 640, 0, 200, obj_background1);
	newObj.counter = counter + 1;
	
	//controls forest background + path
	if(sprite_index == spr_forest1 || sprite_index == spr_forest4 || sprite_index == spr_forest6){	
		var n = irandom_range(1, 3);
		switch n {
			case 1: newObj.sprite_index = spr_forest1; break;
			case 2: newObj.sprite_index = spr_forest2; break;
			case 3: newObj.sprite_index = spr_forest3; break;
		}
	} else if (sprite_index == spr_forest2 || sprite_index == spr_forest5){
		var n = irandom_range(1, 2);
		switch n {
			case 1: newObj.sprite_index = spr_forest4; break;
			case 2: newObj.sprite_index = spr_forest5; break;
		}
	} else {
		newObj.sprite_index = spr_forest6;
	}
	
	#region //old tree code
	/*
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
	*/
	#endregion
	
	//adds background trees
	if(counter % 3 == 0){
		//chance of getting a clearing
		var opening = 0; //irandom_range(0, 1);
		/*
		for(var i = 0; i < 10; i++){
			if(i == 7 && !opening){
				newObj = instance_create_depth(x + 640 + 192 * i, 0, 190, obj_tree_background);
				newObj.sprite_index = spr_tree_background4;
			} else {
				newObj = instance_create_depth(x + 640 + 192 * i, 0, 190, obj_tree_background);
				newObj.sprite_index = spr_tree_background1;
			}
		}
		for(var i = 0; i < 10; i++){
			if(i == 6 && !opening){
				newObj = instance_create_depth(x + 640 + 192 * i, 0, 191, obj_tree_background);
				newObj.sprite_index = spr_tree_background5;
			} else {
				newObj = instance_create_depth(x + 640 + 192 * i, 0, 191, obj_tree_background);
				newObj.sprite_index = spr_tree_background2;
			}
		}
		for(var i = 0; i < 9; i++){
			if(i == 5 && !opening){
				newObj = instance_create_depth(x + 640 + 192 * i, 0, 192, obj_tree_background);
				newObj.sprite_index = spr_tree_background6;
			} else {
				newObj = instance_create_depth(x + 640 + 192 * i, 0, 192, obj_tree_background);
				newObj.sprite_index = spr_tree_background3;
			}
		}*/
		if(!opening){
			newObj = instance_create_depth(x + 640, 100, 100, obj_wall);
			newObj.image_xscale = 640 * 3 / newObj.sprite_width;
			newObj.moveable = true;
		}else{
			newObj = instance_create_depth(x + 640, 100, 100, obj_wall);
			newObj.image_xscale = 640 * 3 / newObj.sprite_width;
			newObj.moveable = true;
		}
		
		//starting trees
		if(counter == 0){
			for(var i = 0; i < 5; i++){
				newObj = instance_create_depth(x + 640 - 192 * i, 0, 190, obj_tree_background);
				newObj.sprite_index = spr_tree_background1;
				newObj = instance_create_depth(x + 640 - 192 * i, 0, 191, obj_tree_background);
				newObj.sprite_index = spr_tree_background2;
				newObj = instance_create_depth(x + 640 - 192 * i, 0, 192, obj_tree_background);
				newObj.sprite_index = spr_tree_background3;
			}
			newObj = instance_create_depth(x, 100, 100, obj_wall);
			newObj.image_xscale = 640 / newObj.sprite_width;
			newObj.moveable = true;
		}
	}
	
	//creates enemies
	for (var i = 0; i <= irandom_range(0, counter); i++){
		//newObj = instance_create_depth(640 + irandom_range(50, 600), irandom_range(150, 330), 100, obj_slime);
		//newObj.image_xscale = 2;
		//newObj.image_yscale = newObj.image_xscale;
	}
}