function DamageEntity(_tid, _sid, _damage, _time)
{
	// damage the target and return the dead status
	//@arg tid		real	target_id
	//@arg sid		real	source_id
	//@arg damage	real    how much damage to deal
	//@arg time		real	how long to knockback the targer

	with(_tid)
	{
		if (ObjPlayer.weapon_scissors == false) and (_sid == ObjPlayer)
		{
			is_touch = true;
		}
		if (state != states.DASH)
		{
			if (shield == false)
			{
				if (is_invincible == false) //and alarm[8] <= 0
				{
					if (_tid != ObjPlayer) and (ObjPlayer.state == states.DASH) and (ObjPlayer.shield == true)
					{
						ObjPlayer.damaging_dash_count++;
						if ObjPlayer.damaging_dash_count > 0
						{
							DestroyShield()
						}
					}
					is_invincible = true;
					alarm[3] = invincibility_time;
					hp -= _damage;
					/*if (_sid == ObjEnemyAttackHitbox)
					{
						if (ObjPlayer.IsBurning == false)
						{
							instance_create_layer(ObjPlayer.x, ObjPlayer.y, ObjPlayer.depth-1, ObjFire);
							Burn();
						}
					}*/
					var _dead = IsDead();
					feedback_damages = true;
					alarm[2] = feedback_damages_time;
					path_end();
					//set knockback distance
					if _dead
					{
						var _dis = 50;
					}
					else 
					{
						if (ObjPlayer.weapon_scissors == true) or (_sid != ObjPlayer)
						{
							var _dis = 30;
						}
						else
						{
							var _dis = 0;
						}
					}
				
					var _dir = point_direction(_sid.x, _sid.y, x, y);
					hsp += lengthdir_x(_dis, _dir);
					vsp += lengthdir_y(_dis, _dir);
					//calc_path_delay = _time; //(lag)
						//calc_path_timer = _time;
					alert = true;
					knockback_time = _time;
					alarm[8] = hurt_time;
			
					if(!_dead)
					{
					state = states.KNOCKBACK;
					if is_touch == true
						{
							if (_tid != ObjPlayer)
							{
								if instance_exists(ObjNeedleThrown)
								{
									if (object_index == ObjMatch)
									{
										instance_create_depth(ObjNeedleThrown.x,y,ObjNeedleThrown.depth,ObjNeedleBack);
										ObjNeedleBack.image_angle=ObjNeedleThrown.image_angle;
										instance_destroy(ObjNeedleThrown);
										can_needle = false;
										ObjPlayer.alarm[4] = 180;
										// ObjPlayer.walk_spd = ObjPlayer.MAX_WALK_SPEED; //if no needle back
									}
									else if (object_index != ObjMatch)
									{
										ObjPlayer.touch_count++;
										if (ObjPlayer.touch_count >= 3)
										{
											//ObjPlayer.walk_spd = ObjPlayer.MAX_WALK_SPEED;
											instance_create_depth(ObjNeedleThrown.x,y,ObjNeedleThrown.depth,ObjNeedleBack);
											ObjNeedleBack.image_angle=ObjNeedleThrown.image_angle;
											instance_destroy(ObjNeedleThrown);
										
										}
									}
									
									if (object_index != ObjMatch)
									{
										if (instance_exists(ObjStun)) and (is_touch == true)
										{
												instance_destroy(ObjStun);
										}
										var _distance_repack = 300;
								
										var _dirrepack = point_direction(ObjPlayer.x, ObjPlayer.y, _tid.x, _tid.y);
		
										//get distance we are moving
										var _hrepack = lengthdir_x(_distance_repack, _dirrepack);
										var _vrepack = lengthdir_y(_distance_repack, _dirrepack);
		
										//add movement to players position
										_tid.x = ObjPlayer.x + _hrepack;
										_tid.y = ObjPlayer.y + _vrepack;
										var _stun_duration = random_range(120,360);
										GetStun();
										alarm[9] = _stun_duration;
										is_touch = false;
									}
									
								}
								/*
								var _distance_repack = 300;
								
								var _dirrepack = point_direction(ObjPlayer.x, ObjPlayer.y, _tid.x, _tid.y);
		
								//get distance we are moving
								var _hrepack = lengthdir_x(_distance_repack, _dirrepack);
								var _vrepack = lengthdir_y(_distance_repack, _dirrepack);
		
								//add movement to players position
								_tid.x = ObjPlayer.x + _hrepack;
								_tid.y = ObjPlayer.y + _vrepack;
								var _stun_duration = random_range(120,600);
								GetStun();
								alarm[9] = _stun_duration;
								is_touch = false;
								*/
							}	
						}
					}
					return _dead;
				}
			}
			else
			{
				DestroyShield();
			}
		}
	}
}


function IsDead()
{
	// check if the instance running this is dead
	if state != states.DEAD
	{
		if hp <= 0
		{
			alert = false;
			state = states.DEAD;
			hp = 0;
			image_index = 0;
			//set death sound
			switch(object_index)
			{
				default:
					//play sound
				break;
				case ObjPlayer:
					//player sound
				break;
			}
			if (object_index == ObjPlayer)
				alarm[6] = 60;
			if (object_index == ObjEnemy)
				alarm[6] = 120;
			if (object_index == ObjMatch)
				alarm[6] = 120;
			return true;
		}
	}
	else
	{
		return true;
	}
}



function Burn()
{
	ObjPlayer.IsBurning = true;
	ObjMatch.alarm[11] = duration_damages_time;
	//for(i = 3; i > 0; i-= 1)
	//{
	//}
}