function script_dialogue_sprite(_speaker){
	switch(_speaker){
		case "Player" : return spr_amber_portrait;
		case "Prof. Harthemony" : return spr_harthemony_portrait;
		case "Prof. Iglet" : return spr_iglet_portrait;
		case "Chef Truffle" : return spr_truffle_portrait;
		case "Lidia" : return spr_lidia_portrait;
		case "Amber" : return spr_amber_portrait;
	}
	return false;
}