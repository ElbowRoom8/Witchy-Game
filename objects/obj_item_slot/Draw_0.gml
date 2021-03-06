/// @description Draws highlight
///this code is a mess

//checks if this item is being moved
if(touchingMouse & !inQuest){
	draw_set_alpha(0.5);
	var i_x = 10;//used for item highlights
	var i_y = 10;
	var m_x = 486;//used for modifier highlights
	var m_y = 10;
	var b_x = 200;//used for brewing highlights
	var b_y = 10;
	/*if brewing type item, it will highlight other inventory slots 
	it's above, otherwise just highlight the corresponding spot on the
	item storage*/
	if (stored == "brewing"){
		if (highlightNum == -1){ //stops this for-loop being run every step
			for(var i = 0; i < array_length(items); i++){
				if(items[i] != -1){
					//find matching item, and sets highlightNum to the index
					if(items[i].type = sprite_index){
						highlightNum = i;
					}
				}
			}
		}
		//used to find coords of matching item slot
		hx = highlightNum mod 5;
		hy = highlightNum div 5;
		
		//checks for inventory collisions
		if (collision_point(mouse_x, mouse_y, obj_inventory, false, true)) {
			var inst = instance_position(mouse_x, mouse_y, obj_inventory);
			//checks if inventory object type is "brewing"
			if(inst.stored == "brewing" || inst.stored == "m_brewing") {
				//if empty, draw highlight there, otherwise, draw it at old slot
				if(!inst.occupied && inst.stored != "m_brewing"){
					draw_sprite(spr_placelight, 0 , inst.x + 3, inst.y + 3);	
				} else {
					draw_sprite(spr_placelight, 0 , snapX + 2, snapY + 2);
				}
			} else {
				//if "items" type slot, draw highlight at corresponding items slot
				draw_sprite(spr_placelight, 0, obj_player.cx + i_x + 3 + 36 * hx, obj_player.cy + i_y + 3 + 36 * hy);
			}
		} else {
			//if not touching inventory object, draw highlight at corresponding items slot
			draw_sprite(spr_placelight, 0, obj_player.cx + i_x + 3 + 36 * hx, obj_player.cy + i_y + 3 + 36 * hy);
		}
		
	}else if (stored == "m_brewing"){
		if (highlightNum == -1){ //stops this for-loop being run every step
			for(var i = 0; i < array_length(items); i++){
				if(items[i] != -1){
					//find matching item, and sets highlightNum to the index
					if(items[i].type = sprite_index){
						highlightNum = i;
					}
				}
			}
		}
		//used to find coords of matching item slot
		hx = (highlightNum - mod_index) mod 4;
		hy = (highlightNum - mod_index) div 4;
		
		//checks for inventory collisions
		if (collision_point(mouse_x, mouse_y, obj_inventory, false, true)) {
			var inst = instance_position(mouse_x, mouse_y, obj_inventory);
			//checks if inventory object type is "brewing"
			if(inst.stored == "brewing" || inst.stored == "m_brewing") {
				//if empty, draw highlight there, otherwise, draw it at old slot
				if(!inst.occupied && inst.stored != "brewing"){
					draw_sprite(spr_placelight, 0 , inst.x + 3, inst.y + 3);	
				} else {
					draw_sprite(spr_placelight, 0 , snapX + 2, snapY + 2);
				}
			} else {
				//if "items" type slot, draw highlight at corresponding items slot
				draw_sprite(spr_placelight, 0, obj_player.cx + m_x + 3 + 36 * hx, obj_player.cy + m_y + 3 + 36 * hy);
			}
		} else {
			//if not touching inventory object, draw highlight at corresponding items slot
			draw_sprite(spr_placelight, 0, obj_player.cx + m_x + 3 + 36 * hx, obj_player.cy + m_y + 3 + 36 * hy);
		}
		
	//if not a brewing type item, it must be one in transit (items type never leave slot)
	
	/* if in transit, it will highight it's old spot if over an occupied inventory slot
	if over an unoccupied inventory slot, checks if there is an inventory slot that matches, 
	and highlights that, otherwise will highlight slot it's over. If over items slot, or nothing,
	will highlight corresponding items slot */
	} else if (stored == "transit") {
		if (highlightNum == -1){ //stops this for-loop being run every step
			highlightNum = -2; //sets it to null value
			for(var i = 0; i < array_length(brew_slots); i++){
				if(brew_slots[i] != -1){
					//searches for matching inventory slot
					if(brew_slots[i].type == sprite_index){
						highlightNum = i;
					}
				}
			}
		}
		//used to find coords of matching items slot
		hx = val mod 5;
		hy = val div 5;
		
		//checks for inventory collisions
		if (collision_point(mouse_x, mouse_y, obj_inventory, false, true)) {
			var inst = instance_position(mouse_x, mouse_y, obj_inventory);
			//checks if inventory is of type "brewing"
			if(inst.stored == "brewing" || inst.stored == "m_brewing") {
				//checks if there is an inventory slot that matches,
				if (highlightNum == -2){
					/*if no matching inventory slot, draw highlight either on the slot it's over,
					or, is slot is full, over matching items slot */
					if(!inst.occupied && inst.stored != "m_brewing"){
						draw_sprite(spr_placelight, 0 , inst.x + 3, inst.y + 3);	
					} else {
						draw_sprite(spr_placelight, 0, obj_player.cx + i_x + 3 + 36 * hx, obj_player.cy + i_y + 3 + 36 * hy);
					}
				} else {
					//if there is a matching inventory slot, draw highlight over it
					draw_sprite(spr_placelight, 0, obj_player.cx + b_x + 3, obj_player.cy + b_y + 3 + 36 * highlightNum);
				}
			} else {
				//if inventory object is type "items", draw highlight over corresponding items slot
				draw_sprite(spr_placelight, 0, obj_player.cx + i_x + 3 + 36 * hx, obj_player.cy + i_y + 3 + 36 * hy);
			}
		} else {
			//if not over inventory object, draw highlight over corresponding items slot
			draw_sprite(spr_placelight, 0, obj_player.cx + i_x + 3 + 36 * hx, obj_player.cy + i_y + 3 + 36 * hy);
		}
		
	} else if (stored == "m_transit") {
		if (highlightNum == -1){ //stops this for-loop being run every step
			highlightNum = -2; //sets it to null value
			for(var i = 0; i < array_length(brew_slots); i++){
				if(brew_slots[i] != -1){
					//searches for matching inventory slot
					if(brew_slots[i].type == sprite_index){
						highlightNum = i;
					}
				}
			}
		}
		//used to find coords of matching items slot
		hx = (val - mod_index) mod 4;
		hy = (val - mod_index) div 4;
		
		//checks for inventory collisions
		if (collision_point(mouse_x, mouse_y, obj_inventory, false, true)) {
			var inst = instance_position(mouse_x, mouse_y, obj_inventory);
			//checks if inventory is of type "brewing"
			if(inst.stored == "brewing" || inst.stored == "m_brewing") {
				//checks if there is an inventory slot that matches,
				if (highlightNum == -2){
					/*if no matching inventory slot, draw highlight either on the slot it's over,
					or, is slot is full, over matching items slot */
					if(!inst.occupied && inst.stored != "brewing"){
						draw_sprite(spr_placelight, 0 , inst.x + 3, inst.y + 3);	
					} else {
						draw_sprite(spr_placelight, 0, obj_player.cx + m_x + 3 + 36 * hx, obj_player.cy + m_y + 3 + 36 * hy);
					}
				} else {
					//if there is a matching inventory slot, draw highlight over it
					draw_sprite(spr_placelight, 0, obj_player.cx + b_x + 3, obj_player.cy + b_y + 3 + 36 * highlightNum);
				}
			} else {
				//if inventory object is type "items", draw highlight over corresponding items slot
				draw_sprite(spr_placelight, 0, obj_player.cx + m_x + 3 + 36 * hx, obj_player.cy + m_y + 3 + 36 * hy);
			}
		} else {
			//if not over inventory object, draw highlight over corresponding items slot
			draw_sprite(spr_placelight, 0, obj_player.cx + m_x + 3 + 36 * hx, obj_player.cy + m_y + 3 + 36 * hy);
		}
	}
}
draw_set_alpha(1);
draw_self();

//draws numbers
draw_set_font(fnt_6);
draw_set_color(c_white);
if (stored == "brewing" || stored == "m_brewing"){
	//if type "brewing", reference inventory array
	var i = brew_slots[val].num;
} else if (stored == "items" || stored == "modifiers"){
	//if type "items" references items array
	var i = items[val].num;
} else {
	//if in transit, just reference stored value
	var i = qty;
}

//displays numbers over 1k
if(i > 999){
	var count = 0;
	var n = floor(i/1000)
    while(n > 0){
        n = floor(n / 10);
        count++;
    }
	if(i > 99999){
		draw_text_transformed(x + 2, y + 15, string_format(i / 1000, 3, 0) + "k", 0.5, 0.5, 0);
	} else {
		draw_text_transformed(x + 2, y + 15, string_format(i / 1000, count, !!(floor(i / 100) % 10)) + "k", 0.5, 0.5, 0);
	}

// only draw if greater than 1
} else if (i > 1) {
	draw_text_transformed(x + 2, y + 15, i, 0.5, 0.5, 0);
}
