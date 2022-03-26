/// @description closes inventory
if(!inDialogue & !inQuest){
	instance_destroy(obj_inventory);
	instance_destroy(obj_item_slot);		
	instance_destroy(obj_potion);
	instance_destroy(obj_potion_slot);
	instance_destroy(obj_potion_autofill);
	instance_destroy(obj_refill_button);
	instance_destroy(obj_brew);
	instance_destroy(obj_storage_button);
	instance_destroy(obj_dim);
	
	if (inInventory){
		inInventory = false;
	} else if (brewing){
		brewing = false;
	}
}