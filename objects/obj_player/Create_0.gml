/// @description Sets variables

#region Setup cameras clamp variables

min_view_x = 0;
min_view_y = 0;
max_view_x = room_width - camera_get_view_width(view_camera[0]);
max_view_y = room_height - camera_get_view_height(view_camera[0]);

#endregion

//audio_play_sound(snd_main_theme, 1, false);

image_speed = 0;
depth = 50;
image_xscale = 2;
image_yscale = 2;

health = 10; //holds player health
def_timer = 0; //defense buff timer

selNum = 0; //used to pick the correct spot in inventory
gap = true; //used to prevent holding of potions
throw_x = 0; //used for throwing potions
throw_y = 0;

fireBreath = 0; //used to count amount of firebreath left

globalvar inDialogue; //allows for cutscenes and dialogue
inDialogue = false; 
globalvar inInventory; //allows for inventory
inInventory = false;
globalvar inQuest; //allows for quests
inQuest = false;
globalvar brewing; //allows for brewing
brewing = false;

globalvar playerName;
playerName = "rawr xd"; //will change how is set later
globalvar maxPotions; //maximum number of each potion type you can have on quests
maxPotions = 3; 
globalvar defense;
defense = 1;

globalvar tabType; //used to keep only one potion tab open
tabType = -1;

inventory = array_create(9, -1); //-1 is default value
globalvar inventory; //nine slots for potions you can bring on quests
//each slot holds a sprite value, and a number value
inventory[0] = {type : spr_health_potion, vrty : 1, num : 7};
inventory[1] = {type : spr_defense_potion, vrty : 0, num : 3};
inventory[2] = {type : spr_acid_potion, vrty : 0, num : 7};
inventory[3] = {type : spr_fire_potion, vrty : 2, num : 7};

potions = array_create(50, -1); //-1 is default value
globalvar potions; //storage for all potions you have
//each slot holds a sprite value, and a number value
potions[0][0] = {type : spr_health_potion, vrty : 0, num : 8, max_v : 1};
potions[0][1] = {type : spr_health_potion, vrty : 1, num : 8};

potions[1][0] = {type : spr_defense_potion, vrty : 0, num : 3, max_v : 0};

potions[2][0] = {type : spr_regen_potion, vrty : 0, num : 2, max_v : 0};

potions[3][0] = {type : spr_fire_potion, vrty : 0, num : 1, max_v : 2};
potions[3][1] = {type : spr_fire_potion, vrty : 1, num : 2};
potions[3][2] = {type : spr_fire_potion, vrty : 2, num : 1};

potions[4][0] = {type : spr_ice_potion, vrty : 0, num : 0, max_v : 0};
potions[5][0] = {type : spr_acid_potion, vrty : 0, num : 2, max_v : 0};
potions[6][0] = {type : spr_light_potion, vrty : 0, num : 1, max_v : 0};
potions[7][0] = {type : spr_sleep_potion, vrty : 0, num : 6, max_v : 0};
potions[8][0] = {type : spr_stone_potion, vrty : 0, num : 0, max_v : 0};

items = array_create(120, -1); //-1 is default value
globalvar items; //bulk storage of all items you have
//each slot holds a sprite value and a number value
items[0] = {type : spr_door1, num : 2};
items[2] = {type : spr_door2, num : 0};
items[3] = {type : spr_door3, num : 69};
items[4] = {type : spr_door4, num : 114001};
items[7] = {type : spr_door5, num : 420};
items[8] = {type : spr_door6, num : 1500};
//store modifiers at end of array
globalvar mod_index;
mod_index = 108;
items[108] = {type : spr_door7, num : 33};
items[109] = {type : spr_door8, num : 46};

brew_slots = array_create(4, -1);
globalvar brew_slots;