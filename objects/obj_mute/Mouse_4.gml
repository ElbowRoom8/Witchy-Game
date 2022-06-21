/// @description mute/unmute music
obj_player.mute = !obj_player.mute;
if(obj_player.mute){
	sprite_index = spr_block_purple;
	audio_group_set_gain(Music, 0, 0);
	audio_group_stop_all(Music);
	audio_stop_sync_group(global.school);
} else {
	sprite_index = spr_block_orange;
	script_music();
}
