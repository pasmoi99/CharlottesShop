function ScreenShake()
{
	is_screen_shaking = true;
	alarm[10] = 60;
	if(is_screen_shaking == true) and (is_open = false)
	{
		var _range = 3;
		camera_set_view_pos(view_camera[0], view_x + random_range(-_range, _range), view_y + random_range(-_range, _range));
	}
	if (is_open == true) and (is_screen_shaking = false)
	{
		camera_set_view_pos(view_camera[0], view_x, view_y);
	}
}