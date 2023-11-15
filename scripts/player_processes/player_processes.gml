function reset_variables()
{
	left = 0;
	right = 0;
	up = 0;
	down = 0;
	dash = false;
}


function get_input() 
{
	if keyboard_check(ord("Q")) left = 1;
	if (gamepad_button_check(0, gp_padd) and gamepad_axis_value(0, gp_axislv) > 0.8)
		left = 1;
	if keyboard_check(ord("D"))
		right = 1;
	if keyboard_check(ord("Z"))
		up = 1;
	if keyboard_check(ord("S"))
		down = 1;
	
	if keyboard_check_pressed(vk_space)
		dash = true;
}

function calc_movement()
{
	var _hmove = right - left;
	var _vmove = down - up;
	var _facing = -sign(_hmove);
	if _facing != 0 
	{
		facing = _facing;
	}
	if (_hmove != 0 or _vmove != 0)
	{
		//get direction we are moving
		var _dir = point_direction(0, 0, _hmove, _vmove);
		
		//get distance we are moving
		_hmove = lengthdir_x(walk_spd, _dir);
		_vmove = lengthdir_y(walk_spd, _dir);
		
		//add movement to players position
		x += _hmove;
		y += _vmove;
		
		state = states.MOVE;
	}
	if ((_hmove == 0) and ( _vmove == 0))
	{
		state = states.IDLE;
	}
}



function collision()
{
	//set target values
	var _tx = x;
	var _ty = y;
	
	//move back to last step position, out of the collision
	x = xprevious;
	y = yprevious;
	
	//get max distance we want to move
	var _disx = ceil(abs(_tx - x));
	var _disy = ceil(abs(_ty - y));
	
	// ensure we are using integers if we are colliding in the x/y axis
	if (place_meeting(x + _disx * sign(_tx - x), y, ObjSolid))
	{
		x = round(x);
	}
	if (place_meeting(x, y + _disy * sign(_ty - y), ObjSolid))
	{
		y = round(y);
	}
	
	//move as far as in x and y before hitting the solid
	repeat(_disx)
	{
		if (!place_meeting(x + sign(_tx - x), y, ObjSolid)) 
		{
			x += sign(_tx - x);
		}
	}
		repeat(_disy)
	{
		if (!place_meeting(x, y + sign(_ty - y), ObjSolid)) 
		{
			y += sign(_ty - y);
		}
	}
}


function CollisionDoor()
{
	//set target values
	var _tx = x;
	var _ty = y;
	
	//move back to last step position, out of the collision
	x = xprevious;
	y = yprevious;
	
	//get max distance we want to move
	var _disx = ceil(abs(_tx - x));
	var _disy = ceil(abs(_ty - y));
	
	// ensure we are using integers if we are colliding in the x/y axis
	if (place_meeting(x + _disx * sign(_tx - x), y, ObjDoor))
	{
		x = round(x);
	}
	if (place_meeting(x, y + _disy * sign(_ty - y), ObjDoor))
	{
		y = round(y);
	}
	
	//move as far as in x and y before hitting the solid
	repeat(_disx)
	{
		if (!place_meeting(x + sign(_tx - x), y, ObjDoor)) 
		{
			x += sign(_tx - x);
		}
	}
		repeat(_disy)
	{
		if (!place_meeting(x, y + sign(_ty - y), ObjDoor)) 
		{
			y += sign(_ty - y);
		}
	}
}



function check_dash()
{
	var _hmove = right - left;
	var _vmove = down - up;
	var _facing = -sign(_hmove);
	if _facing != 0 
	{
		facing = _facing;
	}
	if (dash==true) and (can_dash==true)
	{
		state = states.DASH;
		dash_timer = dash_timer_initial;
		// get moving direction and distance
		var _dir = point_direction(0, 0, _hmove, _vmove);
		hsp = lengthdir_x(dash_spd, _dir);
		vsp = lengthdir_y(dash_spd, _dir);
		dash_arr = [];
		if shield == true
		{
			DashDamages();
		}
	}
}


function DashDamages()
{		
	// create hitbox and pass our variables to the hitbox
	// create other values of parents values
	var _inst = instance_create_layer(x, y, "Instances", ObjDashHitbox);
	_inst.owner_id = ObjPlayer;
	_inst.damage = dash_damages;
	_inst.knockback_time = knockback_time;
}


function ShowShield()
{
	instance_create_depth(ObjPlayer.x, ObjPlayer.y, ObjPlayer.depth-1, ObjSprBonusShield);
}

function DestroyShield()
{
	ObjPlayer.shield_health--;
	ObjSprBonusShield.image_index += 1;
	if ObjPlayer.shield_health <= 0
	{
		ObjPlayer.shield = false;
		ObjSprBonusShield.image_index = 3;
		ObjSprBonusShield.alarm[7] = 60;
	}
}


function PlayerAnim()
{
	switch(state)
	{
		case states.IDLE:
			SwitchSpine("rose_idle");
			ShowHurt();
		break;
		case states.MOVE:
			SwitchSpine("rose_walk");
			ShowHurt();
		break;
		case states.ATTACK:
			SwitchSpine("rose_dash");
		break;
		case states.KNOCKBACK:
			ShowHurt();
		break;
		case states.DEAD:
			SwitchSpine("rose_idle");
		break; 
		case states.DASH:
			SwitchSpine("rose_dash");
	}
}