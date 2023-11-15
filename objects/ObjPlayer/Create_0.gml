event_inherited();
MAX_HP = 100;
hp = 100;
walk_spd = 15;

MAX_WALK_SPEED = 15;
NEEDLE_RANGE = 720;

//first_click=1;

dash_spd = 60;
dash_arr = [];
can_dash = true;
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
can_scissors = true;
scissor_cd = 300;

is_touch = false;

layer_create(-100,"Pause");
layer_create(-100,"Control");
layer_create(-100,"Menus");
layer_create(depth,"Weapons");
instance_create_layer(0,0,"Control",ObjCamera);
instance_create_layer(0,0,"Pause",ObjPause);
instance_create_layer(0,0,"Weapons",ObjNeedleThread);
instance_create_layer(0,0,"Control",controller_obj);

// power up code

powerup = false;


