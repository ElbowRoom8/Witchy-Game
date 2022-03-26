/// @description closes inventory
if(!inDialogue & !inQuest){
	if (inInventory){
		instance_destroy(obj_inventory);
		instance_destroy(obj_potion);
		instance_destroy(obj_potion_slot);
		instance_destroy(obj_refill_button);
		instance_destroy(obj_dim);
		inInventory = false;
	} else if (brewing){
		instance_destroy(obj_inventory);
		instance_destroy(obj_item_slot);
		instance_destroy(obj_brew);
		instance_destroy(obj_dim);
		brewing = false;
	}
}