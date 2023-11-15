/// @description Insert description here
// You can write your code in this editor




if (controller_obj.portNum != 29)
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
	if (controller_obj.shoulderlb == true)
	{
		image_angle = point_direction(0, 0, controller_obj.hcursor, controller_obj.vcursor);
		ang=point_direction(0, 0, controller_obj.hcursor, controller_obj.vcursor)*-1;
		
		dify=(sprite_height/2)*dsin(ang);
		difx=(sprite_width/2)*dcos(ang);
		x=ObjPlayer.x+difx;
		y=ObjPlayer.y+dify;

		instance_create_depth(x + difx*2 , y + dify*2 ,depth, ObjArc);
	}
}