/// @description Sets variables

#region Setup cameras clamp variables

min_view_x = 0;
min_view_y = 0;
max_view_x = room_width - camera_get_view_width(view_camera[0]);
max_view_y = room_height - camera_get_view_height(view_camera[0]);

#endregion

//audio_play_sound(snd_main_theme, 1, false);

#region Set up local variables
image_speed = 0;
depth = 50;
image_xscale = 2;
image_yscale = 2;

health = 10; //holds player health
def_timer = 0; //defense buff timer

selNum = 0; //used to pick the correct spot in inventory
gap = true; //used to prevent holding of potions
old_x = 0; //used to place player in correct spot leaving clearings
throw_x = 0; //used for throwing potions
throw_y = 0;

fireBreath = 0; //used to count amount of firebreath left
#endregion

#region Set up global status variables
globalvar inDialogue; //allows for cutscenes and dialogue
inDialogue = false; 
globalvar inInventory; //allows for inventory
inInventory = false;
globalvar inQuest; //allows for quests
inQuest = false;
globalvar backTracked;//stops player if moving backwards in quests
backTracked = false;
globalvar brewing; //allows for brewing
brewing = false;

globalvar playerName;
playerName = "rawr xd"; //will change how is set later
globalvar maxPotions; //maximum number of each potion type you can have on quests
maxPotions = 3; 
globalvar defense;
defense = 1;
#endregion

#region Set up massive potion reference array

globalvar potRef;
//form: {type/sprite, index (for potions array), modifier/sprite, vrty for that modifier}
potRef[0][0] = {type : spr_health_potion, index : 0, modifier : spr_door7, vrty : 0, t_text : "Health Potion", v_text : "idk lol hi mom"};
potRef[0][1] = {type : spr_health_potion, index : 0, modifier : spr_door8, vrty : 1, t_text : "Health Potion", v_text : "idk lol hi dad"};

potRef[1][0] = {type : spr_door1, index : 0, modifier : spr_door7, vrty : 2, t_text : "Health Potion", v_text : "idk lol hi no one"};
potRef[1][1] = {type : spr_door1, index : 0, modifier : spr_door8, vrty : 3, t_text : "Health Potion", v_text : "idk lol hi everyone"};

potRef[2][0] = {type : spr_defense_potion, index : 1, modifier : spr_door7, vrty : 0, t_text : "Defense Potion", v_text : "df +50% \n time -10s"};

potRef[3][0] = {type : spr_regen_potion, index : 2, modifier : spr_door7, vrty : 0, t_text : "Potion of Regeneration", v_text : "poopity scoop"};
potRef[3][1] = {type : spr_regen_potion, index : 2, modifier : spr_door8, vrty : 1, t_text : "Potion of Regeneration", v_text : "scoopity wooop"};

potRef[4][0] = {type : spr_fire_potion, index : 3, modifier : spr_door7, vrty : 0, t_text : "Fire Breathing Potion", v_text : "damage +25% \ndist -25% \nqty - 30%"};
potRef[4][1] = {type : spr_fire_potion, index : 3, modifier : spr_door8, vrty : 1, t_text : "Fire Breathing Potion", v_text : "damage -25% \ndist +25% \nqty - 30%"};
potRef[4][2] = {type : spr_fire_potion, index : 3, modifier : spr_door3, vrty : 2, t_text : "Fire Breathing Potion", v_text : "damage -25% \ndist -25% \nqty + 30%"};
potRef[4][3] = {type : spr_fire_potion, index : 3, modifier : spr_door4, vrty : 3, t_text : "Fire Breathing Potion", v_text : "damage +25% \ndist +25% \nqty - 30%"};

potRef[5][0] = {type : spr_ice_potion, index : 4, modifier : spr_door7, vrty : 0, t_text : "Ice Potion", v_text : "does the ice, idk"};

potRef[6][0] = {type : spr_acid_potion, index : 5, modifier : spr_door7, vrty : 0, t_text : "Acid Potion", v_text : "it's a trip bro"};

potRef[7][0] = {type : spr_light_potion, index : 6, modifier : spr_door7, vrty : 0, t_text : "Potion of Light", v_text : "AAAAAAAAA my eyes"};

potRef[8][0] = {type : spr_sleep_potion, index : 7, modifier : spr_door7, vrty : 0, t_text : "Potion of Slumber", v_text : "ssssssshhh sleep now"};

