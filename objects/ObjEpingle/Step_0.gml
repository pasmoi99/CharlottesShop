if (mouse_check_button(mb_left))
{
dart_x_spd = lengthdir_x(dart_throw_speed,image_angle);
dart_y_spd = lengthdir_y(dart_throw_speed,image_angle);

x+=dart_x_spd;
y+=dart_y_spd;

if (place_meeting(x,y,ObjEnemyParent))

instance_destroy();

}