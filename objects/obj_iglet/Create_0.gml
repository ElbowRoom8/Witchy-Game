/// @description Stores all dialogues
igletcounter = 0
image_speed = 0;
image_xscale = 2;
image_yscale = 2;
depth = room_height - (y + image_yscale * sprite_height / 2);
interaction = false;

//dialgue variables
index = -1; //used to reference correct area of dialogue grid
c_index = -1; //used to save start of character area in dialogue
speaker = sprite_index;
i = 0;

escape = false; //used to hold if the next character is a command
shaky = false; //used to track shaky text
color = c_dkgrey; //used to change color
choosing = false; //used to check if player is making a decision

spoken = false;// temp testing variable

newObj = instance_create_depth(x + 4, y + sprite_height/2 + 16, 75, obj_wall);
newObj.image_xscale = 3;
newObj.image_yscale = 2;
