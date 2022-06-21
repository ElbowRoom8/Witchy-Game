/// @description moves to given room
if(room = rm_westhall){
	room_goto(rm_classroom4);
	obj_player.x = 560;
	obj_player.y = 200;
} else if(room = rm_classroom4){
	room_goto(rm_westhall);
	obj_player.x = 40;
	obj_player.y = 175;
} else if(room = rm_cafeteria){
	room_goto(rm_easthall);
	obj_player.x = 30;
	obj_player.y = 190;
} else if(room = rm_easthall){
	room_goto(rm_cafeteria);
	obj_player.x = 753;
	obj_player.y = 355;
} else if(room = rm_mainhall){
	room_goto(rm_frontyard);
	obj_player.x = 200;
	obj_player.y = 85;
} else if(room = rm_frontyard){
	if ((story == "Beginning") & (track == "Intro")){
		obj_narrator.index = script_dialogue_scenario(obj_narrator.c_index, "Approach Great Hall");
		obj_narrator.canSpeak = true;
		obj_player.y += 15;
		track = "Meet";
	} else {
		room_goto(rm_mainhall);
		obj_player.x = 390;
		obj_player.y = 610;
	}
}
