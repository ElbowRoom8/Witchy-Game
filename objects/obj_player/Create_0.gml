/// @description Sets variables

#region Setup cameras clamp variables

min_view_x = 0;
min_view_y = 0;
max_view_x = room_width - camera_get_view_width(view_camera[0]);
max_view_y = room_height - camera_get_view_height(view_camera[0]);

#endregion

image_speed = 0;

globalvar inDialogue; //allows for cutscenes and dialogue
inDialogue = false; 
globalvar inInventory; //allows for inventory
inInventory = false;

globalvar playerName;
playerName = "rawr xd"; //will change how is set later

inventory = array_create(9, -1);
inventory[0] = spr_health_potion;
inventory[1] = spr_light_potion;
inventory[2] = spr_acid_potion;
inventory[3] = spr_fire_potion;
