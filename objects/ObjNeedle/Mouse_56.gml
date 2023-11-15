/// @description 
//if (ObjPlayer.first_click>0)
//{
//	ObjPlayer.first_click--;
//}

//else
//{
	instance_create_layer(x,y,"Weapons",ObjNeedleThrown);
	ObjNeedleThrown.image_angle=image_angle;

	ObjPlayer.walk_spd = 0;

	instance_destroy();
//}