/// @description use potion
if(gap & inQuest){
	if(inventory[selNum] != -1){
		inventory[selNum].num -= 1;
	}
	gap = false;
}