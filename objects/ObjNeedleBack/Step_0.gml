/// @description Insert description here

x_spd = lengthdir_x(throw_speed,image_angle);
y_spd = lengthdir_y(throw_speed,image_angle);
//
//x=x_spd;
//y=y_spd;
//for(i=0;i<range;i++)
//{

if (distance_to_point(xstart,ystart)<=range){
	x-=x_spd;
	y-=y_spd;
	
}



else 
{
	ObjPlayer.walk_spd = ObjPlayer.MAX_WALK_SPEED;
	
	instance_destroy();
}