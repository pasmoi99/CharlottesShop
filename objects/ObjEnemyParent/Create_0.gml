event_inherited();
MAX_HP = 40;
hp = MAX_HP;

is_invincible = false;
invincibility_time = 60;

// are chasing player ?
alert = false;
// distance to start chasing
alert_dis =50+ObjPlayer.NEEDLE_RANGE ;
// distance stop from the player
attack_dis = 80;

is_awake = false;
end_awake = false;

// frame of anim of enemy attack (usefull for slower enemy attack)
attack_frame = 18;
can_attack = true;
attack_cd = 60;
damage = 20;
knockback_time = 10;

// move speed enemy
move_spd = 18;

// debug shield for all
shield = false;
damaging_dash_count = 0;

// create path
path = path_add();
//set delay for calculating path
calc_path_delay = 30;
//set a timer when calc a path
calc_path_timer = irandom(60);

is_touch = false;
is_stun = false;