/// @description Sets default values
val = 0; //holds a particular index number in an array
qty = 0; //holds the amount of the item

stored = ""; //hold which array the item is a part of
grabNum = 1;

objOther = self; //used by items in transit to find parent object

//these hold indexes, and are used to highlight the correct slot in the opposite array
highlightNum = -1;

touchingMouse = false; //holds whether or not this particular item is held
rightClick = false; //checks if rightclick was used to pick it up
gap = false; //checks if right was released before being clicked again

//makes sure only one item will be held at a time
globalvar mouseUsed;
mouseUsed = false; //holds if any item is touchingMouse

//sets default snap values, used to reset items if dropped
snapX = x;
snapY = y;

image_xscale = 4;
image_yscale = 4;