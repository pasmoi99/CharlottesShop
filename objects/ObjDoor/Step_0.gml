if ! instance_exists(ObjEnemy)
{
	ScreenShake()
	if (image_angle == 0)
	{
		image_angle = 90;
		
		alarm[9] = 60;
	}
}
else
{
	if (image_angle == 90)
	{
	image_angle = 0;
	}
}
