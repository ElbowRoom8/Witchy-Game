/// @description Sets variables
#region Setup cameras clamp variables

min_view_x = 0;
min_view_y = 0;
max_view_x = room_width - camera_get_view_width(view_camera[0]);
max_view_y = room_height - camera_get_view_height(view_camera[0]);

//for draw_GUI
//grab the width and height of view
var cw = camera_get_view_width(view_camera);
var ch = camera_get_view_height(view_camera);
//set some variables to hold the value and div that by width and height
display_scalex = display_get_gui_width() / cw;
display_scaley = display_get_gui_height() / ch;

#endregion

audio_group_load(Music);
school = audio_create_sync_group(true);
audio_stop_sync_group(school);
alarm[0] = 30;

#region Set up local variables
image_speed = 0;
depth = 50;
image_xscale = 2;
image_yscale = 2;

health = 10; //holds player health
pickup = [];

selNum = 0; //used to pick the correct spot in inventory
choice = -1; //used for selction options in dialogue
chooseMax = -1;
gap = true; //used to prevent holding of potions
old_x = 0; //used to place player in correct spot leaving clearings
throw_x = 0; //used for throwing potions
throw_y = 0;

// status effects
fireBreath = 0; //used to count amount of firebreath left
def_timer = 0; //defense buff timer
slowness = false;
#endregion

#region Set up global status variables
globalvar inDialogue; //allows for cutscenes and dialogue
inDialogue = false; 
globalvar inInventory; //allows for inventory
inInventory = false;
globalvar inQuest; //allows for quests
inQuest = false;
globalvar brewing; //allows for brewing
brewing = false;

globalvar playerName;
playerName = "Rowan"; //will change how is set later //easter egg name is "rawr xd"
globalvar maxPotions; //maximum number of each potion type you can have on quests
maxPotions = 6; 
globalvar defense;
defense = 1;

globalvar backTracked;//stops player if moving backwards in quests
backTracked = false;
globalvar damaged;//allows for i-frames
damaged = false;

//story tracking variables
globalvar story;//used to track certain progresses
story = -1;
globalvar track;//used to track certain progresses
track = -1;

#endregion

#region Set up massive potion reference array

globalvar potRef;
//form: {type/sprite, index (for potions array), modifier/sprite, vrty for that modifier}
potRef[0][0] = {type : spr_health_potion, index : 0, modifier : spr_door5, vrty : 0, t_text : "Health Potion", v_text : "Heals 1 heart"};
potRef[0][1] = {type : spr_health_potion, index : 0, modifier : spr_door2, vrty : 1, t_text : "Health Potion", v_text : "Heals 1 heart"};

potRef[1][0] = {type : spr_door1, index : 0, modifier : spr_door5, vrty : 2, t_text : "Health Potion", v_text : "idk lol hi no one"};
potRef[1][1] = {type : spr_door1, index : 0, modifier : spr_door2, vrty : 3, t_text : "Health Potion", v_text : "idk lol hi everyone"};

potRef[2][0] = {type : spr_defense_potion, index : 1, modifier : spr_door5, vrty : 0, t_text : "Defense Potion", v_text : "df +50% \n time -10s"};

potRef[3][0] = {type : spr_regen_potion, index : 2, modifier : spr_door5, vrty : 0, t_text : "Potion of Regeneration", v_text : "doesn't actually \ndo anything lol"};
potRef[3][1] = {type : spr_regen_potion, index : 2, modifier : spr_door2, vrty : 1, t_text : "Potion of Regeneration", v_text : "still not \nimplemented"};

potRef[4][0] = {type : spr_fire_potion, index : 3, modifier : spr_door5, vrty : 0, t_text : "Fire Breathing Potion", v_text : "damage +25% \ndist -25% \nqty - 30%"};
potRef[4][1] = {type : spr_fire_potion, index : 3, modifier : spr_door2, vrty : 1, t_text : "Fire Breathing Potion", v_text : "damage -25% \ndist +25% \nqty - 30%"};
potRef[4][2] = {type : spr_fire_potion, index : 3, modifier : spr_door3, vrty : 2, t_text : "Fire Breathing Potion", v_text : "damage -25% \ndist -25% \nqty + 30%"};
potRef[4][3] = {type : spr_fire_potion, index : 3, modifier : spr_door4, vrty : 3, t_text : "Fire Breathing Potion", v_text : "damage +25% \ndist +25% \nqty - 30%"};

