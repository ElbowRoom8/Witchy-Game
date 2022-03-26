/// @description fades empty potions

//sum potions of a variety
var sum = 0;
max_v = array_length(potions[val]);
for(var i = 0; i < max_v; i++){
	if(potions[val][i] != -1){
		sum += potions[val][i].num;
	}
}

// Fade empty potions
if(sum == 0){ //this needs to sum all potions of a type
	image_alpha = 0.35;
} else {
	image_alpha = 1;
}