/// @description (debugging) Start playthrough
room_goto(rm_frontyard);

//reset various variables
obj_player.x = 80;
obj_player.y = 250;
obj_narrator.spoken = false;
inQuest = false;
damaged = false;
health = 10;
fireBreath = 0;
defense = 1;

//begin dialouge
story = "Beginning";
track = "Intro";
obj_narrator.canSpeak = true;
