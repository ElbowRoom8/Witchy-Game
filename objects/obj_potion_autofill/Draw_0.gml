/// @description Draws numbers
draw_self();
draw_set_font(fnt_2);

var i = potions[val][vrty].num

//displays numbers over 1k
if(i > 999){
	var count = 0;
	var n = floor(i/1000)
    while(n > 0){
        n = floor(n / 10);
        count++;
    }
	if(i > 99999){
		draw_text(x + 2, y + 19, string_format(i / 1000, 3, 0) + "k");
	} else {
		draw_text(x + 2, y + 19, string_format(i / 1000, count, !!(floor(i / 100) % 10)) + "k");
	}

// only draw if greater than 1
} else if (i > 1) {
	draw_text(x + 2, y + 19, i);
}