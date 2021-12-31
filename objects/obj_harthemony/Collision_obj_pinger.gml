/// Begins interaction
if(!interaction){
	interaction = true;
	canMove = false;
	i = 0; //dialogue line counter
	dialogue = d_intro; //only line that needs to change to switc hout a dialogue
	text = dialogue[0];
	letter = "";
	j = 1; //line letter counter
	alarm[0] = 3; //loops each letter
}
