//sets directional speed and sprites
igletcounter += 1

if (igletcounter mod 400 < 100) {
	sprite_index = spr_iglet_walkleft;
	x += 1
	image_speed = 1;
}
if (igletcounter mod 400 > 100) && (igletcounter mod 400 < 200) {
	sprite_index = spr_iglet_walkup;
	y += 1
	image_speed = 1;
}
if (igletcounter mod 400 > 200) && (igletcounter mod 400 < 300) {
	sprite_index = spr_iglet_walkright;
	x -= 1
	image_speed = 1;
}
if (igletcounter mod 400 > 300) && (igletcounter mod 400 < 400) {
	sprite_index = spr_iglet_walkdown;
	y -= 1
	image_speed = 1;
}