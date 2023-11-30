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

	if controller_obj.portNum == 29
	{
		if keyboard_check(ord("Q")) 
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
	else
	{
		/*if controller_obj.haxis < 0
		{
			left = controller_obj.haxis
		}
		if controller_obj.haxis > 0
		{
			right = controller_obj.haxis
		}
		if controller_obj.vaxis < 0
		{
			up = controller_obj.vaxis
		}
		if controller_obj.vaxis > 0
		{
			down = controller_obj.vaxis
		} */
		
		if (controller_obj.bttd == true)
		{
			dash = true	;
		}
	} 
}

function calc_movement()
{
	if (controller_obj.portNum == 29)
	{
		var _hmove = right - left;
		var _vmove = down - up;
		var _facing = -sign(_hmove);
	}
	else
	{
		var _hmove = controller_obj.haxis;
		var _vmove = controller_obj.vaxis;
		var _facing = -sign(_hmove);
	}
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
		ObjPlayer.state = states.IDLE;
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



function CollisionSolidFull()
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
	if (place_meeting(x + _disx * sign(_tx - x), y, ObjSolidFull))
	{
		x = round(x);
	}
	if (place_meeting(x, y + _disy * sign(_ty - y), ObjSolidFull))
	{
		y = round(y);
	}
	
	//move as far as in x and y before hitting the solid
	repeat(_disx)
	{
		if (!place_meeting(x + sign(_tx - x), y, ObjSolidFull)) 
		{
			x += sign(_tx - x);
		}
	}
		repeat(_disy)
	{
		if (!place_meeting(x, y + sign(_ty - y), ObjSolidFull)) 
		{
			y += sign(_ty - y);
		}
	}
}



function CollisionSolidSup()
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
	if (place_meeting(x + _disx * sign(_tx - x), y, ObjSolidSup))
	{
		x = round(x);
	}
	if (place_meeting(x, y + _disy * sign(_ty - y), ObjSolidSup))
	{
		y = round(y);
	}
	
	//move as far as in x and y before hitting the solid
	repeat(_disx)
	{
		if (!place_meeting(x + sign(_tx - x), y, ObjSolidSup)) 
		{
			x += sign(_tx - x);
		}
	}
		repeat(_disy)
	{
		if (!place_meeting(x, y + sign(_ty - y), ObjSolidSup)) 
		{
			y += sign(_ty - y);
		}
	}
}


function CollisionDoor()
{
	if instance_exists(ObjDoor)
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
}



function CollisionDoorLeft()
{
	if instance_exists(ObjDoorLeft)
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
		if (place_meeting(x + _disx * sign(_tx - x), y, ObjDoorLeft))
		{
			x = round(x);
		}
		if (place_meeting(x, y + _disy * sign(_ty - y), ObjDoorLeft))
		{
			y = round(y);
		}
	
		//move as far as in x and y before hitting the solid
		repeat(_disx)
		{
			if (!place_meeting(x + sign(_tx - x), y, ObjDoorLeft)) 
			{
				x += sign(_tx - x);
			}
		}
			repeat(_disy)
		{
			if (!place_meeting(x, y + sign(_ty - y), ObjDoorLeft)) 
			{
				y += sign(_ty - y);
			}
		}
	}
}




function CollisionDoorRight()
{
	if instance_exists(ObjDoorRight)
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
		if (place_meeting(x + _disx * sign(_tx - x), y, ObjDoorRight))
		{
			x = round(x);
		}
		if (place_meeting(x, y + _disy * sign(_ty - y), ObjDoorRight))
		{
			y = round(y);
		}
	
		//move as far as in x and y before hitting the solid
		repeat(_disx)
		{
			if (!place_meeting(x + sign(_tx - x), y, ObjDoorRight)) 
			{
				x += sign(_tx - x);
			}
		}
			repeat(_disy)
		{
			if (!place_meeting(x, y + sign(_ty - y), ObjDoorRight)) 
			{
				y += sign(_ty - y);
			}
		}
	}
}



function check_dash()
{
	if (controller_obj.portNum == 29)
	{
		var _hmove = right - left;
		var _vmove = down - up;
		var _facing = -sign(_hmove);
	}
	else
	{
		var _hmove = controller_obj.haxis;
		var _vmove = controller_obj.vaxis;
		var _facing = -sign(_hmove);
	}
	if _facing != 0 
	{
		facing = _facing;
	}
	if (dash==true) and (can_dash==true) and (_hmove != 0 or _vmove != 0)
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


function PlayerAttack()
{
	instance_create_layer(ObjNeedle.x,ObjNeedle.y,"Weapons",ObjNeedleThrown);
	ObjNeedleThrown.image_angle=ObjNeedle.image_angle;

	ObjPlayer.walk_spd = 0;

	instance_destroy(ObjNeedle);	
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
			SwitchSpinePlayer("rose_idle");
			ShowHurtPlayer();
		break;
		case states.MOVE:
			SwitchSpinePlayer("rose_walk");
			ShowHurtPlayer();
		break;
		case states.ATTACK:
			SwitchSpinePlayer("rose_attack_idle");
		break;
		case states.KNOCKBACK:
			ShowHurtPlayer();
		break;
		case states.DEAD:
			SwitchSpinePlayer("rose_death");
		break; 
		case states.DASH:
			SwitchSpinePlayer("rose_dash");
	}
}


function SwitchSpinePlayer(spine)
{
	if (skeleton_animation_get() != spine)
	{
		skeleton_animation_set(spine);
	}
}

function ShowHurtPlayer()
{
	if knockback_time-- > 0 
		SwitchSpine("idle");
}