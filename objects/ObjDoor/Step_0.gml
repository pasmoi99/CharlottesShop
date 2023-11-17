if ! instance_exists(ObjEnemy)
{
	if (can_turn == true)
	{
		can_turn = false;
		ScreenShake()
		image_angle += 90;
		alarm[9] = 60;
	}
}
