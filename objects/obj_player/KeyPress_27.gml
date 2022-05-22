/// @description closes UI screens
if(inMenu){
	//close menu
	instance_destroy(obj_dim);
	instance_destroy(obj_mute);
	inMenu = false;
}else if(inInventory){
	//close inventory
	instance_destroy(obj_inventory);		
	instance_destroy(obj_potion);
	instance_destroy(obj_potion_slot);
	instance_destroy(obj_refill_button);
	instance_destroy(obj_storage_button);
	instance_destroy(obj_dim);
	inInventory = false;
} else if (brewing){
	//close brewing
	instance_destroy(obj_inventory);
	instance_destroy(obj_item_slot);
	instance_destroy(obj_potion_slot);
	instance_destroy(obj_potion_autofill);
	instance_destroy(obj_brew);
	instance_destroy(obj_dim);
	brewing = false;
} else if (!inDialogue){
	//open menu
	newObj = instance_create_depth(cx + 0, cy + 0, -1, obj_dim);
	newObj.image_alpha = 0.6;
	newObj = instance_create_depth(cx + 100, cy + 100, -2, obj_mute);
	inMenu = true;
}
