/// @description Draws highlight
///this code is a mess

//checks if this potion is being moved
if(touchingMouse & !inQuest){
	draw_set_alpha(0.5);
	/*if inventory type potion, it will highlight other inventory slots 
	it's above, otherwise just highlight the corresponding spot on the
	potion storage*/
	if (stored == "inventory"){
		if (highlightNum == -1){ //stops this for-loop being run every step
			for(var i = 0; i < array_length(potions); i++){
				if(potions[i] != -1){
					//find matching potion, and sets highlightNum to the index
					if((array_length(potions[i]) - 1) >= vrty){
						if(potions[i][vrty] != -1){
							if(potions[i][vrty].type = sprite_index){
								highlightNum = i;
							}
						}
					}
				}
			}
		}
		//used to find coords of matching potion slot
		hx = highlightNum mod 10;
		hy = highlightNum div 10;
		
		//checks for inventory collisions
		if (collision_point(mouse_x, mouse_y, obj_inventory, false, true)) {
			var inst = instance_position(mouse_x, mouse_y, obj_inventory);
			//checks if inventory object type is "inventory"
			if(inst.stored == "inventory") {
				//if empty, draw highlight there, otherwise, draw it at old slot
				if(!inst.occupied){
					draw_sprite(spr_placelight, 0 , inst.x + 3, inst.y + 3);	
				} else {
					draw_sprite(spr_placelight, 0 , snapX + 2, snapY + 2);
				}
			} else {
				//if "potions" type slot, draw highlight at corresponding potions slot
				if(tabType == highlightNum){
					draw_sprite(spr_placelight, 0, obj_player.cx + 58 + 36 * vrty, obj_player.cy + 134);
				}else{
					draw_sprite(spr_placelight, 0, obj_player.cx + 58 + 36 * hx, obj_player.cy + 173 + 36 * hy);
				}
			}
		} else {
			//if not touching inventory object, draw highlight at corresponding potions slot
			if(tabType == highlightNum){
				draw_sprite(spr_placelight, 0, obj_player.cx + 58 + 36 * vrty, obj_player.cy + 134);
			}else{
				draw_sprite(spr_placelight, 0, obj_player.cx + 58 + 36 * hx, obj_player.cy + 173 + 36 * hy);
			}
		}
		
	//if not inventory type potion, it must be one in transit (potions type never leave slot)
	
	/* if in transit, it will highight it's old spot if over an occupied inventory slot
	if over an unoccupied inventory slot, checks if there is an inventory slot that matches, 
	and highlights that, otherwise will highlight slot it's over. If over potions slot, or nothing,
	will highlight corresponding potions slot */
	} else {
		if (highlightNum == -1){ //stops this for-loop being run every step
			highlightNum = -2; //sets it to null value
			for(var i = 0; i < array_length(inventory); i++){
				if(inventory[i] != -1){
					//searches for matching inventory slot
					if(inventory[i].type == sprite_index && inventory[i].vrty == vrty){
						highlightNum = i;
					}
				}
			}
		}
		//used to find coords of matching potions slot
		hx = val mod 10;
		hy = val div 10;
		
		//checks for inventory collisions
		if (collision_point(mouse_x, mouse_y, obj_inventory, false, true)) {
			var inst = instance_position(mouse_x, mouse_y, obj_inventory);
			//checks if inventory is of type "inventory"
			if(inst.stored == "inventory") {
				//checks if there is an inventory slot that matches,
				if (highlightNum == -2){
					/*if no matching inventory slot, draw highlight either on the slot it's over,
					or, is slot is full, over matching potions slot */
					if(!inst.occupied){
						draw_sprite(spr_placelight, 0 , inst.x + 3, inst.y + 3);	
					} else {
						if(tabType == val){
							draw_sprite(spr_placelight, 0, obj_player.cx + 58 + 36 * vrty, obj_player.cy + 134);
						}else{
							draw_sprite(spr_placelight, 0, obj_player.cx + 58 + 36 * hx, obj_player.cy + 173 + 36 * hy);
						}
					}
				} else {
					//if there is a matching inventory slot, draw highlight over it
					draw_sprite(spr_placelight, 0, obj_player.cx + 7, obj_player.cy + 5 + 4 * (highlightNum + 1) + 35 * highlightNum);
				}
			} else {
				//if inventory object is type "potions", draw highlight over corresponding potions slot
				if(tabType == val){
					draw_sprite(spr_placelight, 0, obj_player.cx + 58 + 36 * vrty, obj_player.cy + 134);
				}else{
					draw_sprite(spr_placelight, 0, obj_player.cx + 58 + 36 * hx, obj_player.cy + 173 + 36 * hy);
				}
			}
		} else {
			//if not over inventory object, draw highlight over corresponding potions slot
			if(tabType == val){
				draw_sprite(spr_placelight, 0, obj_player.cx + 58 + 36 * vrty, obj_player.cy + 134);
			}else{
				draw_sprite(spr_placelight, 0, obj_player.cx + 58 + 36 * hx, obj_player.cy + 173 + 36 * hy);
			}
		}
	}
}
draw_set_alpha(1);
draw_self();

//draws numbers
draw_set_font(fnt_6);
draw_set_color(c_white);
if (stored == "inventory"){
	//if type "inventory", reference inventory array
	var i = inventory[val].num;
} else if (stored == "potions"){
	//if type "potions" references potions array
	var i = potions[val][vrty].num
} else {
	//if in transit, just reference stored value
	var i = stored;
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
