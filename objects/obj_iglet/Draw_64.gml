/// @description Outputs dialogues
// checks if in an interaction before printing
if(interaction){
	draw_sprite(spr_textbox, 0, 0, 440);
	
	//gets portrait sprite of speaker
	name = ds_grid_get(global.dialogue, 2, i + index);
	speaker = script_dialogue_sprite(name);
	if (speaker) {
		draw_sprite_ext(speaker, 0, 20, 470, 5, 5, 0, c_white, 1);
	}
	//write name of character
	var str_width = string_width(name);
	draw_set_font(fnt_1);
	draw_set_halign(fa_center);
	if(str_width > 190){
		draw_set_font(fnt_3);
		draw_text_ext(100, 649, name, -1, 180);
	} else {
		draw_text(100, 655, name);
	}
	
	draw_set_font(fnt_1);
	draw_set_halign(fa_left);
	draw_text_ext(215, 456, letter, -1, 1030);
}