potRef[5][0] = {type : spr_ice_potion, index : 4, modifier : spr_door5, vrty : 0, t_text : "Ice Potion", v_text : "does the ice, \nidk"};

potRef[6][0] = {type : spr_acid_potion, index : 5, modifier : spr_door5, vrty : 0, t_text : "Poison Potion", v_text : "Creates a cloud \nof noxious gas"};

potRef[7][0] = {type : spr_light_potion, index : 6, modifier : spr_door5, vrty : 0, t_text : "Potion of Light", v_text : "AAAAAAAAA my eyes"};

potRef[8][0] = {type : spr_sleep_potion, index : 7, modifier : spr_door5, vrty : 0, t_text : "Potion of Slumber", v_text : "ssssssshhh \nsleep now"};

potRef[9][0] = {type : spr_stone_potion, index : 9, modifier : spr_door5, vrty : 0, t_text : "Stone Potion", v_text : "gets you rock \nhard lol"};

#endregion

#region Set up inventory
globalvar tabType; //used to keep only one potion tab open
tabType = -1;

inventory = array_create(9, -1); //-1 is default value
globalvar inventory; //nine slots for potions you can bring on quests
//form: {sprite/type of potion, variety of potion, quantity}
inventory[0] = {type : spr_health_potion, vrty : 1, num : 7, t_text : "Health Potion", v_text : "Heals 1 heart"};
inventory[1] = {type : spr_defense_potion, vrty : 0, num : 3, t_text : "Defense Potion", v_text : "df +50% \ntime -10s"};
inventory[2] = {type : spr_acid_potion, vrty : 0, num : 7, t_text : "Poison Potion", v_text : "Creates a cloud \nof noxious gas"};
inventory[3] = {type : spr_fire_potion, vrty : 1, num : 15, t_text : "Fire Breathing Potion", v_text : "damage -25% \ndist +25% \nqty - 30%"};

potions = array_create(50, -1); //-1 is default value
globalvar potions; //storage for all potions you have

var ind = 0; //keeps track of potions index
var len = 0; //used to add multiple lengths in potRef
for(var i = 0; i < array_length(potRef); i++){
	if(ind == potRef[i][0].index){
		len += array_length(potRef[i]);
	} else {
		potions[ind] = array_create(len, -1);
		ind = potRef[i][0].index;
		len = array_length(potRef[i]);
	}
}

//form: {sprite/type of potion, variety of potion, quantity}
potions[0][0] = {type : spr_health_potion, vrty : 0, num : 8, t_text : "Health Potion", v_text : "Heals 1 heart"};
potions[0][1] = {type : spr_health_potion, vrty : 1, num : 8, t_text : "Health Potion", v_text : "Heals 1 heart"};

potions[1][0] = {type : spr_defense_potion, vrty : 0, num : 3, t_text : "Defense Potion", v_text : "df +50% \ntime -10s"};

potions[2][0] = {type : spr_regen_potion, vrty : 0, num : 2, t_text : "Potion of Regeneration", v_text : "doesn't actually\n do anything lol"};

//potions[3][0] = {type : spr_fire_potion, vrty : 0, num : 1};
potions[3][1] = {type : spr_fire_potion, vrty : 1, num : 2, t_text : "Fire Breathing Potion", v_text : "damage -25% \ndist +25% \nqty - 30%"};
potions[3][3] = {type : spr_fire_potion, vrty : 3, num : 1, t_text : "Fire Breathing Potion", v_text : "damage -25% \ndist +25% \nqty - 30%"};

