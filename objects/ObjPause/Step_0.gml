if (keyboard_check_pressed(vk_escape))
{
	if GamePause
	{
		instance_activate_layer("Instances")
		GamePause = false
	}
	else
	{
		instance_deactivate_layer("Instances")
		GamePause = true
	}
}