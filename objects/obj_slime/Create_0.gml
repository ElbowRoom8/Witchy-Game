/// @description 
randomize();
slimeHealth = 15;
def_scale = 1;
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
