/// @description Fixes counts if destroyed
if (stored = "brewing" || stored == "m_brewing"){
	if(brew_slots[val] != -1){
		item_array_add(val, "brewing");
	}
} else if (stored != "items" and stored != "modifiers"){
	items[val].num += qty;
}