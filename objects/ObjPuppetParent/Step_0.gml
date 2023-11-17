
/*
if state != states.DEAD
{
	switch(state)
	{
		case states.IDLE:
			CalcEntityMovement();
			CheckForPlayer();
			if path_index != -1 
				state = states.MOVE;
			EnenmyAnim();
		break;
		case states.MOVE:
			CalcEntityMovement();
			CheckForPlayer();
			CheckFacing();
			/*if path_index == -1
				state = states.MOVE;*/
/*			EnenmyAnim();
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
				state = states.IDLE;
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