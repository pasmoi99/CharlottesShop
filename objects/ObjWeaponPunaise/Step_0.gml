/// @description Insert description here
// You can write your code in this editor
dart_x_spd = lengthdir_x(dart_throw_speed,image_angle);
dart_y_spd = lengthdir_y(dart_throw_speed,image_angle);

x+=dart_x_spd;
y+=dart_y_spd;

if(place_meeting(x,y,ObjEnemyParent) or place_meeting(x,y,ObjSolid))
{
	instance_destroy();
}