/// @description Goes to next dialogue line
if(interaction){
	//checks if line is done printing
	if (j = string_length(text) + 1){
		i++; //advances to next line
		//checks if past array length
		if (i < array_length(dialogue)){
			text = dialogue[i];
			letter = "";
			j = 1;
			alarm[0] = 3;
		} else {
		//ends interaction
			canMove = true;
			alarm[1] = 3 // this delay fixes an issue of looping dialogue
		}
	}
}