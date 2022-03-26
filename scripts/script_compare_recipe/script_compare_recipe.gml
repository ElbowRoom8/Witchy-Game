// compares 3 given ingredients to array of given recipes
function compare_recipe(_ingA, _ingB, _ingC){
	for (var i = 0; i < array_length(recipes); i++){
		if(permutate(_ingA, _ingB, _ingC, recipes[i].ing1, recipes[i].ing2, recipes[i].ing3)){
			return recipes[i].res;
		}
	}
	return -1;
}

//swaps around ingredients to ignore ordering
function permutate(_ingA, _ingB, _ingC, _ing1, _ing2, _ing3){
	if (_ingA == _ing1 && _ingB == _ing2 && _ingC == _ing3){
		return true;
	}
	if (_ingA == _ing1 && _ingB == _ing3 && _ingC == _ing2){
		return true;
	}
	if (_ingA == _ing2 && _ingB == _ing1 && _ingC == _ing3){
		return true;
	}
	if (_ingA == _ing2 && _ingB == _ing3 && _ingC == _ing1){
		return true;
	}
	if (_ingA == _ing3 && _ingB == _ing1 && _ingC == _ing2){
		return true;
	}
	if (_ingA == _ing3 && _ingB == _ing2 && _ingC == _ing1){
		return true;
	}
	return false;
}