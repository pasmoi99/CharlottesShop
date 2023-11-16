if (keyboard_check_pressed(vk_escape))
{
	if GamePause
	{
		instance_activate_layer("Ennemy");
		instance_activate_layer("Instances");
		instance_activate_layer("Weapons");
		
		//instance_activate_layer("Bullet_Layer");
		//state = time_source_get_state(time_source_game);
		//if (state == time_source_state_active)
	    //{
	    //    time_source_pause(time_source_game);
	    //}
		if instance_exists(ObjBtnQuit)
		{
		instance_destroy(ObjBtnQuit);
		}
		if instance_exists(obj_controller_transition)
		{
			instance_destroy(obj_controller_transition);
		}
		GamePause = false;
	}
	else
	{
		instance_deactivate_layer("Instances");
		instance_deactivate_layer("Weapons");
		instance_deactivate_layer("Ennemy");
		view_x= camera_get_view_x(view_camera[0]);
		view_y= camera_get_view_y(view_camera[0]);
		view_w= camera_get_view_width(view_camera[0]);
		view_h= camera_get_view_height(view_camera[0]);
		if !instance_exists(ObjBtnQuit)
		{
			instance_create_layer(view_x + view_w/2, view_y + view_h*0.7, "Menus", ObjBtnQuit);
		}
		//state = time_source_get_state(time_source_game);
		//if (state == time_source_state_paused)
	    //{
	    //    time_source_resume(time_source_game);
	    //}
		if !instance_exists(obj_controller_transition)
		{
			instance_create_depth(0,0,0,obj_controller_transition);
		}
		GamePause = true;
	}
}