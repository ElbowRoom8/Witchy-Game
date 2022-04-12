function script_dialogue_sprite(_speaker){
	switch(_speaker){
		case "Player" : return spr_amber_portrait;
		case "Prof. Harthemony" : return spr_harthemony_portrait;
		case "Prof. Iglet" : return spr_iglet_portrait;
	}
	return false;
}