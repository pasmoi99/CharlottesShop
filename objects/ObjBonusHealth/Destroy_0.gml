/// @description add Health
global.player_hp+=ObjPlayer.MAX_HP*0.2;
global.player_hp =  clamp(global.player_hp, 0, ObjPlayer.MAX_HP)
