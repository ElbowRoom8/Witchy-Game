/// @description create next backround
script_object_movement();

//updates traveled
if(hSpd > 0){
	if(obj_player.x <= 100) {
		traveled += hSpd;
	} else {
		traveled += hSpd * 1.7;
	}
	backTracked = false;
} else if (!backTracked) {
	if(obj_player.x >= 250) {
		traveled += hSpd;
	} else {
		traveled += hSpd * 1.7;
	}
}
//sets cap on traveled
if(traveled > 640){
	traveled = 640;
} else if (traveled < 0){
	//traveled = 0;
}

//all of the next background created
if ((x < 3) & (!tiled)){
	tiled = true;
	
	//creates next background
	newObj = instance_create_depth(x + 640, 0, room_height, obj_background1);
	newObj.counter = counter + 1;
	newObj.traveled = traveled;
	
#region //sets next background sprite + path vars
	//sets range for path
	var pathMin = 240;
	var pathMax = 240;
	
	//controls forest background + path
	if(sprite_index == spr_forest1 || sprite_index == spr_forest4 || sprite_index == spr_forest6){	
		var n = irandom_range(1, 5);
		switch n {
			case 1: 
				newObj.sprite_index = spr_forest1; 
				pathMin = 290;
				pathMax = 160;
				break;
			case 2: 
				newObj.sprite_index = spr_forest2;
				pathMin = 290;
				pathMax = 160;
				break;
			case 3: 
				newObj.sprite_index = spr_forest7;
				pathMin = 290;
				pathMax = 190;
				break;
			default: 
				newObj.sprite_index = spr_forest3;
				pathMin = 320;
				pathMax = 190;
				break;
		}
	} else if (sprite_index == spr_forest2 || sprite_index == spr_forest5){
		var n = irandom_range(1, 2);
		switch n {
			case 1: 
				newObj.sprite_index = spr_forest4;
				pathMin = 290;
				pathMax = 160;
				break;
			case 2: 
				newObj.sprite_index = spr_forest5;
				pathMin = 290;
				pathMax = 160;
				break;
		}
	} else if (sprite_index == spr_forest3) {
		newObj.sprite_index = spr_forest6;
		pathMin = 320;
		pathMax = 190;
	} else if (sprite_index == spr_forest7){
		newObj.sprite_index = spr_forest9;
	} else if (sprite_index == spr_forest8){
		var n = irandom_range(1, 3);
		switch n {
			case 1: 
				newObj.sprite_index = spr_forest1;
				pathMin = 290;
				pathMax = 160;
				break;
			case 2: 
				newObj.sprite_index = spr_forest2;
				pathMin = 290;
				pathMax = 160;
				break;
			case 3:
				newObj.sprite_index = spr_forest3;
				pathMin = 320;
				pathMax = 190;
				break;
		}
	} else {
		var n = irandom_range(1, 3);
		switch n {
			case 1:
				newObj.sprite_index = spr_forest8;
				pathMin = 290;
				pathMax = 190;
				break;
			default:
				newObj.sprite_index = spr_forest9;
				break;
		}
	}
#endregion
	
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
	
#region //adds background trees and walls
	if(counter % 3 == 0){
		//chance of getting a clearing
		var opening = 1;//irandom_range(0, 6);
		
		for(var i = 0; i < 11; i++){
			if(i == 7 && !opening){
				newObj = instance_create_depth(x + 640 + 192 * i, 0, room_height - 3, obj_tree_background);
				newObj.sprite_index = spr_tree_background4;
			} else {
				newObj = instance_create_depth(x + 640 + 192 * i, 0, room_height - 3, obj_tree_background);
				newObj.sprite_index = spr_tree_background1;
			}
		}
		for(var i = 0; i < 10; i++){
			if(i == 6 && !opening){
				newObj = instance_create_depth(x + 640 + 192 * i, 0, room_height - 2, obj_tree_background);
				newObj.sprite_index = spr_tree_background5;
			} else {
				newObj = instance_create_depth(x + 640 + 192 * i, 0, room_height - 2, obj_tree_background);
				newObj.sprite_index = spr_tree_background2;
			}
		}
		for(var i = 0; i < 9; i++){
			if(i == 5 && !opening){
				newObj = instance_create_depth(x + 640 + 192 * i, 0, room_height - 1, obj_tree_background);
				newObj.sprite_index = spr_tree_background6;
			} else {
				newObj = instance_create_depth(x + 640 + 192 * i, 0, room_height - 1, obj_tree_background);
				newObj.sprite_index = spr_tree_background3;
			}
		}
		//checks if opening was selected
		if(!opening){
			for(var i = 1; i <= 2; i++){
				newObj = instance_create_depth(x + 640 * i, 120, 100, obj_wall);
				newObj.image_xscale = 640 / newObj.sprite_width;
				newObj.moveable = true;
			}
			//door to clearing
			newObj = instance_create_depth(x + 640 + 1394, 50, 100, obj_door1);
			newObj.image_xscale = 94 / newObj.sprite_height;
			newObj.moveable = true;
			//creates opening
			newObj = instance_create_depth(x + 640 + 1280, 120, 100, obj_wall);
			newObj.image_xscale = 104 / newObj.sprite_width;
			newObj.moveable = true;
			newObj = instance_create_depth(x + 640 + 1486, 120, 100, obj_wall);
			newObj.image_xscale = 434 / newObj.sprite_width;
			newObj.moveable = true;
			//side walls
			newObj = instance_create_depth(x + 640 + 1394, 0, 100, obj_wall);
			newObj.image_yscale = 128 / newObj.sprite_height;
			newObj.moveable = true;
			newObj = instance_create_depth(x + 640 + 1486, 0, 100, obj_wall);
			newObj.image_yscale = 128 / newObj.sprite_height;
			newObj.moveable = true;
		}else{
			//if not opening, create 3 walls
			for(var i = 1; i <= 3; i++){
				//newObj = instance_create_depth(x + 640 * i, 120, 100, obj_wall);
				newObj.image_xscale = 640 / newObj.sprite_width;
				newObj.moveable = true;
			}
		}
		
		//starting trees & wall
		if(counter == 0){
			for(var i = 0; i < 5; i++){
				newObj = instance_create_depth(x + 640 - 192 * i, 0, room_height - 3, obj_tree_background);
				newObj.sprite_index = spr_tree_background1;
				newObj = instance_create_depth(x + 640 - 192 * i, 0, room_height - 2, obj_tree_background);
				newObj.sprite_index = spr_tree_background2;
				newObj = instance_create_depth(x + 640 - 192 * i, 0, room_height - 1, obj_tree_background);
				newObj.sprite_index = spr_tree_background3;
			}
			newObj = instance_create_depth(x, 120, 100, obj_wall);
			newObj.image_xscale = 640 / newObj.sprite_width;
			newObj.moveable = true;
		}
	}
#endregion

#region //adds light beams

for(var i = 0; i < 4; i++){
	newObj = instance_create_depth(640 + irandom_range(-50, 50) + 150 * i, 0, 0, obj_light);
	switch irandom_range(0, 2){
		case 0 : newObj.sprite_index = spr_light1;
		break;
		case 1 : newObj.sprite_index = spr_light2;
		break;
		case 2 : newObj.sprite_index = spr_light3;
		break;
	}
}


#endregion
	
#region //adds environment

	//trees
	for(var i = 0; i <= 10; i++){
		var place_x = irandom_range(640, 1280);
		var place_y = irandom_range(130, 360);
		
		if(place_y < pathMax || place_y > pathMin){
			newObj = instance_create_depth(place_x, place_y - 128, 75, obj_tree);
			if(!irandom_range(0,4)){
				newObj.sprite_index = spr_tree4;
			} else if (!irandom_range(0, 20)){
				newObj.sprite_index = spr_tree3;
			}
		}
	}
	
	//boulders
	for(var i = 0; i <= 3; i++){
		var place_x = irandom_range(640, 1280);
		var place_y = irandom_range(130, 360);
		
		if(place_y < pathMax || place_y > pathMin){
			newObj = instance_create_depth(place_x, place_y - 32, 75, obj_rock);
			var type = irandom_range(0,4);
			switch type{
				case 0:
					if(irandom_range(0,1)){
						newObj.sprite_index = spr_rock5;
					} else {
						newObj.sprite_index = spr_rock6;
					}
					break;
				case 1: newObj.sprite_index = spr_rock1;
				break;
				case 2: newObj.sprite_index = spr_rock2;
				break;
				case 3: newObj.sprite_index = spr_rock3;
				break;
				case 4: newObj.sprite_index = spr_rock4;
				break;
			}
		}
	}
	
	//bush
	for(var i = 0; i <= 3; i++){
		var place_x = irandom_range(640, 1280);
		var place_y = irandom_range(130, 360);
		
		newObj = instance_create_depth(place_x, place_y - 32, 75, obj_bush);
		var type = irandom_range(0,3);
		switch type{
			case 0: newObj.sprite_index = spr_bush_large;
			break;
			case 1: newObj.sprite_index = spr_bush_small1;
			break;
			case 2: newObj.sprite_index = spr_bush_small2;
			break;
			case 3: newObj.sprite_index = spr_bush_tall;
			break;
		}
	}
	
	//flowers
	for(var i = 0; i <= 3; i++){
		var place_x = irandom_range(640, 1280);
		var place_y = irandom_range(130, 360);
		
		if(place_y < pathMax || place_y > pathMin){
			newObj = instance_create_depth(place_x, place_y - 32, room_height - 4, obj_flower);
			if(irandom_range(0,1)){
				newObj.sprite_index = spr_flower1;
			} else {
				newObj.sprite_index = spr_flower2;
			}
		}
	}
	
	//mushrooms
	for(var i = 0; i <= 3; i++){
		var place_x = irandom_range(640, 1280);
		var place_y = irandom_range(130, 360);
		
		if(place_y < pathMax + 16 || place_y > pathMin - 16){
			newObj = instance_create_depth(place_x, place_y - 32, room_height - 4, obj_mushroom);
			if(irandom_range(0,1)){
				newObj.sprite_index = spr_mushroom1;
			} else {
				newObj.sprite_index = spr_mushroom2;
			}
		}
	}

#endregion
	
	//creates enemies
	for (var i = 0; i <= irandom_range(0, counter); i++){
		newObj = instance_create_depth(640 + irandom_range(50, 600), irandom_range(150, 330), 100, obj_slime);
		newObj.image_xscale = 2;
		newObj.image_yscale = newObj.image_xscale;
	}
}