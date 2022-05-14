/// @description 
randomize();
maxHealth = 15;
objHealth = maxHealth;
def_scale = 2;
// randomize sprite color
image_alpha = 0;
color = irandom_range(0, 2);
if (color == 0) {
	sprite_index = spr_slime_green;
} else if (color == 1) {
	sprite_index = spr_slime_brown;
} else if (color == 2) {
	sprite_index = spr_slime_pink;
}
sprRef = sprite_index;

ani_delay = true; //random jiggle
jump_delay = true; //stops constant jumping
damage_delay = true; //stops constant damage

target_x = 0; //used for jump target
target_y = 0; //used for jump target
jumping = false; //status variable

z = 0; // used for tracking 'vertical' height
zspeed = 0; //speed for jumpig up
zgravity = 0; //speed for bringing slime back down
image_speed = 0;
