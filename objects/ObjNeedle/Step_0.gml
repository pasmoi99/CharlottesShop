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
}
else
{
	//if (haxis != 0) || (vaxis != 0)
	image_angle = point_direction(x, y, controller_obj.haxis, controller_obj.vaxis);
	ang=point_direction(controller_obj.x, controller_obj.y, controller_obj.haxis, controller_obj.vaxis)*-1;

// CURSOR OUTPUT
/*if abs(hcursor) < .2
	hcursor = 0;
if abs(vcursor) < .2
	vcursor = 0;
	
if (hcursor != 0) || (vcursor != 0)
	angleCursor = point_direction(0, 0, hcursor, vcursor);*/


}

dify=(sprite_height/2)*dsin(ang);

difx=(sprite_width/2)*dcos(ang);

x=ObjPlayer.x+difx;

y=ObjPlayer.y+dify;
