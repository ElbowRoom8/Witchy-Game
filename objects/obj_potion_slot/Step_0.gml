/// @description fades empty potions

//sum potions of a variety
var sum = 0;
var max_v = potions[val][0].vrty
for(var i = 0; i <= max_v; i++){
	sum += potions[val][i].num;
}

// Fade empty potions
if(sum == 0){ //this needs to sum all potions of a type
	image_alpha = 0.35;
} else {
	image_alpha = 1;
}