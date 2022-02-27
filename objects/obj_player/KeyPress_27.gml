/// @description (temporary) Exits game
if(!inDialogue & !inQuest & inInventory){
	instance_destroy(obj_inventory);
	instance_destroy(obj_potion);
	instance_destroy(obj_refill_button);
	instance_destroy(obj_dim);
	inInventory = false;
}