potions[4][0] = {type : spr_ice_potion, vrty : 0, num : 0, t_text : "Ice Potion", v_text : "still not \nimplemented"};
potions[5][0] = {type : spr_acid_potion, vrty : 0, num : 2, t_text : "Poison Potion", v_text : "Creates a cloud \nof noxious gas"};
potions[6][0] = {type : spr_light_potion, vrty : 0, num : 1, t_text : "Potion of Light", v_text : "AAAAAAAAA my \neyes"};
potions[7][0] = {type : spr_sleep_potion, vrty : 0, num : 6, t_text : "Potion of Slumber", v_text : "ssssssshhh sleep \nnow"};
potions[9][0] = {type : spr_stone_potion, vrty : 0, num : 0, t_text : "Stone Potion", v_text : "gets you rock \nhard lol"};

#endregion

#region Set up massive item reference array
globalvar itemRef;
itemRef = array_create(109, {type : -1, t_text : -1, v_text : -1});
//form: {type, name, tooltip}
itemRef[0] = {type : spr_item_slime, t_text : "Slime Slime", v_text : "Implies the existence of other types of slime"};
itemRef[1] = {type : spr_oil, t_text : "Olive Oil", v_text : "OOOOOLLIIIIIIVVVVVVEEE OOOOOOIIIIIILLLLLLLLL!!!!!!!"};
itemRef[2] = {type : spr_item_silk, t_text : "Spider Silk", v_text : "Has bugs stuck in it"};
itemRef[3] = {type : spr_item_spider_teeth, t_text : "Spider Tooth", v_text : "Feels sharp"};
itemRef[4] = {type : spr_door1, t_text : "Red Mushroom", v_text : "You kind of want to lick it"};
itemRef[5] = {type : spr_wall, t_text : "Yellow Mushroom", v_text : "Used to relieve fever"};
itemRef[7] = {type : spr_item_wolf_pelt, t_text : "Wolf Pelt", v_text : "Surprisingly soft"};
itemRef[8] = {type : spr_item_wolf_claw, t_text : "Wolf Claw", v_text : "Infused with the thrill of the hunt"};
itemRef[108] = {type : spr_door5, t_text : "Purple Mushroom", v_text : "Amplifies damage"};
itemRef[109] = {type : spr_door2, t_text : "Tallowroot", v_text : "Feels greasy"};
#endregion

#region Set up items

items = array_create(120, -1); //-1 is default value
globalvar items; //bulk storage of all items you have
//form: {type of item / sprite, quantity}
items[0] = {type : spr_item_slime, num : 50};
items[2] = {type : spr_item_silk, num : 0};
items[3] = {type : spr_item_spider_teeth, num : 69};
items[4] = {type : spr_door1, num : 2};
items[7] = {type : spr_item_wolf_pelt, num : 420};
items[8] = {type : spr_item_wolf_claw, num : 1500};
//store modifiers at end of array
globalvar mod_index;
mod_index = 108;//gives start of modifiers
items[108] = {type : spr_door5, num : 10};
items[109] = {type : spr_door2, num : 46};

brew_slots = array_create(4, -1);
globalvar brew_slots;

#endregion

#region Set up recipes

globalvar recipes;
//form: {ingredient 1, 2, 3, sprite/type of potion}
recipes[0] = {ing1 : spr_item_slime, ing2 : spr_door1, ing3 : spr_item_spider_teeth, res : spr_health_potion};
recipes[1] = {ing1 : spr_wall, ing2 : spr_item_slime, ing3 : spr_item_wolf_claw, res : spr_fire_potion};
recipes[2] = {ing1 : spr_door1, ing2 : spr_item_wolf_pelt, ing3 : spr_item_spider_teeth, res : spr_defense_potion};
recipes[3] = {ing1 : spr_wall, ing2 : spr_door1, ing3 : spr_item_wolf_claw, res : spr_acid_potion};
#endregion

#region Set up dialogue ds_grid
//loads csv file
global.dialogue = load_csv("fairwick_dialogue.csv");
//checks if load was successful
if(!ds_exists(global.dialogue, ds_type_grid)){
	show_error("Error: Failed to load dialogue file", true);
}
#endregion

#region For spawning objects
instance_create_depth(x, y, depth, obj_floofy);
#endregion
