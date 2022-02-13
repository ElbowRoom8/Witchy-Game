/// @description Sets variables

#region Setup cameras clamp variables

min_view_x = 0;
min_view_y = 0;
max_view_x = room_width - camera_get_view_width(view_camera[0]);
max_view_y = room_height - camera_get_view_height(view_camera[0]);

#endregion

image_speed = 0;
depth = 50;

//used to pick the correct spot in inventory
selNum = 0;
//used to prevent holding of potions
gap = true;

globalvar inDialogue; //allows for cutscenes and dialogue
inDialogue = false; 
globalvar inInventory; //allows for inventory
inInventory = false;
globalvar inQuest; //allows for quests
inQuest = false;

globalvar playerName;
playerName = "rawr xd"; //will change how is set later
globalvar maxPotions; //maximum number of each potion type you can have on quests
maxPotions = 3; 

inventory = array_create(9, -1); //-1 is default value
globalvar inventory; //nine slots for potions you can bring on quests
//each slot holds a sprite value, and a number value
inventory[0] = {type : spr_health_potion, num : 2};
inventory[1] = {type : spr_light_potion, num : 1};
inventory[2] = {type : spr_acid_potion, num : 2};
inventory[3] = {type : spr_fire_potion, num : 2};

potions = array_create(50, -1); //-1 is default value
globalvar potions; //storage for all potions you have
//each slot holds a sprite value, and a number value
potions[0] = {type : spr_health_potion, num : 8};
potions[1] = {type : spr_defense_potion, num : 3};
potions[2] = {type : spr_regen_potion, num : 2};
potions[3] = {type : spr_fire_potion, num : 1};
potions[4] = {type : spr_ice_potion, num : 0};
potions[5] = {type : spr_acid_potion, num : 2};
potions[6] = {type : spr_light_potion, num : 1};
potions[7] = {type : spr_sleep_potion, num : 6};
potions[8] = {type : spr_stone_potion, num : 0};

items = array_create(100, -1); //-1 is default value
globalvar items; //bulk storage of all items you have
//each slot holds a sprite value and a number value
items[0] = {type : spr_door1, num : 2};
