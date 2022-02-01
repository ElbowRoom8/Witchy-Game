/// @description Draws highlight
///this code is a mess

//checks if this potion is being moved
if(touchingMouse){
	draw_set_alpha(0.5);
	/*if inventory type potion, it will highlight other inventory slots 
	it's above, otherwise just highlight the corresponding spot on the
	potion storage*/
	if (stored == "inventory"){
		if (highlightNum == -1){ //stops this for-loop being run every step
			for(var i = 0; i < array_length(potions); i++){
				if(potions[i] != -1){
					//find matching potion, and sets highlightNum to the index
					if(potions[i].type = sprite_index){
						highlightNum = i;
					}
				} else {
					break;//reached end of potions
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
					draw_sprite(spr_placelight, 0 , inst.x + 2, inst.y + 2);	
				} else {
					draw_sprite(spr_placelight, 0 , snapX + 1, snapY + 1);
				}
			} else {
				//if "potions" type slot, draw highlight at corresponding potions slot
				draw_sprite(spr_placelight, 0, obj_player.cx + 57 + 35 * hx, obj_player.cy + 172 + 35 * hy);
			}
		} else {
			//if not touching inventory object, draw highlight at corresponding potions slot
			draw_sprite(spr_placelight, 0, obj_player.cx + 57 + 35 * hx, obj_player.cy + 172 + 35 * hy);
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
					if(inventory[i].type = sprite_index){
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
						draw_sprite(spr_placelight, 0 , inst.x + 2, inst.y + 2);	
					} else {
						draw_sprite(spr_placelight, 0, obj_player.cx + 57 + 35 * hx, obj_player.cy + 172 + 35 * hy);
					}
				} else {
					//if there is a matching inventory slot, draw highlight over it
					draw_sprite(spr_placelight, 0, obj_player.cx + 6, obj_player.cy + 4 + 4 * (highlightNum + 1) + 35 * highlightNum);
				}
			} else {
				//if inventory object is type "potions", draw highlight over corresponding potions slot
				draw_sprite(spr_placelight, 0, obj_player.cx + 57 + 35 * hx, obj_player.cy + 172 + 35 * hy);
			}
		} else {
			//if not over inventory object, draw highlight over corresponding potions slot
			draw_sprite(spr_placelight, 0, obj_player.cx + 57 + 35 * hx, obj_player.cy + 172 + 35 * hy);
		}
	}
}
draw_set_alpha(1);
draw_self();

//draws numbers
draw_set_font(fnt_2);
if (stored == "inventory"){
	//if type "inventory", reference inventory array
	var i = inventory[val].num;
	// only draw if greater than 1
	if (i > 1) {
		draw_text(x + 1, y + 19, i);
	}
} else if (stored == "potions"){
	//if type "potions" references potions array
	var i = potions[val].num
	// only draw if greater than 1
	if (i > 1) {
		draw_text(x + 1, y + 19, i);
	}
} else {
	//if in transit, just reference stored value
	var i = stored;
	// only draw if greater than 1
	if (i > 1) {
		draw_text(x + 1, y + 19, i);
	}
}