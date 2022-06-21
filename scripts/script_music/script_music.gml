//controls which music plays where
function script_music(){
	switch room{
		case rm_laboratory : 
			audio_stop_sync_group(global.school);
			audio_group_stop_all(Music);
			audio_play_sound(snd_jazz, 1, true);
			audio_sound_gain(snd_jazz, 0, 0);
			audio_sound_gain(snd_jazz, 1, 3000);
			break;
		case rm_player_room : 
			audio_stop_sync_group(global.school);
			audio_group_stop_all(Music);
			audio_play_sound(snd_room_theme, 1, true);
			audio_sound_gain(snd_room_theme, 0, 0);
			audio_sound_gain(snd_room_theme, 1, 3000);
			break;
		case rm_forest : 
			if(!audio_is_playing(snd_forest_theme)){
				audio_stop_sync_group(global.school);
				audio_group_stop_all(Music);
				audio_play_sound(snd_forest_theme, 1, true);
				audio_sound_gain(snd_forest_theme, 0, 0);
				audio_sound_gain(snd_forest_theme, 1, 3000);
			}
			break;
		case rm_forest_clearing :
			break;
		default : 
			if(!audio_sync_group_is_playing(global.school)){
				audio_group_stop_all(Music);
				audio_sound_gain(snd_school_theme, 0, 0);
				audio_sound_gain(snd_courtyard_theme, 0, 0);
				if (room == rm_courtyard || room = rm_frontyard) {
					audio_start_sync_group(global.school);
					audio_sound_gain(snd_school_theme, 0, 3000);
					audio_sound_gain(snd_courtyard_theme, 1, 3000);
				} else {
					audio_start_sync_group(global.school);
					audio_sound_gain(snd_school_theme, 1, 3000);
					audio_sound_gain(snd_courtyard_theme, 0, 3000);
				}
			} else {
				if (room == rm_courtyard || room = rm_frontyard) {
					audio_sound_gain(snd_school_theme, 0, 3000);
					audio_sound_gain(snd_courtyard_theme, 1, 3000);
				} else if (!audio_is_playing(snd_school_theme)){
					audio_sound_gain(snd_school_theme, 1, 3000);
					audio_sound_gain(snd_courtyard_theme, 0, 3000);
				}
			}
			
	}
}