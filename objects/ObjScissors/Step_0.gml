if controller_obj.portNum == 29
{
	/*image_angle = point_direction(x, y, mouse_x, mouse_y); //permet de pointer l'aiguille vers la souris
	ang=point_direction(ObjPlayer.x, ObjPlayer.y, mouse_x, mouse_y)*-1; //donne l'angle en ° que l'aiguille doit indiquer

	dify=(sprite_height/2)*dsin(ang);
	difx=(sprite_width/2)*dcos(ang);
	x=ObjPlayer.x+difx;
	y=ObjPlayer.y+dify;*/
	var aim_dir = point_direction(ObjPlayer.x, ObjPlayer.y, mouse_x, mouse_y); //permet de pointer l'aiguille vers la souris
	image_angle = aim_dir;

	/*dify=(sprite_height/2)*dsin(ang);
	difx=(sprite_width/2)*dcos(ang);*/
	difx = lengthdir_x(scissor_dist, aim_dir);
	dify = lengthdir_y(scissor_dist, aim_dir);
	x = ObjPlayer.x+ difx;
	y = ObjPlayer.y+ dify;
	
}
else
{
	// CURSOR INPUT
	// Right axis
	/*hcursor = gamepad_axis_value(controller_obj.portNum, gp_axisrh);
	vcursor = gamepad_axis_value(controller_obj.portNum, gp_axisrv);
	
	// CURSOR OUTPUT
	if abs(hcursor) < .2
		hcursor = 0;
	if abs(vcursor) < .2
		vcursor = 0; */
	
	if (controller_obj.hcursor != 0) || (controller_obj.vcursor != 0)
	{
		image_angle = point_direction(0, 0, controller_obj.hcursor, controller_obj.vcursor);
		ang=point_direction(0, 0, controller_obj.hcursor, controller_obj.vcursor)*-1;
		
		dify=(sprite_height/2)*dsin(ang);
		difx=(sprite_width/2)*dcos(ang);
		x=ObjPlayer.x+difx;
		y=ObjPlayer.y+dify;
			
		if (controller_obj.shoulderrb == true)
		{
			if (ObjPlayer.can_scissor == true)
			{
				instance_create_depth(x + difx*2 , y + dify*2 ,depth, ObjArc);
				ObjPlayer.can_scissor = false;
				ObjPlayer.alarm[11] = ObjPlayer.scissor_cd;
			}
		}
	}
	else 
		instance_destroy(self)
}