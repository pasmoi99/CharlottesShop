function CalcEntityMovement()
{
	// moves enemy and apply drag
	
	// apply movement
	x += hsp;
	y += vsp;
	
	//slowdown
	hsp *= global.drag;
	vsp *= global.drag;
	
	CheckIfStopped();
}

function CheckIfStopped()
{
	if abs(hsp) < 0.1 hsp = 0;
	if abs(vsp) < 0.1 vsp = 0;
}


function CheckFacing()
{
	// check which way we are moving and set facing
	var _facing = -sign(x-xp);
	if _facing != 0 facing = _facing;
}

function CheckForPlayer()
{
	//check if player is close to start chasing
	var _dis = distance_to_object(ObjPlayer);
	// for gomove_towards_point(ObjPlayer.x , ObjPlayer.y , 1);

	if (state != states.AWAKE)
	{
		// alert for start chasing
		if ((_dis <= alert_dis) or (alert == true)) and _dis > attack_dis
		{
			//enemy is now alert
			alert = true


			//should we calc our path ?
			if calc_path_timer-- <= 0
			{
				//reset timer
				calc_path_timer = calc_path_delay; // lag with calc_path_delay = _time; in entity processes
			
				// can we make a path to the player ?
				if x == xp and y == yp var _type = 0 else var _type = 1;
				var _found_player = mp_grid_path(global.mp_grid, path, x, y, ObjPlayer.x , ObjPlayer.y, _type);
	
				//start path if we can reach the player
				if _found_player
				{
					path_start(path, move_spd, path_action_stop, false);
				}
			}
		}
		else
		{
			//are we close enought to attack ?
			if _dis <= attack_dis 
			{
				path_end();
				state = states.ATTACK;
			}
		}
	}
	else
	{
		if is_awake == true
		{
			is_awake = false;
			alarm[10] = 60;
		}
		if end_awake == true
		{
			state = states.MOVE;
			move_spd = 18;
		}
	}
}

function EnenmyAnim()
{
	switch(state)
	{
		case states.IDLE:
			SwitchSpine("sleep");
			ShowHurt();
		break;
		case states.AWAKE:
			SwitchSpine("awakening");
		break;
		case states.MOVE:
			SwitchSpine("walk");
			ShowHurt();
		break;
		case states.ATTACK:
			SwitchSpine("attack");
		break;
		case states.KNOCKBACK:
			ShowHurt();
		break;
		case states.DEAD:
			SwitchSpine("death");
		break; 
		case states.STUN:
			SwitchSpine("idle");
		break; 
	}
	//set depth
	depth = -bbox_bottom;
	//update previous position
	xp = x;
	yp = y;
}

function SwitchSpine(spine)
{
	if (skeleton_animation_get() != spine)
	{
		skeleton_animation_set(spine);
	}
}

function ShowHurt()
{
	if knockback_time-- > 0 
		SwitchSpine("idle");
}


function KbMovement()
{
	//moves enemy and applies drag during knockback
	
	//apply movement
	x += hsp;
	y += vsp;
	
	//slow
	hsp *= 0.91;
	vsp *= 0.91;
	
	CheckIfStopped();
	
	//leave state
	if (knockback_time <= 0)
		{
			state = states.MOVE;
		}
}


function DoAttack()
{
	// attack player if he is in range, cooldown reset and good attack frame
	
	if (image_index >= attack_frame) and (can_attack == true)
	{
		//reset cooldown
		can_attack = false;
		alarm[1] = attack_cd;
		
		//attack direction
		var _dir = point_direction(x, y, ObjPlayer.x, ObjPlayer.y);
		
		// attack position
		var _xx = x + lengthdir_x(attack_dis+86.5, _dir); //86.5 and 124 = 1/2 SprPlayer x and y
		var _yy = y + lengthdir_y(attack_dis+124, _dir);
		
		// create hitbox and pass our variables to the hitbox
		// create other values of parents values
		var _inst = instance_create_layer(_xx, _yy, "Instances", ObjEnemyAttackHitbox);
		_inst.owner_id = id;
		_inst.damage = damage;
		_inst.knockback_time = knockback_time;
	}
}


function GetStun()
{
	state = states.STUN;
	can_attack = false;
	is_stun = true;
}