potRef[9][0] = {type : spr_stone_potion, index : 9, modifier : spr_door7, vrty : 0, t_text : "Stone Potion", v_text : "gets you rock hard lol"};

#endregion

#region Set up inventory
globalvar tabType; //used to keep only one potion tab open
tabType = -1;

inventory = array_create(9, -1); //-1 is default value
globalvar inventory; //nine slots for potions you can bring on quests
//form: {sprite/type of potion, variety of potion, quantity}
inventory[0] = {type : spr_health_potion, vrty : 1, num : 7, t_text : "Health Potion", v_text : "idk lol hi dad"};
inventory[1] = {type : spr_defense_potion, vrty : 0, num : 3, t_text : "Defense Potion", v_text : "df +50% \ntime -10s"};
inventory[2] = {type : spr_acid_potion, vrty : 0, num : 7, t_text : "Acid Potion", v_text : "it's a trip bro"};
inventory[3] = {type : spr_fire_potion, vrty : 1, num : 7, t_text : "Fire Breathing Potion", v_text : "damage +25% \ndist -25% \nqty - 30%"};

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
potions[0][0] = {type : spr_health_potion, vrty : 0, num : 8, t_text : "Health Potion", v_text : "idk lol hi mom"};
potions[0][1] = {type : spr_health_potion, vrty : 1, num : 8, t_text : "Health Potion", v_text : "idk lol hi dad"};

potions[1][0] = {type : spr_defense_potion, vrty : 0, num : 3, t_text : "Defense Potion", v_text : "df +50% \ntime -10s"};

potions[2][0] = {type : spr_regen_potion, vrty : 0, num : 2, t_text : "Potion of Regeneration", v_text : "poopity scoop"};

//potions[3][0] = {type : spr_fire_potion, vrty : 0, num : 1};
potions[3][1] = {type : spr_fire_potion, vrty : 1, num : 2, t_text : "Fire Breathing Potion", v_text : "damage +25% \ndist -25% \nqty - 30%"};
potions[3][3] = {type : spr_fire_potion, vrty : 3, num : 1, t_text : "Fire Breathing Potion", v_text : "damage -25% \ndist +25% \nqty - 30%"};

potions[4][0] = {type : spr_ice_potion, vrty : 0, num : 0, t_text : "Ice Potion", v_text : "does the ice, idk"};
potions[5][0] = {type : spr_acid_potion, vrty : 0, num : 2, t_text : "Acid Potion", v_text : "it's a trip bro"};
potions[6][0] = {type : spr_light_potion, vrty : 0, num : 1, t_text : "Potion of Light", v_text : "AAAAAAAAA my eyes"};
potions[7][0] = {type : spr_sleep_potion, vrty : 0, num : 6, t_text : "Potion of Slumber", v_text : "ssssssshhh sleep now"};
potions[9][0] = {type : spr_stone_potion, vrty : 0, num : 0, t_text : "Stone Potion", v_text : "gets you rock hard lol"};

#endregion

#region Set up items

items = array_create(120, -1); //-1 is default value
globalvar items; //bulk storage of all items you have
//form: {type of item / sprite, quantity}
items[0] = {type : spr_door1, num : 50};
items[2] = {type : spr_door2, num : 0};
items[3] = {type : spr_door3, num : 69};
items[4] = {type : spr_door4, num : 114001};
items[7] = {type : spr_door5, num : 420};
items[8] = {type : spr_door6, num : 1500};
//store modifiers at end of array
globalvar mod_index;
mod_index = 108;//gives start of modifiers
items[108] = {type : spr_door7, num : 33};
items[109] = {type : spr_door8, num : 46};

brew_slots = array_create(4, -1);
globalvar brew_slots;

#endregion

#region Set up recipes

globalvar recipes;
//form: {ingredient 1, 2, 3, sprite/type of potion}
recipes[0] = {ing1 : spr_door1, ing2 : spr_door3, ing3 : spr_door4, res : spr_health_potion};
recipes[1] = {ing1 : spr_door5, ing2 : spr_door1, ing3 : spr_door6, res : spr_fire_potion};
recipes[2] = {ing1 : spr_door1, ing2 : spr_door6, ing3 : spr_door4, res : spr_regen_potion};



#endregion

#region Set up dialogue ds_grid
//loads csv file
global.dialogue = load_csv("fairwick_dialogue.csv");
//checks if load was successful
if(!ds_exists(global.dialogue, ds_type_grid)){
	show_error("Error: Failed to load dialogue file", true);
}
#endregion
