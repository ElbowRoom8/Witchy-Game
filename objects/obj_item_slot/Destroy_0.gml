/// @description Fixes counts if destroyed
if (stored = "brewing"){
	if(brew_slots[val] != -1){
		item_array_add(val, "brewing");
	}
} else if (stored != "items"){
	items[val].num += qty;
}