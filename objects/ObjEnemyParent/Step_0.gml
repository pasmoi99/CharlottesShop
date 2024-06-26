if state != states.DEAD
{
	switch(state)
	{
		case states.IDLE:
			CalcEntityMovement();
			CheckForPlayer();
			move_spd = 0;
			is_awake = true;
			if path_index != -1
				state = states.AWAKE;
			EnenmyAnim();
		break;
		case states.AWAKE:
			CheckForPlayer();
		break;
		case states.MOVE:
			CalcEntityMovement();
			CheckForPlayer();
			CheckFacing();
			/*if path_index == -1
				state = states.MOVE;*/
			EnenmyAnim();
		break;
		case states.ATTACK:
			CalcEntityMovement();
			DoAttack();
			CheckFacing();
			EnenmyAnim();
		break;
		case states.KNOCKBACK:
			KbMovement();
			EnenmyAnim();
		break;
		case states.STUN :
			CalcEntityMovement();
			EnenmyAnim();
			if is_stun = false
			{
				state = states.MOVE;
			}
		break;
	}
}
else
{
	switch(state)
	{
		case states.DEAD:
			CalcEntityMovement();
			EnenmyAnim();
		break;
	}
}



if (alert == true)
{
	if ((state == states.IDLE) or (state == states.AWAKE))
	{
		move_spd = 18;
		state = states.MOVE;
	}
}

if (state == states.STUN)
{
	instance_create_depth(self.x, self.y, depth-10, ObjStun);
}
else
{
	if instance_exists(ObjStun)
	{
		instance_destroy(ObjStun);
	}
}
