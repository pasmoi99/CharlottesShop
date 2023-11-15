if (image_alpha > 1)
{
	room_goto(obj_controller_transition.room_transition)
	flip = -1
}

// transition fermeture
if (image_alpha >= 0)
{
	image_alpha += 1/(60*time_anim/2)*flip;
}
else
{
	instance_destroy()
}
