/// @description Sets variables

#region Setup cameras clamp variables

min_view_x = 0;
min_view_y = 0;
max_view_x = room_width - camera_get_view_width(view_camera[0]);
max_view_y = room_height - camera_get_view_height(view_camera[0]);

#endregion

image_speed = 0;

globalvar canMove; //allows for cutscenes and dialogue
canMove = true; 

globalvar playerName;
playerName = "ur mom"; //will change how is set later