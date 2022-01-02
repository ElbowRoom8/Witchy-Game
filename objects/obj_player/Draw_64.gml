/// @description Draws inventory numbers
if(inInventory){
	draw_set_font(fnt_2);
	for(i = 0; i < 9; i++){
		if(inventory[i] != -1){
			draw_text(11, 49 + 8 * (i + 1) + 70 * i, inventory[i].num);
		}
	}
	
	for(i = 0; i < 10; i++){
		for(j = 0; j < 5; j++){
			potNum = i + j * 10;
			if(potions[potNum] != -1){
				draw_text(113 + 70 * i, 385 + 70 * j, potions[potNum].num);
			}
		}
	}
}