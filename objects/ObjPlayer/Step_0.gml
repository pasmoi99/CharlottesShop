switch(state)
{
	default :
		reset_variables();

		get_input();

		calc_movement();

		check_dash();
	break;
	
	case states.IDLE :
		reset_variables()
		get_input();
		calc_movement(); 
		check_dash();
		PlayerAnim();
	break;
		
	case states.MOVE :
		reset_variables()
		get_input();
		calc_movement();
		check_dash();
		PlayerAnim();
	break;
	
	case states.DASH:
		reset_variables();
		array_push(dash_arr, {x : x, y : y, image_alpha : 0.75});
		x += hsp;
		y += vsp;
		if dash_timer-- <= 0
		{
			state = states.MOVE;
			hsp = 0;
			vsp = 0;
			can_dash = false;
			alarm[0] = dash_cooldown;
			image_index = 2;	
		}
		PlayerAnim();
	break;
		
	case states.DEAD:
		reset_variables();
		PlayerAnim();
	break;
	
	case states.KNOCKBACK:
		reset_variables();
		
		calc_movement();
		
		if knockback_time-- <= 0 
			state = states.IDLE;
	break;
}




//destroy object dash damages at end of dash
if (state != states.DASH)
	instance_destroy(ObjDashHitbox);

show_debug_message(layer);


/*
if(hp>MAX_HP)
{
	hp=MAX_HP;
}*/
//shield_health = median(0,shield_health,MAX_SHIELD_HEALTH);
//hp=median(0, hp, MAX_HP);
//hp_percent=hp/MAX_HP;

//draw_sprite(SprHealthBar,0,0,0);
//draw_sprite_part(SprHealthBarFull,0,0,0,sprite_get_width(SprHealthBarFull)*hp_percent,sprite_get_height(SprHealthBarFull),15,15);

//first_click=min(0,1);

//if (first_click >0)
//{
	
//}

//else
//{

if (controller_obj.portNum != 29)
{
	if (controller_obj.shoulderlb == true)
	{
		weapon_scissors = true;
	}
	else
	{
		weapon_scissors = false;
	}
}

if(weapon_scissors==false)
{
	if (instance_exists(ObjScissors))
	{
		instance_destroy(ObjScissors);
	}
	//spawn needle 	
	if controller_obj.portNum == 29
	{
		if mouse_check_button (mb_left)
		{
			if !instance_exists(ObjNeedle)
			{
				if (walk_spd!=0)
				{
					instance_create_layer(x,y,"Weapons",ObjNeedle);
				}
				/*var _xx = ObjPlayer.x + lengthdir_x(64, image_angle);
				var _yy = ObjPlayer.y + lengthdir_y(64, image_angle);
			
				x = _xx;
				y = _yy;*/
			}
		}
	}
	else
	{
		/*
		var _hcursor = gamepad_axis_value(controller_obj.portNum, gp_axisrh);
		var _vcursor = gamepad_axis_value(controller_obj.portNum, gp_axisrv);
		
		if abs(_hcursor) < .2
			_hcursor = 0;
		if abs(_vcursor) < .2
			_vcursor = 0;
		*/
		if (controller_obj.hcursor != 0) || (controller_obj.vcursor != 0)
		{
			if !instance_exists(ObjNeedle)
			{
				if (walk_spd!=0)
				{
					instance_create_layer(x,y,"Weapons",ObjNeedle);
				}
				/*var _xx = ObjPlayer.x + lengthdir_x(64, image_angle);
				var _yy = ObjPlayer.y + lengthdir_y(64, image_angle);
			
				x = _xx;
				y = _yy;*/
			}
		}
	}
}

else
{
	if !instance_exists(ObjScissors)
	{
		instance_create_layer(x,y,"Weapons",ObjScissors);
	}
}



if !instance_exists(ObjNeedleThrown)
{
	ObjPlayer.touch_count = 0;
}

//if (shield==true)
//{	
//	temp_damage=ObjEnemyParent.damage;
//	ObjEnemyParent.damage=0;
//	if(true)
//	{
//		shield_health--;
//	}
//}


	// audio_play_sound(woosh_punaise,0, false, 1, 0, random_range(0.8, 1.2));
	
if ((powerup == 1) && mouse_check_button(mb_right))
{
	instance_create_layer(x, y,"Bullets_Layer", ObjWeaponPunaise);
}	

