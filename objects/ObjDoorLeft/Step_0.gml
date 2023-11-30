if ! instance_exists(ObjEnemy)
{
	if (can_turn == true)
	{
		can_turn = false;
		ScreenShake()
		alarm[9] = 60;
		sprite_index = SprDoorProfileLeftOpen;
	}
}
