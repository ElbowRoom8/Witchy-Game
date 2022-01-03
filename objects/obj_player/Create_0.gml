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
globalvar maxPotions; //maximum number of each potion type you can have on quests
maxPotions = 3; 

inventory = array_create(9, -1);
globalvar inventory;
inventory[0] = {pot : spr_health_potion, num : 3};
inventory[1] = {pot : spr_light_potion, num : 1};
inventory[2] = {pot : spr_acid_potion, num : 3};
inventory[3] = {pot : spr_fire_potion, num : 2};

potions = array_create(50, -1);
globalvar potions;
potions[0] = {pot : spr_health_potion, num : 7};
potions[1] = {pot : spr_defense_potion, num : 3};
potions[2] = {pot : spr_regen_potion, num : 2};
potions[3] = {pot : spr_fire_potion, num : 0};
potions[4] = {pot : spr_ice_potion, num : 0};
potions[5] = {pot : spr_acid_potion, num : 1};
potions[6] = {pot : spr_light_potion, num : 0};
potions[7] = {pot : spr_sleep_potion, num : 6};
potions[8] = {pot : spr_stone_potion, num : 0};
