/// @description move the view

#region Move the view

halfViewWidth = camera_get_view_width(view_camera[0]) / 2;
halfViewHeight = camera_get_view_height(view_camera[0])/2;

cx = x + (obj_player.sprite_width / 2) - halfViewWidth;
cy = y + (obj_player.sprite_height / 2) - halfViewHeight;

cx = clamp(cx, min_view_x, max_view_x);
cy = clamp(cy, min_view_y, max_view_y);

camera_set_view_pos(view_camera[0], cx, cy);

#endregion