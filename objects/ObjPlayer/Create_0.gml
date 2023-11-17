event_inherited();
MAX_HP = 100;
hp = 100;
walk_spd = 15;

MAX_WALK_SPEED = 15;

NEEDLE_RANGE = 720;
can_needle = true;
needle_cd = 30;

//first_click=1;

dash_spd = 60;
dash_arr = [];
can_dash = false;
alarm[5] = 30;
dash_cooldown = 120;
dash_timer_initial = 15;
dash_timer = dash_timer_initial;

is_invincible = false;
invincibility_time = 60;

shield = false;
MAX_SHIELD_HEALTH = 3;
shield_health = MAX_SHIELD_HEALTH;
dash_damages = 10;
damaging_dash_count = 0;

weapon_scissors = false;
can_switch = true;
can_scissor = true;
scissor_cd = 75;

touch_count = 0;
is_touch = false;

can_switch_anim_attack = true;
can_switch_anim_attack_cd = 60;

layer_create(-100,"Pause");
layer_create(-100,"Control");
layer_create(-100,"Menus");
layer_create(depth,"Weapons");
if (!instance_exists(ObjCamera))
{
	instance_create_layer(0,0,"Control",controller_obj);
	instance_create_layer(0,0,"Control",ObjCamera);
	instance_create_layer(0,0,"Pause",ObjPause);
	instance_create_layer(0,0,"Weapons",ObjNeedleThread);
	instance_create_layer(0,0,"Control",ObjGame);
	instance_create_layer(0,0,"Control",ObjSoundManager);

}
// power up code

powerup = false;


