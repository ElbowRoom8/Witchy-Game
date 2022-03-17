/// @description Sets default values
val = 0; //holds a particular index number in an array
vrty = 0; //holds the variety of the potion, as well as an index number

stored = ""; //hold which array the potion is a part of
/* In some cases, stored will hold an integer instead. If you click, and a new
object is created, that new object will store the correct number to draw here.*/

objOther = self; //used by potions in transit to find parent object

//these hold indexes, and are used to highlight the correct slot in the opposite array
highlightNum = -1;

touchingMouse = false; //holds whether or not this particular potion is held
rightClick = false; //checks if rightclick was used to pick it up
gap = false; //checks if right was released before being clicked again

//makes sure only one potion will be held at a time
globalvar mouseUsed;
mouseUsed = false; //holds if any potion is touchingMouse

//sets default snap values, used to reset potions if dropped
snapX = x;
snapY = y;

image_xscale = 4;
image_yscale = 4;