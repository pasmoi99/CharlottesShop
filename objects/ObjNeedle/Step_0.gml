/// @description Insert description here
// You can write your code in this editor


//image_angle = ObjPlayer.image_angle;
//if(point_distance(ObjPlayer.x,ObjPlayer.y,mouse_x,mouse_y)>point_distance(ObjPlayer.x,ObjPlayer.y,sprite_width/2,sprite_height/2))
//{

//}



if controller_obj.portNum == 29
{
	image_angle = point_direction(x, y, mouse_x, mouse_y); //permet de pointer l'aiguille vers la souris
	ang=point_direction(ObjPlayer.x, ObjPlayer.y, mouse_x, mouse_y)*-1; //donne l'angle en ° que l'aiguille doit indiquer

	dify=(sprite_height/2)*dsin(ang);
	difx=(sprite_width/2)*dcos(ang);
	x=ObjPlayer.x+difx;
	y=ObjPlayer.y+dify;
	
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
			PlayerAttack()
		}
	}
	else 
		instance_destroy(self)
}

/*dify=(sprite_height/2)*dsin(ang);

difx=(sprite_width/2)*dcos(ang);

x=ObjPlayer.x+difx;

y=ObjPlayer.y+dify;*/
